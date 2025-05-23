object dmSBISResponse: TdmSBISResponse
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 980
  Top = 300
  Height = 310
  Width = 400
  object spSetPackStatus: TOraStoredProc
    StoredProcName = 'SBIS.SetPackStatus'
    SQL.Strings = (
      'begin'
      
        '  :RESULT := SBIS.SetPackStatus(:SIDEDO, :NSTATUS, :DCHANGETIME,' +
        ' :SDETAIL, :SIDSO, :SLASTDATEVERSION);'
      'end;')
    Left = 32
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'RESULT'
        ParamType = ptResult
        IsResult = True
      end
      item
        DataType = ftString
        Name = 'SIDEDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NSTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DCHANGETIME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SDETAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SIDSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SLASTDATEVERSION'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'SBIS.SetPackStatus'
  end
  object xmlResponse: TXMLDocument
    Left = 272
    Top = 16
    DOMVendorDesc = 'MSXML'
  end
  object qIniSet: TOraQuery
    SQL.Strings = (
      'select * from skladuser.iniset t '
      'where t.sect = '#39'EDO'#39
      '  and t.ident = :ident')
    Left = 328
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ident'
      end>
  end
  object spCreatePack: TOraStoredProc
    StoredProcName = 'SBIS.CreateSbisPack'
    SQL.Strings = (
      'begin'
      
        '  :RESULT := SBIS.CreateSbisPack(:SIDEDO, :SDOCID, :SUSERID, :NC' +
        'ONTREDO, :SAPP, :NCONTRSENDER, :NCONTRPOL, :NISPOL, :SINNPOL, :S' +
        'INNSENDER, :SIDSO, :SDATE, :SSTATUS, :SDOCNUM, :SDOCTYPE, :SDOCD' +
        'ATE, :NDOCSUM, :SKPPPOL, :SKPPSENDER);'
      'end;')
    Left = 112
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'RESULT'
        ParamType = ptResult
        IsResult = True
      end
      item
        DataType = ftString
        Name = 'SIDEDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SDOCID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SUSERID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NCONTREDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SAPP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NCONTRSENDER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NCONTRPOL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NISPOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SINNPOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SINNSENDER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SIDSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SDATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SSTATUS'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'SDOCNUM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SDOCTYPE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SDOCDATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NDOCSUM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SKPPPOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SKPPSENDER'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'SBIS.CreateSbisPack'
  end
  object qFileIDNew: TOraQuery
    SQL.Strings = (
      'select fileuser.all_files_seq.nextval val from dual')
    Left = 336
    Top = 72
  end
  object qFiles: TOraQuery
    SQL.Strings = (
      'select * from fileuser.all_files t where id = 0')
    Left = 328
    Top = 136
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
    Left = 32
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'RESULT'
        ParamType = ptResult
        IsResult = True
      end
      item
        DataType = ftFloat
        Name = 'ACTION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'V_ID'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'V_FILENAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'V_DATEOTPR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'V_IDPACK'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'V_APP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'V_ID_FILE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'V_IDDOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'V_TYPDOC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'V_POL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'V_ISDEL'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftFloat
        Name = 'V_CONTREDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'V_USER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'V_NAZV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'V_ID_SBIS'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'V_RELEASEDATE'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftFloat
        Name = 'V_RELEASENUM'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'V_DOC_NUM'
        ParamType = ptInput
        HasDefault = True
      end>
    CommandStoredProcName = 'sbis.UpdateSBISObj'
  end
  object spInsArcDocCopy: TOraStoredProc
    StoredProcName = 'sbis.InsArcDocCopy'
    SQL.Strings = (
      'begin'
      '  sbis.InsArcDocCopy(:PACTION, :PIDPACK, :PNFILEID, :PCNT_FILE);'
      'end;')
    Left = 32
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PACTION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPACK'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PNFILEID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PCNT_FILE'
        ParamType = ptInputOutput
      end>
    CommandStoredProcName = 'sbis.InsArcDocCopy'
  end
  object spModifySbispack: TOraStoredProc
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
    Left = 29
    Top = 151
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NACTION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SIDEDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SDOCID'
        ParamType = ptInput
        Table = True
      end
      item
        DataType = ftString
        Name = 'SUSERID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NCONTREDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SAPP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NCONTRSENDER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NCONTRPOL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NISPOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SINNPOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SINNSENDER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SIDSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SDATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SSTATUS'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'SDOCNUM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SDOCTYPE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SDOCDATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NDOCSUM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SKPPPOL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SKPPSENDER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'V_RELEASEDATE'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'V_RELEASEIDSO'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftFloat
        Name = 'NIDPACK'
        ParamType = ptInputOutput
      end
      item
        DataType = ftBoolean
        Name = 'BISNEWPACK'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'IN_TABLE_JN'
        ParamType = ptInput
        HasDefault = True
      end
      item
        DataType = ftString
        Name = 'POLD_IDSO'
        ParamType = ptOutput
        Size = 255
      end
      item
        DataType = ftFloat
        Name = 'PSKLOPNUM'
        ParamType = ptInput
        HasDefault = True
      end>
    CommandStoredProcName = 'SBIS.SAVE_SBISPACK'
  end
  object spDelVloj: TOraStoredProc
    StoredProcName = 'SBIS.DelVloj'
    SQL.Strings = (
      'begin'
      '  SBIS.DelVloj(:IN_IDSO);'
      'end;')
    Left = 112
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_IDSO'
        ParamType = ptInput
      end>
    CommandStoredProcName = 'SBIS.DelVloj'
  end
end
