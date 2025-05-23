unit uDMSBISResponse;

interface

uses
  SysUtils, Classes, xmldom, XMLIntf, msxmldom, XMLDoc, DB, MemDS, DBAccess,
  Ora, OraCall, IOUtils,uSBISArcParser, utilunit, {DocflowAXLib} DocflowAXLib_TLB;

type
  TdmSBISResponse = class(TDataModule)
    spSetPackStatus: TOraStoredProc;
    xmlResponse: TXMLDocument;
    qIniSet: TOraQuery;
    spCreatePack: TOraStoredProc;
    qFileIDNew: TOraQuery;
    qFiles: TOraQuery;
    spSbisObj: TOraStoredProc;
    spInsArcDocCopy: TOraStoredProc;
    spModifySbispack: TOraStoredProc;
    spDelVloj: TOraStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    ErrorDir:string;
    contrEdo:string;
    PolPath:string;
    ArcPath:string;
    //function compareByTime(List:TStringList;index1,index2:integer) : Integer;
  public
    { Public declarations }
    cntNotSbis: string;
    //procedure ProcessResponse(var countPol,countErr:integer);
    procedure SaveFile(fileName: string; idPack, typDoc: integer; SoVloj: ISimpleObject);
//    procedure retryProcess;
    procedure addDocCopy(idPack: integer; fullpath, docName: string; var pCnt_File: integer; pAttrNewDoc: integer = 0);
    procedure EditPack(var idpack: integer; SoDoc: ISimpleObject);

  end;

  FileRec = record
    date:TDateTime;
    name:string;
  end;

var
  dmSBISResponse: TdmSBISResponse;
  ResponseDir:string;

implementation

{$R *.dfm}

procedure TdmSBISResponse.SaveFile(fileName: string; idPack, typDoc: integer; SoVloj: ISimpleObject);
var
  ms: TMemoryStream;
  Blob:TBlobfield;
  nextid:integer;
  fileId:integer;
  fullPath:string;
  Node:iXMLNode;
begin
  fullPath := fileName;
  if not(FileExists(fullPath)) then
    exit;
  ms:=TMemoryStream.Create;
  ms.LoadFromFile(fullPath);
  ms.Position:=0;
  qFileIDNew.Open;
  fileId := qFileIDNew.FieldByName('val').AsInteger;
  qFileIDNew.Close;
  qFiles.open;
  qFiles.Edit;
  qFiles.FieldByName('ID').AsInteger := fileId;
  qFiles.FieldByName('file_name').AsString := ExtractFileName(Filename);
  qFiles.FieldByName('description').AsString := 'SBR';
  qFiles.FieldByName('login').AsString := 'SBISResponse';
  qFiles.FieldByName('program_name').AsString := 'SBR';
  qFiles.FieldByName('cd').AsDateTime := Date;
  Blob := TBlobfield(qFiles.FieldByName('file_internal'));
  Blob.LoadFromStream(ms);
  qFiles.FieldByName('properties').AsString := '';
  qFiles.Post;

  spSbisObj.ParamByName('Action').AsInteger := 0;
  spSbisObj.ParamByName('V_ID').AsInteger := 0;
  spSbisObj.ParamByName('V_FILENAME').AsString := ExtractFileName(Filename);
  spSbisObj.ParamByName('V_DATEOTPR').AsString := datetostr(date);
  spSbisObj.ParamByName('V_IDPACK').AsInteger := idPack;
  spSbisObj.ParamByName('V_APP').AsString := 'SBR';
  spSbisObj.ParamByName('V_ID_FILE').AsInteger := fileId;
  spSbisObj.ParamByName('V_IDDOC').AsString := '';
  spSbisObj.ParamByName('v_typDoc').AsInteger := typDoc;
  if SoVloj.Read('�����������') = '��������' then
    spSbisObj.ParamByName('v_pol').AsInteger := 2
  else
    spSbisObj.ParamByName('v_pol').AsInteger := 1;
  spSbisObj.ParamByName('v_isdel').AsInteger := 0;
  spSbisObj.ParamByName('v_contredo').AsString := contrEdo;
  spSbisObj.ParamByName('v_user_id').AsString := 'SBISResponse';
  spSbisObj.ParamByName('v_Nazv').AsString := SoVloj.Read('��������');
  spSbisObj.ParamByName('V_ID_SBIS').AsString := SoVloj.Read('�������������');
  spSbisObj.ParamByName('v_DOC_NUM').AsString := SoVloj.Read('�����');
  spSbisObj.ParamByName('v_RELEASEDATE').AsString := SoVloj.ReadObject('��������').Read('���������');
  spSbisObj.ParamByName('v_RELEASENUM').AsString := SoVloj.ReadObject('��������').Read('�����');  
  spSbisObj.ExecProc;
  qFiles.close;
  ms.Free;
