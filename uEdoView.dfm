object fmEdoView: TfmEdoView
  Left = 491
  Top = 248
  Caption = #1046#1091#1088#1085#1072#1083' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1069#1044#1054
  ClientHeight = 536
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 828
    Height = 22
    AutoSize = True
    Caption = 'ToolBar'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Images = DM1.ImageList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Transparent = False
    ExplicitLeft = -172
    ExplicitWidth = 1000
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 31
      Top = 0
    end
    object ToolButton14: TToolButton
      Left = 54
      Top = 0
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 28
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 62
      Top = 0
    end
  end
  object dbgDocs: TDBGridEh
    Left = 0
    Top = 22
    Width = 828
    Height = 514
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = dsDocs
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ActionList: TActionList
    Left = 496
    Top = 120
  end
  object qDocs: TOraQuery
    SQL.Strings = (
      'select * from skladuser.sbisobj t '
      '   where t.isdel = :isdel'
      '     and t.dateotpr >= :dates'
      '     and t.dateotpr <= :daten')
    Left = 256
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'isdel'
      end
      item
        DataType = ftUnknown
        Name = 'dates'
      end
      item
        DataType = ftUnknown
        Name = 'daten'
      end>
  end
  object dsDocs: TDataSource
    DataSet = qDocs
    Left = 272
    Top = 160
  end
end
