unit uSBIS;

interface

uses
  SysUtils, Classes,UtilUnit,Forms, Messages, xmldom, XMLIntf, msxmldom, XMLDoc,
  uDMSBIS, MemTableDataEh, MemTableEh, Windows, Dialogs, uDMShared, uSBISXMLBase,
  printdocunit, untErrorMsg,uCaseRep, ORAError{, MSXML2_TLB};

type

  RPlatDoc = record
    docnum, docdate, docname: string;
  end;

  TSbisPack = class(TSBISXMLBase)
  private
    idPack:integer;
    VList:TList;
  public
    appref:string;
    packPref:string;
    summa:real;
    idEdo:string;
    idOperator: string;
    Idso: string;
    TMP_idPack: integer;
    IsNewPack: boolean;
    TablePref: string;
    OldIdso: string;
    TypeDocEDO: string;
    procedure Send;
    procedure addVloj(Vloj:TSBISXMLBase);
    procedure CreateXML; override;
    constructor Create;
    destructor Destroy;
  end;

  TSbisAkt = class(TSBISXMLBase)
  public
    NameVal       :string;
    kodOKV        :string;
    SumSNDS       :real;
    Osn           :string;
    OsnDocnum     :string;
    OsnDocdate    :string;
    OsnDop        :string;
    SFData        :TMemTableEh;
    AKTData       :TMemTableEh;
    TypeForm      :string;
    AKTType       :string;
    DocType       :string;
    BegWork       :string;
    EndWork       :string;
    Recipient     :string;
    Osn_podpis    :string;
    WorkRemark    :string;
    CostGarant    :real;
    SumGarant     :real;
    NDSGarant     :real;
    tGarant       :integer;
    constructor Create;
    destructor  Destroy;
    procedure   CreateXML; override;
  end;

  TSbisSF = class(TSBISXMLBase)
  private
    LPlat         :TList;
    LOtgr         :TList;
  public
    OPType        :integer;
    KodOKV        :integer;
    SFdata        :TMemTableEh;
    IsUPD         :boolean;
    sumBezNDS     :real;
    sumnal        :real;
    sumUchNds     :real;
    func          :string;
    docForm       :string;
    CorrNumberSF  :string;
    CorrDocDateSF :string;
    procedure   FillSod(var Node: IXMLNode);
    procedure   AddPlatDoc (docnum,docdate:string);
    procedure   AddOtgrDoc(docnum, docdate: string; docname: string = '');
    constructor Create;
    destructor  Destroy;
  end;

  TSbisSchet = class(TSBISXMLBase)
  public
    kodOKV:string;
    rsschet:string;
    NaimBank:string;
    BIK:string;
    CorSch:string;
    Contract:string;
    SFdata        :TMemTableEh;
    DocSumma:real;
    SenderTel:string;
    SenderFax:string;
    SenderSite:string;
    PolTel:string;
    constructor Create;
    destructor  Destroy;
    procedure   CreateXML; override;
  end;

  TSbisNakl = class(TSBISXMLBase)
  type
    ROsnovanie  =  record
      docNum  : string;
      docName : string;
      docDate : string;
      docInfo : string;
    end;
    RTransNakl  =  record
      docNum  : string;
      docDate : string;
    end;

  private
    procedure fillPers(Node: IXMLNode; pers: TPersInfo;idtyp:integer);
  public
    cpostav : TContrInfo;
    cplat   : TContrInfo;
    BankOtpr   : rBankRekv;
    BankPol    : rBankRekv;
    BankPostav : rBankRekv;
    BankPlat   : rBankRekv;
    DocTime     : string;
    osnovanie   : ROsnovanie;
    transNakl   : RTransNakl;
    otpRazr     : TPersInfo;
    otpBuh      : TPersInfo;
    otpPro      : TPersInfo;
    vidOper     : string;
    nomerTN     : string;
    dataTN      : string;
    sumOtpusk   : real;
    sumOtpuskPr : string;
    KodOKV      :integer;
    Nakldata    :TMemTableEh;
    constructor Create;
    destructor  Destroy;
    procedure   CreateXML; override;
  end;

  TSbisUPD = class(TSBISXMLBase)
  public
    SF:TSbisSF;
    NAKL:TSbisNakl;
    FUNC:String;
    KND:string;
    constructor Create;
    destructor  Destroy;
    procedure   CreateXML; override;
    procedure   ParseXML (idPackage:integer); override;
  end;

  TSbisUKD = class(TSBISXMLBase)
  public
    OPType           :integer;
    KodOKV           :integer;
    SFdata           :TMemTableEh;
    IncTotalStNotNDS :real;
    IncTotalStNDS    :real;
    IncTotalNDS      :real;
    DecTotalStNotNDS :real;
    DecTotalStNDS    :real;
    DecTotalNDS      :real;
    OsnName          :string;
    OsnNumber        :string;
    OsnDate          :String;
    OsnComment       :String;
    NumParentDoc     :string;
    DateParentDoc    :string;
    NumIDoc          :string;
    DateIDoc         :string;
    procedure   FillSod(var Node: IXMLNode);
    constructor Create;
    destructor  Destroy;
    procedure   CreateXML; override;
  end;

  TSbisAktS = class(TSBISXMLBase)
  public
    NameVal       :string;
    kodOKV        :string;
    SumSNDS       :real;
    Osn           :string;
    OsnDocnum     :string;
    OsnDocdate    :string;
    AKTData       :TMemTableEh;
    TypeForm      :string;
    AKTType       :string;
    DocType       :string;
    BegPeriod     :string;
    EndPeriod     :string;
    Recipient     :string;
    Osn_podpis    :string;
    WorkRemark    :string;
    ItogP         :real;
    ItogR         :real;
    StartSumma    :real;
    SItogo        :real;
    CostGarant    :real;
    SumGarant     :real;
    NDSGarant     :real;
    tGarant       :integer;
    GlavBuh       :TPersInfo;
//    Ispoln        :TPersInfo;
//    DataSender    :TContrInfo;
//    DataRecipient :TContrInfo;
    constructor Create;
    destructor  Destroy;
    procedure   CreateXML; override;
  end;

  procedure FillBankRekv (sNode : IXMLNode; rekv : rBankRekv);
  function CreateCopyDateSet(var p_sourceDS, p_destinationDS: TMemTableEh): boolean;
//  function ValidateXML(filePath: string): boolean;

implementation

procedure TSbisPack.CreateXML;
var
  i:integer;
  VlojNode:IXMLNode;
  FileNode:IXMLNode;
  ContrNode:IXMLNode;
  State: IXMLNode;
  cmdNode: IXMLNode;
begin
  XML.XML.Clear;
  XML.Active:=true;
  DocumentNode := XML.AddChild('Реестр');
  DocumentNode := DocumentNode.AddChild('Пакет');

  if (TMP_idPack <> 0) and (not IsNewPack) then
    DocumentNode.SetAttributeNS('ИдДокСпецоператора', '', IDSO);
  DocumentNode.SetAttributeNS('ИдДок', '', IDEDO);
  ContrNode := DocumentNode.AddChild('Получатель');
  ContrNode.SetAttributeNS('ИНН','',CDest.INN);
  ContrNode.SetAttributeNS('КПП','',CDest.KPP);
  if (CDest.INN = '7838425340') and (CDest.KPP = '784143001') then
    ContrNode.SetAttributeNS('КодФилиала','', '10');    //необходимо для отправки в роуминг(другой оператор ЭДО)
  ContrNode := DocumentNode.AddChild('Отправитель');
  ContrNode.SetAttributeNS('ИНН','',CSender.INN);
  ContrNode.SetAttributeNS('КПП','',CSender.KPP);
  for I := 0 to VList.Count - 1 do
    begin
      VlojNode := DocumentNode.AddChild('Вложение');
      if TSBISXMLBase(Vlist[i]).idRecEDO <> '' then
        VlojNode.SetAttributeNS('ИдФайла', '', TSBISXMLBase(Vlist[i]).idRecEDO);
      VlojNode.SetAttributeNS('ИмяФайла', '', TSBISXMLBASE(VList[i]).Filename+TSBISXMLBASE(VList[i]).FileExt);
    end;
  if (TMP_idPack <> 0) and (not IsNewPack) then
    begin
      State := DocumentNode.AddChild('Состояние');
      State.SetAttributeNS('Код', '', '1');
    end;
  if (TMP_idPack <> idPack) and (TMP_idPack <> 0)then
    begin
      DocumentNode := DocumentNode.ParentNode.AddChild('Пакет');
      DocumentNode.SetAttributeNS('ИдДокСпецоператора', '', OldIdso);
      State := DocumentNode.AddChild('Состояние');
      State.SetAttributeNS('Код', '', '19');
    end;
  XML.XML.Text:=xmlDoc.FormatXMLData(XML.XML.Text);
  XML.Active:=true;
  XML.Version := '1.0';
  XML.Encoding := 'windows-1251';
end;

procedure TSbisPack.Send;
var
  i:integer;
  GUID:TGUID;
  sGuid:string;
  filePath:string;
  arcFPath:string;
  contrEdo:string;
  idDest:string;
  idSender:string;
