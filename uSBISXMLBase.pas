unit uSBISXMLBase;

interface

uses SysUtils, Classes,UtilUnit,Forms, Messages, xmldom, XMLIntf,
  msxmldom, XMLDoc, uDMSBIS, MemTableDataEh,MemTableEh,Windows,Dialogs, uDMShared,DB;

type

  EPathFoundException = class(Exception);
  ESBISDisabledException = class(Exception);
  EUnknownKPPException = class(Exception);
  EOsnNull = class(Exception);

  rAdr = record
    KodRegion: string;
    City:string;
    NasP:string;
    Street:string;
    PostIndex:string;
    Dom:string;
  end;

  TBaseInfo = class
    DMSbis:TDMSbis;
    constructor create;
  end;

  TPersInfo = class //(TBaseInfo)
  private
    _tabn    : string;
    _dolgn   : string;
    _name    : string;
    _famaly  : string;
    _otc     : string;
    procedure GetInfo(const tabn:string);
  public
    property tabn    : string  read _tabn write GetInfo;
    property dolgn   : string  read _dolgn;
    property name    : string  read _name;
    property famaly  : string  read _famaly;
    property otc     : string  read _otc;
    constructor create;
  end;

  rBankRekv = record
    NomSch    :string;
    NameBank  :string;
    bik       :string;
    KorSch    :string;
  end;

  TContrInfo = class //(TBaseInfo)
  private
    _id:integer ;
    _country: string;
    _INN:     string;
    _KPP:     string;
    _Name:    string;
    _Okpo:    string;
    _Adres:   rAdr;
    _sbisEnabled: boolean;
    _ContPersName: string;
    _ContPersDolj: string;
    _ContPersOsn: string;
    _Last_Name: string;
    _First_Name: string;
    _Patronymic: string;
    _OWNERSHIP: integer;
    _DocDate: string;
    procedure GetInfo(const contr_id:integer);
  public
    BankRekv:rBankRekv;
    property id:integer read _id write GetInfo;
    property country: string read _country;
    property INN:     string read _INN;
    property KPP:     string read _KPP write _KPP;
    property Name:    string read _Name write _Name;
    property Okpo:    string read _Okpo;
    property Adres:   rAdr   read _Adres;
    property sbisEnabled: boolean read _sbisEnabled;
    property ContPersName:    string read _ContPersName write _ContPersName;
    property ContPersDolj:    string read _ContPersDolj write _ContPersDolj;
    property ContPersOsn:    string read _ContPersOsn write _ContPersOsn;
    property Last_Name: string read _Last_Name write _Last_Name;
    property First_Name: string read _First_Name write _First_Name;
    property Patronymic: string read _Patronymic write _Patronymic;
    property OWNERSHIP: integer read _OWNERSHIP write _OWNERSHIP;
    property DocDate: string read _DocDate write _DocDate;
    constructor create;
    function GetAddrINO:string;
  end;

  TSBISXMLBase = class
  protected
    XML: TXMLDocument;
    Root:IXMLNode;
    DocumentNode:IXMLNode;
    DMSbis: TDMSbis;
    function CreateHeader(idtyp:integer):IXMLNode;
    procedure CreateFooter(idtyp:integer = 1);
    function fillAddrInfo (Node:IXMLNode;ContrInfo:TContrInfo):IXMLNode;
    function fillContrInfo(Node:IXMLNode;ContrInfo:TContrInfo; WriteOKPO:boolean = false;idtyp:integer = 1; WriteBankRekv:boolean = false):IXMLNode;
    constructor Create;
    destructor  Destroy;
  private
    idSender,idDest:string;
    GUID:TGUID;
    sGuid:string;
    _prefix : string;
    _versform:real;
    _typdoc:string;
    _OperEDO: integer;
    _KND: string;
    _FUNC: string;
    _FormatId: string;
  public
    id            : integer;
    idDoc         : integer;
    CSender       : TContrInfo;
    CDest         : TContrInfo;
    CSignatory    : TContrInfo;
    CGruzOtpr     : TContrInfo;
    CGruzPol      : TContrInfo;
    Podpisant     : TPersInfo;
    Filename      : string;
    FileExt       : string;
    Docname       : string;
    idtyp         : integer;
    DocNum        : string;
    DocDate       : string;
    idRecEDO      : string;
    ArrDocid      : TDocid;
    property prefix   : string read _prefix;
    property versform : real read _versform;
    property typdoc   : string read _typdoc;
    property OperEDO  : integer read _OperEDO write _OperEDO;
    property KND      : string read _KND;
    property FUNC     : string read _FUNC;
    property FormatId : string read _FormatId;
    procedure   SaveToFile (FilePath:string);
    function    SaveToOra (idPackage:integer; idtyp:integer; appref, nazv, docnum:string):integer;
    procedure   CreateXML; virtual; abstract;
    procedure   ParseXML (idPackage:integer);  virtual; abstract;
  end;

