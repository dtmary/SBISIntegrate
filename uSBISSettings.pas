unit uSBISSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EmployUnit, Buttons, UtilUnit, uDMShared, PropFilerEh,
  PropStorageEh, Mask, DBCtrlsEh, ExtDlgs;

type
  TfmSBISSettings = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    edtPodp: TDBComboBoxEh;
    lbOutEmploy: TLabel;
    edtFilePath: TDBComboBoxEh;
    FileDialog: TFileOpenDialog;
    procedure edtPodpButtonClick(Sender: TObject; var Handled: Boolean);
    procedure btOkClick(Sender: TObject);
    procedure edtPodpChange(Sender: TObject);
    procedure edtFilePathButtonClick(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure GetSbisSettings;

var
  fmSBISSettings: TfmSBISSettings;

implementation

{$R *.dfm}

procedure GetSbisSettings;
var
  value:string;
  e:TEmploy;
begin
  Application.CreateForm(TfmSBISSettings,fmSBISSettings);

  readSetting(Company_id,'EDO','TABNPod',value);
  FindEmploy(DateToStr(date), value, e);
  fmSBISSettings.edtPodp.Text := e.Tab_n;
  fmSBISSettings.lbOutEmploy.Caption := e.FIO;
  readSetting(Company_id,'EDO','FilePath',value);
  fmSBISSettings.EdtFilePath.Text := value;
  if fmSBISSettings.ShowModal=mrOk then
  begin
    writesetting(Company_id,'EDO','TABNPod',fmSBISSettings.edtPodp.Text);
    writesetting(Company_id,'EDO','FilePath',fmSBISSettings.EdtFilePath.Text);
  end;
  fmSBISSettings.Destroy;
end;

procedure TfmSBISSettings.btOkClick(Sender: TObject);
begin
  if lbOutEmploy.Caption <> 'Не найден' then
    ModalResult := mrOk
  else
    Application.MessageBox(PChar('Подписант указан не верно!'), 'Ошибка', mb_Ok + mb_IconError);
end;

procedure TfmSBISSettings.edtFilePathButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  FileDialog.DefaultFolder := edtFilePath.Text;
  FileDialog.Title := 'Директория СБИС коннект';
  FileDialog.Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
  if FileDialog.Execute(self.Handle) then
    edtFilePath.Text := FileDialog.FileName;
end;

procedure TfmSBISSettings.edtPodpButtonClick(Sender: TObject;
  var Handled: Boolean);
var
  employ:TEmploy;
begin
  if GetMDIChildEmploy(2, date, employ,company_id) then
    edtPodp.Text := employ.Tab_n;
    lbOutEmploy.Caption := employ.FIO;
end;

procedure TfmSBISSettings.edtPodpChange(Sender: TObject);
var
  e:TEmploy;
begin
  if FindEmploy(DateToStr(date), edtPodp.Text, e) then
    lbOutEmploy.Caption := e.FIO
  else
    lbOutEmploy.Caption := 'Не найден';
end;

end.
