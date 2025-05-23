unit uRdySbisPackParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  recRdySbisPackParams = record
    needSF: boolean;
    needNakl: boolean;
    needAkt: boolean;
    showCount: boolean;
    IDOperEDO: integer;
    IsNewPackage: boolean;
  end;

  TfmRdySbisPackParams = class(TForm)
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    rgrpOperEDO: TRadioGroup;
    cbSF: TCheckBox;
    cbNakl: TCheckBox;
    cbAkt: TCheckBox;
    cbShowCount: TCheckBox;
    gbTypeDoc: TGroupBox;
    cbNewPack: TCheckBox;
    procedure btOkClick(Sender: TObject);
    procedure cbAktClick(Sender: TObject);
    procedure cbNewPackClick(Sender: TObject);
  private
    { Private declarations }
    vShowTypeDoc: boolean;
  public
    { Public declarations }
  end;


  function getRdySbisPackParams(var params:recRdySbisPackParams; ShowTypeDoc: boolean = true; ShowNewDoc: boolean = true): boolean;

var
  fmRdySbisPackParams: TfmRdySbisPackParams;
  TMP_params: recRdySbisPackParams;
implementation

{$R *.dfm}

function getRdySbisPackParams(var params:recRdySbisPackParams; ShowTypeDoc: boolean = true; ShowNewDoc: boolean = true): boolean;
var
  i: integer;
begin
  result := false;
  Application.CreateForm(TfmRdySbisPackParams, fmRdySbisPackParams);

  TMP_params := params;

  for I := 0 to fmRdySbisPackParams.gbTypeDoc.ControlCount - 1 do
    if fmRdySbisPackParams.gbTypeDoc.Controls[i].Tag = 1 then
      fmRdySbisPackParams.gbTypeDoc.Controls[i].Enabled := ShowTypeDoc;
  fmRdySbisPackParams.vShowTypeDoc := ShowTypeDoc;

  if ShowTypeDoc then
    begin
      fmRdySbisPackParams.cbSF.Checked := params.needSF;
      fmRdySbisPackParams.cbSF.Enabled := not params.needSF;

      fmRdySbisPackParams.cbNakl.Checked := params.needNakl;
      fmRdySbisPackParams.cbNakl.Enabled := not params.needNakl;

      fmRdySbisPackParams.cbAkt.Checked := params.needAkt;
      fmRdySbisPackParams.cbAkt.Enabled := not params.needAkt;
      if fmRdySbisPackParams.cbAkt.Checked and fmRdySbisPackParams.cbAkt.Enabled then
        fmRdySbisPackParams.cbShowCount.Enabled := fmRdySbisPackParams.cbAkt.Checked
      else
        fmRdySbisPackParams.cbShowCount.Enabled := false;
    end
  else
    with TMP_params do
      begin
        needSF := false;
        needNakl := false;
        needAkt := false;
        showCount := false;
        {IDOperEDO := 0;
        IsNewPackage := false;}
      end;
  fmRdySbisPackParams.rgrpOperEDO.ItemIndex := params.IDOperEDO;
  fmRdySbisPackParams.cbNewPack.Checked := params.IsNewPackage;
  fmRdySbisPackParams.cbNewPack.Enabled := ShowNewDoc;

  if (fmRdySbisPackParams.ShowModal=mrOk) then
  begin
    params.needSF := fmRdySbisPackParams.cbSF.Checked;
    params.needNakl := fmRdySbisPackParams.cbNakl.Checked;
    params.needAkt := fmRdySbisPackParams.cbAkt.Checked;
    params.showCount := fmRdySbisPackParams.cbShowCount.Checked;
    case fmRdySbisPackParams.rgrpOperEDO.ItemIndex of
      0: params.IDOperEDO := 0;
      1: params.IDOperEDO := 1;
    end;
    params.IsNewPackage := fmRdySbisPackParams.cbNewPack.Checked;
    result := true;
  end;
  fmRdySbisPackParams.Free;
end;

procedure TfmRdySbisPackParams.btOkClick(Sender: TObject);
begin
  if cbSF.Checked or cbNakl.Checked or cbAkt.Checked or not vShowTypeDoc then
    modalResult := mrOk
  else
    Application.MessageBox(PChar('Необходимо выбрать документы'), 'Информация', mb_Ok + mb_IconWarning);
end;

procedure TfmRdySbisPackParams.cbAktClick(Sender: TObject);
begin
  cbShowCount.Enabled := cbAkt.Checked;
end;

procedure TfmRdySbisPackParams.cbNewPackClick(Sender: TObject);
begin
  if TMP_params.needSF then
    fmRdySbisPackParams.cbSF.Enabled := cbNewPack.Checked;
  if TMP_params.needNakl then
    fmRdySbisPackParams.cbNakl.Enabled := cbNewPack.Checked;
  if TMP_params.needAkt then
    fmRdySbisPackParams.cbAkt.Enabled := cbNewPack.Checked;
  if not cbNewPack.Checked then
    begin
      fmRdySbisPackParams.cbSF.Checked := TMP_params.needSF;
      fmRdySbisPackParams.cbNakl.Checked := TMP_params.needNakl;
      fmRdySbisPackParams.cbAkt.Checked := TMP_params.needAkt;
    end;
  if fmRdySbisPackParams.cbAkt.Checked then
    fmRdySbisPackParams.cbShowCount.Enabled := fmRdySbisPackParams.cbAkt.Enabled;
end;

end.