function FloatToXML(f:real;fformat:string):string;

implementation

function TSBISXMLBase.SaveToOra (idPackage:integer; idtyp:integer; appref, nazv, docnum:string):integer;
var
  ms: TMemoryStream;
  Blob:TBlobfield;
  nextid:integer;
  fileId:integer;
  contrEdo:string;
begin
    readSetting(Company_id,'EDO','CONTRSBIS',contrEdo);
    ms:=TMemoryStream.Create;
    XML.SaveToStream(ms);
    ms.Position:=0;
    DMSBIS.qFileIDNew.Open;
    fileId := DMSBIS.qFileIDNew.FieldByName('val').AsInteger;
    DMSBIS.qFileIDNew.Close;
    DMSBIS.qFiles.open;
    DMSBIS.qFiles.Edit;
    DMSBIS.qFiles.FieldByName('ID').AsInteger := fileId;
    DMSBIS.qFiles.FieldByName('file_name').AsString := Filename + FileExt;
    DMSBIS.qFiles.FieldByName('description').AsString := _prefix;
    DMSBIS.qFiles.FieldByName('login').AsString := User_Id;
    DMSBIS.qFiles.FieldByName('program_name').AsString := appref;
    DMSBIS.qFiles.FieldByName('cd').AsDateTime := Date;
    Blob := TBlobfield(DMSBIS.qFiles.FieldByName('file_internal'));
    Blob.LoadFromStream(ms);
    DMSBIS.qFiles.FieldByName('properties').AsString := '';
    DMSBIS.qFiles.Post;

    DMSBIS.spSbisObj.ParamByName('Action').AsInteger := 0;
    DMSBIS.spSbisObj.ParamByName('V_ID').AsInteger := 0;
    DMSBIS.spSbisObj.ParamByName('V_FILENAME').AsString := Filename + FileExt;
    DMSBIS.spSbisObj.ParamByName('V_DATEOTPR').AsString := datetostr(date);
    DMSBIS.spSbisObj.ParamByName('V_IDPACK').AsInteger := idPackage;
    DMSBIS.spSbisObj.ParamByName('V_APP').AsString := appref;
    DMSBIS.spSbisObj.ParamByName('V_ID_FILE').AsInteger := fileId;
    DMSBIS.spSbisObj.ParamByName('V_IDDOC').AsInteger := idDoc;
    DMSBIS.spSbisObj.ParamByName('v_typDoc').AsInteger := idtyp;
    DMSBIS.spSbisObj.ParamByName('v_pol').AsInteger := 1;
    DMSBIS.spSbisObj.ParamByName('v_isdel').AsInteger := 0;
    DMSBIS.spSbisObj.ParamByName('v_contredo').AsString := contrEdo;
    DMSBIS.spSbisObj.ParamByName('v_user_id').AsString := user_id;
    DMSBIS.spSbisObj.ParamByName('v_Nazv').AsString := nazv;
    DMSBIS.spSbisObj.ParamByName('v_DOC_NUM').AsString := docnum;
    DMSBIS.spSbisObj.ExecProc;
    DMSBIS.qFiles.close;
    ms.Free;
  result := DMSBIS.spSbisObj.ParamByName('result').AsInteger;
end;

function FloatToXML(f:real;fformat:string):string;
begin
  if (fformat='') then
    result := StringReplace(floattostr(f),',', '.',[rfReplaceAll, rfIgnoreCase])
  else
    result := StringReplace(FormatFloat(fformat,f),',', '.',[rfReplaceAll, rfIgnoreCase]);
end;

constructor TPersInfo.create;
begin
  inherited;
  _tabn := '';
end;

procedure TPersInfo.GetInfo(const tabn: string);
var
  spacepos:integer;
