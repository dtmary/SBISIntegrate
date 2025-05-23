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
    if _id=0 then exit; //��� ������
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
  result := '�.'+Adres.City+', '+Adres.Street+' - '+Adres.Dom;
end;

function TSBISXMLBase.fillContrInfo(Node:IXMLNode;ContrInfo:TContrInfo; WriteOKPO:boolean = false;idtyp:integer = 1; WriteBankRekv:boolean = false):IXMLNode;
var
  iHead:IXMLNode;
  iBankRekv:IXMLNode;
begin
  iHead:=Node;

  if WriteOKPO and (ContrInfo.okpo<>'') then
    Node.SetAttributeNS('����','',ContrInfo.Okpo);
  Node := Node.AddChild('����','');

  if (ContrInfo.OWNERSHIP = 5) or (length(ContrInfo.INN) = 12) then
    begin
      Node := Node.AddChild('����');
      Node.SetAttributeNS('�����', '', ContrInfo.INN);
      Node := Node.AddChild('���');
      Node.SetAttributeNS('�������', '', ContrInfo.Last_Name);
      Node.SetAttributeNS('���', '', ContrInfo.First_Name);
      Node.SetAttributeNS('��������', '', ContrInfo.Patronymic);

      while Node.NodeName <> iHead.NodeName do
        Node := Node.ParentNode;


    end
  else if (ContrInfo.OWNERSHIP <> 5) and (length(ContrInfo.INN) = 10) then
    begin
      case idtyp of
      2,6:begin
        Node := Node.AddChild('�����');
        Node := Node.AddChild('����');
      end;
      3:begin
        Node := Node.AddChild('����');
      end
      else
        Node := Node.AddChild('������');
      end;
      Node.SetAttributeNS('�����', '', ContrInfo.INN);
      Node.SetAttributeNS('���', '', ContrInfo.KPP);
      Node.SetAttributeNS('�������', '', ContrInfo.Name);
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
    iBankRekv := iHead.AddChild('��������', '');
    if not(ContrInfo.BankRekv.NomSch = '') then
      iBankRekv.SetAttributeNS('����������', '', ContrInfo.BankRekv.NomSch);
    iBankRekv := iBankRekv.AddChild('������', '');
    if not(ContrInfo.BankRekv.NameBank = '') then
      iBankRekv.SetAttributeNS('��������', '', ContrInfo.BankRekv.NameBank);
    if not(ContrInfo.BankRekv.bik = '') then
      iBankRekv.SetAttributeNS('���', '', ContrInfo.BankRekv.bik);
    if not(ContrInfo.BankRekv.KorSch = '') then
      iBankRekv.SetAttributeNS('�������', '', ContrInfo.BankRekv.KorSch);
  end;
  result := Node;
end;

function TSBISXMLBase.fillAddrInfo(Node:IXMLNode;ContrInfo:TContrInfo):IXMLNode;
begin
  Node := Node.AddChild('�����');
  if ContrInfo.country = '643'  then
  begin
    Node := Node.AddChild('�����');
    if ContrInfo.Adres.PostIndex <> '' then
      Node.SetAttributeNS('������','', ContrInfo.Adres.PostIndex);
    Node.SetAttributeNS('���������','', ContrInfo.Adres.KodRegion);
    if (ContrInfo.Adres.City <> '') then
      Node.SetAttributeNS('�����','',     ContrInfo.Adres.City)
    else
      Node.SetAttributeNS('����������','',     ContrInfo.Adres.NasP);
    Node.SetAttributeNS('�����','',     ContrInfo.Adres.Street);
    if ContrInfo.Adres.Dom <> '' then
      Node.SetAttributeNS('���','',       ContrInfo.Adres.Dom);
  end
  else
  begin
    Node := Node.AddChild('������');
    Node.SetAttributeNS('������','',  ContrInfo.country);
    Node.SetAttributeNS('��������','',ContrInfo.GetAddrINO);
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
      ShowMessage(E.ClassName+' ������� ������, � ���������� : '+E.Message);
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
  //  raise ESBISDisabledException.Create('���������� �� ������� ��� ������ � ����');

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
  Root := XML.AddChild('����');
  if idtyp = 20 then
    begin
      Root.SetAttributeNS('�������������', '', FloatToXML(versform, ''));
      Root.SetAttributeNS('���', '', Filename);
    end
  else
    begin
      Root.SetAttributeNS('��������','',FloatToXML(versform,''));
      Root.SetAttributeNS('������', '', Filename);
    end;
  case OperEDO of
  0: Root.SetAttributeNS('��������','','����3');
  1: Root.SetAttributeNS('��������','','Diadoc 1.0');
  end;
  if idtyp = 20 then
    Root.SetAttributeNS('������', '', FormatId)
  else
    begin
      Node := Root.AddChild('�����������');
      Node.SetAttributeNS('������','',idSender);
      if idtyp = 5 then
        Node.SetAttributeNS('�����','',idDest)
      else
        Node.SetAttributeNS('�����','',idDest);
      // �������� ��� ������� ���
      Node:=Node.AddChild('���������');
      Node.SetAttributeNS('�����','',CSender.INN);
      case OperEDO of
      0: begin
           Node.SetAttributeNS('�����','','2BE');
           Node.SetAttributeNS('�������','','��� �������� "������"');
         end;
      1: begin
           Node.SetAttributeNS('�����','','2BM');
           Node.SetAttributeNS('�������','','�� "�� "��� ������"');
         end;
      end;
    end;

  DocumentNode := Root.AddChild('��������');
  if (idtyp <> 5) and (idtyp <> 20) then
    begin
      if idtyp = 6 then
        begin
          DocumentNode.SetAttributeNS('����������', '', date);
          DocumentNode.SetAttributeNS('����������', '', FormatDateTime('hh.mm.ss',time));
        end
      else
        begin
          DocumentNode.SetAttributeNS('���������', '', date);
          DocumentNode.SetAttributeNS('���������', '', FormatDateTime('hh.mm.ss',time));
        end;
      DocumentNode.SetAttributeNS('���', '', KND);
      DocumentNode.SetAttributeNS('���������������', '', CSender.Name);
    end;
  if idtyp = 20 then
    begin
      DocumentNode.SetAttributeNS('����', '', date);
      DocumentNode.SetAttributeNS('�����', '', FormatDateTime('hh.mm.ss', time));
