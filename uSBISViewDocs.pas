unit uSBISViewDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UtilUnit, ComCtrls, ToolWin, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DB, DBAccess, Ora, MemDS, ActnList, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, DBCtrls, StdCtrls, uDMPki, ExtCtrls,
  uConstArcDoc, ImgList,uSBISViewFilt, PropFilerEh, PropStorageEh, Buttons,
  uSBIS, DocflowAXLib_TLB, OleServer, OleCtnrs, dateutils,ShellApi, untErrorMSG,
  uSBISArcParser, uDMSbisResponse, Menus, uSBISDownloadParams, uSplashSKL, OraError,
  MemTableDataEh, MemTableEh, StrUtils, System.ImageList, System.Actions{, uDMSBIS};

type
  TDocAction = (preview,savearc,alldocs,status,vloj);
  TDocActionSet = set of TDocAction;

  TfmSbisViewDocs = class(TForm)
    ToolBar: TToolBar;
    ActionList: TActionList;
    qDocs: TOraQuery;
    dsDocs: TOraDataSource;
    actActivateSQL: TAction;
    pnModal: TPanel;
    qSBISObj: TOraQuery;
    dsSBISObj: TOraDataSource;
    ToolButton10: TToolButton;
    ActArch: TAction;
    ImageList: TImageList;
    actFilter: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ActExit: TAction;
    ActRefresh: TAction;
    ToolButton5: TToolButton;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    actNotFilter: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    StatusBar1: TStatusBar;
    actRefreshDocs: TAction;
    ToolButton8: TToolButton;
    qPacks: TOraQuery;
    ToolButton9: TToolButton;
    ActPreview: TAction;
    ToolButton11: TToolButton;
    qSbisTypes: TOraQuery;
    ActDownloadHTMLS: TAction;
    ActDownloadZIP: TAction;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    pmPol: TPopupMenu;
    ActLoadStatus: TAction;
    ActLoadArcDoc: TAction;
    ActLoadArcDoc1: TMenuItem;
    spDelDocCopy: TOraStoredProc;
    ActLoadStatus1: TMenuItem;
    spDelVloj: TOraStoredProc;
    ActLoadVloj: TAction;
    N1: TMenuItem;
    ActSQLFilter: TAction;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    dsSklPrData: TOraDataSource;
    qSklPrData: TOraQuery;
    Panel2: TPanel;
    dbgObj: TDBGridEh;
    Splitter1: TSplitter;
    pgDocs: TPageControl;
    tsPol: TTabSheet;
    Splitter2: TSplitter;
    dbgDoc: TDBGridEh;
    dbgSklPrData: TDBGridEh;
    tsOtl: TTabSheet;
    SubPanel: TPanel;
    cbFltrSklPr: TComboBox;
    ActRefreshSBISObj: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actActivateSQLExecute(Sender: TObject);
    procedure pgDocsChange(Sender: TObject);
    procedure dsDocsDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActArchExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure ActExitExecute(Sender: TObject);
    procedure ActRefreshExecute(Sender: TObject);
    procedure dbgDocGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure actNotFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDocDblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure actRefreshDocsExecute(Sender: TObject);
    procedure ActPreviewExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActLoadArcDocExecute(Sender: TObject);
    procedure ActLoadStatusExecute(Sender: TObject);
    procedure ActLoadVlojExecute(Sender: TObject);
    procedure cbFltrSklPrKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbFltrSklPrKeyPress(Sender: TObject; var Key: Char);
    procedure cbFltrSklPrChange(Sender: TObject);
    procedure ActSQLFilterExecute(Sender: TObject);
    procedure cbFltrSklPrCloseUp(Sender: TObject);
    procedure tsPolShow(Sender: TObject);
    procedure tsOtlShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure pgDocsDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure dbgDocDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ActRefreshSBISObjExecute(Sender: TObject);
  private
    { Private declarations }
//    Docflow:IDocflow;
//    cntNotSbis:string;
    params:recSBISViewParams;
//    Log: ILog;

    procedure defaultParams;
    procedure DownloadDocs(sTypeFilt:string;dates:string;datepo:string;sDocState:string = '');
//    procedure procDoc(IDEDO, iddoc: string; idpack:integer; actions:TDocActionSet; TypeWay: string; pAttrNewDoc: integer = 0; pDateDoc: string = '');
    procedure procDoc(IDEDO, iddoc: string; idpack:integer; actions:TDocActionSet; TypeWay: string; pAttrNewDoc: integer = 0; pDateDoc: string = ''; pConnect: boolean = true);
    function  connect:boolean;
    function IsImpDoc(inFileName:string; out ListFRM: TStringList):boolean;
    procedure DownloadHTMLs(SoDoc: ISimpleObject; actions: TDocActionSet; idpack: integer = 0; pAttrNewDoc: integer = 0; TypeWay: string = '');
//    procedure UpdateStatus(SoDoc:ISimpleObject);
    function  GetSbisDoc(IDEDO, iddoc, pDateDoc, TypeWay: string):ISimpleObject;
    procedure selectDoc;
    procedure saveVloj(SoDoc:ISimpleObject;idpack:integer);
    function DownLoadSBISDocs(dparams:rSBISDowloadParams):boolean;
    function GetDocList(BegDate, EndDate, IdEDO: string; IdPack: integer): boolean;
  public
    { Public declarations }
  end;

  procedure GetSBISViewDocs;
  function  GetModalSbisDocs(var SbisObj:TSbisUPD; inContrId:string; ActivePage: integer = 0):boolean;
//  procedure ClearDIR(path:string);
  function DownLoadSBISDocsRegular:boolean;
  function GetDocSetStatus(BegDate, EndDate, IdEDO: string; IdPack: integer ): boolean;

var
  inSContrId:string;
  fmSbisViewDocs: TfmSbisViewDocs;
  fmSplash: TfrmSplashSkl;
  sql_filtr: string;
  ChInsList: boolean;
  vActivePage: integer;
  Docflow: IDocflow;
