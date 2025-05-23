unit uSbisWeb;

interface
uses utilUnit, uDMSbis, Classes, sysUtils,httpsend,ssl_openssl,dialogs,windows, messages, forms;

type

//JsonException = class(TException);
TelmJsonObj = class
private
  parent     :TelmJsonObj;
  level      :integer;
  id         :integer;
  numb       :integer;
  class var all :Tlist;
  stringlist :TStringlist;
  constructor create(instringlist:TStringlist;inParent:TelmJsonObj;inName:string); overload;
  constructor create(inParent:TelmJsonObj;inName:string;inValue:string); overload;
  function parse:integer;
public
  Name   :string;
  Value  :string;
  constructor create(instringlist:TStringlist); overload;
  function    GetChild(inName:string):TelmJsonObj;
end;

TSBISConnector = class
private
  dmSbis:tdmSbis;
  _idSession:string;
  function HTTPConnect(s:tStringList;var r:tStringList;service:string = 'https://online.sbis.ru/service/';addSesson:boolean = true):boolean;
  function sbiswrap(ins:string):string;
  procedure Authentificate;
  procedure ExitSession;
public
  proxyhost,proxyport,proxyuser,proxypassword:string;
  login,password:string;
  constructor create;
  function   GetOrCreateSession:string;
  procedure  CloseSession;
  function getUserInfo:string;
end;

var
  expJ:TelmJSONObj;

implementation

function TelmJsonObj.GetChild(inName:string):TelmJsonObj;
var
  curObj:TelmJsonObj;
  i:integer;
begin
  i:=0;
  repeat
    i:=i+1;
    curObj := all[i];
  until not((curObj.Name=inName) and (curObj.parent = Self));
  result := curObj;
end;

function TelmJsonObj.parse:integer;
var
  sl:TStringList;
  cursimb:string;
  curname:string;
  curl:string;
  posn:integer;
  JsonObj:TelmJsonObj;
begin
  posn := 1;
  while cursimb <> '}' do
  begin
    posn := posn + 1;
    cursimb := stringlist.Text[posn];
    if cursimb = '"' then
    begin
      curl := copy(stringlist.Text,posn+1,length(stringlist.Text)-posn-1);
      curl := copy(curl,0,pos('"',curl)-1);
      posn := posn + length(curl) + 1;
      if curname = '' then
        curname := curl
      else
      begin
        expJ := TelmJsonObj.create(self,curname,curl);
        curname := ''
      end;
    end;
    if cursimb = '{' then
    begin
      sl := TStringList.Create;
      sl.Text := copy(stringlist.Text,posn,length(stringlist.Text) - posn);
      JsonObj := TelmJsonObj.create(sl,Self,curname);
      posn := posn + JsonObj.parse;//  parse;
      curname := '';
    end;
  end;
  result := posn - 1;
end;

constructor TelmJsonObj.create(instringlist:TStringlist);       // для ROOTа
begin
  stringList := instringlist;
  all   := Tlist.Create;
  Name       := 'ROOT';
  all.Add(self);
  parse;
end;

constructor TelmJsonObj.create(inParent:TelmJsonObj;inName:string;inValue:string);      // для параметров
begin
  parent     := inParent;
  name       := inName;
  value      := inValue;
  all.Add(self);
end;

constructor TelmJsonObj.create(instringlist:TStringlist;inParent:TelmJsonObj;inName:string);    // для потомков
begin
  stringList := instringlist;
  parent     := inParent;
  name       := inName;
  all.Add(self);
end;

function TSBISConnector.HTTPConnect(s:tStringList;var r:tStringList;service:string = 'https://online.sbis.ru/service/';addSesson:boolean = true):boolean;
var
  httpsend:THTTPSend;
begin
  result := false;
  httpsend := THTTPSend.Create;
  httpsend.ProxyHost := proxyhost;
  httpsend.ProxyPort := proxyport;
  httpsend.ProxyUser := proxyuser;
  httpsend.ProxyPass := proxypassword;
  httpsend.UserAgent := 'PM-2';
  httpsend.Protocol  := '1.1';
  httpsend.MimeType  := 'application/json-rpc;charset="utf-8"';
  if addSesson then
    httpsend.Headers.SetText(PWideChar('X-SBISSessionID: '+_idSession));
    //httpsend.Headers.Append('X-SBISSessionID: '+_idSession);
  s.Text := UTF8EncodeToShortString(s.Text);
  s.SaveToStream(httpsend.Document);
  if httpsend.HTTPMethod('POST',service) then result := true;
  r.LoadFromStream(httpsend.Document);
  httpsend.Free;
