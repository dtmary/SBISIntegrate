object fmSBISViewFilt: TfmSBISViewFilt
  Left = 764
  Top = 423
  BorderStyle = bsDialog
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 206
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 120
    Width = 69
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbContrNaim: TLabel
    Left = 16
    Top = 144
    Width = 3
    Height = 13
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 10
    Width = 325
    Height = 55
    TabOrder = 0
    object Label2: TLabel
      Left = 12
      Top = 22
      Width = 54
      Height = 13
      Caption = #1044#1072#1090#1072'    '#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 189
      Top = 22
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtBegDate: TDBDateTimeEditEh
      Left = 78
      Top = 19
      Width = 100
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object edtEndDate: TDBDateTimeEditEh
      Left = 212
      Top = 19
      Width = 100
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
  end
  object btOk: TBitBtn
    Left = 163
    Top = 173
    Width = 81
    Height = 25
    Caption = 'Ok'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
  end
  object btCancel: TBitBtn
    Left = 251
    Top = 173
    Width = 81
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
  end
  object cbNotActual: TCheckBox
    Left = 16
    Top = 80
    Width = 193
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object cbContr: TComboCA
    Left = 87
    Top = 117
    Width = 99
    Height = 21
    GlyphKind = gkEllipsis
    ButtonWidth = 18
    NumGlyphs = 1
    TabOrder = 4
    CompanyId = 0
    CursorColor = clHighlight
    CursorFontColor = clHighlightText
    ValueType = vtContragent
    OutContragent.FULLNAME = lbContrNaim
    ChangeUpdate = True
  end
  object PropStorageEh1: TPropStorageEh
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Left'
      '<P>.Top'
      '<P>.WindowState')
    Left = 23
    Top = 4
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'software\new_pm\PKI'
    Left = 71
    Top = 20
  end
end