end;

procedure TdmSBISResponse.DataModuleCreate(Sender: TObject);
begin
  SetDataBase(DBName,self);
  qIniSet.ParamByName('IDENT').AsString := 'ResponseDir';
  qIniSet.Open;
  ResponseDir := qIniSet.FieldByName('ID_VALUE').AsString;
  qIniSet.Close;
  qIniSet.ParamByName('IDENT').AsString := 'ErrPath';
  qIniSet.Open;
  ErrorDir := qIniSet.FieldByName('ID_VALUE').AsString;
  qIniSet.Close;
  qIniSet.ParamByName('IDENT').AsString := 'CONTRSBIS';
  qIniSet.Open;
  contrEdo := qIniSet.FieldByName('ID_VALUE').AsString;
  qIniSet.Close;
  qIniSet.ParamByName('IDENT').AsString := 'PolPath';
  qIniSet.Open;
  PolPath := qIniSet.FieldByName('ID_VALUE').AsString;
  qIniSet.Close;
  qIniSet.ParamByName('IDENT').AsString := 'ArcPath';
  qIniSet.Open;
  ArcPath := qIniSet.FieldByName('ID_VALUE').AsString;
  qIniSet.Close;
end;

{function CompareByTime(List:TStringList;index1,index2:integer) : Integer;
begin
  if FileAge(ResponseDir+List[index1])>FileAge(ResponseDir+List[index2]) then
      result := 1
    else
      result := 0;
end;}

{procedure TdmSBISResponse.retryProcess;
var
  SR: TSearchRec;
  ST:TStringList;
  i:integer;
  age:integer;
begin
  ST:=TStringList.Create;
  if FindFirst(ErrorDir + '*.xml', faAnyFile, SR) = 0 then
   begin
     repeat
       ST.Add(SR.Name);
     until FindNext(SR) <> 0;
     FindClose(SR);
     ST.CustomSort(compareByTime);   //���������� �� ������� �������� �����
     for I := 0 to ST.Count - 1 do
     begin
       age := FileAge(ErrorDir+ST[i]);
       RenameFile(ErrorDir+st[I],ResponseDir+ST[i]);
       FileSetDate(ResponseDir+ST[i], age);
     end;
     ST.Free;
   end;
end;}