begin
  try
    try
      if OperEDO = 0 then
        begin
          readSetting(Company_id, 'EDO', 'FilePathSBIS', filePath);
          readSetting(Company_id, 'EDO', 'CONTRSBIS', contrEdo);
        end
      else if OperEDO = 1 then
        begin
          readSetting(Company_id, 'EDO', 'FilePathKontur', filePath);
          readSetting(Company_id, 'EDO', 'CONTRKONTUR', contrEdo);
          readSetting(Company_id, 'EDO', 'ArcPathKONTUR', arcFPath);
        end;
      if filePath[length(filePath)]<>'\' then
        filePath := filePath +'\';
      CreateGUID(GUID);
      sGuid := copy(GUIDToString(GUID), 2, 36);
      idEdo := packPref + '_' + sGuid;
      idDest := CDEST.INN + CDEST.KPP;
      idSender := CSender.INN + CSender.KPP;
      if OperEDO = 0 then
        Filename := 'KONVERT_' + idDest + '_' + idSender + '_' + sGuid + '.SBIS.XML';
      DBName.AutoCommit := false;
      DBName.StartTransaction;

      idPack := DMSBIS.ModyfiPack(TMP_idPack, idEdo, ArrDocid, user_id, appref, StrToInt(contrEdo), CSender.id, CDest.id,
                                  DocNum, TypeDocEDO, DocDate, summa, IDSO, IsNewPack, TablePref, OldIdso);

      for I := 0 to Vlist.Count - 1 do
      begin
        TSBISXMLBase(Vlist[i]).CreateXML;
        TSBISXMLBase(Vlist[i]).SaveToOra(idPack, TSBISXMLBase(Vlist[i]).idtyp, appref, TSBISXMLBase(Vlist[i]).Docname, TSBISXMLBase(Vlist[i]).DocNum);
      end;
      for I := 0 to Vlist.Count - 1 do
      begin
        TSBISXMLBase(Vlist[i]).SaveToFile(filePath);