//  Log: ILog;
//  luSesionId: string;
  //������ ��� �����������
  SbisLogC: ILog;

implementation
{$R *.dfm}

//������������� �������� ������ ���������� ��� ������� Join �� �����
function DownLoadSBISDocsRegular:boolean;
var
  dparams:rSBISDowloadParams;
begin

  Application.CreateForm(TfmSbisViewDocs,fmSbisViewDocs);
  fmSbisViewDocs.FormStyle := fsMDIForm;
  dparams.begDate := DateToStr(Date-7);
  dparams.endDate := DateToStr(Date);
  dparams.dOut := true;
  dparams.dIn  := true;
  dparams.dDel := true;
  dparams.arcAction := aaOnlyEmpty;
  dparams.VlojAction := vaAll;
  result := fmSbisViewDocs.DownLoadSBISDocs(dparams);
end;

function TfmSbisViewDocs.DownLoadSBISDocs(dparams: rSBISDowloadParams): boolean;
var
  arcCount: integer;
  err: string;
//  ConnectInfo: ISimpleObject;
begin
  try
    try
      DBName.AutoCommit := false;
      DBName.StartTransaction;
      fmSplash := TfrmSplashSkl(uSplashSkl.ShowSplash(MainFormUtil));
      fmSplash.ShowAction('�����������...');
      if not(connect) then
        begin
    //      err := DocFlow.ReadLastError;
    //      Docflow.TerminateSession;
          {ConnectInfo := DocFlow.ReadConnectionInfo;
          err := err + ' / ������������: ' + ConnectInfo.Read('������������');
          err := err + ' / �������������������: ' + ConnectInfo.Read('�������������������');
          err := err + ' / �����������������������������: ' + ConnectInfo.Read('�����������������������������');
          err := err + ' / ���������������������: ' + ConnectInfo.Read('���������������������');
          untErrorMsg.ErrorMsg('������.', err);}
          raise Exception.Create('������ �����������');
        end;
      qPacks.Close;
      qPacks.ParamByName('DATES').AsString := dparams.begDate;
      qPacks.Open;

      if dparams.dIn then
        begin
          fmSplash.ShowAction('�������� ��������...');
          DownloadDocs('���������', dparams.begDate, dparams.endDate);
          DownloadDocs('CorrIn', dparams.begDate, dparams.endDate);
          DownloadDocs('���������', dparams.begDate, dparams.endDate);
        end;
      if dparams.dOut then
        begin
          fmSplash.ShowAction('�������� ���������...');
          DownloadDocs('����������', dparams.begDate, dparams.endDate);
          DownloadDocs('CorrOut', dparams.begDate, dparams.endDate);
          DownloadDocs('����������', dparams.begDate, dparams.endDate);
        end;
      if dparams.dDel then
        begin
          fmSplash.ShowAction('�������� ��������...');
          DownloadDocs('���������',dparams.begDate,dparams.endDate,'���������');
          DownloadDocs('����������',dparams.begDate,dparams.endDate,'���������');
          DownloadDocs('CorrIn', dparams.begDate, dparams.endDate, '���������');
          DownloadDocs('CorrOut', dparams.begDate, dparams.endDate, '���������');
          DownloadDocs('���������', dparams.begDate, dparams.endDate, '���������');
          DownloadDocs('����������', dparams.begDate, dparams.endDate, '���������');
        end;
      if not(dparams.arcAction = aaNone) then
        begin
          arcCount := 0;
          fmSplash.ShowAction('�������� �������...');
//          qPacks.Close;
//          qPacks.Open;
          qPacks.ExecSQL;
          qPacks.First;
          while not(qPacks.Eof) do
            begin
              if (qPacks.FieldByName('IDSO').AsString <> '') then
                begin
                  if ((qPacks.FieldByName('ARC').AsInteger = 0) and (dparams.arcAction = aaOnlyEmpty))
                    or (dparams.arcAction = aaAll) then
                    begin
                      procDoc(qPacks.FieldByName('IDEDO').AsString, qPacks.FieldByName('IDSO').AsString, qPacks.FieldByName('ID').AsInteger, [saveArc{,vloj}], '', qPacks.FieldByName('ARC').AsInteger, '', false);
                      arcCount := arcCount + 1;
                      DBName.Commit;
                      fmSplash.ShowAction('', '���������: ' + inttoStr(arcCount));
                      DBName.StartTransaction;
                    end;
                end;
              qPacks.Next;
            end;
        end;
      Screen.cursor := crDefault;
//      Docflow.TerminateSession;
      DBName.Commit;
      DBName.AutoCommit := true;
      result := true;
    except
      DBName.Rollback;
      raise;
    end;
  finally
    Docflow.TerminateSession;
    fmSplash.Free;
  end;
end;

function TfmSbisViewDocs.IsImpDoc(inFileName:string; out ListFRM: TStringList):boolean;
var
  temp_pref:string;
  l_ListFRM: TStringList;
  l_index: integer;
  l_indexN: string;
begin
  result := false;
  l_ListFRM := TStringList.Create;
  qSbisTypes.First;
  while not(qSbisTypes.Eof) do
    begin
      temp_pref := copy(inFileName,1,length(qSbisTypes.FieldByName('PREFIX').AsString));
      if (qSbisTypes.FieldByName('PREFIX').AsString = temp_pref) then
        l_index := l_ListFRM.Add(qSbisTypes.FieldByName('SBISID').AsString + '=' + qSbisTypes.FieldByName('VERSFORM_POINT').AsString);
      qSbisTypes.Next;
    end;
  if l_ListFRM.Count > 0 then
    begin
      ListFRM := TStringList.Create;
      ListFRM.Text := l_ListFRM.Text;
      result := true;
    end;
end;