end;

constructor TSBISConnector.create;
begin
  dmSbis := tdmSbis.GetInstance;
end;

function TSbisConnector.sbiswrap(ins:string):string;
begin
  result := '{"jsonrpc": "2.0","method":' +ins +',"id": 0}';
end;

procedure TSBISConnector.Authentificate;
var
  request:TStringList;
  response:Tstringlist;
  //JsonExtObj:TjsonExtObj;
begin
  request := TStringList.Create;
  response:=TStringlist.Create;
  request.Append(sbiswrap('"СБИС.Аутентифицировать","params": {"Логин": "'+login+'","Пароль": "'+password+'"}'));
  HTTPConnect(request,response,'https://online.sbis.ru/auth/service/',false);
  response.Text := response.Text;
  //JsonExtObj := TjsonExtObj.createfromList(response);
  //if JsonExtObj.GetByKey('ERROR') <> ''then raise Exception.Create('Ошибка сервера.');
  //_idSession := JsonExtObj.GetByKey('RESULT');
  request.Free;
  response.Free;
end;

function TSBISConnector.getUserInfo:string;
var
  request:TStringList;
  response:Tstringlist;
  //JsonExtObj:TjsonExtObj;
  er:string;
begin

  request := TStringList.Create;
  response:=TStringlist.Create;
  request.Append(sbiswrap('"СБИС.ИнформацияОТекущемПользователе","params": {"Параметр": {}}'));
  HTTPConnect(request,response);
  response.SaveToFile('D:\response.txt');
  //JsonExtObj := TjsonExtObj.createfromList(response);
  //er := JsonExtObj.GetByKey('ERROR');
  if er <> '' then
  begin
    if er = 'Not authorized.' then
      result := ''
    else
      raise Exception.Create('Error service');
  end
  else
    //result := JsonExtObj.GetByKey('ФАМИЛИЯ');
    //result := JsonExtObj.GetByKey('RESULT');
end;

procedure TSBISConnector.ExitSession;
var
  request:TStringList;
  response:Tstringlist;
  //JsonExtObj:TjsonExtObj;
begin
  request := TStringList.Create;
  response:=TStringlist.Create;
  request.Append(sbiswrap('"СБИС.Выход","params": {}'));
  HTTPConnect(request,response,'https://online.sbis.ru/auth/service/');
  response.Text := response.Text;
  //JsonExtObj := TjsonExtObj.createfromList(response);
  //if JsonExtObj.GetByKey('ERROR') <> ''then raise Exception.Create('Ошибка сервера.');
  //_idSession := JsonExtObj.GetByKey('RESULT');
  request.Free;
  response.Free;
end;

function TSBISConnector.GetOrCreateSession:string;
begin
  try
    _idSession := dmSbis.GetSession(login);
    if _idSession = '' then
    begin
      dbName.AutoCommit := false;
      dbName.StartTransaction;
      Authentificate;
      dmSbis.CreateSession(_idSession,login);
    end
    else
    begin
      if getUserInfo = '' then        // Если не актуальна
      begin
        dmsbis.DeleteSession(_idSession);
        Authentificate;
        dmSbis.CreateSession(_idSession,login);
      end;
    end;
    dbName.Commit;
  except
  on E:Exception do
  begin
    dbName.Rollback;
    Application.MessageBox(PChar(E.Message), 'Ошибка', mb_Ok + mb_IconError);
  end;
  end;
  dbName.AutoCommit := true;
  result := _idSession;
end;

procedure  TSBISConnector.CloseSession;
begin
  try
    dbName.AutoCommit := false;
    dbName.StartTransaction;
    dmsbis.DeleteSession(_idSession);
    ExitSession;
    dbName.Commit;
    _idSession := '';
  except
  on E:Exception do
    begin
      dbName.Rollback;
      Application.MessageBox(PChar(E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
  end;
end;

end.
