object DMSbis: TDMSbis
  OnCreate = DataModuleCreate
  Height = 366
  Width = 453
  object MTSF: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'text'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KOD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'usl'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'kolvo'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'price'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'summa'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'akc'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'nalst'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'nalog'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'sumnal'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CKOD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SNAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TAMD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'NALSCH'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'ED_ISM'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'edname'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'NameRab'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'Tax'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ZavNum'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'MonitorNum'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MonitorEdISM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MonitorNEdIsm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MonitorCNT'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'MonitorCCountry'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'MonitorNCountry'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MonitorSum'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 8
    object MTSFtext: TStringField
      DisplayWidth = 255
      FieldName = 'text'
      Size = 255
    end
    object MTSFKOD: TStringField
      DisplayWidth = 255
      FieldName = 'KOD'
      Size = 255
    end
    object MTSFusl: TStringField
      DisplayWidth = 255
      FieldName = 'usl'
      Size = 255
    end
    object MTSFkolvo: TStringField
      DefaultExpression = '0'
      DisplayWidth = 255
      FieldName = 'kolvo'
      Size = 255
    end
    object MTSFprice: TStringField
      DefaultExpression = '0'
      DisplayWidth = 255
      FieldName = 'price'
      Size = 255
    end
    object MTSFsumma: TStringField
      DefaultExpression = '0'
      DisplayWidth = 255
      FieldName = 'summa'
      Size = 255
    end
    object MTSFakc: TStringField
      DisplayWidth = 255
      FieldName = 'akc'
      Size = 255
    end
    object MTSFnacst: TStringField
      DefaultExpression = '0'
      DisplayWidth = 255
      FieldName = 'nalst'
      Size = 255
    end
    object MTSFnalog: TStringField
      DefaultExpression = '0'
      DisplayWidth = 255
      FieldName = 'nalog'
      Size = 255
    end
    object MTSFsumnal: TStringField
      DefaultExpression = '0'
      DisplayWidth = 255
      FieldName = 'sumnal'
      Size = 255
    end
    object MTSFCKOD: TStringField
      DisplayWidth = 255
      FieldName = 'CKOD'
      Size = 255
    end
    object MTSFSNAME: TStringField
      DisplayWidth = 255
      FieldName = 'SNAME'
      Size = 255
    end
    object MTSFTAMD: TStringField
      DisplayWidth = 255
      FieldName = 'TAMD'
      Size = 255
    end
    object MTSFNALSCH: TIntegerField
      DisplayWidth = 10
      FieldName = 'NALSCH'
    end
    object MTSFED_ISM: TIntegerField
      DisplayWidth = 10
      FieldName = 'ED_ISM'
    end
    object MTSFedname: TStringField
      DisplayWidth = 255
      FieldName = 'edname'
      Size = 255
    end
    object MTSFNameRab: TStringField
      DisplayWidth = 256
      FieldName = 'NameRab'
      Size = 256
    end
    object MTSFTax: TStringField
      DefaultExpression = '0'
      DisplayWidth = 20
      FieldName = 'Tax'
    end
    object MTSFZavNum: TStringField
      DisplayWidth = 256
      FieldName = 'ZavNum'
      Size = 256
    end
    object MTSFMonitorNum: TStringField
      DisplayWidth = 30
      FieldName = 'MonitorNum'
      Size = 30
    end
    object MTSFMonitorEdISM: TStringField
      DisplayWidth = 20
      FieldName = 'MonitorEdISM'
    end
    object MTSFMonitorNEdIsm: TStringField
      DisplayWidth = 20
      FieldName = 'MonitorNEdIsm'
    end
    object MTSFMonitorCNT: TSmallintField
      DisplayWidth = 10
      FieldName = 'MonitorCNT'
    end
    object MTSFMonitorCCountry: TStringField
      FieldName = 'MonitorCCountry'
      Size = 3
    end
    object MTSFMonitorNCountry: TStringField
      FieldName = 'MonitorNCountry'
    end
    object MTSFMonitorSum: TStringField
      FieldName = 'MonitorSum'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object text: TMTStringDataFieldEh
          FieldName = 'text'
          StringDataType = fdtStringEh
          Size = 255
        end
        object KOD: TMTStringDataFieldEh
          FieldName = 'KOD'
          StringDataType = fdtStringEh
          Size = 255
        end
        object usl: TMTStringDataFieldEh
          FieldName = 'usl'
          StringDataType = fdtStringEh
          Size = 255
        end
        object kolvo: TMTStringDataFieldEh
          FieldName = 'kolvo'
          StringDataType = fdtStringEh
          Size = 255
        end
        object price: TMTStringDataFieldEh
          FieldName = 'price'
          StringDataType = fdtStringEh
          Size = 255
        end
        object summa: TMTStringDataFieldEh
          FieldName = 'summa'
          StringDataType = fdtStringEh
          Size = 255
        end
        object akc: TMTStringDataFieldEh
          FieldName = 'akc'
          StringDataType = fdtStringEh
          Size = 255
        end
        object nalst: TMTStringDataFieldEh
          FieldName = 'nalst'
          StringDataType = fdtStringEh
          Size = 255
        end
        object nalog: TMTStringDataFieldEh
          FieldName = 'nalog'
          StringDataType = fdtStringEh
          Size = 255
        end
        object sumnal: TMTStringDataFieldEh
          FieldName = 'sumnal'
          StringDataType = fdtStringEh
          Size = 255
        end
        object CKOD: TMTStringDataFieldEh
          FieldName = 'CKOD'
          StringDataType = fdtStringEh
          Size = 255
        end
        object SNAME: TMTStringDataFieldEh
          FieldName = 'SNAME'
          StringDataType = fdtStringEh
          Size = 255
        end
        object TAMD: TMTStringDataFieldEh
          FieldName = 'TAMD'
          StringDataType = fdtStringEh
          Size = 255
        end
        object NALSCH: TMTNumericDataFieldEh
          FieldName = 'NALSCH'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object ED_ISM: TMTNumericDataFieldEh
          FieldName = 'ED_ISM'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object edname: TMTStringDataFieldEh
          FieldName = 'edname'
          StringDataType = fdtStringEh
          Size = 255
        end
        object NameRab: TMTStringDataFieldEh
          FieldName = 'NameRab'
          StringDataType = fdtStringEh
          Size = 256
        end
        object Tax: TMTStringDataFieldEh
          FieldName = 'Tax'
          StringDataType = fdtStringEh
        end
        object ZavNum: TMTStringDataFieldEh
          FieldName = 'ZavNum'
          StringDataType = fdtStringEh
          Size = 256
        end
        object MonitorNum: TMTStringDataFieldEh
          FieldName = 'MonitorNum'
          StringDataType = fdtStringEh
          Size = 30
        end
        object MonitorEdISM: TMTStringDataFieldEh
          FieldName = 'MonitorEdISM'
          StringDataType = fdtStringEh
        end
        object MonitorNEdIsm: TMTStringDataFieldEh
          FieldName = 'MonitorNEdIsm'
          StringDataType = fdtStringEh
        end
        object MonitorCNT: TMTNumericDataFieldEh
          FieldName = 'MonitorCNT'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object MonitorCCountry: TMTStringDataFieldEh
          FieldName = 'MonitorCCountry'
          StringDataType = fdtStringEh
          Size = 3
        end
        object MonitorNCountry: TMTStringDataFieldEh
          FieldName = 'MonitorNCountry'
          StringDataType = fdtStringEh
        end
        object MonitorSum: TMTStringDataFieldEh
          FieldName = 'MonitorSum'
          StringDataType = fdtStringEh
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object qContragent: TOraQuery
    SQL.Strings = (
      'select t.*, t1.kpp as kppp,t2.country_name, t2.oksm_code, t3.*,'
      
        '       (select tb1.fio from skladuser.contr_contact tb1 where tb' +
        '1.contr_id = t.contr_id and tb1.def_pr = '#39'Y'#39') as ContPersFIO, '
      
        '       (select tb1.dolgn from skladuser.contr_contact tb1 where ' +
        'tb1.contr_id = t.contr_id and tb1.def_pr = '#39'Y'#39') as ContPersDolj,' +
        ' '
      
        '       (select tb1.text from skladuser.contr_contact tb1 where t' +
        'b1.contr_id = t.contr_id and tb1.def_pr = '#39'Y'#39') as ContPersRem,'
      
        '       (select tCN.F2 from CONTR_NAME tCN where tCN.CONTR_ID = t' +
        '.contr_id and sysdate between nvl(tCN.Date_n, '#39'01.01.1900'#39') and ' +
        'nvl(tCn.Date_k, '#39'01.01.3001'#39')) as FirstName,'
      
        '       (select tCN.F1 from CONTR_NAME tCN where tCN.CONTR_ID = t' +
        '.contr_id and sysdate between nvl(tCN.Date_n, '#39'01.01.1900'#39') and ' +
        'nvl(tCn.Date_k, '#39'01.01.3001'#39')) as LastName,'
      
        '       (select tCN.F3 from CONTR_NAME tCN where tCN.CONTR_ID = t' +
        '.contr_id and sysdate between nvl(tCN.Date_n, '#39'01.01.1900'#39') and ' +
        'nvl(tCn.Date_k, '#39'01.01.3001'#39')) as Patronymic,'
      
        '       (select tCR.Code from REGIONS tCR where tCr.id = t.region' +
        '_id) as Code_Region,'
      
        '       contragents_pkg.ContrName(t.contr_id, decode(:docdate, '#39'%' +
        #39', sysdate, to_date(:docdate)), 0) as fullname_of_date,'
      
        '       contragents_pkg.ContrName(t.contr_id, decode(:docdate, '#39'%' +
        #39', sysdate, to_date(:docdate)), 1) as shortname_of_date'
      
        'from skladuser.contragents_view t, skladuser.contr_kpp t1, sklad' +
        'user.contr_country t2, skladuser.contr_addr_view t3'
      'where t.contr_id = :contr_id'
      '      and t.contr_id = t1.contr_id(+)'
      '      and t1.def_pr(+) = '#39'Y'#39
      '      and t.country = t2.id'
      '      and t.contr_id = t3.contr_id')
    Left = 208
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'docdate'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'contr_id'
        Value = nil
      end>
  end
  object MTNakl: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'text'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EDNAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'brutto'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'netto'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'price'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'summa'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'nalst'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'nalog'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'sumnal'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KOD_OKEI'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 8
    object MTNakltext: TStringField
      DisplayWidth = 255
      FieldName = 'text'
      Size = 255
    end
    object MTNaklEDNAME: TStringField
      DisplayWidth = 255
      FieldName = 'EDNAME'
      Size = 255
    end
    object MTNaklbrutto: TStringField
      DisplayWidth = 255
      FieldName = 'brutto'
      Size = 255
    end
    object MTNaklnetto: TStringField
      DisplayWidth = 255
      FieldName = 'netto'
      Size = 255
    end
    object MTNaklprice: TStringField
      DisplayWidth = 255
      FieldName = 'price'
      Size = 255
    end
    object MTNaklsumma: TStringField
      DisplayWidth = 255
      FieldName = 'summa'
      Size = 255
    end
    object MTNaklnalst: TStringField
      DisplayWidth = 255
      FieldName = 'nalst'
      Size = 255
    end
    object MTNaklnalog: TStringField
      DisplayWidth = 255
      FieldName = 'nalog'
      Size = 255
    end
    object MTNaklsumnal: TStringField
      Alignment = taCenter
      DisplayWidth = 255
      FieldName = 'sumnal'
      Size = 255
    end
    object MTNaklKOD_OKEI: TStringField
      FieldName = 'KOD_OKEI'
      Size = 255
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object text: TMTStringDataFieldEh
          FieldName = 'text'
          StringDataType = fdtStringEh
          Size = 255
        end
        object EDNAME: TMTStringDataFieldEh
          FieldName = 'EDNAME'
          StringDataType = fdtStringEh
          Size = 255
        end
        object brutto: TMTStringDataFieldEh
          FieldName = 'brutto'
          StringDataType = fdtStringEh
          Size = 255
        end
        object netto: TMTStringDataFieldEh
          FieldName = 'netto'
          StringDataType = fdtStringEh
          Size = 255
        end
        object price: TMTStringDataFieldEh
          FieldName = 'price'
          StringDataType = fdtStringEh
          Size = 255
        end
        object summa: TMTStringDataFieldEh
          FieldName = 'summa'
          StringDataType = fdtStringEh
          Size = 255
        end
        object nalst: TMTStringDataFieldEh
          FieldName = 'nalst'
          StringDataType = fdtStringEh
          Size = 255
        end
        object nalog: TMTStringDataFieldEh
          FieldName = 'nalog'
          StringDataType = fdtStringEh
          Size = 255
        end
        object sumnal: TMTStringDataFieldEh
          FieldName = 'sumnal'
          StringDataType = fdtStringEh
          Size = 255
        end
        object KOD_OKEI: TMTStringDataFieldEh
          FieldName = 'KOD_OKEI'
          StringDataType = fdtStringEh
          Size = 255
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object qKadry: TOraQuery
    SQL.Strings = (
      'select * from skladuser.kadryall t where t.tab_n = :tabn')
    Left = 264
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tabn'
        Value = nil
      end>
  end
  object qSBISTypes: TOraQuery
    SQL.Strings = (
      'select t.*, rowid from skladuser.sbistypes t where t.id = :id')
    Left = 264
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
  object qFiles: TOraQuery
    SQL.Strings = (
      'select * from fileuser.all_files t where id = 0')
    Left = 264
    Top = 56
  end
  object qFileIDNew: TOraQuery
    SQL.Strings = (
      'select fileuser.all_files_seq.nextval val from dual')
    Left = 312
    Top = 56
  end
  object spSbisObj: TOraStoredProc
    StoredProcName = 'sbis.UpdateSBISObj'
    SQL.Strings = (
      'begin'
      
        '  :RESULT := sbis.UpdateSBISObj(:ACTION, :V_ID, :V_FILENAME, :V_' +
        'DATEOTPR, :V_IDPACK, :V_APP, :V_ID_FILE, :V_IDDOC, :V_TYPDOC, :V' +
        '_POL, :V_ISDEL, :V_CONTREDO, :V_USER_ID, :V_NAZV, :V_ID_SBIS, :V' +
        '_RELEASEDATE, :V_RELEASENUM, :V_DOC_NUM);'
      'end;')
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'RESULT'
        ParamType = ptResult
        Value = nil
        IsResult = True
      end
      item
        DataType = ftFloat
        Name = 'ACTION'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_ID'
        ParamType = ptInputOutput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_FILENAME'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_DATEOTPR'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_IDPACK'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_APP'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_ID_FILE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_IDDOC'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_TYPDOC'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_POL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_ISDEL'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftFloat
        Name = 'V_CONTREDO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_USER_ID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_NAZV'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_ID_SBIS'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'V_RELEASEDATE'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftFloat
        Name = 'V_RELEASENUM'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'V_DOC_NUM'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end>
    CommandStoredProcName = 'sbis.UpdateSBISObj'
  end
  object qCheckSend: TOraQuery
    SQL.Strings = (
      'select t.* from skladuser.sbispack t,'
      '                       skladuser.sbisobj t1'
      'where t.id = t1.idpack'
      'and t.app = :app '
      'and t.docid = :iddoc '
      'and t.actual = 1'
      'and t1.typid = :idtyp')
    Left = 328
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'app'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'iddoc'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'idtyp'
        Value = nil
      end>
  end
  object spDelDoc: TOraStoredProc
    StoredProcName = 'sbis.DelDoc'
    SQL.Strings = (
      'begin'
      '  sbis.DelDoc(:V_ID, :V_APP, :V_USER_ID);'
      'end;')
    Left = 96
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'V_ID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_APP'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_USER_ID'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'sbis.DelDoc'
  end
  object spUpdateSession: TOraStoredProc
    StoredProcName = 'sbis.UpdateSession'
    SQL.Strings = (
      'begin'
      
        '  sbis.UpdateSession(:ACTION, :V_ID, :V_USER_PM, :V_USER_EDO, :V' +
        '_ID_EDO, :V_CONTREDO);'
      'end;')
    Left = 104
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ACTION'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_ID'
        ParamType = ptInputOutput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_USER_PM'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_USER_EDO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_ID_EDO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'V_CONTREDO'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'sbis.UpdateSession'
  end
  object spGetSesson: TOraStoredProc
    StoredProcName = 'sbis.getsession'
    SQL.Strings = (
      'begin'
      '  :RESULT := sbis.getsession(:V_USER_EDO);'
      'end;')
    Left = 24
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'RESULT'
        ParamType = ptResult
        Value = nil
        IsResult = True
      end
      item
        DataType = ftString
        Name = 'V_USER_EDO'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'sbis.getsession'
  end
  object spCreatePack: TOraStoredProc
    StoredProcName = 'SBIS.CREATESBISPACK'
    SQL.Strings = (
      'begin'
      
        '  :RESULT := SBIS.CREATESBISPACK(:SIDEDO, :SDOCID, :SUSERID, :NC' +
        'ONTREDO, :SAPP, :NCONTRSENDER, :NCONTRPOL, :NISPOL, :SINNPOL, :S' +
        'INNSENDER, :SIDSO, :SDATE, :SSTATUS, :SDOCNUM, :SDOCTYPE, :SDOCD' +
        'ATE, :NDOCSUM, :SKPPPOL, :SKPPSENDER);'
      'end;')
    Filtered = True
    Left = 24
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'RESULT'
        ParamType = ptResult
        Value = nil
        IsResult = True
      end
      item
        DataType = ftString
        Name = 'SIDEDO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SDOCID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SUSERID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'NCONTREDO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SAPP'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'NCONTRSENDER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'NCONTRPOL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'NISPOL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SINNPOL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SINNSENDER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SIDSO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SDATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'SSTATUS'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'SDOCNUM'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SDOCTYPE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SDOCDATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'NDOCSUM'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SKPPPOL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SKPPSENDER'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'SBIS.CREATESBISPACK'
  end
  object qParseUPDsh: TOraQuery
    SQL.Strings = (
      
        'with s as(select o.nazv, o.filename, xml.blob_to_xmltype(file_in' +
        'ternal) xml '
      '     from fileuser.all_files t,'
      '          skladuser.sbisobj o'
      '          where t.id = o.id_file'
      '            and o.idpack = :idpack)'
      ''
      'select t.*,        '
      
        '       (select count(kpp.kpp) from skladuser.contr_kpp kpp where' +
        ' kpp.contr_id = caprod and kpp.kpp = prodkpp) as prodkppcount,'
      
        '       (select count(kpp.kpp) from skladuser.contr_kpp kpp where' +
        ' kpp.contr_id = capokup and kpp.kpp = pokupkpp) as pokupkppcount'
      'from ('
      'SELECT scf.*,prod.*, pokup.*,'
      
        '       (select sb.contrsender from skladuser.sbispack sb where s' +
        'b.id = :idpack)  as caprod,'
      
        '       (select sb.contrpol from skladuser.sbispack sb where sb.i' +
        'd = :idpack)   as capokup,'
      '       to_number(itog.sumbezNDS,'#39'9999999999.999'#39') as sumbezNDS,'
      '       to_number(itog.sumnal,'#39'9999999999.999'#39') as sumnal,'
      '       to_number(itog.sumuchNDS,'#39'9999999999.999'#39') as sumuchNDS'
      '     --  func'
      '   from  s ,'
      '  XMLTABLE ('#39#1060#1072#1081#1083'/'#1044#1086#1082#1091#1084#1077#1085#1090'/'#1057#1074#1057#1095#1060#1072#1082#1090#39' passing s.xml'
      '            COLUMNS '
      '              scf_docdate varchar2(255)  path '#39'@'#1044#1072#1090#1072#1057#1095#1060#39','
      '              scf_docnum varchar2(255)   path '#39'@'#1053#1086#1084#1077#1088#1057#1095#1060#39
      '           ) as scf,'
      
        '             XMLTABLE ('#39#1060#1072#1081#1083'/'#1044#1086#1082#1091#1084#1077#1085#1090'/'#1057#1074#1057#1095#1060#1072#1082#1090'/'#1057#1074#1055#1088#1086#1076'/'#1048#1076#1057#1074'/'#1057#1074#1070#1051#1059 +
        #1095#39' passing s.xml'
      '            COLUMNS '
      '              prodinn varchar2(255)  path '#39'@'#1048#1053#1053#1070#1051#39','
      '              prodkpp varchar2(255)  path '#39'@'#1050#1055#1055#39
      '           ) as prod'
      '           ,'
      '  XMLTABLE ('#39#1060#1072#1081#1083'/'#1044#1086#1082#1091#1084#1077#1085#1090#39' passing s.xml'
      '            COLUMNS '
      '              func     varchar2(255)  path '#39'@'#1060#1091#1085#1082#1094#1080#1103#39','
      
        '              pokupinn varchar2(255)  path '#39#1057#1074#1057#1095#1060#1072#1082#1090'/'#1057#1074#1055#1086#1082#1091#1087'/'#1048#1076#1057 +
        #1074'/'#1057#1074#1070#1051#1059#1095'/@'#1048#1053#1053#1070#1051#39','
      
        '              pokupkpp varchar2(255)  path '#39#1057#1074#1057#1095#1060#1072#1082#1090'/'#1057#1074#1055#1086#1082#1091#1087'/'#1048#1076#1057 +
        #1074'/'#1057#1074#1070#1051#1059#1095'/@'#1050#1055#1055#39
      '           ) as pokup'
      '           ,'
      '  XMLTABLE ('#39#1060#1072#1081#1083'/'#1044#1086#1082#1091#1084#1077#1085#1090#39' passing s.xml'
      '            COLUMNS '
      
        '              sumbezNDS varchar2(255)  path '#39#1058#1072#1073#1083#1057#1095#1060#1072#1082#1090'/'#1042#1089#1077#1075#1086#1054#1087#1083 +
        '/@'#1057#1090#1058#1086#1074#1041#1077#1079#1053#1044#1057#1042#1089#1077#1075#1086#39','
      
        '              sumNal    varchar2(255)  path '#39#1058#1072#1073#1083#1057#1095#1060#1072#1082#1090'/'#1042#1089#1077#1075#1086#1054#1087#1083 +
        '/'#1057#1091#1084#1053#1072#1083#1042#1089#1077#1075#1086'/'#1057#1091#1084#1053#1072#1083#39','
      
        '              sumuchNDS varchar2(255)  path '#39#1058#1072#1073#1083#1057#1095#1060#1072#1082#1090'/'#1042#1089#1077#1075#1086#1054#1087#1083 +
        '/@'#1057#1090#1058#1086#1074#1059#1095#1053#1072#1083#1042#1089#1077#1075#1086#39
      '           ) as itog           '
      '           '
      '           '
      '           ) t')
    Left = 308
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpack'
        Value = nil
      end>
  end
  object qParseUpdSod: TOraQuery
    SQL.Strings = (
      
        'with s as(select o.nazv, o.filename, xml.blob_to_xmltype(file_in' +
        'ternal) xml '
      '     from fileuser.all_files t,'
      '          skladuser.sbisobj o'
      '          where t.id = o.id_file'
      '            and o.idpack = :idpack)'
      '            '
      'select s.func,'
      '       s.numb,'
      '       s.text,'
      '       s.nalst,'
      '       s.summa,'
      '       s.summanal,'
      '       s.kolvo,'
      '       nvl(s.price,s.summa) as price,'
      '       s.nalog,'
      '       s.akc,'
      '       s.KOD,'
      '       case when s.kod is null then '#39'1'#39
      
        '         else (select ed.ednum from skladuser.ed_ism ed where ed' +
        '.kod = s.kod) '
      '       end as ed_ism,'
      
        '       (select n.schid from skladuser.nalog_sch n where n.realpe' +
        'rc = s.nalst) as nalsch'
      '       from ('
      '       '
      'select '
      '       headschf.func,'
      '       tablschf.numb,'
      '       tablschf.text,'
      
        '       to_number(substr(tablschf.nalst,1,length(tablschf.nalst)-' +
        '1),'#39'9999999999.9999999'#39') as nalst,'
      '       to_number(tablschf.summa,'#39'9999999999.9999999'#39') as summa,'
      
        '       to_number(tablschf.summanal,'#39'9999999999.9999999'#39') as summ' +
        'anal,'
      
        '       nvl(to_number(tablschf.kolvo,'#39'9999999999.9999999'#39'),1) as ' +
        'kolvo,'
      '       to_number(tablschf.price,'#39'9999999999.9999999'#39') as price,'
      '       to_number(tablschf.nalog,'#39'9999999999.9999999'#39') as nalog,'
      '       tablschf.akc,'
      '       tablschf.KOD'
      '       '
      '        from s ,   '
      '  XMLTABLE ('#39#1060#1072#1081#1083'/'#1044#1086#1082#1091#1084#1077#1085#1090'/'#1058#1072#1073#1083#1057#1095#1060#1072#1082#1090'/'#1057#1074#1077#1076#1058#1086#1074#39' passing s.xml'
      '            COLUMNS '
      '              numb varchar2(255)  path '#39'@'#1053#1086#1084#1057#1090#1088#39','
      '              text varchar2(255)  path '#39'@'#1053#1072#1080#1084#1058#1086#1074#39','
      '              nalst varchar2(255)  path '#39'@'#1053#1072#1083#1057#1090#39','
      '              summa varchar2(255) path '#39'@'#1057#1090#1058#1086#1074#1041#1077#1079#1053#1044#1057#39','
      '              summanal varchar2(255) path '#39'@'#1057#1090#1058#1086#1074#1059#1095#1053#1072#1083#39',      '
      '              kolvo varchar2(255) path '#39'@'#1050#1086#1083#1058#1086#1074#39','
      '              KOD varchar2(255) path '#39'@'#1054#1050#1045#1048'_'#1058#1086#1074#39','
      '              price varchar2(255) path '#39'@'#1062#1077#1085#1072#1058#1086#1074#39','
      '              numstr varchar2(255) path '#39'@'#1053#1086#1084#1057#1090#1088#39',     '
      '              nalog varchar(255) path '#39#1057#1091#1084#1053#1072#1083'/'#1057#1091#1084#1053#1072#1083#39','
      
        '              akc varchar2(255) path '#39#1040#1082#1094#1080#1079'/'#1041#1077#1079#1040#1082#1094#1080#1079#39'           ' +
        ' '
      '           ) tablschf,'
      '  XMLTABLE ('#39#1060#1072#1081#1083'/'#1044#1086#1082#1091#1084#1077#1085#1090#39' passing s.xml'
      '            COLUMNS'
      '              func varchar2(255) path '#39'@'#1060#1091#1085#1082#1094#1080#1103#39
      '           ) headschf   '
      '           where (headschf.func = :func or :func is null)    '
      '           ) s')
    Left = 384
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpack'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'func'
        Value = nil
      end>
  end
  object qReadySFFRM: TOraQuery
    SQL.Strings = (
      'select t5.*'
      'from rp_doc_frm t5'
      'where t5.opnum = :OPNUM'
      '  and t5.doctype = '#39'FrmOgpSchet'#39)
    Left = 384
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OPNUM'
        Value = nil
      end>
  end
  object MTAKT: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'Dolzhn'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'Familiya'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'Imya'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'Otchestvo'
        DataType = ftString
        Size = 128
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 88
    Top = 8
    object MTAKTDolzhn: TStringField
      FieldName = 'Dolzhn'
      Size = 256
    end
    object MTAKTFamiliya: TStringField
      FieldName = 'Familiya'
      Size = 128
    end
    object MTAKTImya: TStringField
      FieldName = 'Imya'
      Size = 128
    end
    object MTAKTOtchestvo: TStringField
      FieldName = 'Otchestvo'
      Size = 128
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object Dolzhn: TMTStringDataFieldEh
          FieldName = 'Dolzhn'
          StringDataType = fdtStringEh
          Size = 256
        end
        object Familiya: TMTStringDataFieldEh
          FieldName = 'Familiya'
          StringDataType = fdtStringEh
          Size = 128
        end
        object Imya: TMTStringDataFieldEh
          FieldName = 'Imya'
          StringDataType = fdtStringEh
          Size = 128
        end
        object Otchestvo: TMTStringDataFieldEh
          FieldName = 'Otchestvo'
          StringDataType = fdtStringEh
          Size = 128
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
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
    Left = 308
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dates'
        Value = nil
      end>
  end
  object qDocs: TOraQuery
    SQL.Strings = (
      'select * from ('
      'select t.*,stat.namestat, '
      '           case when(t.ispol = 1)'
      '             then contrsender'
      '             else contrpol'
      '           end as contr_id,'
      '           contrpol.fullname as polname,'
      '           contrsend.fullname as sendername,'
      
        '           (select count(*) as arc from skladuser.arc_doc_link a' +
        'l '
      '            where al.log_name = '#39'SBISLOG'#39
      '              and al.log_doc_id = t.id) as arc/*,'
      '              po.sklad,'
      '              po.docnum as podocnum,'
      '              po.summadoc,'
      '              po.summanal*/'
      '       from skladuser.sbispack t, '
      '                skladuser.company_ca ca,'
      '                skladuser.sbisstatus stat,'
      '                skladuser.contragents_view contrpol,'
      '                skladuser.contragents_view contrsend/*,'
      '                skladuser.po_base po*/'
      '       where '
      '              ((t.ispol = 0 '
      '              and ca.contr_id = t.contrsender'
      '              and :ispol = 0) or'
      '              (t.ispol = 1 '
      '              and ca.contr_id = t.contrpol'
      '              and :ispol = 1))'
      '         and ca.company_id = :company_id'
      '         and t.curstatus = stat.id'
      '         and t.contrpol = contrpol.contr_id'
      '         and t.contrsender = contrsend.contr_id'
      '         and to_date(t.docdate) between :dates and :datef'
      '         and (t.actual = 1 or :notactual = 1)'
      '         /*and t.sklopnum = po.opnum(+)*/'
      '         ) t'
      'where  (t.contr_id = :inContrId or :inContrId is null)'
      '&macrofilter'
      'order by t.createdate desc,t.docdate desc')
    Left = 396
    Top = 6
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
  object qSBISObj: TOraQuery
    SQL.Strings = (
      'select t1.*, t2.typdoc from SBISOBJ t1, SBISTYPES t2'
      'where t1.idpack = :idpack'
      '      and t2.id = t1.typid')
    Left = 352
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpack'
        Value = nil
      end>
  end
  object qPackView: TOraQuery
    SQL.Strings = (
      
        'select t1.id, t1.idedo, t1.idso, t1.docdate, t1.createdate, t1.d' +
        'ate_last_ver, trunc(t1.status_last) as status_last, t1.contredo '
      'from skladuser.sbispack t1'
      
        'where t1.id = (select max(t2.id) from skladuser.sbispack t2, skl' +
        'aduser.sbis_join t3'
      '               where t3.id_jn = :docid'
      '                     and t2.id = t3.idpack'
      '                     and t2.actual = 1'
      '                     and t2.ispol = 0)')
    Left = 392
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'docid'
        Value = nil
      end>
  end
  object spModyfiSBISPack: TOraStoredProc
    StoredProcName = 'SBIS.SAVE_SBISPACK'
    SQL.Strings = (
      'declare'
      '  v_BISNEWPACK boolean := sys.DIUTIL.INT_TO_BOOL(:BISNEWPACK);'
      'begin'
      
        '  SBIS.SAVE_SBISPACK(:NACTION, :SIDEDO, :SDOCID, :SUSERID, :NCON' +
        'TREDO, :SAPP, :NCONTRSENDER, :NCONTRPOL, :NISPOL, :SINNPOL, :SIN' +
        'NSENDER, :SIDSO, :SDATE, :SSTATUS, :SDOCNUM, :SDOCTYPE, :SDOCDAT' +
        'E, :NDOCSUM, :SKPPPOL, :SKPPSENDER, :V_RELEASEDATE, :V_RELEASEID' +
        'SO, :NIDPACK, v_BISNEWPACK, :IN_TABLE_JN, :POLD_IDSO, :PSKLOPNUM' +
        ');'
      'end;')
    Left = 32
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NACTION'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SIDEDO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'SDOCID'
        ParamType = ptInput
        Value = nil
        Table = True
      end
      item
        DataType = ftString
        Name = 'SUSERID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'NCONTREDO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SAPP'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'NCONTRSENDER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'NCONTRPOL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'NISPOL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SINNPOL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SINNSENDER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SIDSO'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SDATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'SSTATUS'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'SDOCNUM'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SDOCTYPE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SDOCDATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'NDOCSUM'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SKPPPOL'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'SKPPSENDER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'V_RELEASEDATE'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'V_RELEASEIDSO'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftFloat
        Name = 'NIDPACK'
        ParamType = ptInputOutput
        Value = nil
      end
      item
        DataType = ftBoolean
        Name = 'BISNEWPACK'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'IN_TABLE_JN'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'POLD_IDSO'
        ParamType = ptOutput
        Size = 255
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'PSKLOPNUM'
        ParamType = ptInput
        Value = nil
        HasDefault = True
      end>
    CommandStoredProcName = 'SBIS.SAVE_SBISPACK'
  end
  object MTKSF: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'ProductName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'kodEIBefore'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'kodEIAfter'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'countBefore'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'countAfter'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'priceBefore'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'priceAfter'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'ndsBefore'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ndsAfter'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'STnotNDSBefore'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'STnotNDSAfter'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'STnotNDSInc'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'STnotNDSDec'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'STNDSBefore'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'STNDSAfter'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'STNDSInc'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'STNDSDec'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'sumNDSBefore'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'sumNDSAfter'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'sumNDSInc'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'sumNDSDec'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'akcBefore'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'akcAfter'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'akcInc'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'akcDec'
        DataType = ftFloat
        Precision = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 8
    Top = 56
    object MTKSFProductName: TStringField
      FieldName = 'ProductName'
      Size = 255
    end
    object MTKSFkodEIBefore: TStringField
      FieldName = 'kodEIBefore'
      Size = 3
    end
    object MTKSFkodEIAfter: TStringField
      FieldName = 'kodEIAfter'
      Size = 3
    end
    object MTKSFcountBefore: TFloatField
      FieldName = 'countBefore'
    end
    object MTKSFcountAfter: TFloatField
      FieldName = 'countAfter'
    end
    object MTKSFpriceBefore: TFloatField
      FieldName = 'priceBefore'
    end
    object MTKSFpriceAfter: TFloatField
      FieldName = 'priceAfter'
    end
    object MTKSFndsBefore: TStringField
      FieldName = 'ndsBefore'
    end
    object MTKSFndsAfter: TStringField
      FieldName = 'ndsAfter'
    end
    object MTKSFSTnotNDS: TFloatField
      FieldName = 'STnotNDSBefore'
    end
    object MTKSFSTnotNDS2: TFloatField
      FieldName = 'STnotNDSAfter'
    end
    object MTKSFSTnotNDS3: TFloatField
      FieldName = 'STnotNDSInc'
    end
    object MTKSFSTnotNDS4: TFloatField
      FieldName = 'STnotNDSDec'
    end
    object MTKSFSTNDS: TFloatField
      FieldName = 'STNDSBefore'
    end
    object MTKSFSTNDS2: TFloatField
      FieldName = 'STNDSAfter'
    end
    object MTKSFSTNDS3: TFloatField
      FieldName = 'STNDSInc'
    end
    object MTKSFSTNDS4: TFloatField
      FieldName = 'STNDSDec'
    end
    object MTKSFsumNDSBefore: TFloatField
      FieldName = 'sumNDSBefore'
    end
    object MTKSFsumNDSAfter: TFloatField
      FieldName = 'sumNDSAfter'
    end
    object MTKSFsumNDSDiff: TFloatField
      FieldName = 'sumNDSInc'
    end
    object MTKSFsumNDSDiff2: TFloatField
      FieldName = 'sumNDSDec'
    end
    object MTKSFakcBefore: TFloatField
      FieldName = 'akcBefore'
    end
    object MTKSFakcAfter: TFloatField
      FieldName = 'akcAfter'
    end
    object MTKSFakcDiff: TFloatField
      FieldName = 'akcInc'
    end
    object MTKSFakcDiff2: TFloatField
      FieldName = 'akcDec'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ProductName: TMTStringDataFieldEh
          FieldName = 'ProductName'
          StringDataType = fdtStringEh
          Size = 255
        end
        object kodEIBefore: TMTStringDataFieldEh
          FieldName = 'kodEIBefore'
          StringDataType = fdtStringEh
          Size = 3
        end
        object kodEIAfter: TMTStringDataFieldEh
          FieldName = 'kodEIAfter'
          StringDataType = fdtStringEh
          Size = 3
        end
        object countBefore: TMTNumericDataFieldEh
          FieldName = 'countBefore'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object countAfter: TMTNumericDataFieldEh
          FieldName = 'countAfter'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object priceBefore: TMTNumericDataFieldEh
          FieldName = 'priceBefore'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object priceAfter: TMTNumericDataFieldEh
          FieldName = 'priceAfter'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object ndsBefore: TMTStringDataFieldEh
          FieldName = 'ndsBefore'
          StringDataType = fdtStringEh
        end
        object ndsAfter: TMTStringDataFieldEh
          FieldName = 'ndsAfter'
          StringDataType = fdtStringEh
        end
        object STnotNDSBefore: TMTNumericDataFieldEh
          FieldName = 'STnotNDSBefore'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object STnotNDSAfter: TMTNumericDataFieldEh
          FieldName = 'STnotNDSAfter'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object STnotNDSInc: TMTNumericDataFieldEh
          FieldName = 'STnotNDSInc'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object STnotNDSDec: TMTNumericDataFieldEh
          FieldName = 'STnotNDSDec'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object STNDSBefore: TMTNumericDataFieldEh
          FieldName = 'STNDSBefore'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object STNDSAfter: TMTNumericDataFieldEh
          FieldName = 'STNDSAfter'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object STNDSInc: TMTNumericDataFieldEh
          FieldName = 'STNDSInc'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object STNDSDec: TMTNumericDataFieldEh
          FieldName = 'STNDSDec'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object sumNDSBefore: TMTNumericDataFieldEh
          FieldName = 'sumNDSBefore'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object sumNDSAfter: TMTNumericDataFieldEh
          FieldName = 'sumNDSAfter'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object sumNDSInc: TMTNumericDataFieldEh
          FieldName = 'sumNDSInc'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object sumNDSDec: TMTNumericDataFieldEh
          FieldName = 'sumNDSDec'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object akcBefore: TMTNumericDataFieldEh
          FieldName = 'akcBefore'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object akcAfter: TMTNumericDataFieldEh
          FieldName = 'akcAfter'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object akcInc: TMTNumericDataFieldEh
          FieldName = 'akcInc'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object akcDec: TMTNumericDataFieldEh
          FieldName = 'akcDec'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object MTAKTS: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'NumDoc'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Remark'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRIH_RASH'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DateDoc'
        DataType = ftDate
      end
      item
        Name = 'SumDoc'
        DataType = ftFloat
        Precision = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 56
    object MTAKTSNumDoc: TStringField
      DisplayWidth = 20
      FieldName = 'NumDoc'
    end
    object MTAKTSRemark: TStringField
      DisplayWidth = 20
      FieldName = 'Remark'
    end
    object MTAKTSPRIH_RASH: TStringField
      DisplayWidth = 1
      FieldName = 'PRIH_RASH'
      Size = 1
    end
    object MTAKTSDateDoc: TDateField
      DisplayWidth = 10
      FieldName = 'DateDoc'
    end
    object MTAKTSSumDoc: TFloatField
      DisplayWidth = 10
      FieldName = 'SumDoc'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object NumDoc: TMTStringDataFieldEh
          FieldName = 'NumDoc'
          StringDataType = fdtStringEh
        end
        object Remark: TMTStringDataFieldEh
          FieldName = 'Remark'
          StringDataType = fdtStringEh
        end
        object PRIH_RASH: TMTStringDataFieldEh
          FieldName = 'PRIH_RASH'
          StringDataType = fdtStringEh
          Size = 1
        end
        object DateDoc: TMTDateTimeDataFieldEh
          FieldName = 'DateDoc'
          DateTimeDataType = fdtDateEh
        end
        object SumDoc: TMTNumericDataFieldEh
          FieldName = 'SumDoc'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object qCompany: TOraQuery
    SQL.Strings = (
      
        'select t.* from skladuser.company_ca t where t.company_id = :com' +
        'pany_id')
    Left = 208
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'company_id'
        Value = nil
      end>
  end
end
