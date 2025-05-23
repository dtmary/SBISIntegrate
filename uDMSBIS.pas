unit uDMSBIS;

interface

uses
  SysUtils, Classes,UtilUnit,Forms, PlugDMUnit,Messages, xmldom, XMLIntf,
  msxmldom, XMLDoc, MemTableDataEh, Db, MemTableEh, MemDS, DBAccess, Ora, OdacVcl;

type TDocid = array of integer;

type
  TDMSbis = class(TDataModule)
    MTSF: TMemTableEh;
    MTSFKOD: TStringField;
    MTSFusl: TStringField;
    MTSFkolvo: TStringField;
    MTSFtext: TStringField;
    MTSFprice: TStringField;
    MTSFsumma: TStringField;
    MTSFakc: TStringField;
    MTSFnacst: TStringField;
    MTSFnalog: TStringField;
    MTSFsumnal: TStringField;
    MTSFCKOD: TStringField;
    MTSFSNAME: TStringField;
    MTSFTAMD: TStringField;
    qContragent: TOraQuery;
    MTNakl: TMemTableEh;
    MTNakltext: TStringField;
    MTNaklEDNAME: TStringField;
    MTNaklbrutto: TStringField;
    MTNaklnetto: TStringField;
    MTNaklprice: TStringField;
    MTNaklsumma: TStringField;
    MTNaklnalst: TStringField;
    MTNaklnalog: TStringField;
    MTNaklsumnal: TStringField;
    qKadry: TOraQuery;
    qSBISTypes: TOraQuery;
    qFiles: TOraQuery;
    qFileIDNew: TOraQuery;
    spSbisObj: TOraStoredProc;
    qCheckSend: TOraQuery;
    spDelDoc: TOraStoredProc;
    spUpdateSession: TOraStoredProc;
    spGetSesson: TOraStoredProc;
    spCreatePack: TOraStoredProc;
    MTNaklKOD_OKEI: TStringField;
    qParseUPDsh: TOraQuery;
    qParseUpdSod: TOraQuery;
    MTSFNALSCH: TIntegerField;
    MTSFED_ISM: TIntegerField;
    qReadySFFRM: TOraQuery;
    MTSFedname: TStringField;
    MTSFNameRab: TStringField;
    MTSFTax: TStringField;
    MTSFZavNum: TStringField;
    MTAKT: TMemTableEh;
    MTAKTDolzhn: TStringField;
    MTAKTFamiliya: TStringField;
    MTAKTImya: TStringField;
    MTAKTOtchestvo: TStringField;
    qPacks: TOraQuery;
    qDocs: TOraQuery;
    qSBISObj: TOraQuery;
    qPackView: TOraQuery;
    spModyfiSBISPack: TOraStoredProc;
    MTSFMonitorNum: TStringField;
    MTSFMonitorEdISM: TStringField;
    MTSFMonitorNEdIsm: TStringField;
    MTSFMonitorCNT: TSmallintField;
    MTKSF: TMemTableEh;
    MTKSFProductName: TStringField;
    MTKSFkodEIBefore: TStringField;
    MTKSFkodEIAfter: TStringField;
    MTKSFcountBefore: TFloatField;
    MTKSFcountAfter: TFloatField;
    MTKSFpriceBefore: TFloatField;
    MTKSFpriceAfter: TFloatField;
    MTKSFndsBefore: TStringField;
    MTKSFndsAfter: TStringField;
    MTKSFSTnotNDS: TFloatField;
    MTKSFSTNDS: TFloatField;
    MTKSFsumNDSBefore: TFloatField;
    MTKSFsumNDSAfter: TFloatField;
    MTKSFsumNDSDiff: TFloatField;
    MTKSFSTnotNDS2: TFloatField;
    MTKSFSTnotNDS3: TFloatField;
    MTKSFSTnotNDS4: TFloatField;
    MTKSFSTNDS2: TFloatField;
    MTKSFSTNDS3: TFloatField;
    MTKSFSTNDS4: TFloatField;
    MTKSFakcBefore: TFloatField;
    MTKSFakcAfter: TFloatField;
    MTKSFakcDiff: TFloatField;
    MTKSFsumNDSDiff2: TFloatField;
    MTKSFakcDiff2: TFloatField;
    MTSFMonitorCCountry: TStringField;
    MTSFMonitorNCountry: TStringField;
    MTAKTS: TMemTableEh;
    MTAKTSNumDoc: TStringField;
    MTAKTSRemark: TStringField;
    MTAKTSPRIH_RASH: TStringField;
    MTAKTSDateDoc: TDateField;
    MTAKTSSumDoc: TFloatField;
    qCompany: TOraQuery;
    MTSFMonitorSum: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    class function GetInstance:TDMSbis;
  private
    { Private declarations }
    constructor create;
    destructor destroy;
  public
    { Public declarations }
    procedure CreateSession(edo_id:string;user_edo:string = 'ElmehOperator');
    function  GetSession(user_edo:string):string;
    procedure DeleteSession(edo_id:string);
    {function CreatePack (sIdEdo, sDocId, sUserId, sApp: string; nContrEdo, nContrSender, nContrPol: integer;
                         sDocnum, sDoctype, sDocdate: string; nDocsum: real; sIDSO: string):integer;}
    function ModyfiPack(IdPack: integer; sIdEdo: string; sDocId: TDocid; sUserId, sApp: string; nContrEdo, nContrSender, nContrPol: integer;
                        sDocnum, sDoctype, sDocdate: string; nDocsum: real; sIDSO: string; IsNewPack: boolean; pTablePref: string;
                        var oldIDSO: string): integer;
  end;

  var
    DMSbis:TDMSbis;