//      DocumentNode.SetAttributeNS('���������', '', '��, �����������������, ������������� �����������, � ����� ������� � ������������� ��������� � ������ �������, ��������� ��������� ��� � ���, ��� ����������� ��������, � �������� ������ ��������� ������ (������)');
      DocumentNode.SetAttributeNS('��������', '', typdoc);
//      DocumentNode.SetAttributeNS('�����', '', Docnum);
    end;
  if (FUNC = '������') or (FUNC = '���') then
    DocumentNode.SetAttributeNS('��������','','�������� �� �������� ������� (���������� �����), �������� ������������� ���� (�������� �� �������� �����)');
  if (FUNC = '������') then
    DocumentNode.SetAttributeNS('����������','','����-������� � �������� �� �������� ������� (���������� �����), �������� ������������� ���� (�������� �� �������� �����)');
  if (FUNC = '���') then
    DocumentNode.SetAttributeNS('����������','','�������� �� �������� ������� (���������� �����), �������� ������������� ���� (�������� �� �������� �����)');
  if (FUNC = '�������') or (FUNC = '���') then
    DocumentNode.SetAttributeNS('��������','','�������� �� ��������� ��������� ����������� ������� (����������� �����, ��������� �����), ���������� ������������� ����');
  if (FUNC = '�������') then
    DocumentNode.SetAttributeNS('����������','','���������������� ����-������� � �������� �� ��������� ��������� ����������� ������� (����������� �����, ��������� �����), ���������� ������������� ����');
  if (FUNC = '���') then
    DocumentNode.SetAttributeNS('����������','','�������� �� ��������� ��������� ����������� ������� (����������� �����, ��������� �����), ���������� ������������� ����');
  if FUNC <> '' then
    DocumentNode.SetAttributeNS('�������', '', FUNC);
  Result := DocumentNode;
end;

procedure TSBISXMLBase.CreateFooter(idtyp:integer = 1);
var
  Node:IXMLNode;
begin
  if (idtyp<>5) and (idtyp <> 20) then
  begin
    Node := DocumentNode.AddChild('���������');

    Node.SetAttributeNS('������','',1);
    if (idtyp in [9, 12, 16, 17, 18]) then
      Node.SetAttributeNS('�������', '', 0)
    else
      begin
        case OperEDO of
          0: Node.SetAttributeNS('�������', '', 1);
          1: Node.SetAttributeNS('�������', '', 6)
        end;
      end;

    if (idtyp in [2, 9, 12, 16, 17, 18]) then
      Node.SetAttributeNS('�������','','����������� �����������')
    else
      Node.SetAttributeNS('�����������','','����������� �����������');
//    if (idtyp in [9, 12, 16, 17, 18]) then
//      Node.SetAttributeNS('����������','','����������� �����������');

    Node := Node.AddChild('��');
    Node.SetAttributeNS('�����', '', CSignatory.INN);  //    Node.SetAttributeNS('�����','',CSender.INN);
    Node.SetAttributeNS('�������', '', CSignatory.Name);  //    Node.SetAttributeNS('�������','',CSender.Name);

    Node.SetAttributeNS('�����','',Podpisant.dolgn);
    Node:=Node.AddChild('���');
    Node.SetAttributeNS('���','',Podpisant.name);
    Node.SetAttributeNS('��������','',Podpisant.otc);
    Node.SetAttributeNS('�������','',Podpisant.famaly);
  end;

  XML.XML.Text := xmlDoc.FormatXMLData(XML.XML.Text);
  XML.Active:=true;
  XML.Version := '1.0';
  XML.Encoding := 'windows-1251';
end;

procedure TSBISXMLBase.SaveToFile (FilePath:string);
begin
  if not(DirectoryExists(FilePath)) then
    raise EPathFoundException.Create(FilePath + ' �� ����������!');
  XML.SaveToFile(Filepath + FileName + FileExt);
end;

end.
