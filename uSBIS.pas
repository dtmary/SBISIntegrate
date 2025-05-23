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
  DocumentNode := XML.AddChild('������');
  DocumentNode := DocumentNode.AddChild('�����');

  if (TMP_idPack <> 0) and (not IsNewPack) then
    DocumentNode.SetAttributeNS('������������������', '', IDSO);
  DocumentNode.SetAttributeNS('�����', '', IDEDO);
  ContrNode := DocumentNode.AddChild('����������');
  ContrNode.SetAttributeNS('���','',CDest.INN);
  ContrNode.SetAttributeNS('���','',CDest.KPP);
  if (CDest.INN = '7838425340') and (CDest.KPP = '784143001') then
    ContrNode.SetAttributeNS('����������','', '10');    //���������� ��� �������� � �������(������ �������� ���)
  ContrNode := DocumentNode.AddChild('�����������');
  ContrNode.SetAttributeNS('���','',CSender.INN);
  ContrNode.SetAttributeNS('���','',CSender.KPP);
  for I := 0 to VList.Count - 1 do
    begin
      VlojNode := DocumentNode.AddChild('��������');
      if TSBISXMLBase(Vlist[i]).idRecEDO <> '' then
        VlojNode.SetAttributeNS('�������', '', TSBISXMLBase(Vlist[i]).idRecEDO);
      VlojNode.SetAttributeNS('��������', '', TSBISXMLBASE(VList[i]).Filename+TSBISXMLBASE(VList[i]).FileExt);
    end;
  if (TMP_idPack <> 0) and (not IsNewPack) then
    begin
      State := DocumentNode.AddChild('���������');
      State.SetAttributeNS('���', '', '1');
    end;
  if (TMP_idPack <> idPack) and (TMP_idPack <> 0)then
    begin
      DocumentNode := DocumentNode.ParentNode.AddChild('�����');
      DocumentNode.SetAttributeNS('������������������', '', OldIdso);
      State := DocumentNode.AddChild('���������');
      State.SetAttributeNS('���', '', '19');
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
//          Application.MessageBox(PChar('������ ���������'), '����������', mb_Ok + mb_IconInformation);
        if OperEDO = 1 then
          TSBISXMLBase(Vlist[i]).SaveToFile(arcFPath);  //��������� � ������� ������ ��� ��������, ������ ��� �������
      end;
      if OperEDO = 0 then
        begin
          CreateXML;
          saveToFile(filepath);
        end;
      DBName.Commit;
      Application.MessageBox(PChar('����� ������� ���������'), '����������', mb_Ok + mb_IconInformation);
    except
      DBName.Rollback;
      raise;
    end;
  except
    on E:ESBISDisabledException do
    begin
      Application.MessageBox(PChar('������ ���������� �� ��������� � ���'), '������', mb_Ok + mb_IconError);
    end;
    on E:EPathFoundException do
    begin
      Application.MessageBox(PChar('������ �����'+#13+E.Message), '������', mb_Ok + mb_IconError);
    end;
    on E:EOraError do
    begin
      Application.MessageBox(PChar('������ ���� ������'+#13+E.Message), '������', mb_Ok + mb_IconError);
    end;
    on E:EOsnNull do
    begin
      Application.MessageBox(PChar('��������� ����� ���� ���������'+#13+E.Message), '������', mb_Ok + mb_IconError);
    end;
    on E:Exception do
    begin
      Application.MessageBox(PChar('������ �������� ������!'+#13+E.Message), '������', mb_Ok + mb_IconError);
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
  TypeDocEDO := '����������';
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
  Node := sNode.AddChild('��������');
  Node.SetAttributeNS('����������','',rekv.NomSch);
  Node := Node.AddChild('������');
  Node.SetAttributeNS('��������','',rekv.NameBank);
  if rekv.bik <> '' then
    Node.SetAttributeNS('���','',rekv.bik);
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

  if not(FUNC='���') then
  begin
    SVProdPer := DocumentNode.AddChild('���������');
    Node := SVProdPer.AddChild('�����');
    Node.SetAttributeNS('�������','','����������');
    Node := Node.AddChild('������');
    if assigned(Nakl) then
      if Nakl.osnovanie.docNum <> '' then
      begin
        Node.SetAttributeNS('�������','',Nakl.osnovanie.docDate);
        Node.SetAttributeNS('�������','',Nakl.osnovanie.docName);
        Node.SetAttributeNS('������','',Nakl.osnovanie.docNum);
        if Nakl.osnovanie.docInfo <> '' then
          Node.SetAttributeNS('��������', '', Nakl.osnovanie.docInfo);
      end
      else
      begin
        raise EOsnNull.Create('���������');
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

  iSVDocPRU := DocumentNode.AddChild('��������');

  if AKTType <> '' then
    begin
      iNaimDoc := iSVDocPRU.AddChild('�������');
      iNaimDoc.SetAttributeNS('����������','','��� � �������� ����������� ����� (��� �� �������� �����)');
      iNaimDoc.SetAttributeNS('��������','','�������� � �������� ����������� ����� (�������� �� �������� �����)');
    end
  else
    begin
      iNaimDoc := iSVDocPRU.AddChild('�������');
      iNaimDoc.SetAttributeNS('����������','','��� �����-������ ��������� �����');
      iNaimDoc.SetAttributeNS('��������','','�������� � �������� ����������� ����� (�������� �� �������� �����)');
    end;

  iIdenDoc := iSVDocPRU.AddChild('��������');
  iIdenDoc.SetAttributeNS('���������','',docnum);
  iIdenDoc.SetAttributeNS('����������','',docdate);

  iDenIzm := iSVDocPRU.AddChild('������');
  iDenIzm.SetAttributeNS('������','',kodOKV);
  iDenIzm.SetAttributeNS('�������','',nameVal);

  iSodFHZ1 := iSVDocPRU.AddChild('������1');

  iIspol := iSodFHZ1.AddChild('�����������');
  fillContrInfo(iIspol, CSender, false, idtyp, false);

  iZak := iSodFHZ1.AddChild('��������');
  fillContrInfo(iZak, CDest, false, idtyp, false);

  iOsn := iSodFHZ1.AddChild('���������');
  iOsn.SetAttributeNS('�������', '', Osn);
  iOsn.SetAttributeNS('������', '', OsnDocnum);
  iOsn.SetAttributeNS('�������', '', OsnDocdate);
  if OsnDop <> '' then
    iOsn.SetAttributeNS('��������', '', OsnDop);

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

  iOpis := iSodFHZ1.AddChild('���������');
  iOpis.SetAttributeNS('����������','',FloatToXML(itog_summa,'0.00'));
  iOpis.SetAttributeNS('��������','',FloatToXML(itog_NALOG,'0.00'));
  iOpis.SetAttributeNS('���������','',FloatToXML(itog_sumnal,'0.00'));

  SFData.First;
  while not(SfData.Eof) do
    begin
      iRab := iOpis.AddChild('������');
      iRab.SetAttributeNS('�����','',SFData.RecNo);
      if (SFData.FieldByName('EDNAME').AsString <> '') then
        iRab.SetAttributeNS('���������', '', SFData.FieldByName('EDNAME').AsString)
      else
        iRab.SetAttributeNS('���������', '', '-');
      if (SFData.FieldByName('KOD').AsString<>'') then
        iRab.SetAttributeNS('����','',SFData.FieldByName('KOD').AsString)
      else
        iRab.SetAttributeNS('����','','0000');
      iRab.SetAttributeNS('�����������','',FloatToXML(SFData.FieldByName('summa').AsFloat,'0.00'));
      iRab.SetAttributeNS('������','',FloatToXML(SFData.FieldByName('nalog').AsFloat,'0.00'));
      iRab.SetAttributeNS('����������','',FloatToXML(SFData.FieldByName('sumnal').AsFloat,'0.00'));

      if (SFData.FieldByName('KOD').AsString = '0000') then
        begin
          iRabOpis := iRab.AddChild('��������');
          iRabOpis.Text := SFData.FieldByName('TEXT').AsString;
        end
      else
        begin
          if SFData.FieldByName('NameRab').AsString <> '' then
            iRab.SetAttributeNS('���������', '' , SFData.FieldByName('NameRab').AsString)
          else
            iRab.SetAttributeNS('���������', '' , SFData.FieldByName('TEXT').AsString);
          iRab.SetAttributeNS('�����', '', SFData.FieldByName('Tax').AsString);
          if SFData.FieldByName('price').AsFloat <> 0 then
            iRab.SetAttributeNS('����', '', FloatToXML(SFData.FieldByName('price').AsFloat,'0.00'))
          else
            iRab.SetAttributeNS('����', '', FloatToXML(0,'0.000'));
          if (SFData.FieldByName('kolvo').AsString <> '') and (SFData.FieldByName('kolvo').AsString <> '0') then
            iRab.SetAttributeNS('����������', '', FloatToXML(SFData.FieldByName('kolvo').AsFloat,'0.000'))
          else
            iRab.SetAttributeNS('����������','', FloatToXML(0,'0.000'));
        end;
      if (DocType = '-') then
        begin
          iTextInf := iRab.AddChild('����������������');
          iTextInf.SetAttributeNS('�������', '', '��������������');
          iTextInf.SetAttributeNS('������', '', SFData.FieldByName('ZavNum').AsString);
        end;
      SFData.Next;
    end;

  if OperEDO <> 1 then
    begin
      InfPolFHZ1 := iSodFHZ1.AddChild('���������1');
      if AKTType <> '' then
        begin
          iTextInf := InfPolFHZ1.AddChild('��������');
          iTextInf.SetAttributeNS('�������', '', '��������������');
          iTextInf.SetAttributeNS('������', '', AKTType);
          iTextInf := InfPolFHZ1.AddChild('��������');
          iTextInf.SetAttributeNS('�������', '', '�������������������');
          iTextInf.SetAttributeNS('������', '', '����������');
          if (DocType <> '') and (DocType <> '-') then
            begin
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '������������');
              iTextInf.SetAttributeNS('������', '', DocType);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '�����������');
              iTextInf.SetAttributeNS('������', '', OsnDocdate);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '������������');
              iTextInf.SetAttributeNS('������', '', OsnDocnum);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '������������');
              iTextInf.SetAttributeNS('������', '', Osn + ' � ' + OsnDocnum + ' �� ' +  OsnDocdate);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '���������');
              iTextInf.SetAttributeNS('������', '', OsnDocdate);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '������������');
              iTextInf.SetAttributeNS('������', '', BegWork);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '�������������');
              iTextInf.SetAttributeNS('������', '', EndWork);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '�������');
              iTextInf.SetAttributeNS('������', '', Osn_podpis);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '��������');
              iTextInf.SetAttributeNS('������', '', DocName);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '��������');
              iTextInf.SetAttributeNS('������', '', WorkRemark);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '���������');
              iTextInf.SetAttributeNS('������', '', CDest.Okpo);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '��������');
              iTextInf.SetAttributeNS('������', '', CSender.Okpo);
              {iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '��������');        //������������, ���� ������������ ������� ������ ������������� ���������
              iTextInf.SetAttributeNS('������', '', CDest.ContPersName);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '����������');
              iTextInf.SetAttributeNS('������', '', CDest.ContPersDolj);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '��������');
              iTextInf.SetAttributeNS('������', '', CDest.ContPersOsn);}
              if tGarant <> 0 then
                begin
                  iTextInf := InfPolFHZ1.AddChild('��������');
                  iTextInf.SetAttributeNS('�������', '', '����������������');
                  iTextInf.SetAttributeNS('������', '', '��');
                  iTextInf := InfPolFHZ1.AddChild('��������');
                  iTextInf.SetAttributeNS('�������', '', '����������������������');
                  iTextInf.SetAttributeNS('������', '', FloatToXML(CostGarant,'0.00'));
                  iTextInf := InfPolFHZ1.AddChild('��������');
                  iTextInf.SetAttributeNS('�������', '', '�������������������');
                  iTextInf.SetAttributeNS('������', '', FloatToXML(NDSGarant,'0.00'));
                  iTextInf := InfPolFHZ1.AddChild('��������');
                  iTextInf.SetAttributeNS('�������', '', '����������������C���');
                  iTextInf.SetAttributeNS('������', '', FloatToXML(SumGarant,'0.00'));
                end;

            end
          else
            begin
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '�����������');
              iTextInf.SetAttributeNS('������', '', OsnDocdate);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '������������');
              iTextInf.SetAttributeNS('������', '', OsnDocnum);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '��������������������');
              iTextInf.SetAttributeNS('������', '', '�. �����');
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '��������');
              iTextInf.SetAttributeNS('������', '', BegWork);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '��������');
              iTextInf.SetAttributeNS('������', '', EndWork);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '���������������');
              iTextInf.SetAttributeNS('������', '', Recipient);
              iTextInf := InfPolFHZ1.AddChild('��������');
              iTextInf.SetAttributeNS('�������', '', '���������');
              iTextInf.SetAttributeNS('������', '', Osn + ' ' + OsnDocnum + ' �� ' + OsnDocdate);
              AKTData.First;
              while not(AKTData.Eof) do
                begin
                  iTextInf := InfPolFHZ1.AddChild('��������');
                  iTextInf.SetAttributeNS('�������', '', '�������������������');
                  iTextInf.SetAttributeNS('������', '', AKTData.FieldByName('Dolzhn').AsString
                                                        + ' ' + AKTData.FieldByName('Familiya').AsString);
                  AKTData.Next;
                end;
            end;
        end
      else
        begin
          iTextInf := InfPolFHZ1.AddChild('��������');
          iTextInf.SetAttributeNS('�������', '', '��������');
          iTextInf.SetAttributeNS('������', '', TypeForm);
        end;
    end;
  iSodFHZ2 := DocumentNode.AddChild('������2');
  iSodFHZ2.SetAttributeNS('�������','','�������');
  if OperEDO = 1 then
    iSodFHZ2.SetAttributeNS('�������', '', docdate);
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
  SvSch := DocumentNode.AddChild('������');
  SvSch.SetAttributeNS('���������','',docnum);
  SvSch.SetAttributeNS('��������','',docdate);
  SvSch.SetAttributeNS('������','',kodOKV);
  Node := SvSch.AddChild('������');

  Node := fillContrInfo(Node,CSender,false,3);

  Node := Node.AddChild('��������');
  Node.SetAttributeNS('����������','',rsschet);

  Node := Node.AddChild('������');
  Node.SetAttributeNS('��������','',NaimBank);
  Node.SetAttributeNS('���','',BIK);
  Node.SetAttributeNS('�������','',CorSch);

  Node := SvSch.AddChild('�������');

  fillContrInfo(Node,CDest,false,3);
  Node := SvSch.AddChild('������');
  tempstr := '';
  tempstr := '<������>';
  if Contract<>'' then
  begin
    tempstr := tempstr + '<������� ���="����������" ��������="'+Contract+'"/>';
    tempstr := tempstr + '<������� ���="������������" ��������="'+Contract+'"/>';
  end;
  tempstr := tempstr + '<������� ���="�������" ��������="'+DateToStr(Date)+'"/>';
  tempstr := tempstr + '<������� ���="���������������" ��������="a54c336f-98f6-4307-ad65-ce5cadb600b5"/>';
  tempstr := tempstr +  '</������>';
  Node.SetAttributeNS('��������','',tempstr);
  TablSchet := DocumentNode.AddChild('��������');
  SFdata.First;
  while not(SFdata.Eof) do
  begin
    SvTov := TablSchet.AddChild('�������');
    SvTov.SetAttributeNS('������','',SFData.RecNo);
    SvTov.SetAttributeNS('�������','',SFData.fieldbyname('TEXT').AsString);
    SvTov.SetAttributeNS('����_���','',SFData.fieldbyname('KOD').AsString);
    if (SFData.fieldbyname('KOLVO').AsString <> '')
        and (SFData.fieldbyname('KOLVO').AsString <> '-')
        and (SFData.fieldbyname('KOLVO').AsString <> '0') then
      SvTov.SetAttributeNS('������','',SFData.fieldbyname('KOLVO').AsString);
    if (SFData.fieldbyname('PRICE').AsString <> '') and (SFData.fieldbyname('PRICE').AsString <> '0') then
      SvTov.SetAttributeNS('�������','',FloatToXML(SFData.fieldbyname('PRICE').AsFloat,'0.00'));
    if (SFData.fieldbyname('SUMMA').AsString <> '') and (SFData.fieldbyname('SUMMA').AsString <> '0') then
      begin
        SvTov.SetAttributeNS('�����������','',FloatToXML(SFData.fieldbyname('SUMMA').AsFloat,'0.00'));
        sumBezNds := sumBezNds + SFData.fieldbyname('SUMMA').AsFloat;
      end;
    if (SFData.fieldbyname('SUMNAL').AsString <> '') and (SFData.fieldbyname('SUMNAL').AsString <> '0') then
      begin
        SvTov.SetAttributeNS('����������','',FloatToXML(SFData.fieldbyname('SUMNAL').AsFloat,'0.00'));
        sumAll := sumAll + SFData.fieldbyname('SUMNAL').AsFloat;
      end;
    if (SFData.fieldbyname('NALST').AsString <> '') and ((SFData.fieldbyname('NALST').AsString <> '0')) then
      begin
        Node := SvTov.AddChild('�����');