begin
  _tabn := tabn;
  if _tabn = '' then
    exit;
  DMSbis.qKadry.ParamByName('TABN').AsString := tabn;
  DMSbis.qKadry.Open;
  _dolgn   := DMSbis.qKadry.FieldByName('DOLGN').AsString;
  _famaly  := DMSbis.qKadry.FieldByName('famaly').AsString;

  spacepos :=  Pos(' ',DMSbis.qKadry.FieldByName('IMY_OT').AsString);
  _name    := Copy(DMSbis.qKadry.FieldByName('IMY_OT').AsString,1,spacepos-1);
  _otc     := Copy(DMSbis.qKadry.FieldByName('IMY_OT').AsString,spacepos+1,255);
  DMSbis.qKadry.close;
end;

constructor TBaseInfo.create;
begin
  DMSbis := TDMSbis.GetInstance;
end;

procedure TContrInfo.GetInfo(const contr_id: integer);
begin
  try
    _id := contr_id;
    if _id=0 then exit; //Для пустых
    DMSbis.qContragent.ParamByName('contr_id').AsInteger := contr_id;
    DMSbis.qContragent.ParamByName('DocDate').AsString := DocDate;
    DMSbis.qContragent.Open;
    _INN     := DMSbis.qContragent.FieldByName('INN').AsString;
    _KPP     := DMSbis.qContragent.FieldByName('KPPP').AsString;
    _Name    := DMSbis.qContragent.FieldByName('shortname_of_date').AsString; //DMSbis.qContragent.FieldByName('SHORTNAME').AsString;
    _country := DMSbis.qContragent.FieldByName('OKSM_CODE').AsString;
    _Okpo    := DMSbis.qContragent.FieldByName('OKPO').AsString;

    _Adres.KodRegion := DMSbis.qContragent.FieldByName('Code_Region').AsString;
    if (DMSbis.qContragent.FieldByName('CITY').AsString<>'') then
      _Adres.City      := DMSbis.qContragent.FieldByName('CITY').AsString
    else
      _Adres.NasP    := DMSbis.qContragent.FieldByName('NAS_NAME').AsString;
    _Adres.Street    := DMSbis.qContragent.FieldByName('ADDR_STREET').AsString;
    _Adres.Dom       := DMSbis.qContragent.FieldByName('ADDR_DOM').AsString;
    _Adres.PostIndex := DMSbis.qContragent.FieldByName('ADDR_POSTINDEX').AsString;
    if DMSbis.qContragent.FieldByName('SBIS').AsInteger = 1 then
      _SbisEnabled := true
    else
      _sbisEnabled := false;
    _ContPersName := DMSbis.qContragent.FieldByName('CONTPERSFIO').AsString;
    _ContPersDolj := DMSbis.qContragent.FieldByName('CONTPERSDOLJ').AsString;
    _ContPersOsn := DMSbis.qContragent.FieldByName('CONTPERSREM').AsString;

    _OWNERSHIP := DMSbis.qContragent.FieldByName('OWNERSHIP').AsInteger;
    _First_Name := DMSbis.qContragent.FieldByName('FirstName').AsString;
    _Last_Name := DMSbis.qContragent.FieldByName('LastName').AsString;
    _Patronymic := DMSbis.qContragent.FieldByName('Patronymic').AsString;
  finally
    DMSbis.qContragent.Close;
  end;
end;

constructor TContrInfo.create;
begin
  inherited;
  DMSBIS := TDMSBIS.GetInstance;
  id := 0;
  DocDate := '%';
end;

function tContrInfo.GetAddrINO:string;
begin
  result := 'г.'+Adres.City+', '+Adres.Street+' - '+Adres.Dom;
end;

function TSBISXMLBase.fillContrInfo(Node:IXMLNode;ContrInfo:TContrInfo; WriteOKPO:boolean = false;idtyp:integer = 1; WriteBankRekv:boolean = false):IXMLNode;
var
  iHead:IXMLNode;
  iBankRekv:IXMLNode;
