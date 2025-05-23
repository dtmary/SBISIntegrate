unit uSbisArcParser;

interface

uses classes,FWZipReader,SysUtils;

type
  TSbisArcParser = class
    constructor create(Path:string);
    destructor destroy;
  private
    list:Tlist;
    listNames:TStringlist;
    arcSettingPath:string;
    Index:integer;
    _eof:boolean;
    _FilesCount:integer;
  public
    onlyroot:boolean;
    procedure parse(Path:string);
    procedure next;
    property eof:boolean read _eof;
    function GetFile:TMemoryStream;
    function GetFileName:string;
    property FilesCount:integer read _FilesCount;
  end;

implementation

 constructor TSbisArcParser.create(Path: string);
 begin
   arcSettingPath:=Path;
   list:=Tlist.Create;
   listNames:=TStringList.Create;
   onlyroot:=false;
 end;

 destructor TSBisArcParser.destroy;
 var
   i:integer;
 begin
   for I := 0 to List.Count - 1 do
     TStream(List[i]).Free;
   List.Free;
   listNames.Free;
 end;

 procedure TSbisArcParser.next;
 begin
   if index = list.Count then
     _eof := true
   else
     index := index + 1;
 end;

 function TSbisArcParser.GetFile:TMemoryStream;
 begin
   result := List[index-1];
   //TMemorySList[index-1]
 end;

 function TSbisArcParser.GetFileName:string;
 begin
   result := listNames[index-1];
 end;

 procedure TSbisArcParser.parse(Path: string);
 var
   fullPath:string;
   i:integer;
   Zip: TFWZipReader;
   ArcIndex:integer;
   S:TMemoryStream;
   j:integer;
   z:integer;
   arcFileName:string;
   extfilename:string;
   poss:integer;
 begin
   for I := 0 to List.Count - 1 do
     TStream(List[i]).Free;
   List.Clear;
   listNames.Clear;
   index := 1;
   _eof := false;
   fullPath := arcSettingPath + Path;
    Zip := TFWZipReader.Create;
     try
       Zip.LoadFromFile(fullPath);
       for j:= 0 to Zip.Count-1 do
       begin
         arcFileName:= zip.Item[j].FileName;
         arcFileName  := StringReplace(arcFileName, '/', '\',[rfReplaceAll, rfIgnoreCase]);
         poss := pos('\',arcFileName);
         if (not(onlyroot) or (poss=0)) then
        // if (ExtractFileExt(arcFileName) = '.pdf') then
         begin
           S := TMemoryStream.Create;
           Zip[j].ExtractToStream(S, '');
           list.Add(S);
           extfilename := ExtractFileName(arcFileName);
           listNames.Add(extfilename);
         end;
       end;
     finally
       Zip.Free;
     end;
     _FilesCount := list.Count;
 end;
end.