{procedure TdmSBISResponse.ProcessResponse(var countPol,countErr:integer);
var
  SR: TSearchRec;
  i:integer;
  ffileName:string;
  Node:iXMLNode;
  IDEDO:string;     //ID ������ � ������� Ready_pack + GUID
  IDSO:string;
  KODESTAT:string;
  Detail:string;
  CHANGETIME:string;
  ST:TStringList;
  INNSender:string;
  INNPol:string;
  n:integer;
  ArcDoc:string;
  SBISArcParser:TSBISArcParser;
  S:TMemoryStream;
  fileId:integer;
  Blob:TBlobField;
  nazv:string;
  age:integer;
  intFileAge:integer;
begin
  countPol := 0;
  countErr := 0;
  ST:=TStringList.Create;
  if FindFirst(ResponseDir + '*.xml', faAnyFile, SR) = 0 then
   begin
     repeat
       ST.Add(SR.Name);
     until FindNext(SR) <> 0;
  FindClose(SR);
  ST.CustomSort(compareByTime);   //���������� �� ������� �������� �����
  for I := 0 to ST.Count - 1 do
  begin
  try
    try
      ffileName := ResponseDir+ST[i];
      xmlResponse.XML.LoadFromFile(ffileName);
      xmlResponse.Active := true;
      Node := xmlResponse.DocumentElement.ChildNodes['�����'];
      if Node.HasAttribute('�����') then
        ArcDoc := Node.Attributes['�����'];
      if Node.HasAttribute('�����') then    //�������� �� ������������
        IDEDO :=  Node.Attributes['�����']
      else
        IDEDO := '';
      IDSO := Node.Attributes['������������������'];
      Node := Node.ChildNodes['���������'];
      KODESTAT :=  Node.Attributes['���'];
      if KODESTAT = '12' then
        Detail := Node.Attributes['�����������������']
      else
        Detail:='';
      intFileAge := FileAge(ffileName);
      CHANGETIME := DatetimeToStr(FileDateToDateTime(intFileAge));//Node.Attributes['���������'];
      DBName.StartTransaction;

      // ���� �����������, �� ��������� ��
      if KODESTAT = '1' then
      begin
        Node := Node.ParentNode;
        Node := Node.ChildNodes['�����������'];
        INNSender := Node.Attributes['���'];
        Node := Node.ParentNode;
        Node := Node.ChildNodes['����������'];
        INNPol := Node.Attributes['���'];
        //���������� ������
        spCreatePack.ParamByName('sIdEdo').AsString := IDEDO;
        spCreatePack.ParamByName('sDocId').AsString := '';
        spCreatePack.ParamByName('sUserId').AsString := 'SBISResponse';
        spCreatePack.ParamByName('sApp').AsString := 'SBR';
        spCreatePack.ParamByName('nContrEdo').AsString := ContrEdo;
        spCreatePack.ParamByName('nContrSender').AsInteger := 0;
        spCreatePack.ParamByName('nContrPol').AsInteger := 0;
        spCreatePack.ParamByName('sINNSender').AsString := INNSender;
        spCreatePack.ParamByName('sINNPol').AsString := INNPol;
        spCreatePack.ParamByName('nIsPol').AsInteger := 1;
        spCreatePack.ParamByName('sIdSO').AsString := IDSO;
        spCreatePack.ParamByName('SDate').AsString := CHANGETIME;
        spCreatePack.ExecProc;

        Node := Node.ParentNode;  //�� ������� ������
        Node := Node.ChildNodes['�������'];
        Node := Node.ChildNodes['���������'];

        // ���������� �����������
        for n := 0 to Node.ChildNodes.Count-1 do
        begin
          SaveFile (IDSO,
                    Node.ChildNodes[n].Attributes['��������'],
                    spCreatePack.ParamByName('Result').AsInteger,
                    Node.ChildNodes[n].Attributes['��������']);
        end;
        TDirectory.Delete(PolPath+IDSO,true);
      end
      else
      //����� �������� ������
      begin
        spSetPackStatus.ParamByName('SIDEDO').AsString := IDEDO;
        spSetPackStatus.ParamByName('NSTATUS').AsString := KODESTAT;
        spSetPackStatus.ParamByName('dChangetime').AsString := CHANGETIME;
        spSetPackStatus.ParamByName('sDetail').AsString := Detail;
        spSetPackStatus.ParamByName('sIDSO').AsString := IDSO;
        spSetPackStatus.ParamByName('SLASTDATEVERSION').AsString := '';
        spSetPackStatus.ExecProc;
        if KODESTAT = '7' then //����������� ��������� ���������� � �����
        begin
          Node := Node.ParentNode;  //�� ������� ������
          Node := Node.ChildNodes['�������'];
          Node := Node.ChildNodes['���������'];
          SBISArcParser := TSBISArcParser.create(ArcPath);
          SBISArcParser.parse(ArcDoc);
          while not(SBISArcParser.eof) do
          begin
            for n := 0 to Node.ChildNodes.Count-1 do
            begin
              if ((Node.ChildNodes[n].Attributes['��������']+'.pdf') = SBISArcParser.GetFileName)then
                nazv := Node.ChildNodes[n].Attributes['��������'];
            end;
            qFileIDNew.Open;
            fileId := qFileIDNew.FieldByName('val').AsInteger;
            qFileIDNew.Close;
            qFiles.open;
            qFiles.Edit;
            qFiles.FieldByName('ID').AsInteger := fileId;
            qFiles.FieldByName('file_name').AsString := SBISArcParser.GetFileName;
            qFiles.FieldByName('description').AsString := nazv;
            qFiles.FieldByName('login').AsString := 'SBISResponse';
            qFiles.FieldByName('program_name').AsString := 'SBR';
            qFiles.FieldByName('cd').AsDateTime := Date;
            Blob := TBlobfield(qFiles.FieldByName('file_internal'));
            Blob.LoadFromStream(SBISArcParser.GetFile);
            qFiles.FieldByName('properties').AsString := '';
            qFiles.Post;
            qFiles.close;
            spInsArcDocCopy.ParamByName('idPack').AsInteger := spSetPackStatus.ParamByName('result').AsInteger;
            spInsArcDocCopy.ParamByName('nFileID').AsInteger := fileId;
            spInsArcDocCopy.ExecProc;
            SBISArcParser.next;
          end;
          SBISArcParser.destroy;
        end;
      end;
      DeleteFile(ffileName);
      DBName.Commit;
      countPol := countPol + 1;
    except
      qFiles.close;
      countErr := countErr + 1;
      //xmlResponse.SaveToFile(ErrorDir+ST[i]);

      age := FileAge(ResponseDir+ST[i]);
      RenameFile(ResponseDir+ST[i],ErrorDir+st[I]);
      FileSetDate(ErrorDir+ST[i], age);
      DBName.Rollback;
     //raise;
    end;
  finally
    xmlResponse.Active := false;
  end;
  end;
  ST.Free;
  end;
end;}