function GetModalSbisDocs(var SbisObj:TSbisUPD; inContrId:string; ActivePage: integer = 0):boolean;
begin
  try
    result := false;
    inSContrId := inContrId;
    vActivePage := ActivePage;
    Application.CreateForm(TfmSbisViewDocs,fmSbisViewDocs);
    fmSbisViewDocs.dbgDoc.Options:=fmSbisViewDocs.dbgDoc.Options + [dgRowSelect]  - [dgMultiSelect];
    fmSbisViewDocs.dbgDoc.IndicatorOptions:=fmSbisViewDocs.dbgDoc.IndicatorOptions-[GioShowRowselCheckBoxesEh];
    if fmSbisViewDocs.ShowModal = mrOk then
    begin
      with fmSbisViewDocs do
      begin
        SbisObj.parseXML(qDocs.FieldByName('ID').AsInteger);
      end;
      result := true;
    end;
  finally
    fmSbisViewDocs.free;
  end;
end;

procedure TfmSbisViewDocs.ActArchExecute(Sender: TObject);
begin
  Show_DocsWnd('SBISLOG', qDocs.FieldByName('id').AsInteger,'');
end;

procedure TfmSbisViewDocs.ActExitExecute(Sender: TObject);
begin
  close;
end;

procedure TfmSbisViewDocs.actFilterExecute(Sender: TObject);
begin
  if GetSBISViewFilt(params) then
    ActActivateSQl.Execute;
end;

procedure TfmSbisViewDocs.ActSQLFilterExecute(Sender: TObject);
begin
  sql_filtr := '';
  if pgDocs.ActivePage = tsPol then
    begin
      if cbFltrSklPr.ItemIndex = 1 then
        sql_filtr := 'and (sklopnum is null and id_jn is null)';
      if cbFltrSklPr.ItemIndex = 0 then
        sql_filtr := 'and (sklopnum is not null or id_jn is not null)';
    end;
end;

procedure TfmSbisViewDocs.ActLoadArcDocExecute(Sender: TObject);
begin
  try
    screen.Cursor := crSQLWait;
    DBName.AutoCommit := false;
    DBName.Commit;
    DBName.StartTransaction;
    procDoc(qDocs.FieldByName('IDEDO').AsString, qDocs.FieldByName('IDSO').AsString, qDocs.FieldByName('ID').AsInteger, [saveArc], qDocs.FieldByName('DOCTYPE').AsString, qDocs.FieldByName('ARC').AsInteger, qDocs.FieldByName('DOCDATE').AsString);
    DBName.Commit;
  except
    on E: EOraError do
    begin
      DBName.Rollback;
      untErrorMsg.ErrorMsg('',e.Message,1);
    end;
    on E: Exception do
    begin
      DBName.Rollback;
      untErrorMsg.ErrorMsg('',E.ClassName+'   '+E.Message,1);
    end;
    else
      begin
        DBName.Rollback;
        untErrorMsg.ErrorMsg('','',1);
      end;
  end;
  actRefresh.Execute;
  DBName.AutoCommit := true;
  screen.Cursor := crDefault;
end;

procedure TfmSbisViewDocs.ActLoadStatusExecute(Sender: TObject);
var
  vArc_doc_id, vLog_name: string;
begin
  screen.Cursor := crSQLWait;
  DBName.AutoCommit := false;
  DBName.Commit;
  DBName.StartTransaction;
  procDoc(qDocs.FieldByName('IDEDO').AsString, qDocs.FieldByName('IDSO').AsString, qDocs.FieldByName('ID').AsInteger, [status], qDocs.FieldByName('DOCTYPE').AsString, qDocs.FieldByName('ARC').AsInteger, qDocs.FieldByName('DOCDATE').AsString);
  actRefresh.Execute;
  DBName.Commit;
  DBName.AutoCommit := true;
  screen.Cursor := crDefault;
end;

procedure TfmSbisViewDocs.ActLoadVlojExecute(Sender: TObject);
var
  vArc_doc_id, vLog_name: string;
begin
  screen.Cursor := crSQLWait;
  DBName.AutoCommit := false;
  DBName.Commit;
  DBName.StartTransaction;
  procDoc(qDocs.FieldByName('IDEDO').AsString, qDocs.FieldByName('IDSO').AsString, qDocs.FieldByName('ID').AsInteger, [vloj], qDocs.FieldByName('DOCTYPE').AsString, qDocs.FieldByName('ARC').AsInteger, qDocs.FieldByName('DOCDATE').AsString);
  ActRefreshSBISObj.Execute;
  DBName.Commit;
  DBName.AutoCommit := true;
  screen.Cursor := crDefault;
end;

procedure TfmSbisViewDocs.actNotFilterExecute(Sender: TObject);
begin
  defaultParams;
  ActActivateSQL.Execute;
end;

procedure TfmSbisViewDocs.ActPreviewExecute(Sender: TObject);
var
  vArc_doc_id, vLog_name: string;
begin
  procDoc(qDocs.FieldByName('IDEDO').AsString, qDocs.FieldByName('IDSO').AsString, qDocs.FieldByName('ID').AsInteger, [preview], '', qDocs.FieldByName('ARC').AsInteger, qDocs.FieldByName('DOCDATE').AsString);
end;

procedure TfmSbisViewDocs.procDoc(IDEDO, iddoc: string; idpack:integer; actions:TDocActionSet; TypeWay: string; pAttrNewDoc: integer = 0; pDateDoc: string = ''; pConnect: boolean = true);
var
  SoDoc:ISimpleObject;      //��������
  err:string;
  SL:TStringList;
begin
  try
    if pConnect and not(connect) then    //����������� � ������-������� ����
      begin
        untErrorMsg.ErrorMsg('������ �����������.','');
        exit;
      end;
    SoDoc := GetSbisDoc(IDEDO, iddoc, pDateDoc, TypeWay);   //��������� ���������
    if not Assigned(SoDoc) then exit;   //�������� ������� ������

    if (vloj in actions) then
      begin
//        spDelVloj.ParamByName('in_idso').AsString := SoDoc.Read('�������������');
//        spDelVloj.ExecProc;
        saveVloj(SoDoc, idPack);
      end;
    if (status in actions) then
      dmSBISResponse.EditPack(idpack, SoDoc);

    if (preview in actions) or
       (savearc in actions) or
       (alldocs in actions)
    then
      DownloadHTMLs(SoDoc, actions, idpack, pAttrNewDoc, TypeWay);
  finally
    if pConnect then
      Docflow.TerminateSession;     //������������ ���������� ������ � ������-������� ����
  end;
