unit uEdoView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UtilUnit, DBGridEhGrouping, GridsEh, DBGridEh, ActnList, ComCtrls,
  ToolWin, DB, MemDS, DBAccess, Ora;

type
  TfmEdoView = class(TForm)
    ToolBar: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton9: TToolButton;
    ToolButton14: TToolButton;
    ToolButton11: TToolButton;
    ActionList: TActionList;
    dbgDocs: TDBGridEh;
    qDocs: TOraQuery;
    dsDocs: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEdoView: TfmEdoView;

implementation

{$R *.dfm}

procedure TfmEdoView.FormCreate(Sender: TObject);
begin
  SetDatabase(DBName,Self);
end;

end.