procedure TdmSBISResponse.addDocCopy(idPack: integer; fullpath, docName: string; var pCnt_File: integer; pAttrNewDoc: integer = 0);
var
  fileId:integer;
  Blob:TBlobfield;
begin
  qFileIDNew.Open;
  fileId := qFileIDNew.FieldByName('val').AsInteger;
  qFileIDNew.Close;
  qFiles.open;
  qFiles.Edit;
  qFiles.FieldByName('ID').AsInteger := fileId;
  qFiles.FieldByName('file_name').AsString := ExtractFileName(fullpath);
  qFiles.FieldByName('description').AsString := docName;
  qFiles.FieldByName('login').AsString := 'SBISResponse';
  qFiles.FieldByName('program_name').AsString := 'SBR';
  qFiles.FieldByName('cd').AsDateTime := Date;
  Blob := TBlobfield(qFiles.FieldByName('file_internal'));
  Blob.LoadFromFile(fullpath);
  qFiles.FieldByName('properties').AsString := '';
  qFiles.Post;
  qFiles.close;
  spInsArcDocCopy.ParamByName('pAction').AsInteger := pAttrNewDoc;
  spInsArcDocCopy.ParamByName('pIdPack').AsInteger := idPack;
  spInsArcDocCopy.ParamByName('pNFileId').AsInteger := fileId;
  spInsArcDocCopy.ParamByName('pCnt_File').AsInteger := pCnt_File;
  spInsArcDocCopy.ExecProc;
  pCnt_File := spInsArcDocCopy.ParamByName('pCnt_File').AsInteger;
end;

//������/�������������� ������ � ������� � ��
procedure TdmSBISResponse.EditPack(var idpack: integer; SoDoc: ISimpleObject);
var
  docsum: string;
  docnum: string;
  lOldIDSO: string;
begin
  if SoDoc.ReadObject('����������') = nil then exit;

  docnum := SoDoc.Read('�����');
