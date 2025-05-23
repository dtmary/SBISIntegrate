object fmSbisViewDocs: TfmSbisViewDocs
  Left = 297
  Top = 160
  Caption = #1044#1086#1082#1091#1084#1077#1090#1099' '#1057#1041#1048#1057
  ClientHeight = 696
  ClientWidth = 1296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 1296
    Height = 22
    AutoSize = True
    Caption = 'ToolBar'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Images = ImageList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ExplicitWidth = 1292
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Action = ActRefresh
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 0
      Action = actFilter
    end
    object ToolButton6: TToolButton
      Left = 46
      Top = 0
      Action = actNotFilter
    end
    object ToolButton8: TToolButton
      Left = 69
      Top = 0
      Action = actRefreshDocs
    end
    object ToolButton7: TToolButton
      Left = 92
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 28
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 28
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 108
      Top = 0
      Action = ActPreview
    end
    object ToolButton2: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 114
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 139
      Top = 0
      Hint = #1040#1088#1093#1080#1074#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      Action = ActArch
    end
    object ToolButton3: TToolButton
      Left = 162
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 114
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 170
      Top = 0
      Action = ActExit
    end
    object ToolButton12: TToolButton
      Left = 193
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 28
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 201
      Top = 0
      Action = ActLoadStatus
    end
    object ToolButton14: TToolButton
      Left = 224
      Top = 0
      Action = ActLoadArcDoc
    end
    object ToolButton15: TToolButton
      Left = 247
      Top = 0
      Action = ActLoadVloj
    end
  end
  object pnModal: TPanel
    Left = 0
    Top = 627
    Width = 1296
    Height = 50
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitTop = 626
    ExplicitWidth = 1292
    object Panel1: TPanel
      Left = 1013
      Top = 2
      Width = 281
      Height = 46
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 1009
      object BitBtn3: TBitBtn
        Left = 117
        Top = 17
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
        Top = 17
        Width = 75
        Height = 25
        Action = ActExit
        Caption = #1042#1099#1093#1086#1076
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 677
    Width = 1296
    Height = 19
    Panels = <
      item
        Alignment = taRightJustify
        Text = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081':'
        Width = 125
      end
      item
        Width = 50
      end
      item
        Width = 300
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 676
    ExplicitWidth = 1292
  end
  object Panel2: TPanel
    Left = 0
    Top = 22
    Width = 1296
    Height = 605
    Align = alClient
    TabOrder = 3
    ExplicitWidth = 1292
    ExplicitHeight = 604
    object Splitter1: TSplitter
      Left = 1089
      Top = 1
      Width = 5
      Height = 603
      ExplicitLeft = 790
      ExplicitHeight = 675
    end
    object dbgObj: TDBGridEh
      Left = 1094
      Top = 1
      Width = 201
      Height = 603
      Align = alClient
      DataSource = dsSBISObj
      DynProps = <>
      MinAutoFitWidth = 200
      ReadOnly = True
      TabOrder = 0
      TitleParams.Font.Charset = DEFAULT_CHARSET
      TitleParams.Font.Color = clWindowText
      TitleParams.Font.Height = -11
      TitleParams.Font.Name = 'Tahoma'
      TitleParams.Font.Style = [fsBold]
      TitleParams.ParentFont = False
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'TYPDOC'
          Footers = <>
          MinWidth = 50
          Title.Alignment = taCenter
          Title.Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 100
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DOC_NUM'
          Footers = <>
          MinWidth = 50
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 127
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAZV'
          Footers = <>
          MinWidth = 50
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 500
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pgDocs: TPageControl
      Left = 1
      Top = 1
      Width = 1088
      Height = 603
      ActivePage = tsPol
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      OwnerDraw = True
      ParentFont = False
      TabOrder = 1
      TabWidth = 300
      OnChange = pgDocsChange
      OnDrawTab = pgDocsDrawTab
      ExplicitHeight = 602
      object tsPol: TTabSheet
        Caption = #1055#1086#1083#1091#1095#1077#1085#1085#1099#1077
        OnShow = tsPolShow
        object Splitter2: TSplitter
          Left = 0
          Top = 434
          Width = 1080
          Height = 4
          Cursor = crVSplit
          Align = alBottom
          Visible = False
          ExplicitTop = 484
          ExplicitWidth = 1300
        end
        object dbgDoc: TDBGridEh
          Left = 0
          Top = 35
          Width = 1080
          Height = 399
          Align = alClient
          DataSource = dsDocs
          DynProps = <>
          EditActions = [geaCopyEh]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghFrozen3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentFont = False
          PopupMenu = pmPol
          ReadOnly = True
          TabOrder = 0
          TitleParams.Font.Charset = DEFAULT_CHARSET
          TitleParams.Font.Color = clWindowText
          TitleParams.Font.Height = -11
          TitleParams.Font.Name = 'MS Sans Serif'
          TitleParams.Font.Style = [fsBold]
          TitleParams.MultiTitle = True
          TitleParams.ParentFont = False
          TitleParams.RowLines = 2
          OnDblClick = dbgDocDblClick
          OnDrawColumnCell = dbgDocDrawColumnCell
          OnGetCellParams = dbgDocGetCellParams
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DOCNUM'
              Footers = <>
              Title.Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'|'#1053#1086#1084#1077#1088
              Width = 122
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DOCDATE'
              Footers = <>
              Title.Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'|'#1044#1072#1090#1072
              Width = 77
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DisplayFormat = '#,##0.00'
              DynProps = <>
              EditButtons = <>
              FieldName = 'DOCSUM'
              Footers = <>
              Title.Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'|'#1057#1091#1084#1084#1072
              Width = 83
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'MoveDate'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
              Width = 77
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'IdContr'
              Footers = <>
              Title.Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
              Width = 96
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAMECONTR'
              Footers = <>
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 407
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAMESTAT'
              Footers = <>
              Title.Caption = #1057#1090#1072#1090#1091#1089
              Width = 83
            end
            item
              Alignment = taCenter
              CellButtons = <>
              Checkboxes = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'ARC'
              Footers = <>
              Title.Caption = #1040#1088#1093#1080#1074
              Width = 45
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAMEEDO'
              Footers = <>
              MinWidth = 50
              Title.Caption = #1054#1087#1077#1088#1072#1090#1086#1088' '#1069#1044#1054
              Width = 60
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'OPNAME'
              Footers = <>
              MinWidth = 50
              Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
              Width = 200
            end
            item
              CellButtons = <>
              DisplayFormat = '0.00'
              DynProps = <>
              EditButtons = <>
              Footers = <>
              Title.Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088'|'#1089#1091#1084#1084#1072'.'#1076#1086#1082'.'
              Visible = False
              Width = 78
            end
            item
              CellButtons = <>
              DisplayFormat = '0.00'
              DynProps = <>
              EditButtons = <>
              Footers = <>
              Title.Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088'|'#1089#1091#1084#1084#1072'.'#1085#1072#1083'.'
              Visible = False
              Width = 83
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object dbgSklPrData: TDBGridEh
          Left = 0
          Top = 438
          Width = 1080
          Height = 137
          Align = alBottom
          DataSource = dsSklPrData
          DynProps = <>
          ReadOnly = True
          TabOrder = 1
          TitleParams.Font.Charset = DEFAULT_CHARSET
          TitleParams.Font.Color = clWindowText
          TitleParams.Font.Height = -11
          TitleParams.Font.Name = 'Tahoma'
          TitleParams.Font.Style = [fsBold]
          TitleParams.MultiTitle = True
          TitleParams.ParentFont = False
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DOCNUM'
              Footers = <>
              MaxWidth = 150
              MinWidth = 30
              Title.Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1093#1086#1076#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1072
              Width = 150
            end
            item
              Alignment = taRightJustify
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SKLAD'
              Footers = <>
              MaxWidth = 150
              MinWidth = 30
              Title.Caption = #1057#1082#1083#1072#1076
              Width = 75
            end
            item
              Alignment = taCenter
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DOCDATE'
              Footers = <>
              MaxWidth = 150
              MinWidth = 50
              Title.Caption = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1085#1086#1075#1086' '#1086#1088#1076#1077#1088#1072
              Width = 150
            end
            item
              Alignment = taRightJustify
              CellButtons = <>
              DisplayFormat = '#,##0.00'
              DynProps = <>
              EditButtons = <>
              FieldName = 'SUMMADOC'
              Footers = <>
              MaxWidth = 300
              MinWidth = 50
              Title.Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
              Width = 92
            end
            item
              Alignment = taRightJustify
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'OTKL'
              Footers = <>
              MaxWidth = 300
              MinWidth = 50
              Title.Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077
              Visible = False
              Width = 100
            end
            item
              Alignment = taRightJustify
              CellButtons = <>
              DisplayFormat = '#,##0.00'
              DynProps = <>
              EditButtons = <>
              FieldName = 'SUMMANAL'
              Footers = <>
              MaxWidth = 300
              MinWidth = 50
              Title.Caption = #1057#1091#1084#1084#1072' '#1085#1072#1083#1086#1075#1072
              Width = 105
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object SubPanel: TPanel
          Left = 0
          Top = 0
          Width = 1080
          Height = 35
          Align = alTop
          TabOrder = 2
          object cbFltrSklPr: TComboBox
            Left = 17
            Top = 6
            Width = 145
            Height = 21
            ItemIndex = 1
            TabOrder = 0
            Text = #1053#1077#1086#1087#1088#1080#1093#1086#1076#1086#1074#1072#1085#1099#1077
            OnChange = cbFltrSklPrChange
            OnCloseUp = cbFltrSklPrCloseUp
            OnKeyPress = cbFltrSklPrKeyPress
            OnKeyUp = cbFltrSklPrKeyUp
            Items.Strings = (
              #1054#1087#1088#1080#1093#1086#1076#1086#1074#1072#1085#1085#1099#1077
              #1053#1077#1086#1087#1088#1080#1093#1086#1076#1086#1074#1072#1085#1099#1077
              #1042#1089#1077)
          end
        end
      end
      object tsOtl: TTabSheet
        Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077
        ImageIndex = 1
        OnShow = tsOtlShow
      end
    end
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 260
    Top = 182
    object actActivateSQL: TAction
      Caption = 'actActivateSQL'
      OnExecute = actActivateSQLExecute
    end
    object ActArch: TAction
      Caption = 'ActArch'
      Hint = #1040#1088#1093#1080#1074#1085#1099#1077' '#1076#1088#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 113
      OnExecute = ActArchExecute
    end
    object actFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      Hint = #1060#1080#1083#1100#1090#1088
      ImageIndex = 20
      ShortCut = 119
      OnExecute = actFilterExecute
    end
    object actNotFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      ImageIndex = 21
      ShortCut = 16503
      OnExecute = actNotFilterExecute
    end
    object ActExit: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076
      ImageIndex = 27
      OnExecute = ActExitExecute
    end
    object ActRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 64
      OnExecute = ActRefreshExecute
    end
    object actRefreshDocs: TAction
      Caption = #1047#1072#1082#1072#1095#1072#1090#1100
      Hint = #1047#1072#1082#1072#1095#1072#1090#1100
      ImageIndex = 117
      OnExecute = actRefreshDocsExecute
    end
    object ActPreview: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 33
      OnExecute = ActPreviewExecute
    end
    object ActDownloadHTMLS: TAction
      Caption = 'ActDownloadHTMLS'
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088
    end
    object ActDownloadZIP: TAction
      Caption = 'ActDownloadZIP'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' zip '#1092#1072#1081#1083
    end
    object ActLoadStatus: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      ImageIndex = 50
      OnExecute = ActLoadStatusExecute
    end
    object ActLoadArcDoc: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1072#1088#1093#1080#1074
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1072#1088#1093#1080#1074
      ImageIndex = 12
      OnExecute = ActLoadArcDocExecute
    end
    object ActLoadVloj: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1074#1083#1086#1078#1077#1085#1080#1103
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1074#1083#1086#1078#1077#1085#1080#1103
      ImageIndex = 51
      OnExecute = ActLoadVlojExecute
    end
    object ActSQLFilter: TAction
      Caption = 'ActSQLFilter'
      OnExecute = ActSQLFilterExecute
    end
    object ActRefreshSBISObj: TAction
      Caption = 'ActRefreshSBISObj'
      OnExecute = ActRefreshSBISObjExecute
    end
  end
  object qDocs: TOraQuery
    SQL.Strings = (
      'select t.*,'
      '       case'
      '         when t.ispol = 0 then t.contr_id'
      '         when t.ispol = 1 then t.contrsender'
      '       end as IdContr,'
      '       case'
      '         when t.ispol = 0 then t.polname'
      '         when t.ispol = 1 then t.sendername'
      '       end as NameContr,'
      '       case'
      
        '         when t.table_jn = '#39'PLPP'#39' then (select t2.opname from sk' +
        'laduser.plpp t1, skladuser.optype t2 where t1.docid = t.id_jn an' +
        'd t2.doctype = t1.typ and t2.tbl = t.table_jn)'
      
        '         when t.table_jn = '#39'RP_DOC'#39' then (select t2.opname from ' +
        'skladuser.rp_doc t1, skladuser.optype t2 where t1.opnum = t.id_j' +
        'n and t2.doctype = t1.optype and t2.tbl = t.table_jn)'
      
        '         when t.table_jn = '#39'PL_POR'#39' then (select t2.opname from ' +
        'skladuser.pl_por t1, skladuser.optype t2 where t1.docid = t.id_j' +
        'n and t2.doctype = t1.typ and t2.tbl = t.table_jn)'
      
        '         when t.table_jn = '#39'PO_BASE'#39' then (select distinct t3.op' +
        'name from skladuser.po_base t1, skladuser.skllog t2, skladuser.o' +
        'ptype t3 where t1.opnum = t.id_jn and t2.opnum = t1.opnum and t3' +
        '.optype = t2.opertype and t3.tbl = '#39'SKLLOG'#39')'
      
        '         when t.table_jn = '#39'CONTRAGENTS'#39' then '#39#1057#1042#1045#1056#1050#1040' '#1042#1047#1040#1048#1052#1054#1056#1040#1057#1063 +
        #1025#1058#1054#1042#39
      
        '           else (select distinct t3.opname from skladuser.po_bas' +
        'e t1, skladuser.skllog t2, skladuser.optype t3 where t1.opnum = ' +
        't.sklopnum and t2.opnum = t1.opnum and t3.optype = t2.opertype a' +
        'nd t3.tbl = '#39'SKLLOG'#39')'
      '       end as opname'
      'from (select t.*,stat.namestat, '
      '                 case when(t.ispol = 1)'
      '                   then contrsender'
      '                   else contrpol'
      '                 end as contr_id,'
      '                 contrpol.fullname as polname,'
      '                 contrsend.fullname as sendername,'
      
        '                 (select count(*) as arc from skladuser.arc_doc_' +
        'link al '
      '                  where al.log_name = '#39'SBISLOG'#39
      
        '                    and al.log_doc_id = t.id) as arc,           ' +
        '         '
      
        '                 trunc(nvl(t.date_last_ver, t.createdate)) as Mo' +
        'veDate,'
      
        '                 decode(t.contredo, '#39'14942'#39', '#39#1057#1041#1048#1057#39', decode(t.co' +
        'ntredo, '#39'15484'#39', '#39#1044#1048#1040#1044#1054#1050#39', '#39#1054#1087#1077#1088#1072#1090#1086#1088' '#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1105#1085#39')) as NameEDO,'
      
        '                 (select min(tsj.id_jn) from skladuser.SBIS_JOIN' +
        ' tsj where t.id = tsj.idpack) as id_jn,'
      
        '                 (select distinct tsj.table_jn from skladuser.SB' +
        'IS_JOIN tsj where t.id = tsj.idpack) as table_jn'
      '             from skladuser.sbispack t, '
      '                      skladuser.company_ca ca,'
      '                      skladuser.sbisstatus stat,'
      '                      skladuser.contragents_view contrpol,'
      '                      skladuser.contragents_view contrsend'
      '             where '
      '                    ((t.ispol = 0 '
      '                    and ca.contr_id = t.contrsender'
      '                    and :ispol = 0) or'
      '                    (t.ispol = 1 '
      '                    and ca.contr_id = t.contrpol'
      '                    and :ispol = 1))'
      '               and ca.company_id = :company_id'
      '               and t.curstatus = stat.id'
      '               and t.contrpol = contrpol.contr_id'
      '               and t.contrsender = contrsend.contr_id'
      '               and to_date(t.docdate) between :dates and :datef'
      '               and (t.actual = 1 or :notactual = 1)) t'
      'where  (t.contr_id = :inContrId or :inContrId is null)'
      '&macrofilter'
      'order by t.createdate desc,t.docdate desc')
    Left = 1036
    Top = 390
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ispol'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'company_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'dates'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'datef'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'notactual'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'inContrId'
        Value = nil
      end>
    MacroData = <
      item
        Name = 'macrofilter'
      end>
  end
  object dsDocs: TOraDataSource
    DataSet = qDocs
    OnDataChange = dsDocsDataChange
    Left = 996
    Top = 382
  end
  object qSBISObj: TOraQuery
    SQL.Strings = (
      'select t1.*, t2.typdoc from SBISOBJ t1, SBISTYPES t2'
      'where t1.idpack = :idpack'
      '      and t2.id = t1.typid')
    MasterSource = dsDocs
    MasterFields = 'ID'
    DetailFields = 'IDPACK'
    Left = 1248
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpack'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        Value = nil
      end>
  end
  object dsSBISObj: TOraDataSource
    DataSet = qSBISObj
    Left = 1200
    Top = 520
  end
  object ImageList: TImageList
    Left = 102
    Top = 181
    Bitmap = {
      494C010176007900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000E0010000010020000000000000E0
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFB
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008380
      E100000000000000000000000000F8F8F800ECF5ED00EFF5EF00EEF5EF00F0F6
      F100FBF9FA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000C9C7F3002821
      D700B1B1F3000000000000000000EAEAED009DCEA50043BB720044BC710049BD
      760062C48B00F5F4F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FDFDFD002622E200221B
      E000211BDF00F8F9FC000000000000000000FEFEFE0074CC950081D1A40084D1
      A50085D1A400E5F4EB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000000000009D9CF200221EEB00231C
      E9001F18E9006D6BE9000000000000000000000000009AD8AB0064C9950068CA
      970073CC9D0092D7B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000F4F4FA003131EC002626ED00211A
      EB004C47EA003A35E900E1E1F6000000000000000000D5ECD80068CA990060C8
      940065CA97006CCC990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000C6C6C600000000000000
      0000FFFFFF0000000000FFFFFF00000000008F8EF0004241ED002D2DED00221C
      EC003A35EC00322DEC00534EE2000000000000000000F4F9F4003FC1800045C3
      84004EC4890056C48C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007777F0003A3AED002928
      EC002020EB007B7AE8000000000000000000000000000000000037BC700040BF
      78003EC1800040C2830000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000008282F1004848EE003536
      ED003032EC007676E8000000000000000000000000000000000035BA690040BE
      72003FBF770034BF7A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00000000000000000000000000A5A5F2006F6EED006162
      EC004143EE006664E5000000000000000000F4F8F400BDE7CC003CBA680048BE
      70005BC2830057C38700BAE7CF00F4F9F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000C6C6C600FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000C6C6F6007978F0006E6E
      EF005A5AEF005956E6000000000000000000F7FBF80034B5590044BB6B0047BC
      6D0052C078004FC07E003DC07E00FAFCFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000E6E7F9007777F1006E6C
      F1006665F0005756EB00FAFAFD000000000000000000B4E1BE003EB75D0043BA
      610041BA650038B96700D3EEDE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFD009192F3009090
      F3008788F3008586F300EEEDF90000000000000000000000000051BD6E0045B6
      580043B9600065C5830000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3A4F1006F6F
      F0007F7FEF007E7FEF007675E700F4F4F5000000000000000000DEF1E6004AB6
      55003BB45000EFF8F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEF2009F9D
      F100B6B5F000A8A6F0009D9CF000DEDEEC0000000000000000000000000078CC
      8C008FD297000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8FC
      FB00FDFEFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000241CED00241CED000000000000000000000000000000000000000000241C
      ED00241CED00241CED00241CED000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFF000000000000FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000241CED00241CED00000000000000000000000000241CED00241C
      ED000000000000000000241CED00241CED000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF0000FFFF00FFFFFF0000000000FFFF000000000000FFFFFF00FFFF
      FF0000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000241CED00241CED000000000000000000241CED00241C
      ED000000000000000000241CED00241CED000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00C6C6C60084848400FFFF000084848400000000000000
      000084848400C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000241CED00241CED000000000000000000241CED00241C
      ED000000000000000000241CED00241CED000000000000000000000000000000
      00000000000000000000C0C0C000C0C0C000C0C0C00000000000C0C0C0000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000008484
      8400FFFFFF0000FFFF00FFFFFF000000000084840000FFFF0000FFFF0000FFFF
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000241CED00241CED0000000000241CED00241C
      ED000000000000000000241CED00241CED000000000000000000000000000000
      00008080800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000FFFF00008484000000000000848484000000
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000241CED00241CED000000000000000000241C
      ED00241CED00241CED00241CED00000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFFFF0000000000FFFFFF0000000000000000000000000000000000C6C6
      C600FFFFFF0000000000FFFF00008484000000000000FFFFFF00C6C6C600FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000241CED00241C
      ED00241CED00241CED000000000000000000241CED00241CED00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000008484
      840000000000FFFF00008484000000000000FFFFFF00FFFFFF00FFFFFF0000FF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      000000000000241CED00241CED0000000000241CED00241CED00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000FFFF0000FFFF
      0000FFFF00008484000000000000FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      000000000000241CED00241CED000000000000000000241CED00241CED000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000C6C6C60084848400000000000000
      000084848400FFFF000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF0000FF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      000000000000241CED00241CED00000000000000000000000000241CED00241C
      ED00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000C0C0C000FFFFFF00FFFFFF0080808000FFFF
      FF00C0C0C00000000000FFFFFF0000000000C6C6C60000000000000000000000
      000000000000FFFF000000000000FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000241CED00241CED000000
      000000000000241CED00241CED00000000000000000000000000241CED00241C
      ED00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000241CED00241C
      ED00241CED00241CED000000000000000000000000000000000000000000241C
      ED00241CED000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      800080808000FFFFFF00C0C0C000000000000000000000000000840000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00C6C6
      C600FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080808000C0C0C0000000000000000000000000000000000000000000C6C6
      C600FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000055809F305B86A65F00FFFF01000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005386A6285C8BABA0648FAEF55D8AAAFF6C9BBCFF74A2C2FF6C9ABAB572A1
      BC26000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006594BC266393B69377A2
      C1F47CA6C4FF608FB0FF5988A9FF5D8AAAFF6D9CBDFF81ADCCFF7CAACAFF79A7
      C8FF73A2C2EE6A97B86C80AAD506000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      000080000000800000008000000080000000000000006595B7FF76A6C5FF6597
      BBFF6496B9FF6395B8FF6394B6FF6694B5FF72A0C1FF8AB2CFFF80ACCBFF7BA9
      C9FF79A8C8FF79A7C8FF77A4C65A000000000000000000000000F4F4F400E6E6
      E600E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000000000006293B5FF70A3C4FF689B
      BFFF679ABEFF689BBFFF6C9DBFFF73A2C1FF79A8C9FF95BAD4FF88B1CFFF7EAB
      CBFF7AA8C9FF79A8C8FF78A6C959000000000000000000000000E9E9E9006383
      A3003E72A7003E72A7003E72A7003E72A7003E72A7003E72A7003E72A7006383
      A300E5E5E5000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0080000000000000006293B5FF70A3C3FF689B
      BFFF689BBEFF6B9DC0FF72A2C3FF7CAAC8FF7BABCCFFA2C2D9FF94B9D3FF86B0
      CEFF7EABCAFF7BA9C9FF78A9C959000000000000000000000000000000005288
      BC007EB1E3007CAFE1007CAFE1007CAFE1007CAFE1007CAFE1007EB1E3005288
      BC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0080000000000000000000000000808000808080000080
      8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000000000006293B5FF6B9EC1FF689B
      BEFF6A9CBFFF70A1C2FF79A8C7FF83AFCBFF78A8C9FFABC8DDFFA0C1D8FF91B8
      D2FF85AFCDFF7EABCBFF7BA9C959000000000000000000000000000000005A90
      C50089BCE90082B5E50082B5E50082B5E50082B5E50082B5E50089BCE9005A90
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF00000000000000000000000000FFFF
      FF0080000000800000008000000080000000000000006394B7FF689BBEFF699B
      BFFF6E9FC1FF75A4C4FF72A3C4FF74A8C8FF83B6D2FF81B1CFFF97BBD4FF9DBF
      D7FF8EB5D1FF85AFCDFF7BA9CB59000000000000000000000000000000006196
      CA0094C7F1008ABDEB004477AA008ABDEB004073A6008ABDEB0094C7F1006196
      CA000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0080000000000000000000000000808000808080000080
      8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF008000000000000000000000006597BBFF699BBFFF6B9D
      C0FF74A8C8FF74A7C5FF5E88A6FF50758FFF50758EFF59809BFF78A7C2FF84B6
      D2FF8BB4D0FF8DB5D1FF7EACCB5900000000000000000000000000000000669B
      CF009CCFF70092C5F1005588BB004477AA004D80B30092C5F1009CCFF700669B
      CF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008000000080000000000000000000000000000000689BBFFF6A9ABAFF5177
      95FF41607BFF45647EFF4B6D86FF4F738CFF527791FF537993FF50758EFF5074
      8DFF638DA8FF7AAAC8FF7BA9C959000000000000000000000000000000006B9F
      D300AADDFF00AADDFF006699CC006699CC005E91C400AADDFF00AADDFF006B9F
      D3000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFFFF008000
      0000800000008000000080000000000000000000000000808000808080000080
      8000808080000080800080000000800000008000000080000000800000008000
      00008000000000000000000000000000000000000000639CC624619EC9A169A0
      C6F8668EAAFF4E6E88FF486882FF4F738BFF527892FF547B96FF567F99FF5F94
      B1FF619DC5E85F9DC86B80AAD5060000000000000000000000000000000091B5
      DA0078ACE10080B3E600497CAF00497CAF004477AA0080B3E60078ACE10091B5
      DA000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      0000FFFFFF008000000000000000000000000000000080808000008080008080
      8000008080008080800000808000808080000080800080808000008080008080
      8000008080000000000000000000000000000000000000000000000000000000
      00005B9BC81C65A3CD986AA2C7F45B89A8FF5885A1FF69A5C7FF64A0C9A95B9B
      C81C00000000000000000000000000000000000000000000000000000000C0D7
      EE0072A9DE0089BCEF00376A9D00376A9D0036699C0089BCEF0072A9DE00C0D7
      EE000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008000
      0000800000000000000000000000000000000000000000808000808080000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000619EC215609FC84A00FFFF01000000000000
      000000000000000000000000000000000000000000000000000000000000E6F0
      F90076A9DD0076A9DD0033669900336699003366990076A9DD0076A9DD00E6F0
      F9000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000080808000808080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000008080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000080
      80000000000000FFFF00000000000000000000FFFF0000000000808080000080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DC
      C000C0DCC000C0DCC000C0DCC000FFFFFF000000000000000000000000008080
      8000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DC
      C000C0DCC000C0DCC000C0DCC000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000800000000000000000000000FFFFFF00FFFFFF008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF0000000000FFFFFF00FFFFFF008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000C0DCC0008080
      800040404000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000080808000C0DCC0008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0080000000800000008000
      00008000000080000000FFFFFF000000000080000000FFFFFF00000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0080000000000000000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000404040008080
      800040404000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF00000000000080800000000000C0C0
      C000C0C0C000000000000000000000000000FFFFFF0080000000800000008000
      00008000000080000000FFFFFF000000000080000000FFFFFF00000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0080000000000000000000000080808000404040008080
      800040404000FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00C0DCC000FFFFFF000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF00000000000080800000000000C0C0
      C000C0C0C000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000404040008080
      800040404000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00C0DCC000FFFFFF000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000000808000000000000000
      000000000000000000000000000000000000FFFFFF008000000080000000FFFF
      FF000000000000000000000000000000000080000000FFFFFF00000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0080000000000000000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00C0DCC000FFFFFF000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000000808000008080000080
      800000808000008080000080800000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00C0DCC000FFFFFF000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000000808000808080000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000080000000FFFFFF00000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0080000000000000000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF000000000080808000404040008080
      800040404000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0DCC000FFFFFF00000000000080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080000000000000000000000080808000404040008080
      8000404040004040400040404000404040004040400040404000404040004040
      40004040400040404000C0DCC000FFFFFF000000000080808000404040008080
      8000404040004040400040404000404040004040400040404000404040004040
      40004040400040404000C0DCC000FFFFFF00000000000080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000808000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000080808000404040008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000FFFFFF000000000080808000404040008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000FFFFFF00000000000080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      00000000000000000000000000000000000080000000FFFFFF00800000008000
      000080000000FFFFFF00800000008000000080000000FFFFFF00800000008000
      000080000000FFFFFF0080000000000000000000000080808000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000C0DCC000FFFFFF0000000000000000000000000080808000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000C0DCC000FFFFFF000000000000000000000000000080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF0000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080808000C0C0C000FFFFFF00C0C0C00080008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000C0C0C000FFFFFF00FFFFFF0080808000C0C0C000C0C0C000800080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00808080000000
      0000000000000000000000000000000000000000000080808000C0C0C000FFFF
      FF00FFFFFF0080808000808080000000000080808000C0C0C000C0C0C0008000
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C0C0C0000000
      0000000000000000000000000000000000008000800080808000FFFFFF008080
      8000808080000000000000000000800080000000000080808000C0C0C000C0C0
      C000800080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF00C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF008080
      8000000000000000000000000000000000008000800080808000808080000000
      000000000000800080008000800080008000800080000000000080808000C0C0
      C000C0C0C0008000800000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0080808000FFFF
      FF00FFFFFF00C0C0C000FFFFFF00000000000000000000000000000000000000
      000000FFFF008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00C0C0
      C000000000000000000000000000000000008000800000000000000000008000
      8000800080008000800080008000800080008000800080008000000000008080
      8000C0C0C000C0C0C00080008000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00808080000000000000000000000000008000800080808000800080008000
      8000800080008000800000FFFF00008080008000800080008000800080000000
      000080808000C0C0C00000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000808000000000000000
      00000000000000000000000000000000000000000000FFFFFF0080808000FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000800000008000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000000000000000000000000000000080008000808080008000
      8000800080008000800080008000C0C0C00000FFFF0000FFFF00800080008000
      8000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00008080000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF0080808000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000800000000000000000000000000000000000800080008080
      8000800080008000800000808000008080008000800000FFFF0000FFFF008000
      8000800080000000000000000000000000000000000000000000000000000000
      000000FFFF000080800000000000000000000000000000FFFF0000FFFF000080
      8000000000000000000000000000000000008000000080000000800000008000
      000080000000800000008000000080000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      800080808000800080008000800000FFFF0000FFFF0000FFFF00008080008000
      8000800080008000800000000000000000000000000000000000000000000000
      000000FFFF00008080000000000000000000000000000000000000FFFF000080
      8000000000000000000000000000000000008000000080000000800000008000
      000080000000800000008000000080000000FFFFFF0080808000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800080008080800080008000800080008000800080008000800080008000
      8000800080000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000808000000000000000000000FFFF0000FFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000800080808000800080008000800080008000800080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080008000808080008000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080000000800000008000000080000000808080008080
      80000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000000000000000000000000000000000000FFFFFF00FFFFFF008000
      0000800000008000000080000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF008000000080000000C0C0C000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000FFFFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000FF00000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF008000000080000000C0C0C000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000000000000000000000000000000000000000000080808000808080008080
      800080808000808080000000000000000000000000008080800000000000C0C0
      C000FF0000008080800000000000000000000000000080000000800000008000
      00008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008000
      00008000000080000000800000000000000000000000FFFFFF00FFFFFF008000
      000080000000800000008000000080000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF008080
      80000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000080808000000000008080800000000000C0C0C000FF00
      0000000000008080800000000000000000008080800080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF0080000000800000008000
      00008000000080000000800000008080800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      80000000000000000000000000000000000000000000FFFFFF00000000008080
      80008080800000000000000000000000000080808000C0C0C000FF0000008080
      8000000000008080800000000000000000008080800080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF0080000000800000008000
      0000800000008000000080000000808080000000000080000000800000008000
      000080000000800000008000000080000000800000008000000000000000C0C0
      C000FFFFFF00C0C0C000FFFFFF00000000000000000000000000FFFFFF008080
      8000808080008080800080808000808080008080800080808000FFFFFF008080
      80000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C0000000000080800000FFFF00008080000000000000FF000000808080008080
      8000000000008080800000000000000000008000000080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF0080000000800000008000
      000080000000800000008000000080000000000000008000000080000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008000000000000000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF008080
      80000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFF0000FFFF0000FFFF00008080000000000000FFFFFF008080
      8000000000008080800000000000000000008000000080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF0080000000800000008000
      0000800000008000000080000000800000000000000080000000800000008000
      000080000000800000008000000080000000800000008000000000000000C0C0
      C000FFFFFF00C0C0C000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      80000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFFFF008080
      8000000000008080800000000000000000008000000080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF0080000000800000008000
      00008000000080000000800000008000000000000000FFFFFF00FFFFFF008000
      000080000000800000008000000080000000FFFFFF00FFFFFF0000000000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFF0000FFFF0000FFFF00008080000000000000FFFFFF008080
      8000000000008080800000000000000000008000000080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF0080000000800000008000
      00008000000080000000800000008000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFF0000FFFFFF0000000000FFFFFF00FFFFFF008080
      8000000000008080800000000000000000008080800080000000800000008000
      00008000000080000000FFFFFF00FFFFFF00FFFFFF0080000000800000008000
      00008000000080000000800000008080800000000000FFFFFF00FFFFFF008000
      0000800000008000000080000000FFFFFF00FFFFFF00FFFFFF0000000000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00000000000000000000000000C0C0C000FFFFFF00FFFFFF008080
      8000000000008080800000000000000000008080800080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000800000008080800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF008080
      8000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF0080000000800000008000
      00008000000080000000800000000000000000000000FFFFFF00FFFFFF008000
      000080000000800000008000000080000000FFFFFF00FFFFFF0000000000FFFF
      FF008000000080000000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000FFFFFF00FFFFFF0080000000800000008000
      00008000000080000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080000000800000008000000080000000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF008080
      80000000000000000000000000000000000080808000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00808080000000
      00000000000000000000FFFFFF00000000000000000080808000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000808080000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008080
      80000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00008080800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF0000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      0000808000008080000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000C0C0C000000000000000000000000000000000000000
      00000000000000000000C0C0C000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      80008080800080808000808080008080800000000000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000C0C0C000FFFFFF00C0C0
      C000FFFFFF0000000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF000000000000000000FFFFFF0000000000FFFF
      FF0080808000C0C0C000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000080808000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000C0C0C0000000000000000000FFFFFF00000000000000
      00000000000000000000C0C0C000FFFFFF00C0C0C0000000800000008000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000FFFFFF008080
      8000000000000000000080808000C0C0C000FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000C0C0C00080808000FFFF000000000000FFFF0000FFFF0000FFFF
      0000000000000000000080808000000000000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000C0C0C000FFFFFF00C0C0
      C000FFFFFF0000000000FFFFFF00C0C0C000FFFFFF000000800000008000C0C0
      C000FFFFFF00C0C0C000FFFFFF000000000000000000FFFFFF00808080000000
      0000FFFFFF0000FFFF00000000000000000080808000C0C0C000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000C0C0C00080808000FFFF000000000000FFFF0000FFFF0000FFFF00000000
      0000C0C0C000C0C0C00000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000C0C0C0000000000000000000FFFFFF00808080000000
      80000000800000000000C0C0C000FFFFFF00C0C0C000FFFFFF00000080000000
      8000C0C0C000FFFFFF00C0C0C00000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF0000000000000000000000000000000000C0C0C000000080000000
      8000FFFFFF0000000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF000000
      800000008000C0C0C000FFFFFF00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF0000FFFF0000FFFF000000000000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00808080000000
      80000000800000000000C0C0C000FFFFFF000000800000008000000080000000
      800000008000FFFFFF00C0C0C0000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF0000FFFF0000FFFF000000000000C0C0C000000000008080
      8000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF0000000000000000000000000000000000C0C0C000000080000000
      8000FFFFFF0000000000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFF00000000
      0000FFFF0000FFFF0000FFFF000000000000C0C0C000C0C0C000C0C0C0000000
      0000808080000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000808080000000000000000000FFFFFF00808080000000
      8000000080000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      00000000000080000000000000000000000000000000FFFF000000000000FFFF
      0000FFFF0000FFFF0000000000000000000000000000C0C0C000C0C0C000C0C0
      C000000000008080800000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000C0C0C000FFFFFF00C0C0
      C000FFFFFF000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00C0C0C00000000000000000000000
      0000800000008000000080000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080000080800000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      00008000000080000000800000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFFFF00808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      00008080000080800000800000000000000000000000FFFFFF0080808000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFF0000808000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
      FF00C0C0C00000000000800000000000000000000000FFFFFF00808080000000
      0000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000080000000800000008000000080000000800000000000
      00000000000000000000000000000000000080800000FFFFFF00808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      00008080000080800000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFF0000808000000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFFFF00808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      00008080000080800000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000080000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFF000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808000008080
      00008080000080800000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008080800000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000008400000084000000840000008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000808000008080
      00008080000080800000800000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000008400000084000000840000008400
      000084000000840000008400000084000000840000008400000084000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000808000008080
      00008080000080800000800000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
      FF00FFFF0000FFFFFF00808000000000000000000000FFFFFF0080808000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000808000008080
      0000808000008080000080800000808000008080000080800000808000008080
      00008080000080800000808000000000000000000000FFFFFF00808080000000
      0000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000008000
      0000800000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF0000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000FF0000008400000084000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF000000000000000000000000
      00007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000FF0000008400000084000084848400000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840000000000FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000080800000808000008080000080
      800000808000000000000000000000000000000000000000FF000000FF000000
      FF00000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FF0000008400000084000084848400000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000FF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF000000000000FFFF00FFFFFF000080800000000000000000000080
      800000808000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FF0000008400000084000084848400000000000000
      00000000000000000000000000000000000084848400FFFFFF00848484008484
      840084848400FFFFFF0000000000FFFFFF000000FF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF000000000000000000000000000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF00FFFFFF000000
      00000080800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000084848400848484008484
      8400848484008484840000FF0000008400000084000084848400848484008484
      84008484840084848400848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000FF0000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000848484000000000084848400FFFFFF00848484008484
      840084848400FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000FF0000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00808080000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF007B7B7B007B7B
      7B00FFFFFF007B7B7B007B7B7B00FFFFFF007B7B7B00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF0000008400000084000000FF000000FF000000FF
      000000FF000000FF0000848484000000000084848400FFFFFF00848484008484
      840084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FF0000008400000084000084848400000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00848484000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000080808000FFFFFF0000FF
      FF00FFFFFF0000FFFF00000000000000000000000000FFFFFF007B7B7B007B7B
      7B00FFFFFF007B7B7B007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FF0000008400000084000084848400000000000000
      00000000000000000000000000000000000084848400FFFFFF00848484008484
      840084848400FFFFFF00848484008484840084848400FFFFFF00848484008484
      840084848400FFFFFF008484840000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000FF0000008400000084000084848400000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00848484000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF0000008400000084000084848400000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF000000000000000000FFFFFF0000FFFF000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000084848400000000000000
      00000000000000000000000000000000000084848400FFFFFF00848484008484
      840084848400FFFFFF00848484008484840084848400FFFFFF00848484008484
      840084848400FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD0000000000BDBDBD000000FF000000FF000000FF00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF0000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD0000000000BDBDBD0000000000BDBDBD0000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD0000000000BDBDBD0000000000BDBDBD0000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF0000000000000000000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD0000000000BDBDBD0000000000BDBDBD0000000000BDBD
      BD00000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF0000000000000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000FF000000FF00000000000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000000000BDBD
      BD000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000FF000000FF0000000000000000000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000FFFF000000000000FFFF000000000000BDBD
      BD000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000FF000000FF000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000000000BDBD
      BD000000000000000000000000000000000000000000FF000000FF0000000000
      000000000000FF000000FF000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF0000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000080000000
      8000000000000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000080000000
      8000000000000000800000008000000000000000000000000000000000008080
      8000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000080000000
      8000000000000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000008000000000000000800000000000000080000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      8000000080000000800000008000000000000000000000000000808080000000
      000000000000000000008080800000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000080000000
      8000000000000000800000008000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000080000000
      8000000000000000800000008000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000800000008000000080000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000000000008000000080000000800000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000800000000000
      0000000000000000000080000000808080000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000000000C0C0C000000000000000
      00000000000000000000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000000000008000000080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000000000000000000000000000808080000000
      0000000000000000000080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000800000008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000000000000000000000000
      0000800000000000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000008080800000FF0000008000008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      00007B7B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF008080800080808000808080008080800080808000808080008080
      80008080800000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000080808000C0C0C000C0C0
      C000000000000000000000000000000000007B7B7B00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFFFF00FFFFFF00FFFFFF00FFFF0000FFFF0000FFFF0000FFFF
      00007B7B00007B7B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF0080808000808080008080800000000000FFFFFF00808080008080
      8000808080000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000000000000000000080808000C0C0C000C0C0
      C000808080008080800080808000000000007B7B7B00FFFF0000FFFF0000FFFF
      0000FFFFFF0000000000000000007B7B7B00FFFFFF00FFFF0000FFFF0000FFFF
      00007B7B00007B7B00007B7B00000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF0080808000808080008080800000000000FFFFFF00808080008080
      8000808080000000000000000000000000000000000080808000FFFF0000FFFF
      0000FFFF00008080800000000000000000000000000080808000808080008080
      8000000000000000000080808000000000007B7B7B00FFFF0000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF007B7B7B00FFFFFF00FFFFFF00FFFF
      00007B7B00007B7B00007B7B00000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF0080808000808080008080800000000000FFFFFF00808080008080
      8000808080000000000000000000000000000000000080808000FFFF0000FFFF
      0000FFFF00008080800000000000000000000000000000000000000000000000
      0000000000000000000080808000000000007B7B7B00FFFFFF007B7B7B000000
      0000FFFFFF00FFFFFF00FF000000FF000000FF0000007B7B7B007B7B7B00FFFF
      FF007B7B00007B7B00007B7B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF0080808000808080008080800000000000FFFFFF00808080008080
      8000808080000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      000000000000000000008080800000000000000000007B7B7B007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B
      7B00FFFFFF007B7B00007B7B0000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080000000000000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FFFF
      FF007B7B7B00FFFFFF007B7B0000000000000000000000000000FFFFFF000000
      00000000000000000000C0C0C0000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080000000000000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B7B7B00FFFFFF00000000000000000000000000FFFFFF000000
      00000000000000000000C0C0C0000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080000000000000000000000000007B7B7B00FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF00BDBDBD00000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000008080800000FF0000008000008080
      8000808080008080800080808000000000000000000080808000C0C0C000C0C0
      C0000000000000000000808080000000000000000000000000007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBD
      BD00BDBDBD00000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000080808000C0C0C000C0C0
      C0008080800080808000808080000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFF0000FFFF
      0000FFFF00008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFF0000FFFF
      0000FFFF00008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000000000FFFFFF00000000000084000000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000000000FFFFFF00000000000084000000840000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000840000008400000084000000840000008400000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF0000000000FFFFFF00000000000084000000840000FFFFFF00848400008484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000000000FFFFFF00000000000084000000000000FFFFFF008484
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00000000008484000000000000FFFFFF0000000000FFFFFF00000000008484
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0084840000FFFFFF00000000000084000000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000084000000840000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00000000008484000084840000FFFFFF00008400000084000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008400000084848400000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000840000008400000084000000840000008400000000
      0000FFFFFF000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000008400000084848400000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00008400000084000000000000FFFF
      FF00000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000000000FFFFFF000000
      0000000000000000000000000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000008484
      8400FFFFFF000000000000000000000000008400000000000000000000008400
      0000848484000000000000000000000000008400000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F989F009F989F009F989F009F989F00D0785000D0785000D0785000D078
      5000D0785000D07850009F989F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003F3F3F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F003F3F3F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009F98
      9F00807F8000706F7000605F6000D0785000FFF7F000F0E0DF00F0D8D000EFC8
      C000D0785000403F4000403F40009F989F000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000FF00000000000000FF000000000000000000
      00000000000000000000000000000000000000000000000000009F989F00807F
      8000807F8000B0AFB0009F8F9F00000000007F787F007F787F007F787F007F78
      7F0000000000403F4000403F40009F989F000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000007F7F
      7F00000000007F7F7F0000000000FF7F7F00FF7F7F00FF7F7F00FF7F7F00FF7F
      7F00FF7F7F00000000007F7F7F00000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FFFFFF0000000000FF0000000000
      000000000000000000000000000000000000000000009F989F00807F8000B0AF
      B000807F8000B0AFB0009F8F9F00000000000000000000000000000000000000
      000000000000504F5000403F40009F989F000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000003F3F3F007F7F7F007F7F
      7F00000000007F7F7F0000000000FF7F7F00FF7F7F00FF7F7F00FF7F7F00FF7F
      7F00FF7F7F00000000007F7F7F00000000000000000000000000000000000000
      0000FF0000000000000000000000FFFFFF0000000000FFFFFF0000000000FF00
      0000000000000000000000000000000000009F989F00807F8000B0AFB000B0AF
      B000807F8000B0AFB000B0AFB0009F8F9F009F8F9F007F787F007F787F00605F
      6000504F5000504F5000403F40009F989F000000000000000000000000000000
      000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF0000000000000000007F7F7F00000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000000000000000000000FF00
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FF000000000000000000000000000000807F8000B0AFB000B0AFB000807F
      8000807F8000504F5000504F5000504F5000504F5000504F5000504F5000504F
      5000504F5000504F5000403F40009F989F000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007F7F7F00000000007F7F
      7F00000000007F7F7F0000000000FF7F7F00FF7F7F00FF7F7F00FF7F7F00FF7F
      7F00FF7F7F00000000007F7F7F000000000000000000FF000000FF0000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FF0000000000000000000000807F8000B0AFB000807F80009F8F
      9F0066FF990066FF99009F8F9F009F8F9F007F787F007F787F00605F6000605F
      6000605F6000403F40009F989F00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF0000000000FFFFFF0000000000000000007F7F7F00000000007F7F
      7F00000000007F7F7F0000000000FF7F7F00FF7F7F00FF7F7F00FF7F7F00FF7F
      7F00FF7F7F00000000007F7F7F0000000000FF0000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FF00000000000000807F8000807F8000807F8000605F
      6000605F6000605F6000605F6000605F6000605F6000605F6000605F6000504F
      5000403F40009F989F0000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000000000007F7F7F00000000007F7F
      7F0000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      000000000000000000007F7F7F00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FF000000807F8000807F8000807F8000605F
      6000605F6000605F6000605F6000605F6000605F6000605F6000605F6000403F
      40009F989F00000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF000000000000FFFF00FFFFFF0000000000FFFFFF0000FFFF000000
      0000FFFFFF0000000000FFFFFF0000000000000000007F7F7F00000000007F7F
      7F0000000000BF7F7F003F3F3F00000000007F3F3F00FF7F7F00FF7F7F00FF7F
      7F00FF7F7F00000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000504F5000504F
      5000F0D8CF00F0D8CF00F0D8CF00F0D8CF00F0D8CF00F0D8CF00504F5000504F
      5000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007F7F7F00000000007F7F
      7F0000000000FF7F7F00BF3F3F003F3F3F007F7F7F0000000000000000000000
      000000000000000000007F7F7F00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000000000000000000000000000E0B8
      A000FFF0F000F0E8EF00F0E0DF00F0E0DF00F0E0DF00F0D8CF00D07850000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF0000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007F7F7F00000000007F7F
      7F00000000000000000000000000BFBFBF007F7F7F007F7F7F007F7F7F007F7F
      7F003F3F3F007F7F7F007F7F7F0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000E0B8
      A000FFFFFF00FFF0F000FFF0F000FFF0F000F0E8EF00F0D8CF00D07850000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000007F7F7F00000000003F3F
      3F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F003F3F3F000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000D0785000E0B8
      A000FFFFFF00FFFFFF00FFF0F000FFF0F000FFF0F000F0D8CF00D07850000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000007F7F7F00000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000D0785000D0785000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF0F000D0785000000000000000
      000000000000000000000000000000000000FFFF0000FFFF00000000000000FF
      FF00FFFFFF0000FFFF000000000000FFFF00FFFFFF0000FFFF0000000000FFFF
      FF0000000000FFFFFF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0785000E0B8A000E0B8
      A000E0B8A000E0B8A000E0B8A000E0B8A000E0B8A00000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484000084840000848400000000000000000000FFFF000084
      8400000000000084840000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000FFFFFF008484
      8400848484008484840084848400848484008484840084848400FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF000084840000000000FFFFFF000084
      84000084840000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6000000
      00008484840000000000008484000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000848400000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000FFFFFF008484
      84008484840084848400848484008484840084848400FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6000000
      0000FFFFFF00000000000084840000FFFF00FFFFFF0000000000000000000000
      0000FFFFFF0000FFFF0000848400000000000000000000008400000084000000
      0000000000000000000000000000000000000000000000000000000000008400
      000000000000000000000000000000000000000000000000000084000000FFFF
      FF0084000000FFFFFF0084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6000000
      0000FFFFFF000084840000000000FFFFFF000000000084848400FFFFFF000000
      0000000000000084840000000000000000000000000000008400000084000000
      8400000000000000000000000000000000000000000084000000000000008400
      000000000000840000000000000000000000000000000000000084000000FFFF
      FF00840000008400000084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000FFFFFF008484
      8400848484008484840084848400848484008484840084848400FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6000000
      00000000000000000000000000000084840000FFFF0084848400FFFFFF000000
      00000084840000FFFF0000000000000000000000000000008400000084000000
      8400000084000000000000000000000000000000000000000000840000008400
      000084000000000000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF000084840000FFFF000000000084848400FFFFFF000000
      0000000000000084840000000000000000000000000000008400000084000000
      8400000084000000840000000000000000008400000084000000840000008400
      0000840000008400000084000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00000000000000000000000000000000000084848400FFFFFF00C6C6C6000000
      000084848400848484000084840000848400C6C6C6008484840084848400C6C6
      C600C6C6C6000000000000000000000000000000000000008400000084000000
      8400000084000000000000000000000000000000000000000000840000008400
      00008400000000000000000000000000000084000000FFFFFF0084000000FFFF
      FF00840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00000000000000000000000084000000000084848400FFFFFF00C6C6C6000000
      000000000000FFFFFF0084848400FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840000000000000000000000000000008400000084000000
      8400000000000000000000000000000000000000000084000000000000008400
      00000000000084000000000000000000000084000000FFFFFF00840000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000084000000000084848400FFFFFF00C6C6C6000000
      0000FFFFFF000000000084848400FFFFFF00C6C6C60000000000000000000000
      0000C6C6C6008484840000000000000000000000000000008400000084000000
      0000000000000000000000000000000000000000000000000000000000008400
      00000000000000000000000000000000000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400000000000000000000000000
      0000000000000000000000008400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      84000000000000008400000000000000000084848400FFFFFF00C6C6C6000000
      0000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000000000000000000000000
      8400000000000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      84000000840000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084000000FFFFFF00840000008400
      0000840000008400000084000000840000008400000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      84000000840000008400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000000000000000000000000
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      000000FFFF0000000000000000000000000000FFFF0000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000840000008400000084
      00000084000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      000000FFFF0000000000000000000000000000FFFF0000840000008400000084
      00000084000000000000000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084000000840000008400000084
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000840000008400000084
      00000084000000000000000000000000000000000000FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF0000000000FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000FF000000
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C60000FFFF000000FF00000000000000000084840000000000008484
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000FFFF000000FF000000000084840000848400008484
      000084840000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000FFFF000000FF0000000000848400000000
      00008484000084840000FFFF0000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C60084840000C6C6C60000FFFF000000FF00848400008484
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000008400000000000000
      000000000000000000000000000000000000000000000000000000FFFF008484
      840000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600FFFFFF0000000000C6C6C60000FFFF000000FF008484
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000008400000084000000
      000000000000000000000000000000000000000000000000000000FFFF00C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF0084840000C6C6C6000000000000000000C6C6C60000FFFF000000
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00000000000000000000000000000000000000000000008400000084000000
      84000000000000000000000000000000000000000000000000000000000000FF
      FF0084848400000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C60000FF
      FF000000FF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000FFFFFF0084848400000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600000000000000000000000000000000000000000000008400000084000000
      84000000840000000000000000000000000000000000000000000000000000FF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C6000000
      000000FFFF000000FF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      8400000084000000840000000000000000000000000000000000000000000000
      000000FFFF00848484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000C6C6C6000000000000000000000000000084
      84000000000000FFFF000000FF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000000000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      000000FFFF00000000000000000000000000000000000000000000000000FFFF
      FF00C6C6C6000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C60084848400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600848484000000000000000000000000000000000000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60084840000000000000000000084840000C6C6
      C6008484000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C60084848400FFFFFF00C6C6C6008484840084848400FFFF
      FF00848484000000000000000000000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60084840000C6C6C600C6C6C600C6C6C600C6C6C60084840000848400008484
      0000C6C6C6000000000000FFFF000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C60084848400C6C6C600FFFFFF008484840084848400C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C60084840000000000008484
      000000000000C6C6C60000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000084848400000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF00848400008484000084840000000000000000
      00000000FF000000FF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C60000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FF000000FF00000084000000840000008400
      0000FF0000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00007B7B7B007B7B7B007B7B7B0000FFFF0000FFFF007B7B7B007B7B7B007B7B
      7B007B7B7B0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008400000084000000FFFFFF00FFFFFF00C6C6
      C600840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FF00000000000000000000000000840000008400000084000000
      840000008400000084000000840000008400FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000084848400848484008484
      840084848400848484000000000000000000000000008484840000000000C6C6
      C600FF000000848484000000000000000000000084000000FF000000FF000000
      840000008400000084000000FF000000840000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B00000000000000000000000000FFFFFF00000000000000
      0000000000000000000084848400000000008484840000000000C6C6C600FF00
      000000000000848484000000000000000000000000000000840000008400FFFF
      FF00C6C6C600FFFFFF00000084000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000000000000000000084848400FFFF
      FF00FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C600FFFF00008484840000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000007B7B7B00000000000000000000000000FFFFFF00000000008484
      84008484840000000000000000000000000084848400C6C6C600FF0000008484
      8400000000008484840000000000000000000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      0000C6C6C6000000000084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B00000000000000000000000000FFFFFF0000000000C6C6
      C6000000000084840000FFFF00008484000000000000FF000000848484008484
      840000000000848484000000000000000000000000000000000000000000FFFF
      FF00C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6
      C6008484840000000000848484000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FFFF0000FFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFF0000FFFF0000FFFF00008484000000000000FFFFFF008484
      840000000000848484000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000084848400FFFFFF00C6C6C600FFFF
      0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF0000C6C6C600FFFF
      0000000000008484840084848400000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF0000000000FFFFFF00000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFFFF008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FF000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000008400000084000000
      8400000084000000840084848400000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFF0000FFFF0000FFFF00008484000000000000FFFFFF008484
      840000000000848484000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000008484840084848400848484008484
      8400848484008484840084848400848484000000840000008400848484008484
      840084848400FFFF000084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF00FFFF0000FFFFFF0000000000FFFFFF00FFFFFF008484
      840000000000848484000000000000000000000000000000000000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF00000000840000008400C6C6C600FFFF0000C6C6
      C600FFFF0000C6C6C60084848400000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00FFFFFF0000000000FFFFFF000000000000FF
      FF000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00000000000000000000000000C6C6C600FFFFFF00FFFFFF008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00008400000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      0000C6C6C600FFFF0000C6C6C6000000840000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600FFFF0000C6C6C600FFFF0000000084000000840084848400848484008484
      840084848400848484008484840000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000840000008400000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      00000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF008400000000000000000000000000000000000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF008400
      0000FFFFFF00840000008400000084000000FFFFFF0084000000840000008400
      0000FFFFFF00840000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF0084000000FFFFFF00840000008400000084000000840000008400
      0000840000008400000084000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000FFFFFF00840000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF008400000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00840000000000000000000000000000000000000084000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000000000000000000084000000FFFFFF0084000000FFFF
      FF00840000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000000000000000000084000000FFFFFF00840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000000000000000000084000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF008400
      000084000000840000008400000084000000FFFFFF0084000000840000008400
      0000840000008400000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000000000000000000084000000FFFFFF00840000008400
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840084008400840084008400840084008400840084008400840084008400
      84008400840084008400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      8400FFFFFF00000000008484840084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084008400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000084
      8400C6C6C60000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00C6C6
      C600008484000000000000000000000000000000000000000000840084008400
      8400FFFFFF0000000000C6C6C600FFFFFF008484840084848400C6C6C600FFFF
      FF00FFFFFF0084008400000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      00000084840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00C6C6C6000084
      840000000000000000000000000000000000000000008400840084008400FFFF
      FF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0084848400C6C6
      C600FFFFFF0084008400000000000000000000000000FFFFFF0000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF00C6C6C600008484000000
      0000000000000000000000000000000000000000000084008400FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFFFF008484
      8400FFFFFF0084008400000000000000000000000000FFFFFF000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF00C6C6C600008484000000
      0000000000000000000000000000000000000000000084008400FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FFFF008484
      8400FFFFFF0084008400000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFFFF008400
      000084000000840000008400000084000000FFFFFF0084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF00C6C6C600008484000000
      0000000000000000000000000000000000000000000084008400FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFFFF008484
      8400FFFFFF0084008400000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF00C6C6C600008484000000
      0000000000000000000000000000000000000000000084008400FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF0000FFFF008484
      8400FFFFFF0084008400000000000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0084000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      00008484840000000000C6C6C60000FFFF00C6C6C60000848400000000008484
      8400000000000000000000000000000000000000000084008400FFFFFF00FFFF
      FF00FFFFFF0000000000C6C6C600FFFFFF0000FFFF00FFFFFF00FFFFFF008484
      8400FFFFFF0084008400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF008400000000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000008484840000000000C6C6C6000084840000000000848484000000
      0000000000000000000000000000000000000000000084008400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF0000FFFF008484
      84000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0084000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00840000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000084848400000000000000
      0000000000000000000000000000000000000000000084008400FFFFFF00FFFF
      FF008484840000000000000000008484840084848400FFFFFF00FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF00840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084008400FFFFFF00C6C6
      C600848484000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000FFFFFF008400
      000084000000840000008400000084000000FFFFFF0084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF008400000084000000840000008400
      0000840000008400000084000000840000000000000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400840084008400840084008400
      8400840084008400840084848400840084008400840084008400840084008400
      840084008400FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000084848400000000000000000000000000000000007B7B7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B7B7B000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000C6C6C600C6C6
      C600C6C6C600000000000000000000000000C6C6C600C6C6C600C6C6C6008484
      840000000000FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000084848400000000000000000000000000FFFFFF007B7B7B007B7B
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007B7B7B007B7B7B00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B7B7B007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400000000000000
      000000000000C6C6C60084848400C6C6C6000000000000000000000000000000
      000084008400FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600FFFF00008484
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B
      7B00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6C600C6C6C6008484
      8400C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF007B7B7B0000000000FFFF0000FFFF0000FFFF0000FFFF0000000000007B7B
      7B00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000C6C6C6008484
      84008484840000000000000000000000000000000000FFFFFF007B7B7B000000
      00007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B
      7B00000000007B7B7B00FFFFFF000000000000000000FFFFFF007B7B7B007B7B
      7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF00FF00000000FF0000000000000000000084848400FFFFFF00FFFF
      FF00C6C6C6008484840084848400FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000000000000000000000000000000000000000000007B7B7B00FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00007B7B7B00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF0000FF00000000FF00000000000000000000000000FFFFFF00FFFF
      FF00C6C6C6008484840000000000FFFFFF00FFFFFF00FFFFFF00C6C6C6000000
      000084008400FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      84000000000000000000FFFFFF0000000000848484008484840000000000FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000007B7B7B00FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C6C6C600FFFFFF00848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00000000007B7B7B00FFFF0000FFFF00007B7B7B00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C60084848400000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B0000000000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFFFFF008484840084848400840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60084848400000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084000000840000000000
      000084000000FFFFFF0084848400840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6008484840084848400C6C6C600848484008484840000000000000000008484
      840084848400000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF000000000000000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF0084848400000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000084000000FFFFFF008400
      00000000000084000000C6C6C600840000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400C6C6C600C6C6C600C6C6C600848484008484840084848400848484000000
      000000000000848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000C6C6C600FFFFFF00C6C6
      C60084848400000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000084000000FFFFFF008484
      84008400000084848400C6C6C600840000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484008484840084848400848484008484
      840084848400000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF0084848400000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600848484008400000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00848484008484840084848400848484008484
      840084848400848484008484840000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6
      C60084848400000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000840000008400
      00008400000084000000FFFFFF00C6C6C6008484840084000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400848484008484
      840084848400848484008484840000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0084848400000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400000000000000000000000000FFFFFF0084848400000000008484
      8400FFFFFF000000000084000000FFFFFF00C6C6C60084848400840000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6C6008484
      840084848400848484008484840000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000C6C6
      C60084848400000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000FFFF00848484008484
      840000FFFF008484840000FFFF0084000000FFFFFF00C6C6C600848484008400
      00008400000084000000840000000000000084848400FFFFFF00C6C6C600C6C6
      C60000FF000000FF0000C6C6C600C6C6C600C6C6C60084848400848484000000
      0000C6C6C600848484008484840000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFF
      FF0084848400000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00848484000000000000000000000000000000000000000000FFFFFF008484
      8400FFFFFF00FFFFFF00000000000000000084000000FFFFFF00C6C6C600C6C6
      C600C6C6C600848484008484840084000000000000008484840084848400FFFF
      FF00C6C6C600C6C6C600C6C6C6008484840084848400C6C6C600FFFFFF000000
      0000C6C6C600848484008484840000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000C6C6
      C60084848400000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400000000000000000000000000848484008484840084848400FFFF
      FF0000FFFF008484840084848400848484000000000084000000FFFFFF008484
      840084000000FFFFFF0084848400840000000000000000000000000000008484
      840084848400FFFFFF0084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000008484
      840084848400000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF0084848400000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000084000000FFFFFF008400
      00000000000084000000FFFFFF00840000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400000000000000000000000000000000008484840000FFFF008484
      840000FFFF0000FFFF0000000000000000000000000084000000FFFFFF008484
      8400840000000000000084000000840000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484840000000000000000000000000084848400FFFFFF00000000008484
      8400FFFFFF0084848400FFFFFF00000000000000000084000000FFFFFF00FFFF
      FF00FFFFFF008400000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000008484840084848400FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000000000000000000000000000FFFF0000000000000000008484
      840000FFFF00000000008484840000FFFF000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000084000000000000000000000000007B7B7B00FFFFFF000000
      00000000000000000000000000000000000000000000000000007B7B7B00FFFF
      FF007B7B7B0000000000FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B00FFFF
      FF00FFFFFF007B7B7B0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0084848400C6C6C600FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000084000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B0000000000FFFFFF007B7B7B00000000000000000000000000FFFFFF008484
      8400000000000000000084848400C6C6C600FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      840000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B00FFFFFF0000000000000000000000000000000000000000007B7B7B00FFFF
      FF007B7B7B0000000000FFFFFF007B7B7B0000000000FFFFFF00848484000000
      0000FFFFFF0000FFFF00000000000000000084848400C6C6C600FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000000000000084000000
      84000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B00FFFFFF00000000000000000000000000FFFFFF00FFFFFF007B7B7B00FFFF
      FF00000000007B7B7B00000000007B7B7B00000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000008400000000000000000000008400000084000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B0000000000FFFFFF00FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B000000
      000000000000000000007B7B7B007B7B7B000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B007B7B7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B7B7B007B7B7B0000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00FFFFFF007B7B7B00FFFFFF0000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      00007B7B7B00FFFFFF007B7B7B00FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000008400000000000000000000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00FFFFFF007B7B7B007B7B7B007B7B7B00000000000000
      00007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      000000000000000000000000000000FFFF00C6C6C60000000000000000000000
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000084000000840000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF007B7B7B00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000FFFFFF00FFFFFF007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400848484000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008400000084008484840000000000000000000000
      0000000000000000000000008400848484000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000FFFFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000084000000840000000000000000000000
      0000000000008484840000008400000000000000000000000000000000000000
      000000000000840000008400000084000000FFFFFF008400000084000000FFFF
      FF00000000000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400000084000000840000008400000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840084848400000000000000
      00000000840000008400848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00840000008400000084000000FFFFFF000000000000000000840000008400
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000840000008400848484008484
      84000000840000008400000000000000000000000000FFFFFF00848484008484
      84008484840084000000FFFFFF00FFFFFF000000000000000000000000008400
      0000FFFFFF0000000000000000000000000000000000000000007B7B7B000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000840000008400000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000000000000000000000000840000008400000084000000
      84000000840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000084000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000008400000000000000000000000000000000000000
      0000000000008484000000000000000000000000000084848400FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000008484840000008400000084000000
      84000000000000000000000000000000000000000000FFFFFF00848484008484
      8400848484008484840084848400FFFFFF000000000000000000000000000000
      00000000000084000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF007B7B7B0000000000000000000000000000000000BDBD
      BD00BDBDBD00FFFFFF0000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60084848400848484000000840000008400000084000000
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000084000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00FFFFFF0000000000000000000000000000000000000000000000
      000000000000C6C6C6000000000000000000000000000000000084848400FFFF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000C6C6C6000000840000008400000084000000840000000000000000000000
      84000000840084848400000000000000000000000000FFFFFF00848484008484
      8400C6C6C600C6C6C600C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60084840000000000000000000000000000000000008484
      8400FFFFFF0000FFFF0000FFFF0000000000000000000000000000000000C6C6
      C600C6C6C6000000840000008400848400008484840000000000000000000000
      00000000840000008400848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600848400000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084840000FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C6008484000000000000000000000000
      00000000000000008400000084000000000000000000FFFFFF00848484008484
      8400C6C6C60000000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084840000FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C6008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084848400848484008484
      84008484840084848400FFFFFF000000000000000000000000000000FF000000
      FF000000FF00000000007B7B7B00000000007B7B7B00000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000008400848484000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084848400FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF0000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000008400000000000000
      0000000000000000000000008400000084008484840000000000000000000000
      0000000000000000000000008400848484000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0084848400848484008484
      84008484840084848400FFFFFF0000000000000000000000FF000000FF000000
      000000000000000000007B7B7B00000000007B7B7B0000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000008400000084000000
      0000000000000000000084848400000084000000840000000000000000000000
      0000000000008484840000008400000000008400000084000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000C6C6C600000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000008400000084000000
      8400000000000000000000000000000084000000840084848400000000000000
      0000848484000000840084848400000000008400000084848400848484008484
      840084848400848484008484840000000000FFFFFF008484840084848400C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000008400000084000000
      8400000084000000000000000000848484000000840000008400848484008484
      84000000840000008400000000000000000084000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000007B7B7B00000000007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000008400000084000000
      8400000084000000840000000000000000000000840000008400000084000000
      84000000840000000000000000000000000084000000C6C6C600000000000000
      0000C6C6C600000000000000000000000000FFFFFF008484840084848400C6C6
      C60000000000C6C6C60000000000000000000000FF000000FF00000000000000
      0000000000000000000000008400000000000000840000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000008400000084000000
      8400000084000000000000000000000000008484840000008400000084000000
      84000000000000000000000000000000000084000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000C6C6C600FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000008400000084000000
      8400000000000000000084848400848484000000840000008400000084000000
      84008484840000000000000000000000000084000000C6C6C600000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000008400000084000000
      0000000000000000840000008400000084000000840000000000000000000000
      84000000840084848400000000000000000084000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008400
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008400000000000000
      0000000000000000840000008400000000000000000000000000000000000000
      0000000084000000840084848400000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007B7B7B00000000007B7B7B00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008400000084000000000084000000FFFFFF00840000008400
      0000FFFFFF008400000084000000FFFFFF008400000084000000FFFFFF008400
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000FF00000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000FFFF0000000000008484000000
      0000BDBDBD000000000000000000000000000000000000FFFF000000000000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000FFFF0000000000008484000000
      0000BDBDBD0000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000008484000084
      84000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      840000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      840000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000000000000000000000FFFF000000
      0000000000000000000000FFFF0000000000BDBDBD0000000000008484000084
      84000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000000000BDBDBD0000000000008484000084
      8400000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF0000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000008484000084
      84000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000FFFF0000000000008484000084
      8400000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000008484000084
      8400000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF007B7B7B007B7B7B0000000000008484000084
      840000000000000000000000000000000000000000007B7B7B00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      840000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000084840000FFFF000084840000FFFF000084840000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF000084840000FFFF000084840000FFFF00008484000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000FFFF000084840000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000084840000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000FFFF0000FFFF000000
      00007B7B7B007B7B7B007B7B7B0000FFFF0000FFFF007B7B7B007B7B7B007B7B
      7B007B7B7B0000FFFF0000FFFF000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00007B7B7B007B7B7B007B7B7B0000FFFF0000FFFF007B7B7B007B7B7B007B7B
      7B007B7B7B0000FFFF0000FFFF0000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00000000000000000000000000BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000BDBDBD000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000BDBDBD00BDBDBD00000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000BDBDBD00000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000BDBDBD00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000007B7B7B0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000BDBDBD000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B00000000000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000BDBDBD0000000000000000007B7B7B000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007B7B7B000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF00000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000FF00000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008686860000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000008686
      8600000000000080800000808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      84000000840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000086868600000000000080
      800000808000FFFFFF00FFFFFF00008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF008484
      8400848484008484840084848400C6C6C6008484840084848400FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000080800000808000FFFF
      FF00FFFFFF000080800000000000FFFFFF000080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000808000FFFFFF000080
      800000808000000000000080800000000000FFFFFF0000808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF008484
      8400848484008484840084848400C6C6C6000000000000000000C6C6C600FFFF
      FF00C6C6C60000000000000000000000000000000000008080000080800000FF
      FF000000000000FFFF00000000000080800000000000FFFFFF00008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FF000000FF00000000000000FFFF
      FF00C6C6C600000000000000000000000000000000000080800000FFFF000000
      000000FFFF000000000000FFFF00000000000080800000000000FFFFFF000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF008484
      840084848400848484008484840084848400C6C6C600FF000000FF0000000000
      0000C6C6C60000000000000000000000000000000000868686000000000000FF
      FF000000000000FFFF000000000000FFFF00000000000080800000000000FFFF
      FF00008080000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000000000000000000000000000000000000000000000000000868686000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000008080000000
      0000FFFFFF000080800000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF008484
      840084848400848484008484840084848400848484008484840084848400FF00
      0000FF0000000000000000000000000000000000000000000000000000008686
      86000000000000FFFF000000000000FFFF000000000000FFFF00000000000080
      800000000000FFFFFF0000808000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00FF000000FF00000000000000000000000000000000000000000000000000
      0000868686000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000808000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF000000
      8400000084000000840000008400FFFFFF0000FFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FF000000FF000000000000000000000000000000000000000000
      000000000000868686000000000000FFFF000000000000FFFF000000000000FF
      FF00000000000080800000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      840000008400000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000000000C6C6C600FF000000840000000000000000000000000000000000
      00000000000000000000868686000000000000FFFF000000000000FFFF000000
      000000FFFF000000000000808000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400FFFF0000000084000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000084848400FFFFFF000000
      84000000840000008400FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000868686000000000000FFFF000000000000FF
      FF00868686008686860000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000008484840000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008686860000000000868686008686
      8600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000008000000080000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000080
      0000000000000000000000800000008000000080000000800000008000000080
      000000800000008000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000080
      0000008000000000000000000000000000000000000000000000000000000000
      00000000000000FF00000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000800000008000
      0000FFFFFF000000000000000000000000008080800000000000000000000000
      0000000000008000000000000000000000000000000000000000008000000080
      0000FFFFFF000000000000000000000000008080800000000000000000000000
      000000000000008000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008000000080000000800000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00008000000080000000800000FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000008000000080000000FFFF
      FF00FFFFFF000000000000000000FFFFFF008080800080808000000000000000
      000000000000808080000000000000000000000000000080000000800000FFFF
      FF00FFFFFF000000000000000000FFFFFF008080800080808000000000000000
      00000000000000FF00000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000080000000800000000000000000800000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000080000000800000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008000000000000000000000000000000000800000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000008000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000000080000000800000008000
      0000800000008000000000000000800000000000000000000000008000000080
      000000800000008000000080000000800000FFFFFF0000800000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008080800000000000000000000000000000800000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000FF00000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008000000000000000000000000000000000800000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000008000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008080800000000000000000000000000000800000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000FF00000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000080000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000800000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000080000000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000800000FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000E00100000100010000000000000F00000000000000000000
      000000000000000000000000FFFFFF00FFFFEFFF00000000FC00EE0700000000
      FC00C60300000000FC00830300000000FC00838300000000EC00018300000000
      E400018300000000E00083C300000000000083C3000000000001830000000000
      00038300000000000007818100000000000F81C300000000E3FFC0C300000000
      E7FFC0E700000000EFFFFFE700000000FFFF9CFFFFFFFFFFFFFF087FE001FFFF
      F3E10003E001F1FFF9CC9003E001F1FFFCCCB000E001E03FFCCCD000E001F1FF
      FE4CE000E001E03FFE61F000E001F1FFC33FF000C001F01F993FF0008001F00F
      999FF0000001F18F99CFF0003001F18F99CFF000E001F00FC3E7F000C003F01F
      FFFFFC01E007FFFFFFFFFC03E00FFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF
      0000FFFFFFFFFC000000C007FC0180000000C007FC0100000000E00FFC010000
      0000E00F000100000000E00F000100010000E00F000100030000E00F00010003
      0000E00F000300030000E00F000700030000E00F000F00030000FFFF00FF0003
      0000FFFF01FF80070000FFFF03FFF87FFFFFE000E000FFFFFFFFE000E000FE00
      000180008000FE00000180008000FE0000018000800080000001800080000000
      0001800080000000000180008000000000018000800000010001800080000003
      0001800080000007000180008000001F000180008000001F000180038003005F
      000180038003001FFFFFFFFFFFFFFFFFEABFFFFFFE7FFFFFFF9FD57FF83FFE7F
      FF8FFF3FE01FFC3FFF87FF1F800FFC3FFF87FF0F0007FE7F00C3FF0F0003FC3F
      00C3FF870001FC3F00E1FF870000FC3F0001FFC30000FC1F0000FFC38001F20F
      0001FFE1C001E107000FFFE3E000E187000FFFFFF001E007F00FFFFFF807F00F
      F00FFFFFFC1FF81FF00FFFFFFE7FFFFF0000C00FFFFFF00F00008007FFF3E007
      000080070001C003000080070001800100008007000100000000800700010000
      0000800700010000000080070001000000008007000100000000800F00010000
      0000FFFF000100000000FFBB000100000000FF99010180010000FF88C387C003
      0000FF99FFFFE0070000FFBBFFFFF00FCF9FF8FFFFFFFFFFB37F001FFFCFFFFF
      9CFF001F000FFFFF8FFF001F001FFFFF87FF001F000FFFFF83FF001F0007FFFF
      81FF000F0013000080FF0007001B7FFE80FF001700195634807F001B00197FFE
      807F001D00030000C03F001E001FFFFFC03F001F001FFFFFE03F001F003FFFFF
      E07F001F007FFFFFF0FFFFFF00FFFFFFFFFFFFFFF3FFFFFFFFFFF800E0FFFFC1
      8000F800C03F800180000000800F8001800000000007800080000000800FC000
      800000000007E00080000000800FF00080000000800FE00F800000000007C007
      80000000800F800380000000E01B010180800000F8310381E1C30000FE6007C1
      FFFF001FFFFBFFFFFFFF001FFFFBFFFFFFFFFFFFFFFFFFFFFFFF0001001FFFFF
      80010001001FFFFF00000001001FFFFF00000001001FE00F000000010001E00F
      000000010001F1FF000000010001F8FF000000010001FC7F000000010001FCFF
      000000010001F9FF00000001F001F3EF00000001F001E00F80010001F001E01F
      FFFF0001F001FFFFFFFF0001FFFFFFFFFFFFFC00FE7FFFE3FC3FFC00F81FFC41
      FC3FFC00E0078800FC3F0000C0030000FC3F0000C0030000FC3F0000C0030000
      80010000C00300008001000000000000800100008001000080010000C0030000
      FC3F0001C0010000FC3F000180000000FC3F000180010001FC3F0001E0070001
      FC3F0001F99F000DFFFF0001FFFFD553C007FFFFFFFFFFFFC007FFFFFFFFFFFF
      C007F3E1FFFFFFFFC007F9CCFFFFFFFFC007FCCCFC7FFFFFC007FCCCFC7FFFFF
      C007FE4CFC7FFFFFC007FE61E00FE007C007C33FE00FE007C007993FE00FE007
      C007999FFC7FFFFFC00799CFFC7FFFFFC00799CFFC7FFFFFC007C3E7FFFFFFFF
      C007FFFFFFFFFFFFC007FFFFFFFFFFFFFFFF88F7FFFFFFFFFFF7C9E3FFFFFFFF
      FFF3C9E3C007001FEA81E1C1C007000FFFF3C9C1C0070007FFF7C9F7C0070003
      FFFFE0F7C00700011C7FFFF7C00700001C7F88F7C007001F087F9CF7C007001F
      087FC1F7C007001F007FC9F7C0078FF180FFE3F7C00FFFF9C9FFE3F7C01FFF75
      C9FFF7F7C03FFF8FFFFFFFFFFFFFFFFFF80F80FF0007FFFFF007008F0003FFFF
      E0030081000107C1E0038180000007C1E003818C000007C1E00381FC00000101
      E00381FC80000001E003FFFCC0000001E003FFFCC0000001E003808CC0008003
      F0070080C003C107F9CF0081C003C107F9CF818FFFFFE38FF9CF81FFFFFFE38F
      F80F81FFFFFFE38FFC1F81FFFFFFFFFFC001FFFFFFFFFFFFDFFDD57FFFFFFFFF
      C555FF3FFFFFFFFFCA2DFF1FFFFFFFFFC415FF0FFF7FFBFFCA0DFF0FFE7FF9FF
      C545FF87FC7FF8FFCAADFF87F87FF87FC155FFC3F07FF83FC82DFE43F87FF87F
      C4150F21FC7FF8FFC02D1FA3FE7FF9FFC0411FBFFF7FFBFFC0A3673FFFFFFFFF
      C007F07FFFFFFFFFC00FFFFFFFFFFFFFF001F000F801FFFFE000F000E3FDFE3F
      C000F000EA05F81F8000F0008A05F40F0000F000ABFDE0070000F000AA058003
      0001F000AA0540010003E000A87D00000007C000A9050000C00F8000A87D8001
      E01F8000AE01C003E01F0000A007E00FC01F0000BFDFF07F803F0001801FF8FF
      807F0003FFFFFFFFFFFF0007FFFFFFFFFFFFFFFFFF8FFFFFF007800F0001FFFF
      F007800F0000FFFFF007800F0001FFFFF007800F0000BFFFC007800F00009FEF
      C007800F00018FABC007800F000187C7C01F800F00018301001F800F000187C7
      001F800D00018FAB001DFFFD00019FEF007DFFEB0001BFFF006BFFE70001FFFF
      0067FFE30001FFFF0063FFFF0001FFFFFFFFFFFFFFFFFFFFFFFFFF9F0003FFFF
      0001FF9F0001FFFF0001FF3F000000010001F73F000000010001F27F00000001
      FFFFF07F000000016DB7F00F00000001FFFFF01F800000010001F03FFFFF0001
      0001F07FFFFF00010001F0FFFFFF00010001F1FFFFFF00010001F3FFFFFF0001
      0001F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC007FFFF8001EABF0001FE7F
      8001FF9F0000FE3F8001FF8FC00300078001BF87E00F000780019F87E00F0007
      80018FC3E0070003800187C3F0130003800183E1E0090007800187E1C0010003
      80018FF0C007000180019FF1C00300018001BFFF800100078001FFFFC0010007
      8001FFFFF0310007FFFFFFFFF83F0007FF7EFFFFFC01FFFF9001FFF3FE03FFFF
      C00300010007E000E00300010003C000E00300018001C000E0030001C0018000
      E0030001C001800000010001800000008000000180010000E007000100010000
      E00F000100008000E00F000100008000E027010100038001C073C387803FC07F
      9E79FFFFC03FE03F7EFEFFFFE0FFFF83FFFFFFFFFFFFFFFFF801FFFFFFFFFFFF
      F801800380038003F801800380038003F801800380038003C001800380038003
      C001800380038003C001800380038003C00F800380038003000F800380038003
      000F800380038003000F800380038003003F800380038003003F800380038003
      003F800380038003003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FF001003FFFFF
      FC3FE001003F8003C003C001003F8003C0038001003F8003E0070001003F8003
      F00F0001000F8003F00F000100338003F00F0001000080031008000100008003
      F00F000100008003F81F000300008003FC3F060F00008003EFF7078FF8008003
      DEFB8FFFFC008003BEFDDFFFFC00FFFFFFFFFFFFFFFFFFFFF000000CFFFFFFFF
      F000000800000000000000010000000000000003000000000000000300000000
      0000000300000000000000030000000000000003000000000000000700000000
      0000000F000000008000000F8001FFFFF000000FC003FFFFF001001FF00FFFFF
      F003003FFC3FFFFFF007007FFFFFFFFFFFFFFC7FFFFFFFFFE1FFF01FC003E003
      E0FFC007C003C00390FF8001C003C00388FF8001C003C00380FF0001C003C003
      807F0000C003C003C03F0000C003C003241F0000C003C00380010000C003C003
      C3008001C003C0030080E007C003C0030088F803E01FC0038384FE00F81FC003
      2183FF03FE1FC00764C3FF8FFF9FFFFFF00FF3FFFFFFFFFFE007E0FFFFFFFFFF
      DFCBC03FF8FFFFFB9FC5800FF77FEFFF00020007EFBFC7F70009800FECBFC7EF
      87C40007EF5FE3CFC70A800FEF5FF19FE81C800FF5AFF83FF0000007F5AFFC7F
      F800800FFAD7F83FF910E01BFAD7F1BFF831F831FF77C3CFF9C3FE60FF7787E7
      FA07FFFBFF8F9FF3FC7FFFFBFFFFFFFFFF3FFFFFFFFFFFFFFE1FFFFFFF3FE01F
      FF0FFCFEFE1FC00FFF07FC7CFC1F8007FF83FC79000F0003FE01FE3100470001
      FE00F00300678000F107F1070073C000F183F10F0079E000F181F007007CF000
      F1C0E063007EF801E0E0C071007FF801C07F803900FFF801803F803F01FFF807
      001FFFFF03FFF807FFFFFFFFFFFFFC7FFFFFFFFFFFFFFFFFFE00F83FFC00FFFF
      FE00E00FFC00FFFFFE00C447FC00FCFEFE008C63FC00BC7CFE009C73EC009C79
      00003FF9E4008E3100003EF9E000860300003C7F0000830700013C7F0001870F
      00033C4100038C0700079C6100079863000F8C71000FB9F1000FC441E3FFFFF9
      000FE00DE7FFFFFF000FF83FEFFFFFFFC01FFFFFC01FFFFFC00F801FC00FF83F
      E0070000E007E00FE0030000E003CFC780030000E00387E380070000E007A3F3
      80070000E00731F980070000E00738F980070000E0073C7980078000E0073E39
      E0078000E0073F19C007FC00C0079F8BC007FC01C0078FC3E007FC03E007C7E7
      F803FC07F803E00FFC03FFFFFC03F83FFF7E8007FFFFFF7E90010003FFFF9001
      C0030001F9FFC003E0038010F0FFE003E0030000F0FFE003E0030000E07FE003
      E0038000C07FE00300018000843F0001800000001E3F8000E0070000FE1FE007
      E00F0000FF1FE00FE00F0000FF8FE00FE027C001FFC7E027C073C001FFE3C073
      9E79C007FFF89E797EFEE3FFFFFF7EFEE00FC0078003F9FFE00FC0078003E0FF
      E00FC0078003807FE00FC0078003023FE00FC0078003051FE00FC00780030A8F
      E00FC00780031547E00FC0078003AAA3E00FC0078003D551F01FC0078003EAA9
      F83FC0078001F553F83FC0078000FAABF83FC0078000FD55F83FC0078000FEA3
      F83FC0078003FF4FFFFFC0078003FFBFFFFFFFFFFFFFFFFFE3FFE3FFC007E003
      C001C001C007E003C001C001C007E003C001C001C007E00382798279C000E003
      02090209C004A00302090209C002C00302090209C007E00302090209C007E003
      02090209C007E00300090009C007E00306070607C00FE007078F078FC01FE00F
      8FFF8FFFC03FE01FDFFFDFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'software\new_pm\sbis'
    Left = 208
    Top = 252
  end
  object PropStorageEh1: TPropStorageEh
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 103
    Top = 252
  end
  object qPacks: TOraQuery
    SQL.Strings = (
      'select t.*,'
      '(select count(*) as arc from skladuser.arc_doc_link al '
      '            where al.log_name = '#39'SBISLOG'#39
      '                          and al.log_doc_id = t.id) as arc'
      
        '                          from skladuser.sbispack t where create' +
        'date >= :dates'
      
        '                                                          and ac' +
        'tual <> 0')
    Left = 188
    Top = 334
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dates'
        Value = nil
      end>
  end
  object qSbisTypes: TOraQuery
    SQL.Strings = (
      'select t.* from skladuser.sbistypes t')
    Left = 100
    Top = 334
  end
  object pmPol: TPopupMenu
    Left = 172
    Top = 182
    object ActLoadStatus1: TMenuItem
      Action = ActLoadStatus
    end
    object ActLoadArcDoc1: TMenuItem
      Action = ActLoadArcDoc
    end
    object N1: TMenuItem
      Action = ActLoadVloj
    end
  end
  object spDelDocCopy: TOraStoredProc
    StoredProcName = 'SBIS.DelDocCopy'
    SQL.Strings = (
      'begin'
      '  SBIS.DelDocCopy(:IDPACK);'
      'end;')
    Left = 560
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPACK'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'SBIS.DelDocCopy'
  end
  object spDelVloj: TOraStoredProc
    StoredProcName = 'SBIS.DelVloj'
    SQL.Strings = (
      'begin'
      '  SBIS.DelVloj(:IN_IDSO);'
      'end;')
    Left = 560
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_IDSO'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'SBIS.DelVloj'
  end
  object dsSklPrData: TOraDataSource
    DataSet = qSklPrData
    Left = 984
    Top = 512
  end
  object qSklPrData: TOraQuery
    SQL.Strings = (
      
        'select OPNUM, SKLAD, DOCNUM, SRCLOG_OPNUM, DOCDATE, /*ISCLOSED, ' +
        'IS_OTLOG, CONTR_ID, MEDIATOR_ID, DOC1TYPE, DOC1NUM, DOC1DATE, DO' +
        'C2, DOC3,*/ '
      
        '       (SUMMADOC + OTKL) as SUMMADOC, /*SUMMACL, VIDOPL, SCH_NAL' +
        ',*/ SUMMANAL, OTKL/*, PROXYNUM, ACC, COMPANY_ID, DOCFRM, DOC4, R' +
        'PDOC_OPNUM, PROXYDATE, TAB_N, '
      '       AFACELOG_DOCID, TYP_CALC_NAL, KPP, GM_RAS*/ '
      'from skladuser.po_base po where po.opnum = :opnum')
    MasterSource = dsDocs
    MasterFields = 'SKLOPNUM'
    DetailFields = 'OPNUM'
    Left = 1032
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'opnum'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'SKLOPNUM'
        Value = nil
      end>
  end
end
