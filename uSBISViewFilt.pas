unit uSBISViewFilt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, Buttons, PropFilerEh, PropStorageEh, utilUnit,
  untComboEdit, CaCtrls;

type

  recSBISViewParams = record
    dates:string;
    datef:string;
    notActual:integer;
    contrid:string;
  end;

  TfmSBISViewFilt = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtBegDate: TDBDateTimeEditEh;
    edtEndDate: TDBDateTimeEditEh;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    cbNotActual: TCheckBox;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    cbContr: TComboCA;
    Label3: TLabel;
    lbContrNaim: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function GetSBISViewFilt(var params:recSBISViewParams):boolean;

var
  fmSBISViewFilt: TfmSBISViewFilt;

implementation

{$R *.dfm}
function GetSBISViewFilt(var params:recSBISViewParams):boolean;
  begin
    try
      result := false;
      Application.CreateForm(tfmSBISViewFilt,fmSBISViewFilt);
      fmSBISViewFilt.edtBegDate.Text := params.dateS;
      fmSBISViewFilt.edtEndDate.Text := params.dateF;
      fmSBISViewFilt.cbNotActual.Checked := boolean(params.notActual);
      fmSBISViewFilt.cbContr.Text := params.contrid;
      if fmSBISViewFilt.ShowModal = mrOk then
      begin
        params.dateS := fmSBISViewFilt.edtBegDate.Text;
        params.dateF := fmSBISViewFilt.edtEndDate.Text;
        params.notActual := integer(fmSBISViewFilt.cbNotActual.Checked);
        params.contrid := fmSBISViewFilt.cbContr.Text;
        result := true;
      end;
    finally
      fmSBISViewFilt.Free;
    end;
  end;

procedure TfmSBISViewFilt.FormCreate(Sender: TObject);
begin
  SetDatabase(DBName,self);
end;

end.