//  if docnum = '100100035' then
//    docnum := SoDoc.Read('�����');
  docsum := SoDoc.Read('�����');
  if docsum = '' then
    docsum := SoDoc.ReadObjectList('��������').At(0).read('�����');
  if idpack = 0 then
    spModifySbispack.ParamByName('nAction').AsInteger := 0
  else
    spModifySbispack.ParamByName('nAction').AsInteger := 1;
  spModifySbispack.ParamByName('nIdPack').AsInteger := idpack;
  spModifySbispack.ParamByName('sIdEdo').AsString := SoDoc.ReadObjectList('��������').At(SoDoc.ReadObjectList('��������').count - 1).Read('������������');
//  spModifySbispack.ParamByName('sDocId').AsString := '';
  spModifySbispack.ParamByName('sDocId').ItemAsInteger[1] := 0;
  spModifySbispack.ParamByName('sUserId').AsString := 'SBISResponse';
  spModifySbispack.ParamByName('sApp').AsString := 'SBISDocs';
  spModifySbispack.ParamByName('nContrEdo').AsString := '14942';
  spModifySbispack.ParamByName('nContrSender').AsInteger := 0;
  spModifySbispack.ParamByName('nContrPol').AsInteger := 0;
  if (SoDoc.ReadObject('����������').ReadObject('����') = nil) then
    begin
      spModifySbispack.ParamByName('sINNSender').AsString := SoDoc.ReadObject('����������').ReadObject('����').Read('���');
      spModifySbispack.ParamByName('sKPPSender').AsString := '';
    end
  else
    begin
      spModifySbispack.ParamByName('sINNSender').AsString := SoDoc.ReadObject('����������').ReadObject('����').Read('���');
      spModifySbispack.ParamByName('sKPPSender').AsString := SoDoc.ReadObject('����������').ReadObject('����').Read('���');
    end;
  spModifySbispack.ParamByName('sINNPol').AsString := SoDoc.ReadObject('���������������').ReadObject('����').Read('���');
  spModifySbispack.ParamByName('sKPPPol').AsString := SoDoc.ReadObject('���������������').ReadObject('����').Read('���');
  if (SoDoc.Read('�����������') = '���������') then
    spModifySbispack.ParamByName('nIsPol').AsInteger := 0;
  if (SoDoc.Read('�����������') = '��������') then
    spModifySbispack.ParamByName('nIsPol').AsInteger := 1;
  spModifySbispack.ParamByName('sIdSO').AsString := SoDoc.Read('�������������');
  spModifySbispack.ParamByName('sStatus').AsString := SoDoc.ReadObject('���������').Read('���');
  spModifySbispack.ParamByName('sDocnum').AsString := docnum;
  spModifySbispack.ParamByName('sDoctype').AsString :=SoDoc.Read('���');
  spModifySbispack.ParamByName('sDocdate').AsString :=SoDoc.Read('����');
  docsum := StringReplace(docsum,'.', ',',[rfReplaceAll, rfIgnoreCase]);
  if (docsum = '') then docsum := '0';
  spModifySbispack.ParamByName('nDocsum').AsFloat :=  StrToFloat(docsum);
  spModifySbispack.ParamByName('v_RELEASEIDSO').AsString := SoDoc.ReadObjectList('��������').At(SoDoc.ReadObjectList('��������').count - 1).Read('�������������');
  spModifySbispack.ParamByName('v_RELEASEDATE').AsString := SoDoc.ReadObjectList('��������').At(SoDoc.ReadObjectList('��������').count - 1).Read('���������');
  try
    try
      spModifySbispack.ExecProc;
    except
      cntNotSbis := cntNotSbis + spModifySbispack.ParamByName('sINNSender').AsString + #13;
    end;
  finally
    lOldIDSO := spModifySbispack.ParamByName('pOld_IDSO').AsString;
    idpack := spModifySbispack.ParamByName('nIdPack').AsInteger;
  end;
end;

end.