end;

function TfmSbisViewDocs.GetSbisDoc(IDEDO, iddoc, pDateDoc, TypeWay: string):ISimpleObject;
var
  SoDoc: ISimpleObject;
  SoDocList: ISimpleObjectList;
  err:string;
  i: integer;
  curstr: integer;
  SoNav: ISimpleObject;
  SoNavResult: ISimpleObject;
  SoFilter: ISimpleObject;
  SoRes: ISimpleObject;
  SrcResult: boolean;
  CntSrc: integer;
begin
  try
    SrcResult := false;
    CntSrc := 0;

    SoDoc := DocFlow.CreateSimpleObject;
    SoDoc.Write('�������������', iddoc);
    SoDoc := DocFlow.ReadDocument(SoDoc);
    if not Assigned(SoDoc) then
      begin
        SoDocList := DocFlow.CreateSimpleObjectList;
        SoDoc := DocFlow.CreateSimpleObject;
        SoFilter := Docflow.CreateSimpleObject;

        SoFilter.Write('�����', pDateDoc);
        SoFilter.Write('������', DateToStr(IncDay(StrToDate(pDateDoc), 2)));
        SoFilter.Write('��������������������������������������', '��');

        if TypeWay <> '' then
          SoFilter.Write('���', TypeWay);

        SoNav := Docflow.CreateSimpleObject;
        SoNav.Write('��������������', '1000');
        curstr := 0;
        repeat
          repeat
            soNav.Write('��������', IntToStr(curstr));
            SoFilter.WriteObject('���������', soNav);
            SoRes := Docflow.ReadDocuments(SoFilter);
            if Docflow.ReadLastError <> '' then
              begin
                showmessage(Docflow.ReadLastError);
                Docflow.TerminateSession;
                exit;
              end;
            SoDocList := SoRes.ReadObjectList('��������');
            SoNavResult := SoRes.ReadObject('���������');
            if SoRes.ReadLastError <> '' then
              showmessage(SoRes.ReadLastError);
            if Assigned(SoDocList) then
              begin
                for I := 0 to SoDocList.count - 1 do
                  begin
                    SoDoc := SoDocList.At(i);
                    if SoDoc.ReadObjectList('��������').At(SoDoc.ReadObjectList('��������').count - 1).Read('������������') = IDEDO then
                      begin
                        SrcResult := true;
                        break;
                      end
                    else
                      SoDoc := nil;
                  end;
              end;
            curstr := curstr + 1;
          until (SoNavResult.Read('�������')<>'��');
          if SrcResult then break;
          curstr := 0;
          SoFilter.Write('���������', '���������');
          CntSrc := CntSrc + 1;
        until (CntSrc >= 2);
      end;
    err := DocFlow.ReadLastError;
    if err <> '' then
      begin
        untErrorMsg.ErrorMsg('������.',err);
        Docflow.TerminateSession;
        exit;
      end;
    result := SoDoc;
  except
    ShowMessage('������ �������� ���������');
  end;
end;