implementation

{$R *.dfm}
{function TDMSbis.CreatePack (sIdEdo, sDocId, sUserId, sApp: string; nContrEdo, nContrSender, nContrPol: integer;
                             sDocnum, sDoctype, sDocdate: string; nDocsum: real; sIDSO: string):integer;
begin
  spCreatePack.ParamByName('sIdEdo').AsString := sIdEdo;
  spCreatePack.ParamByName('sDocId').AsString := sDocId;
  spCreatePack.ParamByName('sUserId').AsString := sUserId;
  spCreatePack.ParamByName('sApp').AsString := sApp;
  spCreatePack.ParamByName('nContrEdo').AsInteger := nContrEdo;
  spCreatePack.ParamByName('nContrSender').AsInteger := nContrSender;
  spCreatePack.ParamByName('nContrPol').AsInteger := nContrPol;
  spCreatePack.ParamByName('nIsPol').AsInteger := 0;
  spCreatePack.ParamByName('sIdSO').AsString := sIDSO;
  spCreatePack.ParamByName('sINNSender').AsString := '';
  spCreatePack.ParamByName('sKPPSender').AsString := '';
  spCreatePack.ParamByName('sINNPol').AsString := '';
  spCreatePack.ParamByName('sKPPPol').AsString := '';
  spCreatePack.ParamByName('sDocnum').AsString := sDocnum;
  spCreatePack.ParamByName('sDoctype').AsString := sDoctype;
  spCreatePack.ParamByName('sDocdate').AsString := sDocdate;
  spCreatePack.ParamByName('nDocsum').AsFloat := nDocsum;
  spCreatePack.ParamByName('sStatus').AsInteger := 1;
  spCreatePack.ExecProc;
  Result := spCreatePack.ParamByName('RESULT').AsInteger;
end;}

procedure  TDMSbis.CreateSession(edo_id:string;user_edo:string);
begin
  spUpdateSession.parambyname('ACTION').asinteger := 0;
  spUpdateSession.parambyname('V_USER_PM').asString := user_id;
  spUpdateSession.parambyname('V_USER_EDO').AsString := user_edo;
  spUpdateSession.parambyname('V_ID_EDO').AsString := edo_id;
  spUpdateSession.parambyname('V_CONTREDO').AsInteger := 14942; //Ë‰ —¡»—¿ ËÁ contragents
  spUpdateSession.ExecProc;
