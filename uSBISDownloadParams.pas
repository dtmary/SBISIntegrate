unit uSBISDownloadParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, PropFilerEh, PropStorageEh, Mask,
  DBCtrlsEh;

type
  tArcAction = (aaNone,aaOnlyEmpty,aaAll);
  tVlojAction = (vaNone,vaOnlyNew,vaAll);

  rSBISDowloadParams = record
    dIn,dOut,dDel:boolean;
    begDate,endDate:string;
    arcAction:tArcAction;
    VlojAction:tVlojAction;
  end;

  TfmSBISDownloadParams = class(TForm)
    pnModal: TPanel;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    cbIn: TCheckBox;
    cbOut: TCheckBox;
    cbDel: TCheckBox;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    deBegDate: TDBDateTimeEditEh;
    deEndDate: TDBDateTimeEditEh;
    rgArcAction: TRadioGroup;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function getSbisDownloadParams(var Params:rSBISDowloadParams):boolean;

var
  fmSBISDownloadParams: TfmSBISDownloadParams;

implementation

{$R *.dfm}

function getSbisDownloadParams(var Params:rSBISDowloadParams):boolean;
begin
  result := false;
  Application.CreateForm(TfmSBISDownloadParams,fmSBISDownloadParams);
  fmSBISDownloadParams.deBegDate.Value := Params.begDate;
  fmSBISDownloadParams.deEndDate.Value := params.endDate;
  fmSBISDownloadParams.cbIn.Checked := Params.dIn;
  fmSBISDownloadParams.cbOut.Checked := params.dOut;
  fmSBISDownloadParams.cbDel.Checked := params.dDel;
  fmSBISDownloadParams.rgArcAction.ItemIndex := Ord(params.arcAction);
  if fmSBISDownloadParams.ShowModal = mrOk then
  begin
    Params.dIn  := fmSBISDownloadParams.cbIn.Checked;
    Params.dOut := fmSBISDownloadParams.cbOut.Checked;
    Params.dDel := fmSBISDownloadParams.cbDel.Checked;
    Params.begDate := fmSBISDownloadParams.deBegDate.Value;
    Params.endDate := fmSBISDownloadParams.deEndDate.Value;
    case fmSBISDownloadParams.rgArcAction.ItemIndex of
      0: Params.arcAction := aaNone;
      1: Params.arcAction := aaOnlyEmpty;
      2: Params.arcAction := aaAll;
    end;
    result := true;
  end;
//  fmSBISDownloadParams.Free;
end;

procedure TfmSBISDownloadParams.BitBtn2Click(Sender: TObject);
begin
  modalResult := mrCancel;
end;

procedure TfmSBISDownloadParams.BitBtn3Click(Sender: TObject);
begin
  modalResult := mrOk;
end;

procedure TfmSBISDownloadParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