{procedure ClearDIR(path:string);
var
  sh : SHFILEOPSTRUCT;
  From : array [0..255] of Char;
  fullpath:string;
begin
  fullpath := path+'*.*';
  //SetLength(From,length(fullpath));
  FillChar(From,High(Byte),#0);
  StrPCopy(From,fullpath);
  //From := @From;//StringToArray();  //'d:\temp\sbis\*.*';
  sh.Wnd := Application.Handle;
  sh.wFunc := FO_DELETE;
  sh.pFrom := @From;
  sh.pTo := nil;
  sh.fFlags := FOF_NOCONFIRMATION + FOF_SILENT;
  sh.fAnyOperationsAborted := False;
  sh.hNameMappings := nil;
  sh.lpszProgressTitle := nil;
  SHFileOperation(sh);
end;}

procedure TfmSbisViewDocs.DownloadHTMLs(SoDoc: ISimpleObject; actions: TDocActionSet; idpack: integer = 0; pAttrNewDoc: integer = 0; TypeWay: string = '');
var
  SlVloj:ISimpleObjectList; //������ ��������
  SoVloj:ISimpleObject;     //��������
  curVloj:integer;
  fullpath:string;
  err:string;
  shref:string;
  tpp:string;
  cnt_File: integer;
  i, lvOut_Res: integer;
//  lvConnectioInfo: ISimpleObject;
//  lvIdSession: string;
begin
  try
    cnt_File := 0;
//    SoDoc := getSbisDoc('', SoDoc.Read('�������������'), '', TypeWay);
//    if ((preview in actions) or (SaveArc in actions)) then
//      begin
        SlVloj := SoDoc.ReadObjectList('��������');
        if Assigned(SlVloj) then
          begin
            for curVloj := 0 to SLVloj.Count - 1 do
              begin
                SoVloj := SlVloj.At(curVloj);
                err := Docflow.ReadLastError;
                if err <> '' then
                  begin
                    untErrorMsg.ErrorMsg('������.',err);
                    exit;
                  end;
                tpp := SoVloj.Read('���');
                if (qSbisTypes.Locate('SBISID',tpp,[]) or (allDocs in actions)) then
                  begin
                    fullpath := GetWindowsTemp+SoVloj.Read('���')+'_'+SoVloj.Read('�������������')+'.pdf';
                    shref := SoVloj.Read('��������PDF');
                    if (shref<>'') then
                    begin
                      lvOut_Res := DocFlow.LoadDataFromURIToFile(shref,fullpath);

                      err := Docflow.ReadLastError;
                      if err <> '' then
                      begin
                        untErrorMsg.ErrorMsg('������.',err);
                        exit;
                      end;
                      if (preview in actions) then
                        ShellExecute( Handle, 'open', PChar(fullpath), nil, nil, SW_NORMAL );
                      if (saveArc in actions) then
                        dmSBISResponse.addDocCopy(idpack, fullpath, SoVloj.Read('��������'), cnt_File, pAttrNewDoc);
                    end;
                  end;
              end;
          end;
//      end;
//    if (vloj in actions) then saveVloj(SoDoc,idpack);
  except
    ShowMessage('������ �������� ������ ����������');
  end;
end;

//�������� ������ ���������
procedure TfmSbisViewDocs.DownloadDocs(sTypeFilt: string; dates: string; datepo: string; sDocState: string = '');
var
  SoFilter:ISimpleObject;
  SoRes:ISimpleObject;
  SoDoc:ISimpleObject;
  SoSob:ISimpleObject;
  SoContr:ISimpleObject;
  SoNav:ISimpleObject;
  SoNavResult:ISimpleObject;
  SoParamHTML:ISimpleObject;
  SoResultHTML:ISimpleObject;
  SlRes:ISimpleObjectList;
  SlSob:ISimpleObjectList;
  i:integer;
  j:integer;
  z:integer;
  docid:string;
  docsum:string;
  docnum:string;
  st:string;
  curstr:integer;
  sType:string;
  StreamHelper:IStreamHelper;
  errList:string;
  TotalCount:integer;
  inn:string;
  prim:string;
  SlVloj: ISimpleObjectList;
  SoVloj: ISimpleObject;
  DocSoVloj: ISimpleObject;
  dateD, dateC: string;
  ListVersDoc: ISimpleObjectList;
  ObjVersDoc: ISimpleObject;
  Versid: string;
  VersDate: string;
  VersNote: string;
  RevCount: integer;
  vStatus: string;
  EditData: boolean;
  lvIdPack: integer;
//  vLINN: string;
//  vLDocNum: string;
begin
  errList := '';

  SoFilter := Docflow.CreateSimpleObject;
  SoFilter.Write('�����', dates);
  SoFilter.Write('������', datepo);
  SoFilter.Write('���', sTypeFilt);
  if (sDocState <> '') then SoFilter.Write('���������', sDocState);

  SoNav := Docflow.CreateSimpleObject;
  SoNav.Write('��������������', '1000');
  curstr := 0;
  TotalCount := 0;
  repeat
    try
      soNav.Write('��������', IntToStr(curstr));
      SoFilter.WriteObject('���������', soNav);
      SoRes := Docflow.ReadDocuments(SoFilter);

      if Docflow.ReadLastError <> '' then
        showmessage(Docflow.ReadLastError);

      SlRes := SoRes.ReadObjectList('��������');

      SoNavResult := SoRes.ReadObject('���������');
      if SoRes.ReadLastError <> '' then
        showmessage(SoRes.ReadLastError);

      for i := 0 to SlRes.count - 1 do
        begin
          EditData := false;
          SoDoc := SlRes.At(i);
          prim := SoDoc.ReadObjectList('��������').At(SoDoc.ReadObjectList('��������').count - 1).Read('������������');
          vStatus := SoDoc.ReadObject('���������').Read('���');
          docid := SoDoc.Read('�������������');
          docsum := SoDoc.Read('�����');
          SType := SoDoc.Read('�����������');
        {  vLDocNum := SoDoc.Read('�����');
          if vLDocNum = '890' then
            beep;
//          vLINN := SoDoc.ReadObject('����������').ReadObject('����').Read('���');
          try
            if (SoDoc.ReadObject('����������').ReadObject('����').Read('���') = '7734731776') then
              beep
            else
              continue;
          except
            continue;
          end;}


          //����������� ��������� �����, ������������ ��� ������������� ������, �������� �� ������ � �.�.
          if (SType = '���������') and (prim = '') then
            continue;

          //���� ����� ������ �� �������, �� ����� �� �� ������� ��������
          if docsum='' then docsum := SoDoc.ReadObjectList('��������').At(0).read('�����');

          {if prim = 'FacilPack_C2821118-7D5E-4C56-8280-D2E078E5741A' then   //��� �������� ��������
            begin}
          {if docid = '56c260b7-9411-4039-95ae-c8d494fdd67b' then          //��� �������� ��������
            begin}
              if (qPacks.Locate('IDSO', docid, []) or qPacks.Locate('IDEDO', prim, [])) then
                begin
                  if (vStatus <> qPacks.FieldByName('CURSTATUS').AsString) then
                    begin
                      EditData := true;
                      lvIdPack := qPacks.FieldByName('id').AsInteger;
                    end;
                end
              else
                begin
                  if (SType <> '���������') then
                    begin
                      lvIdPack := 0;
                      EditData := true;
                    end;
                end;
              if EditData then
                begin
                  dmSBISResponse.EditPack(lvIdPack, SoDoc);
                  if lvIdPack <> 0 then
                    begin
                      saveVloj(SoDoc, lvIdPack);
//                      DownloadHTMLs(SoDoc, [vloj], lvIdPack);
                      TotalCount := TotalCount + 1;
                      fmSplash.ShowAction('', '���������: ' + inttoStr(TotalCount));
                    end;
                end;
//            end;        //��� �������� ��������
        end;
    except
      errList := errList + #13 + docnum;
      raise;
    end;
    curstr := curstr + 1;
  until (SoNavResult.Read('�������')<>'��');
    if errList<>'' then
      begin
        errList := '������ �������:'+#13 +errList;
        Application.MessageBox(PWideChar(errList),'���������', mb_Ok + mb_IconWarning);
      end;
end;

procedure TfmSbisViewDocs.saveVloj(SoDoc:ISimpleObject;idpack:integer);
var
  SBISArcParser:TSBISArcParser;
  SL:TstringList;
  curVloj:integer;
  SlVloj:ISimpleObjectList;
  SoVloj:ISimpleObject;
  docid:string;
  curType:string;
  Arcpath:string;
  VerFormVloj, VlojNum: string;
  l_ListFRM: TStringList;
  i: integer;
  lvNFileTMP: string;
begin
  try
    DateTimeToString(lvNFileTMP, 'yyyymmdd_hhnnss', Now);
    Arcpath := GetWindowsTemp + lvNFileTMP + '_sbis_arc.zip';
    SL:=TSTringList.Create;
    SlVloj := SoDoc.ReadObjectList('��������'); //�������� ������ ��������
    docid := SoDoc.Read('�������������'); //ID ���������

    DocFlow.LoadDataFromURIToFile(SoDoc.Read('�������������'),Arcpath); //��������� ����� ���������, � ��� ��������� ��� ��������
    SBISArcParser := tSBISArcParser.create(Arcpath);
    SBISArcParser.onlyroot := true;
    SBISArcParser.parse('');
    SL.Clear;
    while not(SBISArcParser.eof) do
      begin
        if ExtractFileExt(SBISArcParser.GetFileName)='.xml' then
          begin
            if IsImpDoc(SBISArcParser.GetFileName, l_ListFRM) then
              begin
                SBISArcParser.GetFile.SaveToFile(GetWindowsTemp+SBISArcParser.GetFileName);
                for curVloj := 0 to SLVloj.Count - 1 do
                  begin
                    SoVloj := SLVloj.At(curVloj);
                    curType := SoVloj.Read('���');
                    VerFormVloj := SoVloj.Read('�������������');
                    VlojNum := SoVloj.Read('�����');
                    for I := 0 to l_ListFRM.Count - 1 do
                      if (l_ListFRM.Names[i] = curType) and (l_ListFRM.ValueFromIndex[i] = VerFormVloj) then
                        dmSBISResponse.SaveFile(GetWindowsTemp+SBISArcParser.GetFileName, idpack, qSbisTypes.Lookup('SBISID;VERSFORM_POINT', VarArrayOf([curType, VerFormVloj]), 'id'), SoVloj);
                  end;
              end;
            deletefile(GetWindowsTemp+SBISArcParser.GetFileName);
          end;
        SBISArcParser.next;
      end;
    deletefile(Arcpath);
    SBISArcParser.destroy;
    SL.Destroy;
  except
    ShowMessage('������ �������� ��������');
  end;
end;

procedure TfmSbisViewDocs.cbFltrSklPrChange(Sender: TObject);
begin
  if not cbFltrSklPr.DroppedDown then
    begin
      if cbFltrSklPr.ItemIndex = 1 then
        dbgSklPrData.Visible := false
      else
        dbgSklPrData.Visible := true;
      actActivateSQL.Execute;
    end;
end;

procedure TfmSbisViewDocs.cbFltrSklPrCloseUp(Sender: TObject);
begin
  actActivateSQL.Execute;
end;

procedure TfmSbisViewDocs.cbFltrSklPrKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then Key := #0;
end;

procedure TfmSbisViewDocs.cbFltrSklPrKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
   begin
    ChInsList := not ChInsList;
    if ChInsList then
      cbFltrSklPr.Perform(CB_SHOWDROPDOWN, 0, 0)
    else
      cbFltrSklPr.Perform(CB_SHOWDROPDOWN, 1, 0);
   end;
end;

//����������� �� ������� online.sbis.ru   //����� ������ ���� ��������� ����������� �������� Docflow.TerminateSession
function TfmSbisViewDocs.connect:boolean;
var
  lvSes, lvAuth: integer;
  SoConnectionInfo: ISimpleObject;
  //������� ��� �����������
  log_info_in: ISimpleObject;
//  SbisLogC: ILog;
  lvConnectioInfo: ISimpleObject;
  lvIdSession: string;

begin
  try
    SoConnectionInfo := Docflow.CreateSimpleObject;
    log_info_in := Docflow.CreateSimpleObject;

    //�������� ���������� ����������� � ���� ��������, ����������� �� ���������� �������������� � ������ ��������
    SoConnectionInfo.Write('�����������������������������', '��' );
    SoConnectionInfo.Write('�������������������������', '5');
    SoConnectionInfo.Write('����������������������', '2000');
    Docflow.WriteConnectionInfo(SoConnectionInfo);

    if Assigned(SbisLogC) then
      begin
        //���������� �����������
        log_info_in.Write('�������', '0');
        SbisLogC.WriteLogInfo(log_info_in);
      end
    else
      SbisLogC := CoLog.Create;
    //�������������� � ������ ��������
    lvAuth := Docflow.Authenticate('����������', '���������123');

    if lvAuth = 1 then
      begin
        //����������� �������� ����������
        log_info_in.Write('�����', 'g:\SBIS\BUH\');
//        log_info_in.Write('�����', 'd:\BUH\');
        log_info_in.Write('�������', '9');
        SbisLogC.WriteLogInfo(log_info_in);
        //�������� ������������ ������������ ������
        lvSes := Docflow.CheckSession;
        //��������� ������ � ������
        lvConnectioInfo := Docflow.ReadConnectionInfo;
        lvIdSession := lvConnectioInfo.Read('�������������������');
      end;

    if lvSes < 1 then
      result := false
    else
      result := true;
  except
    ShowMessage('������ �����������');
  end;
end;

//������������� �������� �� ��������� ����������
procedure TfmSbisViewDocs.actRefreshDocsExecute(Sender: TObject);
var
  dparams:rSBISDowloadParams;
  arcCount:integer;
begin
  if pgDocs.ActivePage = tsPol then
    dparams.dIn := true
  else
    dparams.dIn := false;

  if pgDocs.ActivePage = tsOtl then
    dparams.dOut := true
  else
    dparams.dOut := false;
  dparams.dDel := false;

  dparams.arcAction := aaOnlyEmpty;
  dparams.begDate := params.dates;
  dparams.endDate := params.datef;
  if not(getSBISDownloadParams(dparams)) then exit;
  dmSBISResponse.cntNotSbis := '';
  DownLoadSBISDocs(dparams);
  if dmSBISResponse.cntNotSbis <> '' then
  begin
    dmSBISResponse.cntNotSbis := '���������� ���������� ����� ����������� �� ���: ' + dmSBISResponse.cntNotSbis;
    Application.MessageBox(PWideChar(dmSBISResponse.cntNotSbis),'���������', mb_Ok + mb_IconWarning);
  end;
  ActActivateSQL.Execute;
end;

procedure TfmSbisViewDocs.ActRefreshExecute(Sender: TObject);
var
  idpack:integer;
begin
//  idpack := qDocs.FieldByName('ID').AsInteger;
  ActActivateSQL.Execute;
//  qDocs.Locate('ID',idpack,[]);
end;

procedure TfmSbisViewDocs.ActRefreshSBISObjExecute(Sender: TObject);
begin
  qSBISObj.Close;
  qSBISObj.ParamByName('idpack').AsInteger := qDocs.FieldByName('ID').AsInteger;
  qSBISObj.Open;
  if fmSbisViewDocs.Visible then
    begin
      if (qDocs.RecordCount > 0) and (qSBISObj.RecordCount <= 0) then
        Application.MessageBox(PWideChar('����������� ��������!' + #13 + '�������� ������.'),'���������', mb_Ok + mb_IconWarning);
    end;
end;

procedure TfmSbisViewDocs.BitBtn3Click(Sender: TObject);
begin
  selectDoc;
end;

procedure TfmSbisViewDocs.selectDoc;
var
  errMsg:string;
begin
  errMsg := '';
  if not(qDocs.FieldByName('sklopnum').AsString = '') then
    errMsg := errMsg + '������ ��� ����������.'+#13;
  if (qDocs.FieldByName('curstatus').AsString <> '7') then
    errMsg := errMsg + '�������� �� ��������.'+#13;
  if errMsg = '' then
    modalResult := mrOk
  else
    Application.MessageBox(PChar(errMsg), '���������', mb_Ok + mb_IconExclamation);
end;


procedure TfmSbisViewDocs.tsOtlShow(Sender: TObject);
begin
  cbFltrSklPr.Enabled := False;
  cbFltrSklPr.Visible := False;
  dbgDoc.Parent := tsOtl;
end;

procedure TfmSbisViewDocs.tsPolShow(Sender: TObject);
begin
  cbFltrSklPr.Enabled := True;
  cbFltrSklPr.Visible := True;
  dbgDoc.Parent := tsPol;
end;

procedure TfmSbisViewDocs.dbgDocDblClick(Sender: TObject);
begin
  selectDoc;
end;

procedure TfmSbisViewDocs.dbgDocDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if uppercase(Column.FieldName) = uppercase('MoveDate') then
    begin
      if (Sender as TDBGridEh).Parent = tsOtl then
        Column.Title.Caption := '���� ��������';
      if (Sender as TDBGridEh).Parent = tsPol then
        Column.Title.Caption := '���� ���������';
    end;
  if uppercase(Column.FieldName) = uppercase('IdContr') then
    begin
      if (Sender as TDBGridEh).Parent = tsOtl then
        Column.Title.Caption := '����������';
      if (Sender as TDBGridEh).Parent = tsPol then
        Column.Title.Caption := '�����������';
    end;
end;

procedure TfmSbisViewDocs.dbgDocGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if TDBGridEh(Sender).DataSource.DataSet.FieldByName('curstatus').AsInteger in [1,4] then
    Background := clInfoBk;
  if TDBGridEh(Sender).DataSource.DataSet.FieldByName('curstatus').AsInteger = 7 then
    Background := clMoneyGreen;
  if TDBGridEh(Sender).DataSource.DataSet.FieldByName('curstatus').AsInteger in [19,20] then
    AFont.Color := clRed;
end;

procedure TfmSbisViewDocs.defaultParams;
var
  iMonth:integer;
  sMonth:string;
  iYear:integer;
  sYear:string;
begin
  params.notActual := 0;
  iMonth := MonthOf(Date)-1;
  iYear:=strtoint(copy(DateToStr(Date),7,8));
  if iMonth=0 then
  begin
    iMonth:=12;
    iYear:=iYear-1;
  end;
  sYear := intToStr(iYear);
  sMonth := lpad(IntToStr(iMonth),'0',2);
  params.DateS := '01'+'.'+sMonth+'.'+sYear;
  params.DateF := DateMonthEnd(DateToStr(Date));
  params.contrid := inSContrId;
end;

procedure TfmSbisViewDocs.dsDocsDataChange(Sender: TObject; Field: TField);
begin
  ActRefreshSBISObj.Execute;
  qSklPrData.Close;
  qSklPrData.ParamByName('opnum').AsInteger := qDocs.FieldByName('SKLOPNUM').AsInteger;
  qSklPrData.Open;
end;

procedure GetSBISViewDocs;
begin
  inSContrId:='';
  Application.CreateForm(TfmSbisViewDocs,fmSbisViewDocs);
  fmSbisViewDocs.FormStyle := fsMDIChild;
end;

procedure TfmSbisViewDocs.actActivateSQLExecute(Sender: TObject);
var
  lvLastBM: TBookMark;
  lvOldIspol: integer;
begin
  ActSQLFilter.Execute;
//  lvLastBM := qDocs.GetBookmark;
  lvLastBM := qDocs.Bookmark;
  lvOldIspol := qDocs.ParamByName('ispol').AsInteger;
  qDocs.Close;
  if pgDocs.ActivePage = tsPol then
    qDocs.ParamByName('ispol').AsInteger := 1
  else
    qDocs.ParamByName('ispol').AsInteger := 0;
  qDocs.ParamByName('Company_id').AsInteger := Company_id;
  qDocs.ParamByName('dates').AsString := params.DateS;
  qDocs.ParamByName('datef').AsString := params.DateF;
  qDocs.ParamByName('notactual').AsInteger := params.notActual;
  qDocs.ParamByName('inContrId').AsString := params.contrid;
  if sql_filtr = '' then
    qDocs.MacroByName('macrofilter').Value := ''
  else
    qDocs.MacroByName('macrofilter').Value := sql_filtr;
  qDocs.Open;
  if (lvOldIspol = qDocs.ParamByName('ispol').AsInteger) and (qDocs.BookmarkValid(lvLastBM)) then
    qDocs.GotoBookmark(lvLastBM);
  StatusBar1.Panels[1].Text := IntToStr(qDocs.RecordCount);
end;

procedure TfmSbisViewDocs.FormActivate(Sender: TObject);
begin
  if self.FormStyle = fsMDIChild then
    ToToolBar(MainCoolbar, ToolBar);
  ChInsList := false;
end;

procedure TfmSbisViewDocs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if formStyle = fsMDIChild then
    Free;
end;

procedure TfmSbisViewDocs.FormCreate(Sender: TObject);
begin
  SetDatabase(DBName,Self);
  fmSbisViewDocs.pgDocs.ActivePageIndex := vActivePage;
  if not Assigned(dmSBISResponse) then
    Application.CreateForm(TdmSBISResponse,dmSBISResponse);
  defaultParams;
  actActivateSQL.Execute;
  //ToolBar.Images := DMPKI.ImageList;
  Docflow := CoDocflow.Create;
  qSbisTypes.Close;
  qSbisTypes.Open;
  if cbFltrSklPr.ItemIndex = 1 then
    dbgSklPrData.Visible := false
  else
    dbgSklPrData.Visible := true;
end;

procedure TfmSbisViewDocs.FormDeactivate(Sender: TObject);
begin
  if self.FormStyle = fsMDIChild then
    DelFromToolBar(MainCoolbar);
end;

procedure TfmSbisViewDocs.FormShow(Sender: TObject);
begin
  if formStyle = fsMDIChild then
    fmSbisViewDocs.pnModal.Hide;
  if (FormStyle <> fsMDIForm) and (qDocs.RecordCount > 0) and (qSBISObj.RecordCount <= 0) then
        Application.MessageBox(PWideChar('����������� ��������!' + #13 + '�������� ������.'),'���������', mb_Ok + mb_IconWarning);
end;

procedure TfmSbisViewDocs.pgDocsChange(Sender: TObject);
begin
  actActivateSQL.Execute;
end;

procedure TfmSbisViewDocs.pgDocsDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  AText: string;
  APoint: TPoint;
begin
  with (Control as TPageControl).Canvas do
    begin
      // ������� �������� RGB �������� ���� ������ (Tab) ������� � PageControl
      if Active then
        Brush.Color := RGB(255, 255, 224);
      FillRect(Rect);
      AText := TPageControl(Control).Pages[TabIndex].Caption;
      with Control.Canvas do
        begin
          APoint.x := (Rect.Right - Rect.Left) div 2 - TextWidth(AText) div 2;
          APoint.y := (Rect.Bottom - Rect.Top) div 2 - TextHeight(AText) div 2;
          TextRect(Rect, Rect.Left + APoint.x, Rect.Top + APoint.y, AText);
        end;
    end;
end;

//�������� ������ ���������� �� ���������, ������������ ��������� ���������� � ��� ����������
function TfmSbisViewDocs.GetDocList(BegDate, EndDate, IdEDO: string; IdPack: integer): boolean;
var
  SoFilter:ISimpleObject;
  SoRes:ISimpleObject;
  SoDoc:ISimpleObject;
  SoNav:ISimpleObject;
  SoNavResult:ISimpleObject;
  SlRes:ISimpleObjectList;
  i:integer;
  docid:string;
  docnum:string;
  errList:string;
  prim:string;
  vStatus: string;
  curstr: integer;
begin
  Result := False;
  SoFilter := Docflow.CreateSimpleObject;
  SoFilter.Write('�����', BegDate);
  SoFilter.Write('������', EndDate);
  SoFilter.Write('���', '����������');

  SoNav := Docflow.CreateSimpleObject;
  SoNav.Write('��������������', '1000');
  curstr := 0;

  repeat
    try
      soNav.Write('��������', IntToStr(curstr));
      SoFilter.WriteObject('���������', soNav);
      SoRes := Docflow.ReadDocuments(SoFilter);

      if Docflow.ReadLastError <> '' then
        showmessage(Docflow.ReadLastError);

      SlRes := SoRes.ReadObjectList('��������');

      SoNavResult := SoRes.ReadObject('���������');

      if SoRes.ReadLastError <> '' then
        showmessage(SoRes.ReadLastError);

      for i := 0 to SlRes.count - 1 do
        begin
          SoDoc := SlRes.At(i);
          prim := SoDoc.ReadObjectList('��������').At(SoDoc.ReadObjectList('��������').count - 1).Read('������������');
          vStatus := SoDoc.ReadObject('���������').Read('���');
          docid := SoDoc.Read('�������������');
          if IdEDO = prim then
            begin
              dmSBISResponse.EditPack(IdPack, SoDoc);
              if IdPack <> 0 then
                saveVloj(SoDoc, IdPack);
//                fmSbisViewDocs.DownloadHTMLs(SoDoc,[vloj], IdPack);
              Result := True;
            end;
        end;

    except
      errList := errList + #13 + docnum;
      raise;
    end;
    curstr := curstr + 1;
  until (SoNavResult.Read('�������') <> '��') or not Result;
  if errList<>'' then
      begin
        errList := '������ �������:'+#13 +errList;
        Application.MessageBox(PWideChar(errList),'���������', mb_Ok + mb_IconWarning);
      end;
end;

//���������� ������ �� ����, ����� ��������� ���������� �� ��
function GetDocSetStatus(BegDate, EndDate, IdEDO: string; IdPack: integer): boolean;
begin
  Application.CreateForm(TfmSbisViewDocs, fmSbisViewDocs);
  Result := false;
  try
    try
      if fmSbisViewDocs.connect then
        Result := fmSbisViewDocs.GetDocList(BegDate, EndDate, IdEDO, IdPack)
      else
        begin
          raise Exception.Create('������ �����������');
        end;
    except
      raise Exception.Create('������ ��������� GetDocSetStatus');
    end;
  finally
    Docflow.TerminateSession;
    fmSbisViewDocs.Free;
  end;
end;

end.
