object fmRdySbisPackParams: TfmRdySbisPackParams
  Left = 732
  Top = 352
  BorderStyle = bsDialog
  Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 259
  ClientWidth = 223
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 218
    Width = 223
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object btOk: TBitBtn
      Left = 44
      Top = 8
      Width = 81
      Height = 25
      Caption = 'OK'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btOkClick
    end
    object btCancel: TBitBtn
      Left = 131
      Top = 8
      Width = 81
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      TabOrder = 1
    end
  end
  object rgrpOperEDO: TRadioGroup
    Left = 0
    Top = 144
    Width = 223
    Height = 74
    Align = alBottom
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088' '#1069#1044#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      #1057#1041#1048#1057
      #1044#1048#1040#1044#1054#1050)
    ParentFont = False
    TabOrder = 1
  end
  object gbTypeDoc: TGroupBox
    Left = 0
    Top = 0
    Width = 223
    Height = 144
    Align = alClient
    TabOrder = 0
    object cbAkt: TCheckBox
      Tag = 1
      Left = 8
      Top = 55
      Width = 177
      Height = 17
      Caption = #1040#1082#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = cbAktClick
    end
    object cbNakl: TCheckBox
      Tag = 1
      Left = 8
      Top = 32
      Width = 185
      Height = 17
      Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' ('#1058#1054#1056#1043'-12)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object cbSF: TCheckBox
      Tag = 1
      Left = 8
      Top = 9
      Width = 177
      Height = 17
      Caption = #1057#1095#1077#1090'-'#1092#1072#1082#1090#1091#1088#1072'/'#1059#1055#1044
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbShowCount: TCheckBox
      Tag = 1
      Left = 35
      Top = 78
      Width = 177
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1082#1086#1083'-'#1074#1086
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object cbNewPack: TCheckBox
      Left = 8
      Top = 123
      Width = 185
      Height = 17
      Caption = #1053#1086#1074#1099#1081' '#1087#1072#1082#1077#1090
      TabOrder = 4
      OnClick = cbNewPackClick
    end
  end
end