begin
  iHead:=Node;

  if WriteOKPO and (ContrInfo.okpo<>'') then
    Node.SetAttributeNS('ОКПО','',ContrInfo.Okpo);
  Node := Node.AddChild('ИдСв','');

  if (ContrInfo.OWNERSHIP = 5) or (length(ContrInfo.INN) = 12) then
    begin
      Node := Node.AddChild('СвИП');
      Node.SetAttributeNS('ИННФЛ', '', ContrInfo.INN);
      Node := Node.AddChild('ФИО');
      Node.SetAttributeNS('Фамилия', '', ContrInfo.Last_Name);
      Node.SetAttributeNS('Имя', '', ContrInfo.First_Name);
      Node.SetAttributeNS('Отчество', '', ContrInfo.Patronymic);

      while Node.NodeName <> iHead.NodeName do
        Node := Node.ParentNode;


    end
  else if (ContrInfo.OWNERSHIP <> 5) and (length(ContrInfo.INN) = 10) then
    begin
      case idtyp of
      2,6:begin
        Node := Node.AddChild('СвОрг');
        Node := Node.AddChild('СвЮЛ');
      end;
      3:begin
        Node := Node.AddChild('СвЮЛ');
      end
      else
        Node := Node.AddChild('СвЮЛУч');
      end;
      Node.SetAttributeNS('ИННЮЛ', '', ContrInfo.INN);
      Node.SetAttributeNS('КПП', '', ContrInfo.KPP);
      Node.SetAttributeNS('НаимОрг', '', ContrInfo.Name);
      while Node.NodeName <> iHead.NodeName do
        Node := Node.ParentNode;
    end;

  if (idtyp=6) or (idtyp = 2) then
  begin
    fillAddrInfo(iHead,ContrInfo);
    while Node.NodeName <> iHead.NodeName do
        Node := Node.ParentNode;
  end
  else
  begin
    if idtyp <> 2 then
      Node := fillAddrInfo(Node,ContrInfo);
    if idtyp <> 3 then
      while Node.NodeName <> iHead.NodeName do
        Node := Node.ParentNode;
  end;
  if WriteBankRekv then
  begin
    iBankRekv := iHead.AddChild('БанкРекв', '');
    if not(ContrInfo.BankRekv.NomSch = '') then
      iBankRekv.SetAttributeNS('НомерСчета', '', ContrInfo.BankRekv.NomSch);
    iBankRekv := iBankRekv.AddChild('СвБанк', '');
    if not(ContrInfo.BankRekv.NameBank = '') then
      iBankRekv.SetAttributeNS('НаимБанк', '', ContrInfo.BankRekv.NameBank);
    if not(ContrInfo.BankRekv.bik = '') then
      iBankRekv.SetAttributeNS('БИК', '', ContrInfo.BankRekv.bik);
    if not(ContrInfo.BankRekv.KorSch = '') then
      iBankRekv.SetAttributeNS('КорСчет', '', ContrInfo.BankRekv.KorSch);
  end;
  result := Node;
end;

function TSBISXMLBase.fillAddrInfo(Node:IXMLNode;ContrInfo:TContrInfo):IXMLNode;
begin
  Node := Node.AddChild('Адрес');
  if ContrInfo.country = '643'  then
  begin
    Node := Node.AddChild('АдрРФ');
    if ContrInfo.Adres.PostIndex <> '' then
      Node.SetAttributeNS('Индекс','', ContrInfo.Adres.PostIndex);
    Node.SetAttributeNS('КодРегион','', ContrInfo.Adres.KodRegion);
    if (ContrInfo.Adres.City <> '') then
      Node.SetAttributeNS('Город','',     ContrInfo.Adres.City)
    else
      Node.SetAttributeNS('НаселПункт','',     ContrInfo.Adres.NasP);
    Node.SetAttributeNS('Улица','',     ContrInfo.Adres.Street);
    if ContrInfo.Adres.Dom <> '' then
      Node.SetAttributeNS('Дом','',       ContrInfo.Adres.Dom);
  end
  else
  begin
    Node := Node.AddChild('АдрИно');
    Node.SetAttributeNS('КодСтр','',  ContrInfo.country);
    Node.SetAttributeNS('АдрТекст','',ContrInfo.GetAddrINO);
  end;
  Node := Node.ParentNode.ParentNode;
  result := Node;
end;

constructor TSBISXMLBase.Create;
begin
  try
  DMSbis := TDMSbis.GetInstance;
  if Assigned(UtilUnit.MainFormUtil) then
    XML := TXMLDocument.Create(UtilUnit.MainFormUtil)
  else if Assigned(DMSbis) then
         XML := TXMLDocument.Create(DMSbis);
  except
    on E : Exception do
      ShowMessage(E.ClassName+' поднята ошибка, с сообщением : '+E.Message);
  end;
  DMSBIS      := TDMSBIS.GetInstance;
  CSender     := TContrinfo.Create;
  CDest       := TContrinfo.Create;
  CSignatory  := TContrinfo.create;
  CGruzOtpr   := TContrinfo.Create;
  CGruzPol    := TContrinfo.Create;
  Podpisant   := TPersInfo.create;