end;

procedure TDMSbis.DeleteSession(edo_id:string);
begin
  spUpdateSession.parambyname('ACTION').asinteger := 1;
  spUpdateSession.parambyname('V_ID_EDO').AsString := edo_id;
  spUpdateSession.ExecProc;
end;

function TDMSbis.GetSession(user_edo:string):string;
begin
  spGetSesson.ParamByName('v_user_edo').AsString := user_edo;
  spGetSesson.ExecProc;
  result := spGetSesson.ParamByName('result').AsString;
end;

constructor TDMSbis.create;
begin

end;
destructor TDMSbis.destroy;
begin

end;

class function TDMSbis.GetInstance:TDMSbis;
begin
  if DMSbis = nil then
    Application.CreateForm(TDMSbis,DMSbis);
   // DMSbis := A//TDMSbis.create;
  result := DMSbis;
end;

procedure TDMSbis.DataModuleCreate(Sender: TObject);
begin
  SetDataBase(DBName,self);
end;

function TDMSbis.ModyfiPack(IdPack: integer; sIdEdo: string; sDocId: TDocid; sUserId, sApp: string; nContrEdo, nContrSender, nContrPol: integer;
                            sDocnum, sDoctype, sDocdate: string; nDocsum: real; sIDSO: string; IsNewPack: boolean; pTablePref: string;
                            var oldIDSO: string): integer;
var
  i: integer;
begin
  if IsNewPack then
    begin
      spModyfiSBISPack.ParamByName('nAction').AsInteger := 0;
      sIDSO := '';
    end
  else
    spModyfiSBISPack.ParamByName('nAction').AsInteger := 1;
  spModyfiSBISPack.ParamByName('bIsNewPack').AsBoolean := IsNewPack;
  spModyfiSBISPack.ParamByName('sIdEdo').AsString := sIdEdo;
  for i := 0 to Length(sDocId) - 1 do
    spModyfiSBISPack.ParamByName('sDocId').ItemAsInteger[i + 1] := sDocId[i];
  spModyfiSBISPack.ParamByName('sUserId').AsString := sUserId;
  spModyfiSBISPack.ParamByName('sApp').AsString := sApp;
  spModyfiSBISPack.ParamByName('nContrEdo').AsInteger := nContrEdo;
  spModyfiSBISPack.ParamByName('nContrSender').AsInteger := nContrSender;
  spModyfiSBISPack.ParamByName('nContrPol').AsInteger := nContrPol;
  spModyfiSBISPack.ParamByName('nIsPol').AsInteger := 0;
  spModyfiSBISPack.ParamByName('sIdSO').AsString := sIDSO;
  spModyfiSBISPack.ParamByName('sINNSender').AsString := '';
  spModyfiSBISPack.ParamByName('sKPPSender').AsString := '';
  spModyfiSBISPack.ParamByName('sINNPol').AsString := '';
  spModyfiSBISPack.ParamByName('sKPPPol').AsString := '';
  spModyfiSBISPack.ParamByName('sDocnum').AsString := sDocnum;
  spModyfiSBISPack.ParamByName('sDoctype').AsString := sDoctype;
  spModyfiSBISPack.ParamByName('sDocdate').AsString := sDocdate;
  spModyfiSBISPack.ParamByName('nDocsum').AsFloat := nDocsum;
  spModyfiSBISPack.ParamByName('sStatus').AsInteger := 1;
  spModyfiSBISPack.ParamByName('nIdPack').Value := IdPack;
  spModyfiSBISPack.ParamByName('in_table_jn').Value := pTablePref;
  spModyfiSBISPack.ExecProc;
  oldIDSO := spModyfiSBISPack.ParamByName('pOld_IDSO').asstring;
  Result := spModyfiSBISPack.ParamByName('nIdPack').Value;
end;

end.