//        if not ValidateXML(Filepath + TSBISXMLBase(Vlist[i]).Filename + TSBISXMLBase(Vlist[i]).FileExt) then
//          Application.MessageBox(PChar('Ошибка валидации'), 'Информация', mb_Ok + mb_IconInformation);
        if OperEDO = 1 then
          TSBISXMLBase(Vlist[i]).SaveToFile(arcFPath);  //сохраняет в каталог архивы при выгрузке, только для ДИАДОКа
      end;
      if OperEDO = 0 then
        begin
          CreateXML;
          saveToFile(filepath);
        end;
      DBName.Commit;
      Application.MessageBox(PChar('Пакет успешно отправлен'), 'Информация', mb_Ok + mb_IconInformation);
    except
      DBName.Rollback;
      raise;
    end;
  except
    on E:ESBISDisabledException do
    begin
      Application.MessageBox(PChar('Данный контрагент не участвует в ЭДО'), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E:EPathFoundException do
    begin
      Application.MessageBox(PChar('Ошибка путей'+#13+E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E:EOraError do
    begin
      Application.MessageBox(PChar('Ошибка базы данных'+#13+E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E:EOsnNull do
    begin
      Application.MessageBox(PChar('Основание дожно быть заполнено'+#13+E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E:Exception do
    begin
      Application.MessageBox(PChar('Ошибка отправки пакета!'+#13+E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
  end;

  DBName.AutoCommit := true;
end;

procedure TSbisPack.addVloj(Vloj:TSBISXMLBase);
begin
  Vlist.Add(Vloj);
end;

constructor TSbisPack.Create;
begin
  inherited;
  Vlist := TList.Create;
  TMP_idPack := 0;
  Idso := '';
  TypeDocEDO := 'ДокОтгрИсх';
end;

destructor TSbisPack.Destroy;
var
  i:integer;
begin
  for I := 0 to VList.Count - 1 do
    TSBISXMLBase(VList[i]).Destroy;
  Vlist.Destroy;
  inherited;
end;

procedure FillBankRekv (sNode : IXMLNode; rekv : rBankRekv);
var
  Node:IXMLNode;
begin
  if rekv.NomSch='' then
    exit;
  Node := sNode.AddChild('БанкРекв');
  Node.SetAttributeNS('НомерСчета','',rekv.NomSch);
  Node := Node.AddChild('СвБанк');
  Node.SetAttributeNS('НаимБанк','',rekv.NameBank);
  if rekv.bik <> '' then
    Node.SetAttributeNS('БИК','',rekv.bik);
end;

constructor TSbisAkt.Create;
begin
  inherited;
  CreateCopyDateSet(DMSBIS.MTSF, SfData);
  CreateCopyDateSet(DMSBIS.MTAKT, AKTData);
  idtyp := 6;
end;

destructor TSbisAkt.Destroy;
begin
  SfData.Destroy;
  AKTData.Destroy;
end;

constructor TSbisUPD.Create;
begin
  inherited;
end;

destructor TSbisUPD.Destroy;
begin
  if not(SF=nil) then
    SF.Destroy;
  if not(NAKL=nil) then
    NAKL.Destroy;
  inherited;
end;

constructor TSbisSchet.Create;
begin
  inherited;
  CreateCopyDateSet(DMSBIS.MTSF, SFdata);
  idtyp := 5;
end;

destructor  TSbisSchet.Destroy;
begin
  SFdata.Destroy;
  inherited;
end;

constructor TSbisNakl.Create;
begin
  inherited;
  cpostav := TContrInfo.create;
  cplat   := TContrInfo.create;
  otpRazr := TPersInfo.create;
  otpBuh  := TPersInfo.create;
  otpPro  := TPersInfo.create;
  CreateCopyDateSet(DMSBIS.MTNakl, Nakldata);
  idtyp := 2;
end;

destructor TSbisNakl.Destroy;
begin
  cpostav.Destroy;
  cplat.Destroy;
  otpRazr.Destroy;
  otpBuh.Destroy;
  otpPro.Destroy;
  Nakldata.Destroy;
  inherited;
end;

procedure TSbisUPD.CreateXML;
var
  Node:IXMLNode;
  SVProdPer:IXMLNode;
  sumBrutto,sumNetto,sumSumma,sumNalog,sumAll:real;
begin
  CSender.DocDate   := SF.CSender.DocDate;
  CSender.id        := SF.CSender.id;
  CDest.DocDate     := CDest.DocDate;
  CDest.id          := SF.CDest.id;
  CGruzOtpr.DocDate := SF.CGruzOtpr.DocDate;
  CGruzOtpr.id      := SF.CGruzOtpr.id;
  CGruzPol.id       := SF.CGruzPol.id;
  CSignatory.id     := SF.CSender.id;
  Podpisant         := SF.Podpisant;
  DocumentNode      := CreateHeader(idtyp);

  Node := DocumentNode;

  SF.FillSod(Node);

  if not(FUNC='СЧФ') then
  begin
    SVProdPer := DocumentNode.AddChild('СвПродПер');
    Node := SVProdPer.AddChild('СвПер');
    Node.SetAttributeNS('СодОпер','','Реализация');
    Node := Node.AddChild('ОснПер');
    if assigned(Nakl) then
      if Nakl.osnovanie.docNum <> '' then
      begin
        Node.SetAttributeNS('ДатаОсн','',Nakl.osnovanie.docDate);
        Node.SetAttributeNS('НаимОсн','',Nakl.osnovanie.docName);
        Node.SetAttributeNS('НомОсн','',Nakl.osnovanie.docNum);
        if Nakl.osnovanie.docInfo <> '' then
          Node.SetAttributeNS('ДопСвОсн', '', Nakl.osnovanie.docInfo);
      end
      else
      begin
        raise EOsnNull.Create('Основание');
      end;
  end;

  CreateFooter(idtyp);
end;

procedure TSBISAkt.CreateXML;
var
  iSVDocPRU:IXMLNode;
  iNaimDoc:IXMLNode;
  iIdenDoc:IXMLNode;
  iDenIzm:IXMLNode;
  iSodFHZ1:IXMLNode;
  iSodFHZ2:IXMLNode;
  iIspol:IXMLNode;
  iZak:IXMLNode;
  iOsn:IXMLNode;
  iOpis:IXMLNode;
  iRab:IXMLNode;
  iRabOpis: IXMLNode;
  infPolFHZ1:IXMLNode;
  infPolFHZ2:IXMLNode;
  iTextInf:IXMLNode;
  itog_summa, itog_NALOG, itog_sumnal : real;
  i: integer;
begin
  CreateHeader(idtyp);

  iSVDocPRU := DocumentNode.AddChild('СвДокПРУ');

  if AKTType <> '' then
    begin
      iNaimDoc := iSVDocPRU.AddChild('НаимДок');
      iNaimDoc.SetAttributeNS('НаимДокОпр','','Акт о передаче результатов работ (Акт об оказании услуг)');
      iNaimDoc.SetAttributeNS('ПоФактХЖ','','Документ о передаче результатов работ (Документ об оказании услуг)');
    end
  else
    begin
      iNaimDoc := iSVDocPRU.AddChild('НаимДок');
      iNaimDoc.SetAttributeNS('НаимДокОпр','','АКТ сдачи-приёмки оказанных услуг');
      iNaimDoc.SetAttributeNS('ПоФактХЖ','','Документ о передаче результатов работ (Документ об оказании услуг)');
    end;

  iIdenDoc := iSVDocPRU.AddChild('ИдентДок');
  iIdenDoc.SetAttributeNS('НомДокПРУ','',docnum);
  iIdenDoc.SetAttributeNS('ДатаДокПРУ','',docdate);

  iDenIzm := iSVDocPRU.AddChild('ДенИзм');
  iDenIzm.SetAttributeNS('КодОКВ','',kodOKV);
  iDenIzm.SetAttributeNS('НаимОКВ','',nameVal);

  iSodFHZ1 := iSVDocPRU.AddChild('СодФХЖ1');

  iIspol := iSodFHZ1.AddChild('Исполнитель');
  fillContrInfo(iIspol, CSender, false, idtyp, false);

  iZak := iSodFHZ1.AddChild('Заказчик');
  fillContrInfo(iZak, CDest, false, idtyp, false);

  iOsn := iSodFHZ1.AddChild('Основание');
  iOsn.SetAttributeNS('НаимОсн', '', Osn);
  iOsn.SetAttributeNS('НомОсн', '', OsnDocnum);
  iOsn.SetAttributeNS('ДатаОсн', '', OsnDocdate);
  if OsnDop <> '' then
    iOsn.SetAttributeNS('ДопСвОсн', '', OsnDop);

  SFData.First;
  itog_summa := 0;
  itog_NALOG := 0;
  itog_sumnal := 0;
  while not(SfData.Eof) do
    begin
      itog_summa := itog_summa + SFData.FieldByName('summa').AsFloat;
      itog_NALOG := itog_NALOG + SFData.FieldByName('NALOG').AsFloat;
      itog_sumnal := itog_sumnal + SFData.FieldByName('sumnal').AsFloat;
      SFData.Next;
    end;

  iOpis := iSodFHZ1.AddChild('ОписРабот');
  iOpis.SetAttributeNS('СтБезНДСИт','',FloatToXML(itog_summa,'0.00'));
  iOpis.SetAttributeNS('СумНДСИт','',FloatToXML(itog_NALOG,'0.00'));
  iOpis.SetAttributeNS('СтУчНДСИт','',FloatToXML(itog_sumnal,'0.00'));

  SFData.First;
  while not(SfData.Eof) do
    begin
      iRab := iOpis.AddChild('Работа');
      iRab.SetAttributeNS('Номер','',SFData.RecNo);
      if (SFData.FieldByName('EDNAME').AsString <> '') then
        iRab.SetAttributeNS('НаимЕдИзм', '', SFData.FieldByName('EDNAME').AsString)
      else
        iRab.SetAttributeNS('НаимЕдИзм', '', '-');
      if (SFData.FieldByName('KOD').AsString<>'') then
        iRab.SetAttributeNS('ОКЕИ','',SFData.FieldByName('KOD').AsString)
      else
        iRab.SetAttributeNS('ОКЕИ','','0000');
      iRab.SetAttributeNS('СтоимБезНДС','',FloatToXML(SFData.FieldByName('summa').AsFloat,'0.00'));
      iRab.SetAttributeNS('СумНДС','',FloatToXML(SFData.FieldByName('nalog').AsFloat,'0.00'));
      iRab.SetAttributeNS('СтоимУчНДС','',FloatToXML(SFData.FieldByName('sumnal').AsFloat,'0.00'));

      if (SFData.FieldByName('KOD').AsString = '0000') then
        begin
          iRabOpis := iRab.AddChild('Описание');
          iRabOpis.Text := SFData.FieldByName('TEXT').AsString;
        end
      else
        begin
          if SFData.FieldByName('NameRab').AsString <> '' then
            iRab.SetAttributeNS('НаимРабот', '' , SFData.FieldByName('NameRab').AsString)
          else
            iRab.SetAttributeNS('НаимРабот', '' , SFData.FieldByName('TEXT').AsString);
          iRab.SetAttributeNS('НалСт', '', SFData.FieldByName('Tax').AsString);
          if SFData.FieldByName('price').AsFloat <> 0 then
            iRab.SetAttributeNS('Цена', '', FloatToXML(SFData.FieldByName('price').AsFloat,'0.00'))
          else
            iRab.SetAttributeNS('Цена', '', FloatToXML(0,'0.000'));
          if (SFData.FieldByName('kolvo').AsString <> '') and (SFData.FieldByName('kolvo').AsString <> '0') then
            iRab.SetAttributeNS('Количество', '', FloatToXML(SFData.FieldByName('kolvo').AsFloat,'0.000'))
          else
            iRab.SetAttributeNS('Количество','', FloatToXML(0,'0.000'));
        end;
      if (DocType = '-') then
        begin
          iTextInf := iRab.AddChild('ИнфПолеОписРабот');
          iTextInf.SetAttributeNS('Идентиф', '', 'ЗаводскойНомер');
          iTextInf.SetAttributeNS('Значен', '', SFData.FieldByName('ZavNum').AsString);
        end;
      SFData.Next;
    end;

  if OperEDO <> 1 then
    begin
      InfPolFHZ1 := iSodFHZ1.AddChild('ИнфПолФХЖ1');
      if AKTType <> '' then
        begin
          iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
          iTextInf.SetAttributeNS('Идентиф', '', 'ИдВизуализации');
          iTextInf.SetAttributeNS('Значен', '', AKTType);
          iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
          iTextInf.SetAttributeNS('Идентиф', '', 'ДокументВидОперации');
          iTextInf.SetAttributeNS('Значен', '', 'Реализация');
          if (DocType <> '') and (DocType <> '-') then
            begin
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ТипДокумента');
              iTextInf.SetAttributeNS('Значен', '', DocType);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ДоговорДата');
              iTextInf.SetAttributeNS('Значен', '', OsnDocdate);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ДоговорНомер');
              iTextInf.SetAttributeNS('Значен', '', OsnDocnum);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ВнешНомДогов');
              iTextInf.SetAttributeNS('Значен', '', Osn + ' № ' + OsnDocnum + ' от ' +  OsnDocdate);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ДатаДогов');
              iTextInf.SetAttributeNS('Значен', '', OsnDocdate);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ДатНачВыпРаб');
              iTextInf.SetAttributeNS('Значен', '', BegWork);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ДатОконВыпРаб');
              iTextInf.SetAttributeNS('Значен', '', EndWork);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ОснПрод');
              iTextInf.SetAttributeNS('Значен', '', Osn_podpis);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'НазДогов');
              iTextInf.SetAttributeNS('Значен', '', DocName);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ИмяУслуг');
              iTextInf.SetAttributeNS('Значен', '', WorkRemark);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ОКПОПокуп');
              iTextInf.SetAttributeNS('Значен', '', CDest.Okpo);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ОКПОПрод');
              iTextInf.SetAttributeNS('Значен', '', CSender.Okpo);
              {iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ЗаказФИО');        //использовать, если понадобиться вносить данные представителя заказчика
              iTextInf.SetAttributeNS('Значен', '', CDest.ContPersName);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ЗаказДолжн');
              iTextInf.SetAttributeNS('Значен', '', CDest.ContPersDolj);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ОснПокуп');
              iTextInf.SetAttributeNS('Значен', '', CDest.ContPersOsn);}
              if tGarant <> 0 then
                begin
                  iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
                  iTextInf.SetAttributeNS('Идентиф', '', 'ВыводГарантУдерж');
                  iTextInf.SetAttributeNS('Значен', '', 'Да');
                  iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
                  iTextInf.SetAttributeNS('Идентиф', '', 'СуммаГарантУдержБезНДС');
                  iTextInf.SetAttributeNS('Значен', '', FloatToXML(CostGarant,'0.00'));
                  iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
                  iTextInf.SetAttributeNS('Идентиф', '', 'СуммаГарантУдержНДС');
                  iTextInf.SetAttributeNS('Значен', '', FloatToXML(NDSGarant,'0.00'));
                  iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
                  iTextInf.SetAttributeNS('Идентиф', '', 'СуммаГарантУдержCНДС');
                  iTextInf.SetAttributeNS('Значен', '', FloatToXML(SumGarant,'0.00'));
                end;

            end
          else
            begin
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ДоговорДата');
              iTextInf.SetAttributeNS('Значен', '', OsnDocdate);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'ДоговорНомер');
              iTextInf.SetAttributeNS('Значен', '', OsnDocnum);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'МестоСоставленияАкта');
              iTextInf.SetAttributeNS('Значен', '', 'г. Пенза');
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'НачРабот');
              iTextInf.SetAttributeNS('Значен', '', BegWork);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'КонРабот');
              iTextInf.SetAttributeNS('Значен', '', EndWork);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'Грузополучатель');
              iTextInf.SetAttributeNS('Значен', '', Recipient);
              iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
              iTextInf.SetAttributeNS('Идентиф', '', 'Основание');
              iTextInf.SetAttributeNS('Значен', '', Osn + ' ' + OsnDocnum + ' от ' + OsnDocdate);
              AKTData.First;
              while not(AKTData.Eof) do
                begin
                  iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
                  iTextInf.SetAttributeNS('Идентиф', '', 'КомиссияИсполнителя');
                  iTextInf.SetAttributeNS('Значен', '', AKTData.FieldByName('Dolzhn').AsString
                                                        + ' ' + AKTData.FieldByName('Familiya').AsString);
                  AKTData.Next;
                end;
            end;
        end
      else
        begin
          iTextInf := InfPolFHZ1.AddChild('ТекстИнф');
          iTextInf.SetAttributeNS('Идентиф', '', 'ТипФормы');
          iTextInf.SetAttributeNS('Значен', '', TypeForm);
        end;
    end;
  iSodFHZ2 := DocumentNode.AddChild('СодФХЖ2');
  iSodFHZ2.SetAttributeNS('СодОпер','','СодОпер');
  if OperEDO = 1 then
    iSodFHZ2.SetAttributeNS('ДатаПер', '', docdate);
  CreateFooter(idtyp);
end;

procedure TSbisSchet.CreateXML;
var
  Node:IXMLNode;
  SvSch:IXMLNode;
  SvTov:IXMLNode;
  Vsego:IXMLNode;
  TablSchet:IXMLNode;
  sumAll:real;
  sumNalog:real;
  sumBezNds:real;
  tempstr:string;
  KontaktNode:IXMLNode;
  AdresNode:IXMLNode;
begin
  sumAll := 0;
  sumNalog := 0;
  sumBezNds := 0;
  CreateHeader(idtyp);
  SvSch := DocumentNode.AddChild('СвСчет');
  SvSch.SetAttributeNS('НомерСчет','',docnum);
  SvSch.SetAttributeNS('ДатаСчет','',docdate);
  SvSch.SetAttributeNS('КодОКВ','',kodOKV);
  Node := SvSch.AddChild('СвПрод');

  Node := fillContrInfo(Node,CSender,false,3);

  Node := Node.AddChild('БанкРекв');
  Node.SetAttributeNS('НомерСчета','',rsschet);

  Node := Node.AddChild('СвБанк');
  Node.SetAttributeNS('НаимБанк','',NaimBank);
  Node.SetAttributeNS('БИК','',BIK);
  Node.SetAttributeNS('КорСчет','',CorSch);

  Node := SvSch.AddChild('СвПокуп');

  fillContrInfo(Node,CDest,false,3);
  Node := SvSch.AddChild('ИнфПол');
  tempstr := '';
  tempstr := '<Данные>';
  if Contract<>'' then
  begin
    tempstr := tempstr + '<Реквизт Имя="Примечание" Значение="'+Contract+'"/>';
    tempstr := tempstr + '<Реквизт Имя="ИнфПередТабл" Значение="'+Contract+'"/>';
  end;
  tempstr := tempstr + '<Реквизт Имя="ДатаГен" Значение="'+DateToStr(Date)+'"/>';
  tempstr := tempstr + '<Реквизт Имя="ИдентификаторВИ" Значение="a54c336f-98f6-4307-ad65-ce5cadb600b5"/>';
  tempstr := tempstr +  '</Данные>';
  Node.SetAttributeNS('ТекстИнф','',tempstr);
  TablSchet := DocumentNode.AddChild('ТаблСчет');
  SFdata.First;
  while not(SFdata.Eof) do
  begin
    SvTov := TablSchet.AddChild('СведТов');
    SvTov.SetAttributeNS('НомСтр','',SFData.RecNo);
    SvTov.SetAttributeNS('НаимТов','',SFData.fieldbyname('TEXT').AsString);
    SvTov.SetAttributeNS('ОКЕИ_Тов','',SFData.fieldbyname('KOD').AsString);
    if (SFData.fieldbyname('KOLVO').AsString <> '')
        and (SFData.fieldbyname('KOLVO').AsString <> '-')
        and (SFData.fieldbyname('KOLVO').AsString <> '0') then
      SvTov.SetAttributeNS('КолТов','',SFData.fieldbyname('KOLVO').AsString);
    if (SFData.fieldbyname('PRICE').AsString <> '') and (SFData.fieldbyname('PRICE').AsString <> '0') then
      SvTov.SetAttributeNS('ЦенаТов','',FloatToXML(SFData.fieldbyname('PRICE').AsFloat,'0.00'));
    if (SFData.fieldbyname('SUMMA').AsString <> '') and (SFData.fieldbyname('SUMMA').AsString <> '0') then
      begin
        SvTov.SetAttributeNS('СтТовБезНДС','',FloatToXML(SFData.fieldbyname('SUMMA').AsFloat,'0.00'));
        sumBezNds := sumBezNds + SFData.fieldbyname('SUMMA').AsFloat;
      end;
    if (SFData.fieldbyname('SUMNAL').AsString <> '') and (SFData.fieldbyname('SUMNAL').AsString <> '0') then
      begin
        SvTov.SetAttributeNS('СтТовУчНал','',FloatToXML(SFData.fieldbyname('SUMNAL').AsFloat,'0.00'));
        sumAll := sumAll + SFData.fieldbyname('SUMNAL').AsFloat;
      end;
    if (SFData.fieldbyname('NALST').AsString <> '') and ((SFData.fieldbyname('NALST').AsString <> '0')) then
      begin
        Node := SvTov.AddChild('НалСт');
//        Node.SetAttributeNS('НалСтВел','',SFData.fieldbyname('NALST').AsString+'%'); //12.04.2024 появилась ошибка формата данных, лишний знак %
        Node.SetAttributeNS('НалСтВел','',SFData.fieldbyname('NALST').AsString);
        Node.SetAttributeNS('НалСтТип','','процент');
        Node := SvTov.AddChild('СумНал');
        Node.SetAttributeNS('СумНДС','',FloatToXML(SFData.fieldbyname('NALOG').AsFloat,'0.00'));
        sumNalog := sumNalog + SFData.fieldbyname('NALOG').AsFloat;
      end;
    SFdata.next;
  end;

  Vsego := TablSchet.AddChild('ВсегоОпл');
  Vsego.SetAttributeNS('СтТовБезНДСВсего','',FloatToXML(sumBezNds,'0.00'));
  Vsego.SetAttributeNS('СтТовУчНалВсего','',FloatToXML(sumAll,'0.00'));
  Vsego := Vsego.AddChild('СумНалВсего');
  Vsego.SetAttributeNS('СумНДС','',FloatToXML(sumNalog,'0.00'));

  CreateFooter(idtyp);
end;

procedure TSbisNakl.CreateXML;
var
  Node:IXMLNode;
  SvPTP:IXMLNode;
  SvPTPr:IXMLNode;
  SodFHZ1:IXMLNode;
  SodFHZ2:IXMLNode;
  SodFHZ3:IXMLNode;
  SvTov:IXMLNode;
  nTable:IXMLnode;
  sumBrutto,sumNetto,sumSumma,sumNalog,sumAll:real;
begin
  CreateHeader(idtyp);

  SvPTP   := DocumentNode.AddChild('СвДокПТПрКроме');
  SvPTPr  := SvPTP.AddChild('СвДокПТПр');

  Node := SvPTPr.AddChild('НаимДок');
  Node.SetAttributeNS('ПоФактХЖ','','Документ о передаче товара при торговых операциях');
  Node.SetAttributeNS('НаимДокОпр','','Товарная накладная');

  Node := SvPTPr.AddChild('ИдентДок');
  Node.SetAttributeNS('НомДокПТ','',nomerTN);
  Node.SetAttributeNS('ДатаДокПТ','',dataTN);

  Node := SvPTPr.AddChild('ДенИзм');
  Node.SetAttributeNS('КодОКВ','',KodOKV);

  SodFHZ1 :=SvPTPr.AddChild('СодФХЖ1');
  Node := SodFHZ1.AddChild('ГрузОтпр');
  fillContrInfo(Node,CGruzOtpr,true,2,true);
  Node := SodFHZ1.AddChild('ГрузПолуч');
  fillContrInfo(Node,CGruzPol,true,2,true);
  Node := SodFHZ1.AddChild('Продавец');
  fillContrInfo(Node,CSender,true,2,true);
  Node := SodFHZ1.AddChild('Покупатель');
  fillContrInfo(Node,CDest,true,2,true);

  Node := SodFHZ1.AddChild('Основание');
  if osnovanie.docNum <> '' then
  begin
    Node.SetAttributeNS('НаимОсн','',osnovanie.docName);
    Node.SetAttributeNS('НомОсн','',osnovanie.docNum);
    Node.SetAttributeNS('ДатаОсн','',osnovanie.docDate);
    Node.SetAttributeNS('ДопСвОсн','',osnovanie.docInfo);
  end
  else
  begin
    raise EOsnNull.Create('Основание');
  end;

 SodFHZ2 := SvPTP.AddChild('СодФХЖ2');
 NaklData.First;
 while not(NaklData.Eof) do
  begin
    Node := SodFHZ2.AddChild('СвТов');
    Node.SetAttributeNS('НомТов','',NaklData.RecNo);
    Node.SetAttributeNS('НаимТов','',NaklData.FieldByName('Text').AsString);
    Node.SetAttributeNS('НаимЕдИзм','',NaklData.FieldByName('edname').AsString);
    Node.SetAttributeNS('ОКЕИ_Тов','',NaklData.FieldByName('KOD_OKEI').AsString);
    Node.SetAttributeNS('НалСт','',NaklData.fieldbyname('NALST').AsString+'%');
    if NaklData.fieldbyname('BRUTTO').AsString <> '' then
      Node.SetAttributeNS('Брутто','',StringReplace(NaklData.fieldbyname('BRUTTO').AsString,',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('НеттоПередано','',StringReplace(NaklData.fieldbyname('NETTO').AsString,',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('Цена','',StringReplace(FormatFloat('0.00',NaklData.fieldbyname('PRICE').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('СтБезНДС','',StringReplace(FormatFloat('0.00',NaklData.fieldbyname('SUMMA').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('СумНДС','',StringReplace(FormatFloat('0.00',NaklData.fieldbyname('NALOG').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('СтУчНДС','',StringReplace(FormatFloat('0.00',NaklData.fieldbyname('SUMNAL').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));

    if NaklData.fieldbyname('BRUTTO').AsString <> '' then
      sumBrutto := sumBrutto + NaklData.fieldbyname('BRUTTO').AsFloat;
    if NaklData.fieldbyname('NETTO').AsString <> '' then
      sumNetto  := sumNetto  + NaklData.fieldbyname('NETTO').AsFloat;
    if NaklData.fieldbyname('SUMMA').AsString <> '' then
      sumSumma  := sumSumma  + NaklData.fieldbyname('SUMMA').AsFloat;
    if NaklData.fieldbyname('NALOG').AsString <> '' then
      sumNalog  := sumNalog  + NaklData.fieldbyname('NALOG').AsFloat;
    if NaklData.fieldbyname('SUMNAL').AsString <> '' then
      sumAll    := sumAll    + NaklData.fieldbyname('SUMNAL').AsFloat;
  Nakldata.Next;
  end;

  Node := SodFHZ2.AddChild('Всего');
  Node.SetAttributeNS('БруттоВс','',FloatToXML(sumBrutto,''));
  Node.SetAttributeNS('НеттоВс','',FloatToXML(sumNetto,''));
  Node.SetAttributeNS('СтБезНДСВс','',FloatToXML(sumSumma,'0.00'));
  Node.SetAttributeNS('СумНДСВс','',FloatToXML(sumNalog,'0.00'));
  Node.SetAttributeNS('СтУчНДСВс','',FloatToXML(sumAll,'0.00'));

  SodFHZ3 := DocumentNode.AddChild('СодФХЖ3');
  SodFHZ3.SetAttributeNS('СодОпер','','Перечисленные в документе ценности переданы');

  if transNakl.docNum <> '' then
  begin
    Node := SodFHZ3.AddChild('ТранНакл');
    Node.SetAttributeNS('НомТранНакл','',transNakl.docNum);
    Node.SetAttributeNS('ДатаТранНакл','',transNakl.docDate);
  end;
  CreateFooter(idtyp);
end;

procedure TSBISNakl.fillPers(Node: IXMLNode; pers: TPersInfo;idtyp:integer);
begin
  if not(idtyp = 2) then
    Node.SetAttributeNS('Должн','',pers.dolgn);
  Node := Node.AddChild('ФИО');
  Node.SetAttributeNS('Фамилия','',pers.famaly);
  Node.SetAttributeNS('Имя','',pers.name);
  Node.SetAttributeNS('Отчество','',pers.otc);
  Node := Node.ParentNode;
end;

constructor TSBISSF.Create;
begin
  inherited;
  CGruzOtpr := TContrinfo.Create;
  CGruzPol  := TContrinfo.Create;
  CreateCopyDateSet(DMSBIS.MTSF, SFdata);
  LPlat := TList.Create;
  LOtgr := TList.Create;
end;

destructor TSBISSF.Destroy;
begin
  SFdata.Destroy;
  LPlat.Clear;
  LPlat.Free;
  LOtgr.Clear;
  LOtgr.Free;
  inherited;
end;

procedure TSBISSF.AddPlatDoc(docnum,docdate:string);
var
  PlatDoc: ^RPlatDoc;
begin
  new(PlatDoc);
  PlatDoc.docnum  := docnum;
  PlatDoc.docdate := docdate;
  LPlat.Add(PlatDoc);
end;

procedure TSbisUPD.ParseXML (idPackage:integer);
var
  SL:TStringList;
  Indx:integer;
begin
  try
    ID := idPackage;
    DMSbis.qParseUPDsh.parambyname('idpack').AsInteger := idPackage;
    DMSbis.qParseUPDsh.Open;

    //Шапка
    if DMSbis.qParseUPDsh.FieldByName('PRODKPPCOUNT').AsInteger = 0 then
      raise EUnknownKPPException.Create('Ошибка загрузки данных. К/А: '+DMSbis.qParseUPDsh.FieldByName('CAPROD').AsString +
        ' Отсутствует КПП: '+DMSbis.qParseUPDsh.FieldByName('prodkpp').AsString);
    if DMSbis.qParseUPDsh.FieldByName('POKUPKPPCOUNT').AsInteger = 0 then
      raise EUnknownKPPException.Create('Ошибка загрузки данных. К/А: '+DMSbis.qParseUPDsh.FieldByName('CAPOKUP').AsString +
        ' Отсутствует КПП: '+DMSbis.qParseUPDsh.FieldByName('POKUPkpp').AsString);

    Self.SF := TSBISSF.Create;
    Self.SF.DocNum := DMSbis.qParseUPDsh.FieldByName('SCF_DOCNUM').AsString;
    Self.SF.DocDate := DMSbis.qParseUPDsh.FieldByName('SCF_DOCDATE').AsString;
    Self.SF.CSender.DocDate := DMSbis.qParseUPDsh.FieldByName('SCF_DOCDATE').AsString;
    Self.SF.CSender.id := DMSbis.qParseUPDsh.FieldByName('CAPROD').AsInteger;
    Self.SF.CSender.KPP := DMSbis.qParseUPDsh.FieldByName('PRODkpp').AsString;
    Self.SF.CDest.id := DMSbis.qParseUPDsh.FieldByName('CAPOKUP').AsInteger;
    Self.SF.CDest.KPP := DMSbis.qParseUPDsh.FieldByName('POKUPkpp').AsString;

    Self.SF.sumBezNDS := DMSbis.qParseUPDsh.FieldByName('sumBezNDS').AsFloat;
    Self.SF.sumnal    := DMSbis.qParseUPDsh.FieldByName('sumnal').AsFloat;
    Self.SF.sumUchNds := DMSbis.qParseUPDsh.FieldByName('sumUchNds').AsFloat;
    Self.SF.func      := DMSbis.qParseUPDsh.FieldByName('func').AsString;

    //Содержание
    if DMSbis.qParseUPDsh.RecordCount > 1 then
    begin
      SL := TStringList.Create;
      SL.Add('СЧ/Ф');
      SL.Add('УПД Статус:2');
      Indx := uCaseRep.GetIndx_Rep(SL, 1, 'Выберите документ');
      SL.Free;
      if Indx = 1 then
        Self.SF.func := 'СЧФ';
      if Indx = 2 then
        Self.SF.func := 'ДОП';
    end
    else
      func:='';

    DMSbis.qParseUpdSod.parambyname('func').AsString := Self.SF.func;
    DMSbis.qParseUpdSod.parambyname('idpack').AsInteger := idPackage;
    DMSbis.qParseUpdSod.Open;
    Self.SF.SFdata.LoadFromDataSet(DMSbis.qParseUpdSod, 0, lmAppend, false);
    DMSbis.qParseUpdSod.Close;

  except
    on E:EUnknownKPPException do
      untErrorMsg.ErrorMsg('Указанный КПП не найден',e.Message, 3);
    on E:exception do
      untErrorMsg.ErrorMsg('Ошибка разбора',e.Message, 3);
  end;
  DMSbis.qParseUPDsh.Close;
  DMSbis.qParseUpdSod.close;
end;

procedure TSBISSF.FillSod(var Node: IXMLNode);
var
  i:integer;
  ItogSum       :real;
  ItogTotalSum  :real;
  ItogNalog     :real;
  SvSch:IXMLNode;
  Doc:IXMLNode;
  nSvedTov:IXMLNode;
  nDopSvedTov:IXMLNode;
  nTablSF:IXMLNode;
  nAkc:IXMLNode;
  nSumNal:IXMLNode;
  nMonitorSvedTov: IXMLNode;
  nSvedTD: IXMLNode;
  nCorrSvSch: IXMLNode;
begin
  //Содержание
  Doc := Node;
  SvSch := Doc.AddChild('СвСчФакт');
  SvSch.SetAttributeNS('ДатаСчФ','',DocDate);
  SvSch.SetAttributeNS('КодОКВ','',KodOKV);
  SvSch.SetAttributeNS('НомерСчФ','',DocNum);

  if (CorrNumberSF <> '0') and (CorrNumberSF <> '') then
    begin
        nCorrSvSch := SvSch.AddChild('ИспрСчФ');
        nCorrSvSch.SetAttributeNS('НомИспрСчФ', '', CorrNumberSF);
        nCorrSvSch.SetAttributeNS('ДатаИспрСчФ', '', CorrDocDateSF);
    end;

  Node := SvSch.AddChild('СвПрод');
  Node := fillContrInfo(Node,CSender);

  if (CGruzOtpr.id > 0) then
  begin
    // Сведения о грузоотправителе
    Node := SvSch.AddChild('ГрузОт');
    if CGruzOtpr.id = CSender.id then
    begin
      Node := Node.AddChild('ОнЖе');
      Node.SetText('он же');
    end
    else
    begin
      Node := Node.AddChild('ГрузОтпр');
      fillContrInfo(Node,CGruzOtpr);
    end;
  end;

  if (CGruzPol.id > 0) then
  begin
    // Сведения о грузополучателе
    Node := SvSch.AddChild('ГрузПолуч');
    fillContrInfo(Node,CGRuzPol);
  end;

  for i := 0 to LPlat.Count - 1 do
  begin
    Node := SvSch.AddChild('СвПРД');
    Node.SetAttributeNS('НомерПРД','',RPlatDoc(LPlat[i]^).docnum);
    Node.SetAttributeNS('ДатаПРД','',RPlatDoc(LPlat[i]^).docdate);
    Node := Node.ParentNode;
  end;

  // Сведения о покупателе
  Node := SvSch.AddChild('СвПокуп');
  Node := fillContrInfo(Node,CDest);

  //Сведения о Документе об отгрузке
  for i := 0 to LOtgr.Count - 1 do
  begin
    Node := SvSch.AddChild('ДокПодтвОтгр');
    if RPlatDoc(LOtgr[i]^).docname = '' then
      Node.SetAttributeNS('НаимДокОтгр', '', 'Документ об отгрузке')
    else
      Node.SetAttributeNS('НаимДокОтгр', '', RPlatDoc(LOtgr[i]^).docname);
    Node.SetAttributeNS('НомДокОтгр', '', RPlatDoc(LOtgr[i]^).docnum);
    Node.SetAttributeNS('ДатаДокОтгр', '', RPlatDoc(LOtgr[i]^).docdate);
    Node := Node.ParentNode;
  end;

  nTablSF := Doc.AddChild('ТаблСчФакт');
  ItogSum:=0;
  ItogTotalSum:=0;
  SFdata.First;
  while not(SFdata.Eof) do
  begin
    nSvedTov := nTablSF.AddChild('СведТов');

    nAkc := nSvedTov.AddChild('Акциз');
    if uppercase(SFdata.FieldByName('AKC').AsString) = 'БЕЗ АКЦИЗА' then
    begin
      Node := nAkc.AddChild('СумАкциз');
      Node.text := StringReplace(SFData.fieldbyname('AKC').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]);
    end
    else
    begin
      Node := nAkc.AddChild('БезАкциз');
      Node.text := 'без акциза';
    end;
    nSumNal := nSvedTov.AddChild('СумНал');
    Node := nSumNal.AddChild('СумНал');
    Node.Text := StringReplace(FormatFloat('0.00',SFData.fieldbyname('NALOG').AsFloat), ',', '.',[rfReplaceAll, rfIgnoreCase]);
    nSvedTov.SetAttributeNS('НомСтр','',SFData.RecNo);
    nSvedTov.SetAttributeNS('НаимТов','',StringReplace(SFData.fieldbyname('TEXT').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
    if (SFData.fieldbyname('KOLVO').AsString <> '')
        and (SFData.fieldbyname('KOLVO').AsString <> '-')
        and (SFData.fieldbyname('KOLVO').AsString <> '0') then
      begin

        nSvedTov.SetAttributeNS('ОКЕИ_Тов','',StringReplace(SFData.fieldbyname('KOD').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));

        nSvedTD := nSvedTov.AddChild('СвТД');
        if (SFData.fieldbyname('MonitorNum').AsString <> '')
            and (SfData.FieldByName('CKOD').AsString <> '-')
            and (SfData.FieldByName('CKOD').AsString <> '') then
          nSvedTD.SetAttributeNS('КодПроисх', '', StringReplace(SFData.fieldbyname('CKOD').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]))
        else
          nSvedTD.SetAttributeNS('ДефКодПроисх', '', StringReplace('-', ',', '.', [rfReplaceAll, rfIgnoreCase]));

        nDopSvedTov := nSvedTov.AddChild('ДопСведТов');
        nDopSvedTov.SetAttributeNS('НаимЕдИзм','',StringReplace(SFData.fieldbyname('USL').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
        //данные для прослеживаемости товара
        if SFData.fieldbyname('MonitorNum').AsString <> '' then
          begin
            if (SfData.FieldByName('CKOD').AsString <> '-')
                and (SfData.FieldByName('CKOD').AsString <> '') then
              nDopSvedTov.SetAttributeNS('КрНаимСтрПр','',StringReplace(SFData.fieldbyname('SNAME').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov := nDopSvedTov.AddChild('СведПрослеж');
            nMonitorSvedTov.SetAttributeNS('НомТовПрослеж', '', StringReplace(SFData.fieldbyname('MonitorNum').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov.SetAttributeNS('ЕдИзмПрослеж', '', StringReplace(SFData.fieldbyname('MonitorEdISM').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov.SetAttributeNS('НаимЕдИзмПрослеж', '', StringReplace(SFData.fieldbyname('MonitorNEdIsm').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov.SetAttributeNS('КолВЕдПрослеж', '', StringReplace(SFData.fieldbyname('MonitorCNT').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov.SetAttributeNS('СтТовБезНДСПрослеж', '', StringReplace(SFData.fieldbyname('MonitorSum').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
          end;
      end
    else
      begin
        nSvedTov.SetAttributeNS('ДефОКЕИ_Тов','','-');
      end;
    if (SFData.fieldbyname('KOLVO').AsString <> '')
        and (SFData.fieldbyname('KOLVO').AsString <> '-')
        and (SFData.fieldbyname('KOLVO').AsString <> '0') then
      nSvedTov.SetAttributeNS('КолТов','',StringReplace(SFData.fieldbyname('KOLVO').AsString,',', '.',[rfReplaceAll, rfIgnoreCase]));
    if (SFData.fieldbyname('PRICE').AsString <> '') and (SFData.fieldbyname('PRICE').AsString <> '0') then
      nSvedTov.SetAttributeNS('ЦенаТов','',StringReplace(FormatFloat('0.00',SFData.fieldbyname('PRICE').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('НалСт','',SFData.fieldbyname('NALST').AsString);
    if (SFData.fieldbyname('SUMMA').AsString <> '') and (SFData.fieldbyname('SUMMA').AsString <> '0') then
      nSvedTov.SetAttributeNS('СтТовБезНДС','',StringReplace(FormatFloat('0.00',SFData.fieldbyname('SUMMA').AsFloat), ',', '.',[rfReplaceAll, rfIgnoreCase]));

    if (SFData.fieldbyname('SUMNAL').AsString <> '') and (SFData.fieldbyname('SUMNAL').AsString <> '0') then
      nSvedTov.SetAttributeNS('СтТовУчНал','',StringReplace(FormatFloat('0.00',SFData.fieldbyname('SUMNAL').AsFloat), ',', '.',[rfReplaceAll, rfIgnoreCase]))
    else
      nSvedTov.SetAttributeNS('СтТовУчНал','',StringReplace(FormatFloat('0.00', 0), ',', '.',[rfReplaceAll, rfIgnoreCase]));
    //Итоги
    if (trim(SFData.fieldbyname('NALOG').AsString) <> '') and (SFData.fieldbyname('NALOG').AsString <> '0') then
      ItogNalog:=ItogNalog+SFData.fieldbyname('NALOG').AsFloat;
    if (trim(SFData.fieldbyname('SUMMA').AsString)<>'') and (SFData.fieldbyname('SUMMA').AsString <> '0') then
      ItogSum:=ItogSum+SFData.fieldbyname('SUMMA').AsFloat;
    if (trim(SFData.fieldbyname('SUMNAL').AsString)<>'') and (SFData.fieldbyname('SUMNAL').AsString <> '0') then
      ItogTotalSum:=ItogTotalSum+SFData.fieldbyname('SUMNAL').AsFloat;

    SFData.Next;
  end;
  sumUchNds := ItogTotalSum;
  Node := NTablSF.AddChild('ВсегоОпл');
  Node.SetAttributeNS('СтТовБезНДСВсего','',StringReplace(FormatFloat('0.00',ItogSum), ',', '.',[rfReplaceAll, rfIgnoreCase]));
  Node.SetAttributeNS('СтТовУчНалВсего','',StringReplace(FormatFloat('0.00',ItogTotalSum), ',', '.',[rfReplaceAll, rfIgnoreCase]));
  Node := Node.AddChild('СумНалВсего');
    if ItogNalog>0 then
      begin
        Node := Node.AddChild('СумНал');
        Node.Text := StringReplace(FormatFloat('0.00',ItogNalog), ',', '.',[rfReplaceAll, rfIgnoreCase]);
      end
    else if SFData.fieldbyname('NALST').AsString = '' then
            begin
               Node := Node.AddChild('БезНДС');
              Node.Text := '-';
            end
         else
            begin
              Node := Node.AddChild('ДефНДС');
              Node.Text := '-';
            end;

end;

function CreateCopyDateSet(var p_sourceDS, p_destinationDS: TMemTableEh): boolean;
var
  i: integer;
begin
  result := false;
  try
    p_destinationDS := TMemTableEh.Create(p_sourceDS);
    p_destinationDS.CopyStructure(p_sourceDS);
    p_destinationDS.CreateDataSet;
    for I := 0 to p_sourceDS.Fields.Count - 1 do
      p_destinationDS.Fields.Fields[i].DefaultExpression := p_sourceDS.Fields.Fields[i].DefaultExpression;
    p_destinationDS.EmptyTable;
    result := true;
  except
    Application.MessageBox(PChar('Ошибка создания набора данных'), 'Ошибка', mb_Ok + mb_IconError);
    raise;
  end;
end;

procedure TSBISSF.AddOtgrDoc(docnum, docdate: string; docname: string = '');
var
  OtgrDoc: ^RPlatDoc;
begin
  new(OtgrDoc);
  OtgrDoc.docnum  := docnum;
  OtgrDoc.docdate := docdate;
  OtgrDoc.docname := docname;
  LOtgr.Add(OtgrDoc);
end;

constructor TSBISUKD.Create;
begin
  inherited;
  CGruzOtpr := TContrinfo.Create;
  CGruzPol  := TContrinfo.Create;
  CreateCopyDateSet(DMSBIS.MTKSF, SFdata);
end;

destructor TSBISUKD.Destroy;
begin
  SFdata.Destroy;
  inherited;
end;

procedure TSBISUKD.CreateXML;
begin
  DocumentNode := CreateHeader(idtyp);
  FillSod(DocumentNode);
  while DocumentNode.NodeName <> 'Документ' do
    DocumentNode := DocumentNode.ParentNode;
  CreateFooter(idtyp);
end;

procedure TSBISUKD.FillSod(var Node: IXMLNode);
var
  SvKSch: IXMLNode;
  Doc: IXMLNode;
  nSvedTov: IXMLNode;
  nTotalInc: IXMLNode;
  nTotalDec: IXMLNode;
  nTablKSF: IXMLNode;
  SodFHZ3: IXMLNode;
  PeredatDoc: IXMLNode;
  DocOsnKor: IXMLNode;
begin
  //Содержание
  Doc := Node;
  SvKSch := Doc.AddChild('СвКСчФ');
  nTablKSF := Doc.AddChild('ТаблКСчФ');
  SodFHZ3 := Doc.AddChild('СодФХЖ3');

  SvKSch.SetAttributeNS('ДатаКСчФ', '', DocDate);
  SvKSch.SetAttributeNS('КодОКВ', '', KodOKV);
  SvKSch.SetAttributeNS('НомерКСчФ', '', DocNum);
  if DateParentDoc <> '' then
    begin
      Doc := SvKSch.AddChild('СчФ');
      Doc.SetAttributeNS('ДатаСчФ', '', DateParentDoc);
      Doc.SetAttributeNS('НомерСчФ', '', NumParentDoc);
    end;

  if NumIDoc <> '' then
    begin
      Doc := SvKSch.AddChild('ИспрКСчФ');
      Doc.SetAttributeNS('НомИспрКСчФ', '', NumIDoc);
      Doc.SetAttributeNS('ДатаИспрКСчФ', '', DateIDoc);
    end;

  Doc := SvKSch.AddChild('СвПрод');
  Doc := fillContrInfo(Doc, CSender);
  // Сведения о покупателе
  Doc := SvKSch.AddChild('СвПокуп');
  Doc := fillContrInfo(Doc, CDest);

  //Табличная часть, сведения о товаре
  SFdata.First;
  while not(SFdata.Eof) do
    begin
      nSvedTov := nTablKSF.AddChild('СведТов');

      nSvedTov.SetAttributeNS('НомСтр', '', SFData.RecNo);
      nSvedTov.SetAttributeNS('НаимТов', '', SFData.fieldbyname('ProductName').AsString);
      nSvedTov.SetAttributeNS('ОКЕИ_ТовДо', '', StringReplace(SFData.fieldbyname('kodEIBefore').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('ОКЕИ_ТовПосле', '', StringReplace(SFData.fieldbyname('kodEIAfter').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('КолТовДо', '', StringReplace(SFData.fieldbyname('countBefore').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('КолТовПосле', '', StringReplace(SFData.fieldbyname('countAfter').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('ЦенаТовДо', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('priceBefore').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('ЦенаТовПосле', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('priceAfter').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('НалСтДо', '', SFData.fieldbyname('ndsBefore').AsString);
      nSvedTov.SetAttributeNS('НалСтПосле', '', SFData.fieldbyname('ndsAfter').AsString);

      nSvedTov := nSvedTov.AddChild('СтТовБезНДС');
      nSvedTov.SetAttributeNS('СтоимДоИзм', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STnotNDSBefore').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('СтоимПослеИзм', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STnotNDSAfter').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('СтоимУвел', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STnotNDSInc').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('СтоимУм', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STnotNDSDec').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov := nSvedTov.ParentNode;

      nSvedTov := nSvedTov.AddChild('АкцизДо');
      nSvedTov := nSvedTov.AddChild('БезАкциз');
      nSvedTov.Text := 'без акциза';
      nSvedTov := nSvedTov.ParentNode.ParentNode;
      nSvedTov := nSvedTov.AddChild('АкцизПосле');
      nSvedTov := nSvedTov.AddChild('БезАкциз');
      nSvedTov.Text := 'без акциза';
      nSvedTov := nSvedTov.ParentNode.ParentNode;

      nSvedTov := nSvedTov.AddChild('СумНалДо');
      nSvedTov := nSvedTov.AddChild('СумНДС');
      nSvedTov.Text := StringReplace(Format('%0.2f', [SFData.fieldbyname('sumNDSBefore').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
      nSvedTov := nSvedTov.ParentNode.ParentNode;
      nSvedTov := nSvedTov.AddChild('СумНалПосле');
      nSvedTov := nSvedTov.AddChild('СумНДС');
      nSvedTov.Text := StringReplace(Format('%0.2f', [SFData.fieldbyname('sumNDSAfter').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
      nSvedTov := nSvedTov.ParentNode.ParentNode;

      nSvedTov := nSvedTov.AddChild('СумНалРазн');
      if SFData.fieldbyname('sumNDSInc').AsFloat <> 0 then
        begin
          nSvedTov := nSvedTov.AddChild('СумУвел');
          nSvedTov.Text := StringReplace(Format('%0.2f', [SFData.fieldbyname('sumNDSInc').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
        end;
      if SFData.fieldbyname('sumNDSDec').AsFloat <> 0 then
        begin
          nSvedTov := nSvedTov.AddChild('СумУм');
          nSvedTov.Text := StringReplace(Format('%0.2f', [SFData.fieldbyname('sumNDSDec').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
        end;
      nSvedTov := nSvedTov.ParentNode.ParentNode;

      nSvedTov := nSvedTov.AddChild('СтТовУчНал');
      nSvedTov.SetAttributeNS('СтоимДоИзм', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STNDSBefore').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('СтоимПослеИзм', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STNDSAfter').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('СтоимУвел', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STNDSInc').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('СтоимУм', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STNDSDec').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov := nSvedTov.ParentNode;
      SFData.Next;
    end;

  //Табличная часть Итоги
  nTotalInc := nTablKSF.AddChild('ВсегоУвел');
  nTotalDec := nTablKSF.AddChild('ВсегоУм');

  nTotalInc.SetAttributeNS('СтТовБезНДСВсего', '', StringReplace(Format('%0.2f', [IncTotalStNotNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
  nTotalInc.SetAttributeNS('СтТовУчНалВсего', '', StringReplace(Format('%0.2f', [IncTotalStNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
  nTotalInc := nTotalInc.AddChild('СумНал');
  nTotalInc := nTotalInc.AddChild('СумНДС');
  nTotalInc.Text := StringReplace(Format('%0.2f', [IncTotalNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
  nTotalInc.ParentNode.ParentNode;

  nTotalDec.SetAttributeNS('СтТовБезНДСВсего', '', StringReplace(Format('%0.2f', [DecTotalStNotNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
  nTotalDec.SetAttributeNS('СтТовУчНалВсего', '', StringReplace(Format('%0.2f', [DecTotalStNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
  nTotalDec := nTotalDec.AddChild('СумНал');
  nTotalDec := nTotalDec.AddChild('СумНДС');
  nTotalDec.Text := StringReplace(Format('%0.2f', [DecTotalNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
  nTotalDec.ParentNode.ParentNode;

  SodFHZ3.SetAttributeNS('СодОпер', '', 'Корректировка');
  PeredatDoc := SodFHZ3.AddChild('ПередатДокум');
  PeredatDoc.SetAttributeNS('НаимОсн', '', OsnName);
  PeredatDoc.SetAttributeNS('НомОсн', '', OsnNumber);
  PeredatDoc.SetAttributeNS('ДатаОсн', '', OsnDate);
  if OsnComment <> '' then
    PeredatDoc.SetAttributeNS('ДопСвОсн', '', OsnComment);
  DocOsnKor := SodFHZ3.AddChild('ДокумОснКор');
  DocOsnKor.SetAttributeNS('НаимОсн', '', 'Без документа-основания');
end;

constructor TSbisAktS.Create;
begin
  inherited;
  CreateCopyDateSet(DMSBIS.MTAKTS, AKTData);
  AKTData.SortOrder := 'DateDoc';
  idtyp := 20;
  GlavBuh := TPersInfo.create;
end;

destructor TSbisAktS.Destroy;
begin
  AKTData.Destroy;
  freeandnil(GlavBuh);
  inherited;
end;

procedure TSBISAktS.CreateXML;
var
  iPeriod: IXMLNode;
  iSendRecip: IXMLNode;
  iAdr1: IXMLNode;
  iAdr2: IXMLNode;
  iSvUl: IXMLNode;
  iTableInf: IXMLNode;
  iTableRow: IXMLNode;
  iRowInfo: IXMLNode;
  iRepresent: IXMLNode;
  iRepresentRow: IXMLNode;
begin
  CreateHeader(idtyp);

  iPeriod := DocumentNode.AddChild('Период');
  iPeriod.SetAttributeNS('ДатаНач', '', BegPeriod);
  iPeriod.SetAttributeNS('ДатаКнц', '', EndPeriod);

  iSendRecip := DocumentNode.AddChild('Отправитель');
  iSendRecip.SetAttributeNS('Название', '', CSender.Name);
  iSendRecip.SetAttributeNS('Роль', '', 'Отправитель');
  iAdr1 := iSendRecip.AddChild('Адрес');
  iAdr1.SetAttributeNS('АдрТекст', '', CSender.GetAddrINO);
  iAdr1.SetAttributeNS('Тип', '', 'Юридический');
  iAdr2 := iAdr1.AddChild('АдрРФ');
  iAdr2.SetAttributeNS('Город', '', CSender.Adres.City);
  iAdr2.SetAttributeNS('Улица', '', CSender.Adres.Street);
  iAdr2.SetAttributeNS('Дом', '', CSender.Adres.Dom);
  iAdr2.SetAttributeNS('Индекс', '', CSender.Adres.PostIndex);
  iAdr2.SetAttributeNS('КодРегион', '', CSender.Adres.KodRegion);
  iSvUl := iSendRecip.AddChild('СвЮЛ');
  iSvUl.SetAttributeNS('ИНН', '', CSender.INN);
  iSvUl.SetAttributeNS('КПП', '', CSender.KPP);
  iSvUl.SetAttributeNS('Название', '', CSender.Name);
  iRepresent := iSendRecip.AddChild('Представители');
  iRepresentRow := iRepresent.AddChild('Руководитель');
  iRepresentRow.SetAttributeNS('Должность', '', Podpisant.dolgn);
  iRepresentRow.SetAttributeNS('ФИО', '', Podpisant.famaly + ' ' + Podpisant.name + ' ' + Podpisant.otc);
  iRepresentRow := iRepresent.AddChild('Бухгалтер');
  iRepresentRow.SetAttributeNS('Должность', '', GlavBuh.dolgn);
  iRepresentRow.SetAttributeNS('ФИО', '', GlavBuh.famaly + ' ' + GlavBuh.name + ' ' + GlavBuh.otc);

  iSendRecip := DocumentNode.AddChild('Получатель');
  iSendRecip.SetAttribute('Название', CDest.Name);
  iSendRecip.SetAttribute('Роль', 'Получатель');
  iAdr1 := iSendRecip.AddChild('Адрес');
  iAdr1.SetAttribute('АдрТекст', CDest.GetAddrINO);
  iAdr1.SetAttribute('Тип', 'Юридический');
  iAdr2 := iAdr1.AddChild('АдрРФ');
  iAdr2.SetAttribute('Город', CDest.Adres.City);
  iAdr2.SetAttribute('Улица', CDest.Adres.Street);
  iAdr2.SetAttribute('Дом', CDest.Adres.Dom);
  iAdr2.SetAttribute('Индекс', CDest.Adres.PostIndex);
  iAdr2.SetAttribute('КодРегион', CDest.Adres.KodRegion);
  iSvUl := iSendRecip.AddChild('СвЮЛ');
  iSvUl.SetAttribute('ИНН', CDest.INN);
  iSvUl.SetAttribute('КПП', CDest.KPP);
  iSvUl.SetAttribute('Название', CDest.Name);

  if AKTData.RecordCount > 0 then
    begin
      iTableInf := DocumentNode.AddChild('ТаблДок');
      if StartSumma > 0 then
        begin
          iRowInfo := iTableInf.AddChild('ИтогТабл');
          iRowInfo.SetAttributeNS('Дебет', '', FloatToXML(abs(StartSumma), '0.00'));
          iRowInfo.SetAttributeNS('Кредит', '', 0);
          iRowInfo.SetAttributeNS('Раздел', '', 'Отправитель');
          iRowInfo.SetAttributeNS('Тип', '', 'Сальдо начальное');
        end
      else
        begin
          iRowInfo := iTableInf.AddChild('ИтогТабл');
          iRowInfo.SetAttributeNS('Дебет', '', 0);
          iRowInfo.SetAttributeNS('Кредит', '', FloatToXML(abs(StartSumma), '0.00'));
          iRowInfo.SetAttributeNS('Раздел', '', 'Отправитель');
          iRowInfo.SetAttributeNS('Тип', '', 'Сальдо начальное');
        end;
      if SItogo > 0 then
        begin
          iRowInfo := iTableInf.AddChild('ИтогТабл');
          iRowInfo.SetAttributeNS('Дебет', '', FloatToXML(abs(SItogo), '0.00'));
          iRowInfo.SetAttributeNS('Кредит', '', 0);
          iRowInfo.SetAttributeNS('Раздел', '', 'Отправитель');
          iRowInfo.SetAttributeNS('Тип', '', 'Сальдо конечное');
        end
      else
        begin
          iRowInfo := iTableInf.AddChild('ИтогТабл');
          iRowInfo.SetAttributeNS('Дебет', '', 0);
          iRowInfo.SetAttributeNS('Кредит', '', FloatToXML(abs(SItogo), '0.00'));
          iRowInfo.SetAttributeNS('Раздел', '', 'Отправитель');
          iRowInfo.SetAttributeNS('Тип', '', 'Сальдо конечное');
        end;

      iRowInfo := iTableInf.AddChild('ИтогТабл');
      iRowInfo.SetAttributeNS('Дебет', '', FloatToXML(ItogR, '0.00'));
      iRowInfo.SetAttributeNS('Кредит', '', FloatToXML(ItogP, '0.00'));
      iRowInfo.SetAttributeNS('Раздел', '', 'Отправитель');
      iRowInfo.SetAttributeNS('Тип', '', 'Обороты');

      if StartSumma < 0 then
        begin
          iRowInfo := iTableInf.AddChild('ИтогТабл');
          iRowInfo.SetAttributeNS('Дебет', '', FloatToXML(abs(StartSumma), '0.00'));
          iRowInfo.SetAttributeNS('Кредит', '', 0);
          iRowInfo.SetAttributeNS('Раздел', '', 'Получатель');
          iRowInfo.SetAttributeNS('Тип', '', 'Сальдо начальное');
        end
      else
        begin
          iRowInfo := iTableInf.AddChild('ИтогТабл');
          iRowInfo.SetAttributeNS('Дебет', '', 0);
          iRowInfo.SetAttributeNS('Кредит', '', FloatToXML(abs(StartSumma), '0.00'));
          iRowInfo.SetAttributeNS('Раздел', '', 'Получатель');
          iRowInfo.SetAttributeNS('Тип', '', 'Сальдо начальное');
        end;
      if SItogo < 0 then
        begin
          iRowInfo := iTableInf.AddChild('ИтогТабл');
          iRowInfo.SetAttributeNS('Дебет', '', FloatToXML(abs(SItogo), '0.00'));
          iRowInfo.SetAttributeNS('Кредит', '', 0);
          iRowInfo.SetAttributeNS('Раздел', '', 'Получатель');
          iRowInfo.SetAttributeNS('Тип', '', 'Сальдо конечное');
        end
      else
        begin
          iRowInfo := iTableInf.AddChild('ИтогТабл');
          iRowInfo.SetAttributeNS('Дебет', '', 0);
          iRowInfo.SetAttributeNS('Кредит', '', FloatToXML(abs(SItogo), '0.00'));
          iRowInfo.SetAttributeNS('Раздел', '', 'Получатель');
          iRowInfo.SetAttributeNS('Тип', '', 'Сальдо конечное');
        end;

      iRowInfo := iTableInf.AddChild('ИтогТабл');
      iRowInfo.SetAttributeNS('Дебет', '', FloatToXML(ItogP, '0.00'));
      iRowInfo.SetAttributeNS('Кредит', '', FloatToXML(ItogR, '0.00'));
      iRowInfo.SetAttributeNS('Раздел', '', 'Получатель');
      iRowInfo.SetAttributeNS('Тип', '', 'Обороты');

      AKTData.First;
      while not(AKTData.Eof) do
        begin
          iTableRow := iTableInf.AddChild('СтрТабл');
          iTableRow.SetAttributeNS('Дата', '', AKTData.FieldByName('DateDoc').AsString);
          if AKTData.FieldByName('PRIH_RASH').AsString = '+' then
            begin
              iTableRow.SetAttributeNS('Дебет', '' , '0.00');
              iTableRow.SetAttributeNS('Кредит', '' , FloatToXML(AKTData.FieldByName('SumDoc').AsFloat, '0.00'));
            end;
          if AKTData.FieldByName('PRIH_RASH').AsString = '-' then
            begin
              iTableRow.SetAttributeNS('Дебет', '' , FloatToXML(AKTData.FieldByName('SumDoc').AsFloat, '0.00'));
              iTableRow.SetAttributeNS('Кредит', '' , '0.00');
            end;
          iTableRow.SetAttributeNS('Название', '', AKTData.FieldByName('Remark').AsString);
          iTableRow.SetAttributeNS('Раздел', '', 'Отправитель');

          iTableRow := iTableInf.AddChild('СтрТабл');
          iTableRow.SetAttributeNS('Дата', '', AKTData.FieldByName('DateDoc').AsString);
          if AKTData.FieldByName('PRIH_RASH').AsString = '-' then
            begin
              iTableRow.SetAttributeNS('Дебет', '' , '0.00');
              iTableRow.SetAttributeNS('Кредит', '' , FloatToXML(AKTData.FieldByName('SumDoc').AsFloat, '0.00'));
            end;
          if AKTData.FieldByName('PRIH_RASH').AsString = '+' then
            begin
              iTableRow.SetAttributeNS('Дебет', '' , FloatToXML(AKTData.FieldByName('SumDoc').AsFloat, '0.00'));
              iTableRow.SetAttributeNS('Кредит', '' , '0.00');
            end;
          iTableRow.SetAttributeNS('Название', '', AKTData.FieldByName('Remark').AsString);
          iTableRow.SetAttributeNS('Раздел', '', 'Получатель');
          AKTData.Next;
        end;
    end;
  CreateFooter(idtyp);
end;

//procedure TfrmMain.btnValidateClick(Sender: TObject);
{function ValidateXML(filePath: string): boolean;
var
  vXMLParserError: IXMLDOMParseError2;
  vXMLSchema: IXMLDOMSchemaCollection2;
  vXMLDoc: IXMLDOMDocument2;
  vXMLSchemaDoc: IXMLDOMDocument2;
  vStrs: TStringList;
  CodError:IXMLDOMParseErrorCollection;
   i : Integer;
  InfoError: string;
begin
  vStrs := TStringList.Create();
  InfoError := '';
  try
    //Загрузка схемы
    vXMLSchema := CoXMLSchemaCache60.Create();
    vXMLSchemaDoc := CoDOMDocument60.Create();
    vStrs.LoadFromFile( 'd:\SBIS\Счет-фактура - 1115131 5.01.xsd' );
//    vStrs.LoadFromFile( filePath );
    vXMLSchemaDoc.loadXML( vStrs.Text );
    if vXMLSchemaDoc.parseError.errorCode <> 0 then
      begin
        ShowMessage(Format('Ошибка при загрузке схемы <%s: %s>', [vXMLSchemaDoc.parseError.reason, vXMLSchemaDoc.parseError.srcText]));
        Exit;
      end;
    vXMLSchema.add('', vXMLSchemaDoc);
//Загрузка документа
    vXMLDoc := CoDOMDocument60.Create();
    vXMLDoc.async := False;
    vXMLDoc.resolveExternals := false;
    vXMLDoc.validateOnParse := false;
    vXMLDoc.setProperty('MultipleErrorMessages',true);
    vStrs.Clear();
//    vStrs.LoadFromFile( 'c:\temp\R1_6109001892_095_09102015_DA268A53-98DD-4486-A820-3BC42F109D38.XML' );
    vStrs.LoadFromFile( filePath );
    vXMLDoc.loadXML( vStrs.Text );
    vXMLDoc.schemas := vXMLSchema;
    vXMLParserError := vXMLDoc.validate as IXMLDOMParseError2;
//    Memo1.Clear;
    if vXMLParserError.errorCode <> 0 then
      begin
        CodError := vXMLParserError.allErrors;
        for I := 0 to CodError.length-1 do
          InfoError := InfoError + ', ' + CodError.item[i].reason;
//        begin
//        Memo1.Lines.Add(CodError.item[i].reason);
//        Memo1.Lines.Add('*****');
//        end;
      ShowMessage( InfoError );
      Result := false;
      end
    else
      begin
      ShowMessage( 'Валидация документа проша успешно' );
      Result := true;
      end;
  finally
    FreeAndNil( vStrs );
  end;
end;}

end.