end;

destructor TSBISXMLBase.Destroy;
begin
  freeandnil(XML);
  freeandnil(CSender);
  freeandnil(CDest);
  freeandnil(CSignatory);
end;

function TSBISXMLBase.CreateHeader(idtyp: integer):IXMLNode;
var
  Node:IXMLNode;
  DMSBIS:TDMSBIS;
begin

  //if not(CDest.sbisEnabled) then
  //  raise ESBISDisabledException.Create('Контрагент не отмечен для работы в СБИС');

  DMSBIS := TDMSBIS.GetInstance;
  DMSBIS.qSBISTypes.ParamByName('ID').AsInteger := idtyp;
  DMSBIS.qSBISTypes.Open;
  _prefix   := DMSBIS.qSBISTypes.FieldByName('PREFIX').AsString;
  _versform := DMSBIS.qSBISTypes.FieldByName('versform').AsFloat;
  _typdoc   := DMSBIS.qSBISTypes.FieldByName('TYPDOC').AsString;
  _KND      := DMSBIS.qSBISTypes.FieldByName('KND').AsString;
  _FUNC     := DMSBIS.qSBISTypes.FieldByName('PREFIX_FUNC').AsString;
  _FormatId := DMSBIS.qSBISTypes.FieldByName('SBISID').AsString;
  DMSBIS.qSBISTypes.Close;

  XML.XML.Clear;
  CreateGUID(GUID);
  sGuid:=FormatDateTime('YYYYMMDD',DATE)+'_'+copy(GUIDToString(GUID),2,36);
  idSender:=CSender.INN+CSender.KPP;
  idDest:=CDest.INN+CDest.KPP;
  Filename := PREFIX + '_' + idDest + '_' + idSender + '_' + sGuid;
  FileExt := '.XML';
  XML.Active:=true;
  Root := XML.AddChild('Файл');
  if idtyp = 20 then
    begin
      Root.SetAttributeNS('ВерсияФормата', '', FloatToXML(versform, ''));
      Root.SetAttributeNS('Имя', '', Filename);
    end
  else
    begin
      Root.SetAttributeNS('ВерсФорм','',FloatToXML(versform,''));
      Root.SetAttributeNS('ИдФайл', '', Filename);
    end;
  case OperEDO of
  0: Root.SetAttributeNS('ВерсПрог','','СБиС3');
  1: Root.SetAttributeNS('ВерсПрог','','Diadoc 1.0');
  end;
  if idtyp = 20 then
    Root.SetAttributeNS('Формат', '', FormatId)
  else
    begin
      Node := Root.AddChild('СвУчДокОбор');
      Node.SetAttributeNS('ИдОтпр','',idSender);
      if idtyp = 5 then
        Node.SetAttributeNS('ИдПок','',idDest)
      else
        Node.SetAttributeNS('ИдПол','',idDest);
      // Сведения для системы ЭДО
      Node:=Node.AddChild('СвОЭДОтпр');
      Node.SetAttributeNS('ИННЮЛ','',CSender.INN);
      case OperEDO of
      0: begin
           Node.SetAttributeNS('ИдЭДО','','2BE');
           Node.SetAttributeNS('НаимОрг','','ООО Компания "Тензор"');
         end;
      1: begin
           Node.SetAttributeNS('ИдЭДО','','2BM');
           Node.SetAttributeNS('НаимОрг','','АО "ПФ "СКБ Контур"');
         end;
      end;
    end;

  DocumentNode := Root.AddChild('Документ');
  if (idtyp <> 5) and (idtyp <> 20) then
    begin
      if idtyp = 6 then
        begin
          DocumentNode.SetAttributeNS('ДатаИнфИсп', '', date);
          DocumentNode.SetAttributeNS('ВремИнфИсп', '', FormatDateTime('hh.mm.ss',time));
        end
      else
        begin
          DocumentNode.SetAttributeNS('ДатаИнфПр', '', date);
          DocumentNode.SetAttributeNS('ВремИнфПр', '', FormatDateTime('hh.mm.ss',time));
        end;
      DocumentNode.SetAttributeNS('КНД', '', KND);
      DocumentNode.SetAttributeNS('НаимЭконСубСост', '', CSender.Name);
    end;
  if idtyp = 20 then
    begin
      DocumentNode.SetAttributeNS('Дата', '', date);
      DocumentNode.SetAttributeNS('Время', '', FormatDateTime('hh.mm.ss', time));