//        Node.SetAttributeNS('��������','',SFData.fieldbyname('NALST').AsString+'%'); //12.04.2024 ��������� ������ ������� ������, ������ ���� %
        Node.SetAttributeNS('��������','',SFData.fieldbyname('NALST').AsString);
        Node.SetAttributeNS('��������','','�������');
        Node := SvTov.AddChild('������');
        Node.SetAttributeNS('������','',FloatToXML(SFData.fieldbyname('NALOG').AsFloat,'0.00'));
        sumNalog := sumNalog + SFData.fieldbyname('NALOG').AsFloat;
      end;
    SFdata.next;
  end;

  Vsego := TablSchet.AddChild('��������');
  Vsego.SetAttributeNS('����������������','',FloatToXML(sumBezNds,'0.00'));
  Vsego.SetAttributeNS('���������������','',FloatToXML(sumAll,'0.00'));
  Vsego := Vsego.AddChild('�����������');
  Vsego.SetAttributeNS('������','',FloatToXML(sumNalog,'0.00'));

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

  SvPTP   := DocumentNode.AddChild('��������������');
  SvPTPr  := SvPTP.AddChild('���������');

  Node := SvPTPr.AddChild('�������');
  Node.SetAttributeNS('��������','','�������� � �������� ������ ��� �������� ���������');
  Node.SetAttributeNS('����������','','�������� ���������');

  Node := SvPTPr.AddChild('��������');
  Node.SetAttributeNS('��������','',nomerTN);
  Node.SetAttributeNS('���������','',dataTN);

  Node := SvPTPr.AddChild('������');
  Node.SetAttributeNS('������','',KodOKV);

  SodFHZ1 :=SvPTPr.AddChild('������1');
  Node := SodFHZ1.AddChild('��������');
  fillContrInfo(Node,CGruzOtpr,true,2,true);
  Node := SodFHZ1.AddChild('���������');
  fillContrInfo(Node,CGruzPol,true,2,true);
  Node := SodFHZ1.AddChild('��������');
  fillContrInfo(Node,CSender,true,2,true);
  Node := SodFHZ1.AddChild('����������');
  fillContrInfo(Node,CDest,true,2,true);

  Node := SodFHZ1.AddChild('���������');
  if osnovanie.docNum <> '' then
  begin
    Node.SetAttributeNS('�������','',osnovanie.docName);
    Node.SetAttributeNS('������','',osnovanie.docNum);
    Node.SetAttributeNS('�������','',osnovanie.docDate);
    Node.SetAttributeNS('��������','',osnovanie.docInfo);
  end
  else
  begin
    raise EOsnNull.Create('���������');
  end;

 SodFHZ2 := SvPTP.AddChild('������2');
 NaklData.First;
 while not(NaklData.Eof) do
  begin
    Node := SodFHZ2.AddChild('�����');
    Node.SetAttributeNS('������','',NaklData.RecNo);
    Node.SetAttributeNS('�������','',NaklData.FieldByName('Text').AsString);
    Node.SetAttributeNS('���������','',NaklData.FieldByName('edname').AsString);
    Node.SetAttributeNS('����_���','',NaklData.FieldByName('KOD_OKEI').AsString);
    Node.SetAttributeNS('�����','',NaklData.fieldbyname('NALST').AsString+'%');
    if NaklData.fieldbyname('BRUTTO').AsString <> '' then
      Node.SetAttributeNS('������','',StringReplace(NaklData.fieldbyname('BRUTTO').AsString,',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('�������������','',StringReplace(NaklData.fieldbyname('NETTO').AsString,',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('����','',StringReplace(FormatFloat('0.00',NaklData.fieldbyname('PRICE').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('��������','',StringReplace(FormatFloat('0.00',NaklData.fieldbyname('SUMMA').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('������','',StringReplace(FormatFloat('0.00',NaklData.fieldbyname('NALOG').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));
    Node.SetAttributeNS('�������','',StringReplace(FormatFloat('0.00',NaklData.fieldbyname('SUMNAL').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));

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

  Node := SodFHZ2.AddChild('�����');
  Node.SetAttributeNS('��������','',FloatToXML(sumBrutto,''));
  Node.SetAttributeNS('�������','',FloatToXML(sumNetto,''));
  Node.SetAttributeNS('����������','',FloatToXML(sumSumma,'0.00'));
  Node.SetAttributeNS('��������','',FloatToXML(sumNalog,'0.00'));
  Node.SetAttributeNS('���������','',FloatToXML(sumAll,'0.00'));

  SodFHZ3 := DocumentNode.AddChild('������3');
  SodFHZ3.SetAttributeNS('�������','','������������� � ��������� �������� ��������');

  if transNakl.docNum <> '' then
  begin
    Node := SodFHZ3.AddChild('��������');
    Node.SetAttributeNS('�����������','',transNakl.docNum);
    Node.SetAttributeNS('������������','',transNakl.docDate);
  end;
  CreateFooter(idtyp);
end;

procedure TSBISNakl.fillPers(Node: IXMLNode; pers: TPersInfo;idtyp:integer);
begin
  if not(idtyp = 2) then
    Node.SetAttributeNS('�����','',pers.dolgn);
  Node := Node.AddChild('���');
  Node.SetAttributeNS('�������','',pers.famaly);
  Node.SetAttributeNS('���','',pers.name);
  Node.SetAttributeNS('��������','',pers.otc);
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

    //�����
    if DMSbis.qParseUPDsh.FieldByName('PRODKPPCOUNT').AsInteger = 0 then
      raise EUnknownKPPException.Create('������ �������� ������. �/�: '+DMSbis.qParseUPDsh.FieldByName('CAPROD').AsString +
        ' ����������� ���: '+DMSbis.qParseUPDsh.FieldByName('prodkpp').AsString);
    if DMSbis.qParseUPDsh.FieldByName('POKUPKPPCOUNT').AsInteger = 0 then
      raise EUnknownKPPException.Create('������ �������� ������. �/�: '+DMSbis.qParseUPDsh.FieldByName('CAPOKUP').AsString +
        ' ����������� ���: '+DMSbis.qParseUPDsh.FieldByName('POKUPkpp').AsString);

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

    //����������
    if DMSbis.qParseUPDsh.RecordCount > 1 then
    begin
      SL := TStringList.Create;
      SL.Add('��/�');
      SL.Add('��� ������:2');
      Indx := uCaseRep.GetIndx_Rep(SL, 1, '�������� ��������');
      SL.Free;
      if Indx = 1 then
        Self.SF.func := '���';
      if Indx = 2 then
        Self.SF.func := '���';
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
      untErrorMsg.ErrorMsg('��������� ��� �� ������',e.Message, 3);
    on E:exception do
      untErrorMsg.ErrorMsg('������ �������',e.Message, 3);
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
  //����������
  Doc := Node;
  SvSch := Doc.AddChild('��������');
  SvSch.SetAttributeNS('�������','',DocDate);
  SvSch.SetAttributeNS('������','',KodOKV);
  SvSch.SetAttributeNS('��������','',DocNum);

  if (CorrNumberSF <> '0') and (CorrNumberSF <> '') then
    begin
        nCorrSvSch := SvSch.AddChild('�������');
        nCorrSvSch.SetAttributeNS('����������', '', CorrNumberSF);
        nCorrSvSch.SetAttributeNS('�����������', '', CorrDocDateSF);
    end;

  Node := SvSch.AddChild('������');
  Node := fillContrInfo(Node,CSender);

  if (CGruzOtpr.id > 0) then
  begin
    // �������� � ����������������
    Node := SvSch.AddChild('������');
    if CGruzOtpr.id = CSender.id then
    begin
      Node := Node.AddChild('����');
      Node.SetText('�� ��');
    end
    else
    begin
      Node := Node.AddChild('��������');
      fillContrInfo(Node,CGruzOtpr);
    end;
  end;

  if (CGruzPol.id > 0) then
  begin
    // �������� � ���������������
    Node := SvSch.AddChild('���������');
    fillContrInfo(Node,CGRuzPol);
  end;

  for i := 0 to LPlat.Count - 1 do
  begin
    Node := SvSch.AddChild('�����');
    Node.SetAttributeNS('��������','',RPlatDoc(LPlat[i]^).docnum);
    Node.SetAttributeNS('�������','',RPlatDoc(LPlat[i]^).docdate);
    Node := Node.ParentNode;
  end;

  // �������� � ����������
  Node := SvSch.AddChild('�������');
  Node := fillContrInfo(Node,CDest);

  //�������� � ��������� �� ��������
  for i := 0 to LOtgr.Count - 1 do
  begin
    Node := SvSch.AddChild('������������');
    if RPlatDoc(LOtgr[i]^).docname = '' then
      Node.SetAttributeNS('�����������', '', '�������� �� ��������')
    else
      Node.SetAttributeNS('�����������', '', RPlatDoc(LOtgr[i]^).docname);
    Node.SetAttributeNS('����������', '', RPlatDoc(LOtgr[i]^).docnum);
    Node.SetAttributeNS('�����������', '', RPlatDoc(LOtgr[i]^).docdate);
    Node := Node.ParentNode;
  end;

  nTablSF := Doc.AddChild('����������');
  ItogSum:=0;
  ItogTotalSum:=0;
  SFdata.First;
  while not(SFdata.Eof) do
  begin
    nSvedTov := nTablSF.AddChild('�������');

    nAkc := nSvedTov.AddChild('�����');
    if uppercase(SFdata.FieldByName('AKC').AsString) = '��� ������' then
    begin
      Node := nAkc.AddChild('��������');
      Node.text := StringReplace(SFData.fieldbyname('AKC').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]);
    end
    else
    begin
      Node := nAkc.AddChild('��������');
      Node.text := '��� ������';
    end;
    nSumNal := nSvedTov.AddChild('������');
    Node := nSumNal.AddChild('������');
    Node.Text := StringReplace(FormatFloat('0.00',SFData.fieldbyname('NALOG').AsFloat), ',', '.',[rfReplaceAll, rfIgnoreCase]);
    nSvedTov.SetAttributeNS('������','',SFData.RecNo);
    nSvedTov.SetAttributeNS('�������','',StringReplace(SFData.fieldbyname('TEXT').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
    if (SFData.fieldbyname('KOLVO').AsString <> '')
        and (SFData.fieldbyname('KOLVO').AsString <> '-')
        and (SFData.fieldbyname('KOLVO').AsString <> '0') then
      begin

        nSvedTov.SetAttributeNS('����_���','',StringReplace(SFData.fieldbyname('KOD').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));

        nSvedTD := nSvedTov.AddChild('����');
        if (SFData.fieldbyname('MonitorNum').AsString <> '')
            and (SfData.FieldByName('CKOD').AsString <> '-')
            and (SfData.FieldByName('CKOD').AsString <> '') then
          nSvedTD.SetAttributeNS('���������', '', StringReplace(SFData.fieldbyname('CKOD').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]))
        else
          nSvedTD.SetAttributeNS('������������', '', StringReplace('-', ',', '.', [rfReplaceAll, rfIgnoreCase]));

        nDopSvedTov := nSvedTov.AddChild('����������');
        nDopSvedTov.SetAttributeNS('���������','',StringReplace(SFData.fieldbyname('USL').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
        //������ ��� ���������������� ������
        if SFData.fieldbyname('MonitorNum').AsString <> '' then
          begin
            if (SfData.FieldByName('CKOD').AsString <> '-')
                and (SfData.FieldByName('CKOD').AsString <> '') then
              nDopSvedTov.SetAttributeNS('�����������','',StringReplace(SFData.fieldbyname('SNAME').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov := nDopSvedTov.AddChild('�����������');
            nMonitorSvedTov.SetAttributeNS('�������������', '', StringReplace(SFData.fieldbyname('MonitorNum').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov.SetAttributeNS('������������', '', StringReplace(SFData.fieldbyname('MonitorEdISM').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov.SetAttributeNS('����������������', '', StringReplace(SFData.fieldbyname('MonitorNEdIsm').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov.SetAttributeNS('�������������', '', StringReplace(SFData.fieldbyname('MonitorCNT').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
            nMonitorSvedTov.SetAttributeNS('������������������', '', StringReplace(SFData.fieldbyname('MonitorSum').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
          end;
      end
    else
      begin
        nSvedTov.SetAttributeNS('�������_���','','-');
      end;
    if (SFData.fieldbyname('KOLVO').AsString <> '')
        and (SFData.fieldbyname('KOLVO').AsString <> '-')
        and (SFData.fieldbyname('KOLVO').AsString <> '0') then
      nSvedTov.SetAttributeNS('������','',StringReplace(SFData.fieldbyname('KOLVO').AsString,',', '.',[rfReplaceAll, rfIgnoreCase]));
    if (SFData.fieldbyname('PRICE').AsString <> '') and (SFData.fieldbyname('PRICE').AsString <> '0') then
      nSvedTov.SetAttributeNS('�������','',StringReplace(FormatFloat('0.00',SFData.fieldbyname('PRICE').AsFloat),',', '.',[rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('�����','',SFData.fieldbyname('NALST').AsString);
    if (SFData.fieldbyname('SUMMA').AsString <> '') and (SFData.fieldbyname('SUMMA').AsString <> '0') then
      nSvedTov.SetAttributeNS('�����������','',StringReplace(FormatFloat('0.00',SFData.fieldbyname('SUMMA').AsFloat), ',', '.',[rfReplaceAll, rfIgnoreCase]));

    if (SFData.fieldbyname('SUMNAL').AsString <> '') and (SFData.fieldbyname('SUMNAL').AsString <> '0') then
      nSvedTov.SetAttributeNS('����������','',StringReplace(FormatFloat('0.00',SFData.fieldbyname('SUMNAL').AsFloat), ',', '.',[rfReplaceAll, rfIgnoreCase]))
    else
      nSvedTov.SetAttributeNS('����������','',StringReplace(FormatFloat('0.00', 0), ',', '.',[rfReplaceAll, rfIgnoreCase]));
    //�����
    if (trim(SFData.fieldbyname('NALOG').AsString) <> '') and (SFData.fieldbyname('NALOG').AsString <> '0') then
      ItogNalog:=ItogNalog+SFData.fieldbyname('NALOG').AsFloat;
    if (trim(SFData.fieldbyname('SUMMA').AsString)<>'') and (SFData.fieldbyname('SUMMA').AsString <> '0') then
      ItogSum:=ItogSum+SFData.fieldbyname('SUMMA').AsFloat;
    if (trim(SFData.fieldbyname('SUMNAL').AsString)<>'') and (SFData.fieldbyname('SUMNAL').AsString <> '0') then
      ItogTotalSum:=ItogTotalSum+SFData.fieldbyname('SUMNAL').AsFloat;

    SFData.Next;
  end;
  sumUchNds := ItogTotalSum;
  Node := NTablSF.AddChild('��������');
  Node.SetAttributeNS('����������������','',StringReplace(FormatFloat('0.00',ItogSum), ',', '.',[rfReplaceAll, rfIgnoreCase]));
  Node.SetAttributeNS('���������������','',StringReplace(FormatFloat('0.00',ItogTotalSum), ',', '.',[rfReplaceAll, rfIgnoreCase]));
  Node := Node.AddChild('�����������');
    if ItogNalog>0 then
      begin
        Node := Node.AddChild('������');
        Node.Text := StringReplace(FormatFloat('0.00',ItogNalog), ',', '.',[rfReplaceAll, rfIgnoreCase]);
      end
    else if SFData.fieldbyname('NALST').AsString = '' then
            begin
               Node := Node.AddChild('������');
              Node.Text := '-';
            end
         else
            begin
              Node := Node.AddChild('������');
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
    Application.MessageBox(PChar('������ �������� ������ ������'), '������', mb_Ok + mb_IconError);
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
  while DocumentNode.NodeName <> '��������' do
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
  //����������
  Doc := Node;
  SvKSch := Doc.AddChild('������');
  nTablKSF := Doc.AddChild('��������');
  SodFHZ3 := Doc.AddChild('������3');

  SvKSch.SetAttributeNS('��������', '', DocDate);
  SvKSch.SetAttributeNS('������', '', KodOKV);
  SvKSch.SetAttributeNS('���������', '', DocNum);
  if DateParentDoc <> '' then
    begin
      Doc := SvKSch.AddChild('���');
      Doc.SetAttributeNS('�������', '', DateParentDoc);
      Doc.SetAttributeNS('��������', '', NumParentDoc);
    end;

  if NumIDoc <> '' then
    begin
      Doc := SvKSch.AddChild('��������');
      Doc.SetAttributeNS('�����������', '', NumIDoc);
      Doc.SetAttributeNS('������������', '', DateIDoc);
    end;

  Doc := SvKSch.AddChild('������');
  Doc := fillContrInfo(Doc, CSender);
  // �������� � ����������
  Doc := SvKSch.AddChild('�������');
  Doc := fillContrInfo(Doc, CDest);

  //��������� �����, �������� � ������
  SFdata.First;
  while not(SFdata.Eof) do
    begin
      nSvedTov := nTablKSF.AddChild('�������');

      nSvedTov.SetAttributeNS('������', '', SFData.RecNo);
      nSvedTov.SetAttributeNS('�������', '', SFData.fieldbyname('ProductName').AsString);
      nSvedTov.SetAttributeNS('����_�����', '', StringReplace(SFData.fieldbyname('kodEIBefore').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('����_��������', '', StringReplace(SFData.fieldbyname('kodEIAfter').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('��������', '', StringReplace(SFData.fieldbyname('countBefore').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('�����������', '', StringReplace(SFData.fieldbyname('countAfter').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('���������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('priceBefore').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('������������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('priceAfter').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('�������', '', SFData.fieldbyname('ndsBefore').AsString);
      nSvedTov.SetAttributeNS('����������', '', SFData.fieldbyname('ndsAfter').AsString);

      nSvedTov := nSvedTov.AddChild('�����������');
      nSvedTov.SetAttributeNS('����������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STnotNDSBefore').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('�������������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STnotNDSAfter').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('���������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STnotNDSInc').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('�������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STnotNDSDec').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov := nSvedTov.ParentNode;

      nSvedTov := nSvedTov.AddChild('�������');
      nSvedTov := nSvedTov.AddChild('��������');
      nSvedTov.Text := '��� ������';
      nSvedTov := nSvedTov.ParentNode.ParentNode;
      nSvedTov := nSvedTov.AddChild('����������');
      nSvedTov := nSvedTov.AddChild('��������');
      nSvedTov.Text := '��� ������';
      nSvedTov := nSvedTov.ParentNode.ParentNode;

      nSvedTov := nSvedTov.AddChild('��������');
      nSvedTov := nSvedTov.AddChild('������');
      nSvedTov.Text := StringReplace(Format('%0.2f', [SFData.fieldbyname('sumNDSBefore').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
      nSvedTov := nSvedTov.ParentNode.ParentNode;
      nSvedTov := nSvedTov.AddChild('�����������');
      nSvedTov := nSvedTov.AddChild('������');
      nSvedTov.Text := StringReplace(Format('%0.2f', [SFData.fieldbyname('sumNDSAfter').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
      nSvedTov := nSvedTov.ParentNode.ParentNode;

      nSvedTov := nSvedTov.AddChild('����������');
      if SFData.fieldbyname('sumNDSInc').AsFloat <> 0 then
        begin
          nSvedTov := nSvedTov.AddChild('�������');
          nSvedTov.Text := StringReplace(Format('%0.2f', [SFData.fieldbyname('sumNDSInc').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
        end;
      if SFData.fieldbyname('sumNDSDec').AsFloat <> 0 then
        begin
          nSvedTov := nSvedTov.AddChild('�����');
          nSvedTov.Text := StringReplace(Format('%0.2f', [SFData.fieldbyname('sumNDSDec').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
        end;
      nSvedTov := nSvedTov.ParentNode.ParentNode;

      nSvedTov := nSvedTov.AddChild('����������');
      nSvedTov.SetAttributeNS('����������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STNDSBefore').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('�������������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STNDSAfter').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('���������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STNDSInc').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov.SetAttributeNS('�������', '', StringReplace(Format('%0.2f', [SFData.fieldbyname('STNDSDec').AsFloat]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
      nSvedTov := nSvedTov.ParentNode;
      SFData.Next;
    end;

  //��������� ����� �����
  nTotalInc := nTablKSF.AddChild('���������');
  nTotalDec := nTablKSF.AddChild('�������');

  nTotalInc.SetAttributeNS('����������������', '', StringReplace(Format('%0.2f', [IncTotalStNotNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
  nTotalInc.SetAttributeNS('���������������', '', StringReplace(Format('%0.2f', [IncTotalStNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
  nTotalInc := nTotalInc.AddChild('������');
  nTotalInc := nTotalInc.AddChild('������');
  nTotalInc.Text := StringReplace(Format('%0.2f', [IncTotalNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
  nTotalInc.ParentNode.ParentNode;

  nTotalDec.SetAttributeNS('����������������', '', StringReplace(Format('%0.2f', [DecTotalStNotNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
  nTotalDec.SetAttributeNS('���������������', '', StringReplace(Format('%0.2f', [DecTotalStNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]));
  nTotalDec := nTotalDec.AddChild('������');
  nTotalDec := nTotalDec.AddChild('������');
  nTotalDec.Text := StringReplace(Format('%0.2f', [DecTotalNDS]), ',', '.', [rfReplaceAll, rfIgnoreCase]);
  nTotalDec.ParentNode.ParentNode;

  SodFHZ3.SetAttributeNS('�������', '', '�������������');
  PeredatDoc := SodFHZ3.AddChild('������������');
  PeredatDoc.SetAttributeNS('�������', '', OsnName);
  PeredatDoc.SetAttributeNS('������', '', OsnNumber);
  PeredatDoc.SetAttributeNS('�������', '', OsnDate);
  if OsnComment <> '' then
    PeredatDoc.SetAttributeNS('��������', '', OsnComment);
  DocOsnKor := SodFHZ3.AddChild('�����������');
  DocOsnKor.SetAttributeNS('�������', '', '��� ���������-���������');
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

  iPeriod := DocumentNode.AddChild('������');
  iPeriod.SetAttributeNS('�������', '', BegPeriod);
  iPeriod.SetAttributeNS('�������', '', EndPeriod);

  iSendRecip := DocumentNode.AddChild('�����������');
  iSendRecip.SetAttributeNS('��������', '', CSender.Name);
  iSendRecip.SetAttributeNS('����', '', '�����������');
  iAdr1 := iSendRecip.AddChild('�����');
  iAdr1.SetAttributeNS('��������', '', CSender.GetAddrINO);
  iAdr1.SetAttributeNS('���', '', '�����������');
  iAdr2 := iAdr1.AddChild('�����');
  iAdr2.SetAttributeNS('�����', '', CSender.Adres.City);
  iAdr2.SetAttributeNS('�����', '', CSender.Adres.Street);
  iAdr2.SetAttributeNS('���', '', CSender.Adres.Dom);
  iAdr2.SetAttributeNS('������', '', CSender.Adres.PostIndex);
  iAdr2.SetAttributeNS('���������', '', CSender.Adres.KodRegion);
  iSvUl := iSendRecip.AddChild('����');
  iSvUl.SetAttributeNS('���', '', CSender.INN);
  iSvUl.SetAttributeNS('���', '', CSender.KPP);
  iSvUl.SetAttributeNS('��������', '', CSender.Name);
  iRepresent := iSendRecip.AddChild('�������������');
  iRepresentRow := iRepresent.AddChild('������������');
  iRepresentRow.SetAttributeNS('���������', '', Podpisant.dolgn);
  iRepresentRow.SetAttributeNS('���', '', Podpisant.famaly + ' ' + Podpisant.name + ' ' + Podpisant.otc);
  iRepresentRow := iRepresent.AddChild('���������');
  iRepresentRow.SetAttributeNS('���������', '', GlavBuh.dolgn);
  iRepresentRow.SetAttributeNS('���', '', GlavBuh.famaly + ' ' + GlavBuh.name + ' ' + GlavBuh.otc);

  iSendRecip := DocumentNode.AddChild('����������');
  iSendRecip.SetAttribute('��������', CDest.Name);
  iSendRecip.SetAttribute('����', '����������');
  iAdr1 := iSendRecip.AddChild('�����');
  iAdr1.SetAttribute('��������', CDest.GetAddrINO);
  iAdr1.SetAttribute('���', '�����������');
  iAdr2 := iAdr1.AddChild('�����');
  iAdr2.SetAttribute('�����', CDest.Adres.City);
  iAdr2.SetAttribute('�����', CDest.Adres.Street);
  iAdr2.SetAttribute('���', CDest.Adres.Dom);
  iAdr2.SetAttribute('������', CDest.Adres.PostIndex);
  iAdr2.SetAttribute('���������', CDest.Adres.KodRegion);
  iSvUl := iSendRecip.AddChild('����');
  iSvUl.SetAttribute('���', CDest.INN);
  iSvUl.SetAttribute('���', CDest.KPP);
  iSvUl.SetAttribute('��������', CDest.Name);

  if AKTData.RecordCount > 0 then
    begin
      iTableInf := DocumentNode.AddChild('�������');
      if StartSumma > 0 then
        begin
          iRowInfo := iTableInf.AddChild('��������');
          iRowInfo.SetAttributeNS('�����', '', FloatToXML(abs(StartSumma), '0.00'));
          iRowInfo.SetAttributeNS('������', '', 0);
          iRowInfo.SetAttributeNS('������', '', '�����������');
          iRowInfo.SetAttributeNS('���', '', '������ ���������');
        end
      else
        begin
          iRowInfo := iTableInf.AddChild('��������');
          iRowInfo.SetAttributeNS('�����', '', 0);
          iRowInfo.SetAttributeNS('������', '', FloatToXML(abs(StartSumma), '0.00'));
          iRowInfo.SetAttributeNS('������', '', '�����������');
          iRowInfo.SetAttributeNS('���', '', '������ ���������');
        end;
      if SItogo > 0 then
        begin
          iRowInfo := iTableInf.AddChild('��������');
          iRowInfo.SetAttributeNS('�����', '', FloatToXML(abs(SItogo), '0.00'));
          iRowInfo.SetAttributeNS('������', '', 0);
          iRowInfo.SetAttributeNS('������', '', '�����������');
          iRowInfo.SetAttributeNS('���', '', '������ ��������');
        end
      else
        begin
          iRowInfo := iTableInf.AddChild('��������');
          iRowInfo.SetAttributeNS('�����', '', 0);
          iRowInfo.SetAttributeNS('������', '', FloatToXML(abs(SItogo), '0.00'));
          iRowInfo.SetAttributeNS('������', '', '�����������');
          iRowInfo.SetAttributeNS('���', '', '������ ��������');
        end;

      iRowInfo := iTableInf.AddChild('��������');
      iRowInfo.SetAttributeNS('�����', '', FloatToXML(ItogR, '0.00'));
      iRowInfo.SetAttributeNS('������', '', FloatToXML(ItogP, '0.00'));
      iRowInfo.SetAttributeNS('������', '', '�����������');
      iRowInfo.SetAttributeNS('���', '', '�������');

      if StartSumma < 0 then
        begin
          iRowInfo := iTableInf.AddChild('��������');
          iRowInfo.SetAttributeNS('�����', '', FloatToXML(abs(StartSumma), '0.00'));
          iRowInfo.SetAttributeNS('������', '', 0);
          iRowInfo.SetAttributeNS('������', '', '����������');
          iRowInfo.SetAttributeNS('���', '', '������ ���������');
        end
      else
        begin
          iRowInfo := iTableInf.AddChild('��������');
          iRowInfo.SetAttributeNS('�����', '', 0);
          iRowInfo.SetAttributeNS('������', '', FloatToXML(abs(StartSumma), '0.00'));
          iRowInfo.SetAttributeNS('������', '', '����������');
          iRowInfo.SetAttributeNS('���', '', '������ ���������');
        end;
      if SItogo < 0 then
        begin
          iRowInfo := iTableInf.AddChild('��������');
          iRowInfo.SetAttributeNS('�����', '', FloatToXML(abs(SItogo), '0.00'));
          iRowInfo.SetAttributeNS('������', '', 0);
          iRowInfo.SetAttributeNS('������', '', '����������');
          iRowInfo.SetAttributeNS('���', '', '������ ��������');
        end
      else
        begin
          iRowInfo := iTableInf.AddChild('��������');
          iRowInfo.SetAttributeNS('�����', '', 0);
          iRowInfo.SetAttributeNS('������', '', FloatToXML(abs(SItogo), '0.00'));
          iRowInfo.SetAttributeNS('������', '', '����������');
          iRowInfo.SetAttributeNS('���', '', '������ ��������');
        end;

      iRowInfo := iTableInf.AddChild('��������');
      iRowInfo.SetAttributeNS('�����', '', FloatToXML(ItogP, '0.00'));
      iRowInfo.SetAttributeNS('������', '', FloatToXML(ItogR, '0.00'));
      iRowInfo.SetAttributeNS('������', '', '����������');
      iRowInfo.SetAttributeNS('���', '', '�������');

      AKTData.First;
      while not(AKTData.Eof) do
        begin
          iTableRow := iTableInf.AddChild('�������');
          iTableRow.SetAttributeNS('����', '', AKTData.FieldByName('DateDoc').AsString);
          if AKTData.FieldByName('PRIH_RASH').AsString = '+' then
            begin
              iTableRow.SetAttributeNS('�����', '' , '0.00');
              iTableRow.SetAttributeNS('������', '' , FloatToXML(AKTData.FieldByName('SumDoc').AsFloat, '0.00'));
            end;
          if AKTData.FieldByName('PRIH_RASH').AsString = '-' then
            begin
              iTableRow.SetAttributeNS('�����', '' , FloatToXML(AKTData.FieldByName('SumDoc').AsFloat, '0.00'));
              iTableRow.SetAttributeNS('������', '' , '0.00');
            end;
          iTableRow.SetAttributeNS('��������', '', AKTData.FieldByName('Remark').AsString);
          iTableRow.SetAttributeNS('������', '', '�����������');

          iTableRow := iTableInf.AddChild('�������');
          iTableRow.SetAttributeNS('����', '', AKTData.FieldByName('DateDoc').AsString);
          if AKTData.FieldByName('PRIH_RASH').AsString = '-' then
            begin
              iTableRow.SetAttributeNS('�����', '' , '0.00');
              iTableRow.SetAttributeNS('������', '' , FloatToXML(AKTData.FieldByName('SumDoc').AsFloat, '0.00'));
            end;
          if AKTData.FieldByName('PRIH_RASH').AsString = '+' then
            begin
              iTableRow.SetAttributeNS('�����', '' , FloatToXML(AKTData.FieldByName('SumDoc').AsFloat, '0.00'));
              iTableRow.SetAttributeNS('������', '' , '0.00');
            end;
          iTableRow.SetAttributeNS('��������', '', AKTData.FieldByName('Remark').AsString);
          iTableRow.SetAttributeNS('������', '', '����������');
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
    //�������� �����
    vXMLSchema := CoXMLSchemaCache60.Create();
    vXMLSchemaDoc := CoDOMDocument60.Create();
    vStrs.LoadFromFile( 'd:\SBIS\����-������� - 1115131 5.01.xsd' );
//    vStrs.LoadFromFile( filePath );
    vXMLSchemaDoc.loadXML( vStrs.Text );
    if vXMLSchemaDoc.parseError.errorCode <> 0 then
      begin
        ShowMessage(Format('������ ��� �������� ����� <%s: %s>', [vXMLSchemaDoc.parseError.reason, vXMLSchemaDoc.parseError.srcText]));
        Exit;
      end;
    vXMLSchema.add('', vXMLSchemaDoc);
//�������� ���������
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
      ShowMessage( '��������� ��������� ����� �������' );
      Result := true;
      end;
  finally
    FreeAndNil( vStrs );
  end;
end;}

end.
