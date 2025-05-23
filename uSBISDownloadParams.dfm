object fmSBISDownloadParams: TfmSBISDownloadParams
  Left = 722
  Top = 367
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1075#1088#1091#1079#1082#1080
  ClientHeight = 200
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnModal: TPanel
    Left = 0
    Top = 150
    Width = 345
    Height = 50
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel1: TPanel
      Left = 62
      Top = 2
      Width = 281
      Height = 46
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn3: TBitBtn
        Left = 110
        Top = 8
        Width = 75
        Height = 25
        Caption = #1054#1050
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
        NumGlyphs = 2
        TabOrder = 0
        OnClick = BitBtn3Click
      end
      object BitBtn2: TBitBtn
        Left = 198
        Top = 8
        Width = 75
        Height = 25
        Caption = #1042#1099#1093#1086#1076
        TabOrder = 1
        OnClick = BitBtn2Click
      end
    end
  end
  object cbIn: TCheckBox
    Left = 16
    Top = 63
    Width = 97
    Height = 17
    Caption = #1042#1093#1086#1076#1103#1097#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object cbOut: TCheckBox
    Left = 16
    Top = 94
    Width = 97
    Height = 17
    Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object cbDel: TCheckBox
    Left = 16
    Top = 127
    Width = 97
    Height = 17
    Caption = #1059#1076#1072#1083#1105#1085#1085#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 329
    Height = 49
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label11: TLabel
      Left = 8
      Top = 21
      Width = 13
      Height = 13
      Caption = #1057':'
    end
    object Label12: TLabel
      Left = 158
      Top = 21
      Width = 19
      Height = 13
      Caption = #1087#1086':'
    end
    object deBegDate: TDBDateTimeEditEh
      Left = 22
      Top = 17
      Width = 121
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object deEndDate: TDBDateTimeEditEh
      Left = 199
      Top = 17
      Width = 121
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
  end
  object rgArcAction: TRadioGroup
    Left = 151
    Top = 63
    Width = 186
    Height = 81
    Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1072#1088#1093#1080#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      #1053#1077' '#1086#1073#1085#1086#1074#1083#1103#1090#1100
      #1058#1086#1083#1100#1082#1086' '#1077#1089#1083#1080' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
      #1042#1089#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076)
    ParentFont = False
    TabOrder = 5
  end
  object PropStorageEh1: TPropStorageEh
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Left'
      '<P>.Top'
      '<P>.WindowState')
    Left = 15
    Top = 155
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'software\new_pm\PKI'
    Left = 71
    Top = 155
  end
end