//      DocumentNode.SetAttributeNS('Заголовок', '', 'Мы, нижеподписавшиеся, представитель ИСПОЛНИТЕЛЯ, с одной стороны и представитель ЗАКАЗЧИКА с другой стороны, составили настоящий акт в том, что ИСПОЛНИТЕЛЬ выполнил, а ЗАКАЗЧИК принял следующие работы (услуги)');
      DocumentNode.SetAttributeNS('Название', '', typdoc);
//      DocumentNode.SetAttributeNS('Номер', '', Docnum);
    end;
  if (FUNC = 'СЧФДОП') or (FUNC = 'ДОП') then
    DocumentNode.SetAttributeNS('ПоФактХЖ','','Документ об отгрузке товаров (выполнении работ), передаче имущественных прав (документ об оказании услуг)');
  if (FUNC = 'СЧФДОП') then
    DocumentNode.SetAttributeNS('НаимДокОпр','','Счет-фактура и документ об отгрузке товаров (выполнении работ), передаче имущественных прав (документ об оказании услуг)');
  if (FUNC = 'ДОП') then
    DocumentNode.SetAttributeNS('НаимДокОпр','','Документ об отгрузке товаров (выполнении работ), передаче имущественных прав (Документ об оказании услуг)');
  if (FUNC = 'КСЧФДИС') or (FUNC = 'ДИС') then
    DocumentNode.SetAttributeNS('ПоФактХЖ','','Документ об изменении стоимости отгруженных товаров (выполненных работ, оказанных услуг), переданных имущественных прав');
  if (FUNC = 'КСЧФДИС') then
    DocumentNode.SetAttributeNS('НаимДокОпр','','Корректировочный счет-фактура и документ об изменении стоимости отгруженных товаров (выполненных работ, оказанных услуг), переданных имущественных прав');
  if (FUNC = 'ДИС') then
    DocumentNode.SetAttributeNS('НаимДокОпр','','Документ об изменении стоимости отгруженных товаров (выполненных работ, оказанных услуг), переданных имущественных прав');
  if FUNC <> '' then
    DocumentNode.SetAttributeNS('Функция', '', FUNC);
  Result := DocumentNode;
end;

procedure TSBISXMLBase.CreateFooter(idtyp:integer = 1);
var
  Node:IXMLNode;
begin
  if (idtyp<>5) and (idtyp <> 20) then
  begin
    Node := DocumentNode.AddChild('Подписант');

    Node.SetAttributeNS('Статус','',1);
    if (idtyp in [9, 12, 16, 17, 18]) then
      Node.SetAttributeNS('ОблПолн', '', 0)
    else
      begin
        case OperEDO of
          0: Node.SetAttributeNS('ОблПолн', '', 1);
          1: Node.SetAttributeNS('ОблПолн', '', 6)
        end;
      end;

    if (idtyp in [2, 9, 12, 16, 17, 18]) then
      Node.SetAttributeNS('ОснПолн','','Должностные обязанности')
    else
      Node.SetAttributeNS('ОснПолнПодп','','Должностные обязанности');
//    if (idtyp in [9, 12, 16, 17, 18]) then
//      Node.SetAttributeNS('ОснПолнОрг','','Должностные обязанности');

    Node := Node.AddChild('ЮЛ');
    Node.SetAttributeNS('ИННЮЛ', '', CSignatory.INN);  //    Node.SetAttributeNS('ИННЮЛ','',CSender.INN);
    Node.SetAttributeNS('НаимОрг', '', CSignatory.Name);  //    Node.SetAttributeNS('НаимОрг','',CSender.Name);

    Node.SetAttributeNS('Должн','',Podpisant.dolgn);
    Node:=Node.AddChild('ФИО');
    Node.SetAttributeNS('Имя','',Podpisant.name);
    Node.SetAttributeNS('Отчество','',Podpisant.otc);
    Node.SetAttributeNS('Фамилия','',Podpisant.famaly);
  end;

  XML.XML.Text := xmlDoc.FormatXMLData(XML.XML.Text);
  XML.Active:=true;
  XML.Version := '1.0';
  XML.Encoding := 'windows-1251';
end;

procedure TSBISXMLBase.SaveToFile (FilePath:string);
begin
  if not(DirectoryExists(FilePath)) then
    raise EPathFoundException.Create(FilePath + ' не существует!');
  XML.SaveToFile(Filepath + FileName + FileExt);
end;

end.
