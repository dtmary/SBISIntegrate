unit uSBISUtility;

interface

uses Windows, uSBIS, PlugDMUnit, UtilUnit, Ora, sysutils, ConstPrintDoc, Forms,
  Messages, uDMShared, uSbisXmlBase, OraError, uDMSbis, PrintDocUnit, Controls,
  uRdySbisPackParams, uSBISViewDocs, Variants;

type
  EDataFoundException = class(Exception);
    EAlreadySendException = class(Exception);

    TDocType = (pAkt, pSF, pSchet, pNakl, pUPD, pUKDk, pUKDi, pAktS);
    TDocTypeSet = set of TDocType;

    procedure ReadyNaklToXML(id: integer; SbisNakl: TSbisNakl; p_TypeOp: string);
    procedure ReadySFTOXML(id: integer; SbisSF: TSbisSF; p_TypeOp: string; p_DocType: TDocTypeSet; params: recRdySbisPackParams);
    procedure SbisSendPack(Docid: integer; appref: string; p_DocType: TDocTypeSet; p_TypeOp: string = ''; p_BegDate: string = ''; p_EndDate: string = ''; p_IdCa: integer = 0);
    procedure sbisDelDoc(id: integer; appref: string);
    procedure FinSchetToXML(id: integer; SbisSchet: TSbisSchet);
    procedure FinSFTOXML(id: integer; SbisSF: TSbisSF);
    procedure FacAktToXML(id: integer; SbisAkt: TSbisAkt);
    procedure FacSfToXML(id: integer; SbisSF: TSbisSF; SbisNakl: TSbisNakl);
    procedure ReadyAktToXML(id: integer; SbisAkt: TSbisAkt);
    procedure ReadyUKDTOXML(id: integer; SbisUKD: TSbisUKD; p_TypeOp: string);
    procedure FacUKDTOXML(id: integer; SbisUKD: TSbisUKD; p_TypeOp: string);
    procedure CRMActTOXML(id: integer; SbisAktS: TSbisAktS; p_BegDate: string = ''; p_EndDate: string = '');

    function PosSymbol(in_Str: string): string;

implementation

procedure sbisDelDoc(id: integer; appref: string);
var
  dmSbis: tDmSbis;
begin
  dmSbis := tDmSbis.GetInstance;
  dmSbis.spDelDoc.ParamByName('V_ID').AsInteger := id;
  dmSbis.spDelDoc.ParamByName('V_APP').AsString := appref;
  dmSbis.spDelDoc.ParamByName('V_USER_ID').AsString := User_id;
  dmSbis.spDelDoc.ExecProc;
end;

procedure ReadyAktToXML(id: integer; SbisAkt: TSbisAkt);
var
  value:string;
begin
  PlugDM.qPrint.close;
  PlugDM.qPrint.ParamByName('opnum').value := id;
  PlugDM.qPrint.Open;
  PlugDM.qDocLines.close;
  PlugDM.qDocLines.ParamByName('OPNUM').AsInteger := id;
  PlugDM.qDocLines.ParamByName('typ_doc').AsInteger := 1;
  PlugDM.qDocLines.Open;

  PlugDM.qr_Get_RP_DOC_AKT_COMM.Close;
  PlugDM.qr_Get_RP_DOC_AKT_COMM.ParamByName('opnum').AsFloat := id;
  PlugDM.qr_Get_RP_DOC_AKT_COMM.ParamByName('COMPANY_ID').AsInteger := PlugDM.qPrint.FieldByName('COMPANY_ID').AsInteger;
  PlugDM.qr_Get_RP_DOC_AKT_COMM.Open;

  PlugDM.qrShippingType.Close;
  PlugDM.qrShippingType.ParamByName('frmid').AsString := PlugDM.qPrint.FieldByName('frmid').AsString;
  PlugDM.qrShippingType.Open;

  SbisAkt.CDest.id := PlugDM.qPrint.FieldByName('TRUEDEST').AsInteger; //  SbisAkt.CDest.id := PlugDM.qPrint.FieldByName('CONTR_ID').AsInteger; //в акте №2100 от 16.12.2021 в поле заказчика вышел получатель
  SbisAkt.CDest.KPP := PlugDM.qPrint.FieldByName('PolKpp').AsString;     //09.07.2020, вывод КПП заказчика, при выгрузке подставлялся КПП по умолчанию
  SbisAkt.CDest.BankRekv.NomSch := PlugDM.qPrint.FieldByName('GRPOLSCHET').AsString;
  SbisAkt.CDest.BankRekv.NameBank := PlugDM.qPrint.FieldByName('GRPOLBANK').AsString;
  SbisAkt.CDest.BankRekv.bik := PlugDM.qPrint.FieldByName('GRPOLMFO').AsString;
  SbisAkt.CDest.BankRekv.KorSch := PlugDM.qPrint.FieldByName('GRPOLCORSCHET').AsString;
  SbisAkt.CSender.DocDate := PlugDM.qPrint.FieldByName('Actual_Date').AsString;
  SbisAkt.CSender.id := PlugDM.qPrint.FieldByName('SELF_COD').AsInteger;
  SbisAkt.CSender.BankRekv.NomSch := PlugDM.qPrint.FieldByName('POSTSCHET').AsString;
  SbisAkt.CSender.BankRekv.NameBank := PlugDM.qPrint.FieldByName('POSTBANK').AsString;
  SbisAkt.CSender.BankRekv.bik := PlugDM.qPrint.FieldByName('POSTMFO').AsString;
  SbisAkt.CSender.BankRekv.KorSch := PlugDM.qPrint.FieldByName('POSTCORSCHET').AsString;
  SbisAkt.CSignatory.id := PlugDM.qPrint.FieldByName('SELF_COD').AsInteger;
  SbisAkt.DocNum := PlugDM.qPrint.FieldByName('DOCNUM_N').AsString;
  SbisAkt.DocDate := PlugDM.qPrint.FieldByName('ACTUAL_DATE').AsString;
  SbisAkt.kodOKV := PlugDM.qPrint.FieldByName('EDOKEI').AsString;
  SbisAkt.NameVal := PlugDM.qPrint.FieldByName('SBIS_EDFULLNAME').AsString; //PlugDM.qPrint.FieldByName('VAL').AsString; - было до 29.12.2020, вышла ошибка при отправке пакета документов
  SbisAkt.SumSNDS := PlugDM.qPrint.FieldByName('SUMMASF').asfloat;

  SbisAkt.Osn := PlugDM.qPrint.FieldByName('STNAME').AsString;
  SbisAkt.OsnDocnum := PlugDM.qPrint.FieldByName('OBOSN_NOM_DOC').AsString;
  SbisAkt.osnDocdate := PlugDM.qPrint.FieldByName('OBOSN_DATA_DOC').AsString;
  if PlugDM.qPrint.FieldByName('parent_id').AsString <> '' then
    SbisAkt.OsnDop := '(' + PlugDM.qPrint.FieldByName('STNAME_PARENT').AsString + ' № ' + PlugDM.qPrint.FieldByName('DOCNUM_PARENT').AsString + ' от ' + PlugDM.qPrint.FieldByName('DATE_PARENT').AsString + ')'
  else
    SbisAkt.OsnDop := '';

  SbisAkt.Recipient := PlugDM.qPrint.FieldByName('POLNAMESHORT').AsString
                      + ' ИНН ' + PlugDM.qPrint.FieldByName('POLINN').AsString
                      + ' КПП ' + PlugDM.qPrint.FieldByName('POLKPP').AsString
                      + ' Адрес: ' + PlugDM.qPrint.FieldByName('PolPost').AsString;
  SbisAkt.BegWork := PlugDM.qPrint.FieldByName('akt_date_work_beg').AsString;
  SbisAkt.EndWork := PlugDM.qPrint.FieldByName('akt_date_work_end').AsString;
  SbisAkt.Osn_podpis := PlugDM.qPrint.FieldByName('OSN_ACTION').AsString;
  SbisAkt.WorkRemark := PlugDM.qPrint.FieldByName('OBOSN_KOMMENT').AsString;
  if PlugDM.qPrint.FieldByName('DOC_NAME').AsString <> '' then
    SbisAkt.DocName := PlugDM.qPrint.FieldByName('DOC_NAME').AsString
  else
    SbisAkt.DocName := 'на поставку комплекса средст сбора и регистрации данных и выполнение работ по его монтажу в региональных подразделениях Дирекции тяги - филиала ОАО "РЖД"';

  if (PlugDM.qPrint.FieldByName('IsAKT').AsInteger <> 0) then
    begin
      if (PlugDM.qPrint.FieldByName('pgroup2').AsInteger = 25) then
        begin
          SbisAkt.AKTType := 'ЭЛМФПУ26';
          SbisAkt.DocType := 'АктВыпРабУсл';
        end
      else
        begin
          SbisAkt.AKTType := 'ЭЛМсКомиссией';
          SbisAkt.DocType := '-';
        end;
      if PlugDM.qPrint.FieldByName('RYK_NUM').value <> '' then
        SbisAkt.Podpisant.tabn := PlugDM.qPrint.FieldByName('RYK_NUM').value
      else
        begin
          readSetting(company_id, 'EDO', 'TABNPod', value);
          SbisAkt.Podpisant.tabn := value;
        end;
    end
  else
    begin
      SbisAkt.AKTType := '';
      SbisAkt.DocType := '';
      // Подписант - из настроек
      readSetting(company_id, 'EDO', 'TABNPod', value);
      SbisAkt.Podpisant.tabn := value;
    end;
  SbisAkt.tGarant := PlugDM.qPrint.FieldByName('PROC_GARANT').AsInteger;
  SbisAkt.SumGarant := PlugDM.qPrint.FieldByName('SUMMA_GARANT').AsFloat;
  SbisAkt.NDSGarant := PlugDM.qPrint.FieldByName('NDSSUM_GARANT').AsFloat;
  SbisAkt.CostGarant := PlugDM.qPrint.FieldByName('POSSUM_GARANT').AsFloat;

  while not(PlugDM.qDocLines.Eof) do
  begin
    SbisAkt.SfData.Append;
    SbisAkt.SfData.FieldByName('text').AsString := PlugDM.qDocLines.FieldByName('NAIM').AsString;
    SbisAkt.SfData.FieldByName('NameRab').AsString := PlugDM.qDocLines.FieldByName('NAIM').AsString;
    SbisAkt.SfData.FieldByName('Tax').AsString := PlugDM.qDocLines.FieldByName('REALPERC').AsString + '%';

    {if PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2', [])
       or PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2a', [])
       or PlugDM.qPrint.Locate('frmid', 'ActRbUsl2', []) then
      SbisAkt.SfData.FieldByName('price').AsFloat := 0
    else
      SbisAkt.SfData.FieldByName('price').AsFloat := PlugDM.qDocLines.FieldByName('PRICEPRX').asfloat;}
    case PlugDM.qrShippingType.FieldByName('Shipping_Type').AsInteger of
      0: SbisAkt.SfData.FieldByName('price').AsFloat := PlugDM.qDocLines.FieldByName('PRICEPRX').asfloat;
      1: SbisAkt.SfData.FieldByName('price').AsFloat := 0;
    end;
    SbisAkt.SfData.FieldByName('summa').asfloat := PlugDM.qDocLines.FieldByName('SUMMA').asfloat;
    SbisAkt.SfData.FieldByName('NALST').AsString := PlugDM.qDocLines.FieldByName('REALPERC').AsString+'%'; // Налоговая ставка
    SbisAkt.SfData.FieldByName('NALOG').asfloat := PlugDM.qDocLines.FieldByName('NDS').asfloat;
    SbisAkt.SfData.FieldByName('sumnal').AsFloat := PlugDM.qDocLines.FieldByName('SUMSNDS').AsFloat;
    SbisAkt.SfData.FieldByName('ZavNum').AsString := PlugDM.qDocLines.FieldByName('zavnum').AsString;

    {if (PlugDM.qDocLines.FieldByName('KOD_EI').AsInteger in [10, 0])
        or PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2', [])
        or PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2a', [])
        or PlugDM.qPrint.Locate('frmid', 'ActRbUsl2', []) then
      begin
        SbisAkt.SfData.FieldByName('KOD').AsString := '0000';
        SbisAkt.SfData.FieldByName('EDNAME').AsString := '-';
        SbisAkt.SfData.FieldByName('USL').AsString := '-';
        SbisAkt.SfData.FieldByName('KOLVO').AsString := '0'
      end
      else
      begin
        SbisAkt.SfData.FieldByName('KOD').AsString := PlugDM.qDocLines.FieldByName('KOD_ED_IZM').AsString;
        SbisAkt.SfData.FieldByName('EDNAME').AsString := PlugDM.qDocLines.FieldByName('EDNAME').AsString;
        SbisAkt.SfData.FieldByName('USL').AsString := PlugDM.qDocLines.FieldByName('EDNAME').AsString;    //???? как должно быть? 28.12.2020(были ошибки при отправке счет-фактуры)
        SbisAkt.SfData.FieldByName('kolvo').AsString := PlugDM.qDocLines.FieldByName('ITEM_COUNT').value;
      end;}
    case PlugDM.qrShippingType.FieldByName('Shipping_Type').AsInteger of
      0: begin
           SbisAkt.SfData.FieldByName('KOD').AsString := PlugDM.qDocLines.FieldByName('KOD_ED_IZM').AsString;
           SbisAkt.SfData.FieldByName('EDNAME').AsString := PlugDM.qDocLines.FieldByName('EDNAME').AsString;
           SbisAkt.SfData.FieldByName('USL').AsString := PlugDM.qDocLines.FieldByName('EDNAME').AsString;
           SbisAkt.SfData.FieldByName('kolvo').AsString := PlugDM.qDocLines.FieldByName('ITEM_COUNT').value;
         end;
      1: begin
           SbisAkt.SfData.FieldByName('KOD').AsString := '0000';
           SbisAkt.SfData.FieldByName('EDNAME').AsString := '-';
           SbisAkt.SfData.FieldByName('USL').AsString := '-';
           SbisAkt.SfData.FieldByName('KOLVO').AsString := '0'
         end;
    end;

    SbisAkt.SfData.Post;
    PlugDM.qDocLines.Next;
  end;

  while not(PlugDM.qr_Get_RP_DOC_AKT_COMM.Eof) do
    begin
      SbisAkt.AKTData.Append;
      SbisAkt.AKTData.FieldByName('Dolzhn').AsString := PlugDM.qr_Get_RP_DOC_AKT_COMM.FieldByName('DOLGN').AsString;
      SbisAkt.AKTData.FieldByName('Familiya').AsString := PlugDM.qr_Get_RP_DOC_AKT_COMM.FieldByName('FAMALY').AsString;
      //SbisAkt.AKTData.FieldByName('Imya').AsString := PlugDM.qr_Get_RP_DOC_AKT_COMM.FieldByName('DOLGN').AsString;
      //SbisAkt.AKTData.FieldByName('Otchestvo').AsString := PlugDM.qr_Get_RP_DOC_AKT_COMM.FieldByName('DOLGN').AsString;
      SbisAkt.AKTData.Post;
      PlugDM.qr_Get_RP_DOC_AKT_COMM.Next;
    end;
end;

procedure FacSfToXML(id: integer; SbisSF: TSbisSF; SbisNakl: TSbisNakl);
var
  value:string;
begin
  PlugDM.qrDocPlPor.close;
  PlugDM.qrDocPlPor.ParamByName('Id').value := id;
  PlugDM.qrDocPlPor.ParamByName('cId').value := company_id;
  PlugDM.qrDocPlPor.ParamByName('union_s').AsString := '0';
  PlugDM.qrDocPlPor.Open;
  PlugDM.qrSFList.close;
  PlugDM.qrSFList.ParamByName('ID').asfloat := PlugDM.qrDocPlPor.ParamByName('Id').asfloat;
  PlugDM.qrSFList.ParamByName('cId').value := company_id;
  PlugDM.qrSFList.ParamByName('union_s').AsString := '0';
  PlugDM.qrSFList.ParamByName('deffrm').AsString := 'FrmFaciActP';
  PlugDM.qrSFList.ParamByName('hidePerc').AsInteger := 1;
  PlugDM.qrSFList.Open;

  PlugDM.qrShippingType.Close;
  PlugDM.qrShippingType.ParamByName('frmid').AsString := PlugDM.qrDocPlPor.FieldByName('DOCFRMSF').AsString;
  PlugDM.qrShippingType.Open;

  SbisSF.CDest.id := PlugDM.qrDocPlPor.FieldByName('Dest').AsInteger;
  SbisSF.CDest.KPP := PlugDM.qrDocPlPor.FieldByName('DestKpp').AsString;
  SbisSF.CSender.id := PlugDM.qrDocPlPor.FieldByName('SENDERCOD').AsInteger;
  SbisSF.CSender.Name := PlugDM.qrDocPlPor.FieldByName('RSNAME').AsString;
  SbisSF.DocNum := PlugDM.qrDocPlPor.FieldByName('NUMPOR').AsString;
  SbisSF.DocDate := PlugDM.qrDocPlPor.FieldByName('DATE2').AsString;
  SbisSF.kodOKV := PlugDM.qrDocPlPor.FieldByName('CNTRKOD').AsInteger;
  SbisSF.sumUchNds := PlugDM.qrDocPlPor.FieldByName('SUMMA').asfloat;

  //Сведения о документах об отгрузке
  if (PlugDM.qrDocPlPor.FieldByName('TYP').AsString = 'FU') and (PlugDM.qrDocPlPor.FieldByName('PRZ_UPD').AsInteger = 1) then
    begin
      SbisSF.IsUPD := true;
      SbisSF.AddOtgrDoc(PlugDM.qrDocPlPor.FieldByName('NUMPOR').AsString, PlugDM.qrDocPlPor.FieldByName('DATEPOR').AsString, 'УПД');
    end
  else
    begin
      SbisSF.IsUPD := false;
      SbisSF.AddOtgrDoc(PlugDM.qrDocPlPor.FieldByName('NUMDOC').AsString, PlugDM.qrDocPlPor.FieldByName('DATE2').AsString, 'АКТ');
    end;

  if PlugDM.qrDocPlPor.FieldByName('OSNDOCNUM').AsString <> '' then
    begin
      if (PlugDM.qrDocPlPor.FieldByName('PARENTOSNDOCNUM').AsString <> '') then
          SbisNakl.osnovanie.docInfo := '(' + PlugDM.qrDocPlPor.FieldByName('PARENTOSNDOCNAME').AsString
                                        + ' ' + PlugDM.qrDocPlPor.FieldByName('PARENTOSNDOCNUM').AsString
                                        + ' от ' + PlugDM.qrDocPlPor.FieldByName('PARENTOSNDOCDATE').AsString + ')'
        else
          SbisNakl.osnovanie.docInfo := '';
      SbisNakl.osnovanie.Docname := PlugDM.qrDocPlPor.FieldByName('OSNDOCNAME').AsString;
      SbisNakl.osnovanie.DocNum := PlugDM.qrDocPlPor.FieldByName('OSNDOCNUM').AsString;
      SbisNakl.osnovanie.DocDate := PlugDM.qrDocPlPor.FieldByName('OSNDOCDATE').AsString;
    end;

  if PlugDM.qrDocPlPor.FieldByName('TAB_RU').AsString <> '' then
    SbisSF.Podpisant.tabn := PlugDM.qrDocPlPor.FieldByName('TAB_RU').AsString
  else
    begin
      // Подписант - из настроек
      readSetting(company_id, 'EDO', 'TABNPod', value);
      SbisSF.Podpisant.tabn := value;
    end;
  PlugDM.qrSFList.First;
  while not PlugDM.qrSFList.Eof do
    begin
      SbisSF.SFdata.Append;
      SbisSF.SfData.FieldByName('TEXT').AsString := PlugDM.qrSFList.FieldByName('STRNAME').AsString;
      SbisSF.SfData.FieldByName('KOD').AsString := PlugDM.qrSFList.FieldByName('CODE_OKEI').AsString;
      SbisSF.SfData.FieldByName('USL').AsString := PlugDM.qrSFList.FieldByName('EDIZM').AsString;
      SbisSF.SfData.FieldByName('SUMMA').AsString := floattostr(round(PlugDM.qrSFList.FieldByName('SUMMA').asfloat * 100) / 100);
      SbisSF.SfData.FieldByName('AKC').AsString := 'без акциза';
      SbisSF.SfData.FieldByName('NALST').AsString := PlugDM.qrSFList.FieldByName('NDS').AsString + '%';
      SbisSF.SfData.FieldByName('NALOG').AsString := floattostr(PlugDM.qrSFList.FieldByName('SUMNDS').asfloat);
      SbisSF.SfData.FieldByName('SUMNAL').AsString := floattostr(round((PlugDM.qrSFList.FieldByName('TOTALSUM').asfloat) * 100) / 100);
      SbisSF.sumUchNds := SbisSF.sumUchNds + SbisSF.SfData.FieldByName('SUMNAL').asfloat;
      SbisSF.SFdata.Post;
      PlugDM.qrSFList.Next;
    end;
end;

procedure FacAktToXML(id: integer; SbisAkt: TSbisAkt);
var
  value:string;
begin
  PlugDM.qrDocPlPor.close;
  PlugDM.qrDocPlPor.ParamByName('Id').value := id;
  PlugDM.qrDocPlPor.ParamByName('cId').value := company_id;
  PlugDM.qrDocPlPor.ParamByName('union_s').AsString := '0';
  PlugDM.qrDocPlPor.Open;
  PlugDM.qrSFList.close;
  PlugDM.qrSFList.ParamByName('ID').asfloat := PlugDM.qrDocPlPor.ParamByName('Id').asfloat;
  PlugDM.qrSFList.ParamByName('cId').value := company_id;
  PlugDM.qrSFList.ParamByName('union_s').AsString := '0';
  PlugDM.qrSFList.ParamByName('deffrm').AsString := 'FrmFaciActP';
  PlugDM.qrSFList.ParamByName('hidePerc').AsInteger := 1;
  PlugDM.qrSFList.Open;

  PlugDM.qrShippingType.Close;
  PlugDM.qrShippingType.ParamByName('frmid').AsString := PlugDM.qrDocPlPor.FieldByName('DOCFRMSF').AsString;
  PlugDM.qrShippingType.Open;

  SbisAkt.CDest.id := PlugDM.qrDocPlPor.FieldByName('Dest').AsInteger;
  SbisAkt.CDest.KPP := PlugDM.qrDocPlPor.FieldByName('DestKpp').AsString;
  SbisAkt.CSender.id := PlugDM.qrDocPlPor.FieldByName('SENDERCOD').AsInteger;
  SbisAkt.CSender.Name := PlugDM.qrDocPlPor.FieldByName('RSNAME').AsString;
  SbisAkt.DocNum := PlugDM.qrDocPlPor.FieldByName('NUMDOC').AsString;
  SbisAkt.DocDate := PlugDM.qrDocPlPor.FieldByName('DATE2').AsString;
  SbisAkt.kodOKV := PlugDM.qrDocPlPor.FieldByName('CNTRKOD').AsString;
  SbisAkt.NameVal :=  PlugDM.qrDocPlPor.FieldByName('edfnameSBIS').AsString;
  SbisAkt.SumSNDS := PlugDM.qrDocPlPor.FieldByName('SUMMA').asfloat;
  SbisAkt.Osn := PlugDM.qrDocPlPor.FieldByName('OSNTYPE').AsString;
  SbisAkt.OsnDocnum := PlugDM.qrDocPlPor.FieldByName('OSNDOCNUM').AsString;
  SbisAkt.osnDocdate := PlugDM.qrDocPlPor.FieldByName('OSNDOCDATE').AsString;
  SbisAkt.OsnDop := '';

  SbisAkt.TypeForm := 'прусл';

  if PlugDM.qrDocPlPor.FieldByName('TAB_RU').AsString <> '' then
    SbisAkt.Podpisant.tabn := PlugDM.qrDocPlPor.FieldByName('TAB_RU').AsString
  else
    begin
      // Подписант - из настроек
      readSetting(company_id, 'EDO', 'TABNPod', value);
      SbisAkt.Podpisant.tabn := value;
    end;

  while not(PlugDM.qrSFList.Eof) do
  begin
    SbisAkt.SfData.Append;
    SbisAkt.SfData.FieldByName('text').AsString := PlugDM.qrSFList.FieldByName('STRNAME').AsString;
    case PlugDM.qrShippingType.FieldByName('Shipping_Type').AsInteger of
      0: SbisAkt.SfData.FieldByName('KOD').AsString := '0000';
      1: SbisAkt.SfData.FieldByName('KOD').AsString := PlugDM.qrSFList.FieldByName('CODE_OKV').AsString;
    end;
    SbisAkt.SfData.FieldByName('summa').asfloat := PlugDM.qrSFList.FieldByName('SUMMA').asfloat;
    SbisAkt.SfData.FieldByName('NALST').AsString := PlugDM.qrSFList.FieldByName('NDS').AsString+'%'; // Налоговая ставка
    SbisAkt.SfData.FieldByName('Tax').AsString := PlugDM.qrSFList.FieldByName('NDS').AsString+'%'; // Налоговая ставка
    SbisAkt.SfData.FieldByName('NALOG').asfloat := PlugDM.qrSFList.FieldByName('SUMNDS').asfloat;
    SbisAkt.SfData.FieldByName('sumnal').AsFloat := PlugDM.qrSFList.FieldByName('TOTALSUM').AsFloat;
    PlugDM.qrSFList.Next;
    SbisAkt.SfData.Post;
  end;

end;

procedure SbisSendPack(Docid: integer; appref: string; p_DocType: TDocTypeSet; p_TypeOp: string = ''; p_BegDate: string = ''; p_EndDate: string = ''; p_IdCa: integer = 0);
var
  SbisPack: TSbisPack;
  SbisSF: TSbisSF;
  SbisNakl: TSbisNakl;
  SBisAkt :TSbisAkt;
  SbisUPD: TSbisUPD;
  SbisSchet: TSbisSchet;
  SbisAktS :TSbisAktS;
  params: recRdySbisPackParams;
  vL_IDSO, vL_appref, vL_packPref, vL_TablePref: string;
  vL_app: integer;
  SbisUKD: TSbisUKD;
  contrEdo: string;
begin
  //обнуляем значения параметров, почему-то в разных программах инициализируются разные значения.
  with params do
    begin
      needSF := false;
      needNakl := false;
      needAkt := false;
      showCount := false;
      IDOperEDO := 0;
      IsNewPackage := false;
    end;

  //определяем модуль РМ
  if pos('rdy', appref) <> 0 then
    begin
      vL_app := 1;
      vL_packPref := 'ReadyPack';
      vL_TablePref := 'RP_DOC';
    end;
  if pos('fin', appref) <> 0 then
    begin
      vL_app := 2;
      vL_TablePref := 'PL_POR';
      if pSchet in p_DocType then
        vL_packPref := 'FinSchet';
      if pSF in p_DocType then
        vL_packPref := 'FinSF_';
    end;
  if pos('fac', appref) <> 0 then
    begin
      vL_app := 3;
      vL_packPref := 'FacilPack';
      vL_TablePref := 'PLPP';
    end;
  if pos('crm', appref) <> 0 then
    begin
      vL_app := 4;
      vL_packPref := 'CRMPack';
      vL_TablePref := 'contragents';
      dmSbis := tDmSbis.GetInstance;
    end;

  try
    try
      SbisSF := TSbisSF.Create;
      SbisUPD := TSbisUPD.Create;
      SbisNakl := TSbisNakl.Create;
      SBisAkt := TSbisAkt.Create;
      SbisSchet := TSbisSchet.Create;
      SbisUKD := TSbisUKD.Create;
      SbisAktS := TSbisAktS.Create;

      //ищем предыдущую выгрузку по ID(opnum) документа = Docid
      if vL_app <> 4 then
        begin
          uDMSBIS.DMSbis.qPackView.Close;
          uDMSBIS.DMSbis.qPackView.ParamByName('docid').AsInteger := Docid;
          uDMSBIS.DMSbis.qPackView.Open;
          uDMSBIS.DMSbis.qSBISObj.Close;
          uDMSBIS.DMSbis.qSBISObj.ParamByName('idpack').AsInteger := uDMSBIS.DMSbis.qPackView.FieldByName('id').AsInteger;
          uDMSBIS.DMSbis.qSBISObj.Open;
        end;

      //обновляем из СБИС недостающие данные
      if (uDMSBIS.DMSbis.qPackView.RecordCount <> 0)
          and (uDMSBIS.DMSbis.qPackView.FieldByName('idso').AsString = '') then
        begin
          GetDocSetStatus(uDMSBIS.DMSbis.qPackView.FieldByName('DOCDATE').AsString,
                          uDMSBIS.DMSbis.qPackView.FieldByName('DOCDATE').AsString,
                          uDMSBIS.DMSbis.qPackView.FieldByName('idedo').AsString,
                          uDMSBIS.DMSbis.qPackView.FieldByName('id').AsInteger);
          uDMSBIS.DMSbis.qPackView.ExecSQL;
          uDMSBIS.DMSbis.qSBISObj.ExecSQL;
        end;

      //по найденной выгрузке заполняем параметры
      if uDMSBIS.DMSbis.qSBISObj.Active and uDMSBIS.DMSbis.qSBISObj.Locate('typid', SBisAkt.idtyp, []) then
        begin
          params.needAkt := true;
          SBisAkt.idRecEDO := uDMSBIS.DMSbis.qSBISObj.FieldByName('id_sbis').AsString;
        end;
      if uDMSBIS.DMSbis.qSBISObj.Active
        and (uDMSBIS.DMSbis.qSBISObj.Locate('typid', '9', [])
             or uDMSBIS.DMSbis.qSBISObj.Locate('typid', '12', [])
             or uDMSBIS.DMSbis.qSBISObj.Locate('typid', '13', [])
             or uDMSBIS.DMSbis.qSBISObj.Locate('typid', '15', [])) then
        begin
          params.needSF := true;
          SbisSF.idRecEDO := uDMSBIS.DMSbis.qSBISObj.FieldByName('id_sbis').AsString;
          SbisUPD.idRecEDO := uDMSBIS.DMSbis.qSBISObj.FieldByName('id_sbis').AsString;
        end;
      if uDMSBIS.DMSbis.qSBISObj.Active and uDMSBIS.DMSbis.qSBISObj.Locate('typid', SbisNakl.idtyp, []) then
        begin
          params.needNakl := true;
          SbisNakl.idRecEDO := uDMSBIS.DMSbis.qSBISObj.FieldByName('id_sbis').AsString;
        end;
      if uDMSBIS.DMSbis.qPackView.RecordCount = 0 then
        params.IsNewPackage := true;

      readSetting(Company_id, 'EDO', 'CONTRSBIS', contrEdo);
      if uDMSBIS.DMSbis.qPackView.Active and (uDMSBIS.DMSbis.qPackView.FieldByName('contredo').AsString = contrEdo) then
        params.IDOperEDO := 0;
      readSetting(Company_id, 'EDO', 'CONTRKONTUR', contrEdo);
      if uDMSBIS.DMSbis.qPackView.Active and (uDMSBIS.DMSbis.qPackView.FieldByName('contredo').AsString = contrEdo) then
        params.IDOperEDO := 1;

      //вывод окна параметров выгрузки
      if (vL_app = 1) and not ((pUKDk in p_DocType) {or (pUKDi in p_DocType)}) then
        begin
         if not(getRdySbisPackParams(params)) then exit;
        end
      else if (vL_app = 4) and (pAktS in p_DocType) then
        begin
          if not(getRdySbisPackParams(params, false, false)) then exit;
        end
      else
        begin
          if not(getRdySbisPackParams(params, false)) then exit;
        end;

      //указание оператора для выгрузки документов
      SBisAkt.OperEDO := params.IDOperEDO;
      SbisSF.OperEDO := params.IDOperEDO;
      SbisNakl.OperEDO := params.IDOperEDO;
      SbisUPD.OperEDO := params.IDOperEDO;
      SbisSchet.OperEDO := params.IDOperEDO;

      // создание пакета
      SbisPack := TSbisPack.Create;
//      SbisPack.id := Docid;
      SbisPack.packPref := vL_packPref;
      SbisPack.appref := PosSymbol(appref);
      SbisPack.TablePref := vL_TablePref;

      if vL_app = 1 then
        begin
          if (pUKDk in p_DocType) {or (pUKDi in p_DocType)} then
            begin
              if (pUKDk in p_DocType) and (pUKDi in p_DocType) then
                SbisUKD.idtyp := 16
              else if (pUKDk in p_DocType) and not (pUKDi in p_DocType) then
                     SbisUKD.idtyp := 17
                   else if not (pUKDk in p_DocType) and (pUKDi in p_DocType) then
                          SbisUKD.idtyp := 18;

              ReadyUKDTOXML(Docid, SbisUKD, p_TypeOp);
              SetLength(SbisPack.ArrDocid, 1);
              SbisPack.ArrDocid[0] := Docid;
              SbisPack.CSender.DocDate := SbisUKD.CSender.DocDate;
              SbisPack.CSender.id := SbisUKD.CSender.id;
              SbisPack.CDest.id := SbisUKD.CDest.id;
              SbisPack.CDest.KPP := SbisUKD.CDest.KPP;
              SbisPack.DocNum := SbisUKD.DocNum;
              SbisPack.DocDate := SbisUKD.DocDate;
              SbisPack.TypeDocEDO := 'CorrOut';
              SbisPack.addVloj(SbisUKD);
            end
          else if pUPD in p_DocType then
                 begin

                 end
          else
            begin

              ReadyNaklToXML(Docid, SbisNakl, p_TypeOp);
              SbisNakl.Docname := 'Накладная №' + SbisNakl.DocNum + ' от ' + SbisNakl.DocDate;
              SbisUPD.NAKL := SbisNakl;

              ReadySFTOXML(Docid, SbisSF, p_TypeOp, p_DocType, params);
              SbisUPD.SF := SbisSF;

              SbisUPD.Docname := 'Фактура №' + SbisSF.DocNum + ' от ' + SbisSF.DocDate;
              SbisUPD.DocNum := SbisSF.DocNum;
              SbisUPD.DocDate := SbisSF.DocDate;

              if SbisUPD.SF.IsUPD then
                SbisUPD.idtyp := 9
              else
                SbisUPD.idtyp := 12;

              if params.needAkt then
              begin
                if params.showCount then
                  SBisAkt.TypeForm := 'гп'
                else
                  SBisAkt.TypeForm := 'прусл';
                ReadyAktToXML(Docid, SBisAkt);
                SBisAkt.DocName := 'Акт выполненных работ(окзанных услуг) №' + SBisAkt.DocNum + ' от ' + SBisAkt.DocDate;
              end;

              SetLength(SbisPack.ArrDocid, 1);
              SbisPack.ArrDocid[0] := Docid;
              SbisPack.CSender.DocDate := SbisUPD.SF.CSender.DocDate;
              SbisPack.CSender.id := SbisUPD.SF.CSender.id;
              SbisPack.CDest.id := SbisUPD.SF.CDest.id;
              SbisPack.CDest.KPP := SbisUPD.SF.CDest.KPP;
              SbisPack.DocNum := SbisUPD.SF.DocNum;
              SbisPack.DocDate := SbisUPD.SF.DocDate;
              SbisPack.summa := SbisUPD.SF.sumUchNds;
              if params.needAkt then
                SbisPack.addVloj(SBisAkt);
              if params.needSF then
                SbisPack.addVloj(SbisUPD);
              if params.needNakl then
                SbisPack.addVloj(SbisNakl);
            end;
        end;

      if vL_app = 2 then
        begin
          if pSchet in p_DocType then
            begin
              FinSchetToXML(Docid, SbisSchet);

              SbisSchet.Docname := 'Счет №' + SbisSchet.DocNum + ' от ' + SbisSchet.DocDate;

              SetLength(SbisPack.ArrDocid, 1);
              SbisPack.ArrDocid[0] := Docid;
              SbisPack.CSender.DocDate := SbisSchet.CSender.DocDate;
              SbisPack.CSender.id := SbisSchet.CSender.id;
              SbisPack.CDest.id := SbisSchet.CDest.id;
              SbisPack.DocNum := SbisSchet.DocNum;
              SbisPack.DocDate := SbisSchet.DocDate;
              SbisPack.summa := SbisSchet.DocSumma;

              SbisPack.addVloj(SbisSchet);
            end;
          if pSF in p_DocType then
            begin
              SbisUPD.idtyp := 12;

              SbisUPD.FUNC := 'СЧФ';
              FinSFTOXML(Docid, SbisSF);
              SbisUPD.SF := SbisSF;

              SbisUPD.DocNum := SbisSF.DocNum;
              SbisUPD.DocDate := SbisSF.DocDate;

              SbisUPD.Docname := 'Счет №' + SbisUPD.SF.DocNum + ' от ' + SbisUPD.SF.DocDate;

              SetLength(SbisPack.ArrDocid, 1);
              SbisPack.ArrDocid[0] := Docid;
              SbisPack.CSender.DocDate := SbisUPD.SF.CSender.DocDate;
              SbisPack.CSender.id := SbisUPD.SF.CSender.id;
              SbisPack.CDest.id := SbisUPD.SF.CDest.id;
              SbisPack.CDest.KPP := SbisUPD.SF.CDest.KPP;
              SbisPack.DocNum := SbisUPD.SF.DocNum;
              SbisPack.DocDate := SbisUPD.SF.DocDate;
              SbisPack.summa := SbisUPD.SF.sumUchNds;

              SbisPack.addVloj(SbisUPD);
            end;
        end;

      if vL_app = 3 then
        begin
          if (pUKDk in p_DocType) then
            begin
              SbisUKD.idtyp := 17;

              FacUKDTOXML(Docid, SbisUKD, p_TypeOp);

              SetLength(SbisPack.ArrDocid, 1);
              SbisPack.ArrDocid[0] := Docid;
              SbisPack.CSender.DocDate := SbisUKD.CSender.DocDate;
              SbisPack.CSender.id := SbisUKD.CSender.id;
              SbisPack.CDest.id := SbisUKD.CDest.id;
              SbisPack.CDest.KPP := SbisUKD.CDest.KPP;
              SbisPack.DocNum := SbisUKD.DocNum;
              SbisPack.DocDate := SbisUKD.DocDate;
              SbisPack.TypeDocEDO := 'CorrOut';
              SbisPack.addVloj(SbisUKD);
            end
          else
            begin
              FacSFToXML(Docid, SbisSF, SbisNakl);

              SbisUPD.SF := SbisSF;
              SbisUPD.NAKL := SbisNakl;

              if SbisUPD.SF.IsUPD then
                begin
                  SbisUPD.idtyp := 9;
                  params.needAkt := false;
                end
              else
                begin
                  SbisUPD.FUNC := 'СЧФ';
                  SbisUPD.idtyp := 12;
                  params.needAkt := true;
                end;
              SbisUPD.Docname := 'Счёт-фактура № ' + SbisSF.DocNum + ' от ' + SbisSF.DocDate;
              SbisUPD.DocNum := SbisSF.DocNum;
              SbisUPD.DocDate := SbisSF.DocDate;

              FacAktToXML(Docid, SbisAkt);
              SbisAkt.Docname := 'Акт выполненных работ(оказанных услуг) № ' + SbisAkt.DocNum + ' от ' + SbisAkt.DocDate;

              SetLength(SbisPack.ArrDocid, 1);
              SbisPack.ArrDocid[0] := Docid;
              SbisPack.CSender.DocDate := SbisAkt.CSender.DocDate;
              SbisPack.CSender.id := SbisAkt.CSender.id;
              SbisPack.CDest.id := SbisAkt.CDest.id;
              SbisPack.CDest.KPP := SbisAkt.CDest.KPP;
              SbisPack.DocNum := SbisAkt.DocNum;
              SbisPack.DocDate := SbisAkt.DocDate;
              SbisPack.summa := SbisAkt.SumSNDS;

              SbisPack.addVloj(SbisUPD);
              if params.needAkt then
                SbisPack.addVloj(SbisAkt);
            end;
        end;

      if vL_app = 4 then
        begin
          if pAktS in p_DocType then
            begin
              CRMActTOXML(p_IdCa, SbisAktS, p_BegDate, p_EndDate);

              SbisPack.ArrDocid := SbisAktS.ArrDocid;
              SbisPack.CSender.DocDate := SbisAktS.CSender.DocDate;
              SbisPack.CSender.id := SbisAktS.CSender.id;
              SbisPack.CDest.id := SbisAktS.CDest.id;
              SbisPack.TypeDocEDO := 'АктСверИсх';
              SbisPack.DocDate := p_EndDate;
              SbisPack.addVloj(SbisAktS);
            end;
        end;

      if params.IsNewPackage then
        begin
          SbisPack.IsNewPack := params.IsNewPackage;
          SbisPack.idRecEDO := '';
          SbisNakl.idRecEDO := '';
          SbisSF.idRecEDO := '';
          SbisUPD.idRecEDO := '';
          SBisAkt.idRecEDO := '';
        end
      else
        begin
          SbisPack.Idso := uDMSBIS.DMSbis.qPackView.FieldByName('idso').AsString;
          SbisPack.idRecEDO := uDMSBIS.DMSbis.qPackView.FieldByName('idso').AsString;
        end;
      if uDMSBIS.DMSbis.qPackView.Active then
        SbisPack.TMP_idPack := uDMSBIS.DMSbis.qPackView.FieldByName('id').AsInteger
      else
        SbisPack.TMP_idPack := 0;
      SbisPack.OperEDO := params.IDOperEDO;
      SbisPack.Send;
    except
//      DBName.Rollback;
      raise ;
    end;
  except
    on E: EAlreadySendException do
    begin
      Application.MessageBox(PChar('Пакет уже был отправлен ранее'), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E: EDataFoundException do
    begin
      Application.MessageBox(PChar('Данные не найдены:' + #13 + E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E: ESBISDisabledException do
    begin
      Application.MessageBox(PChar('Данный контрагент не участвует в ЭДО'), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E: EPathFoundException do
    begin
      Application.MessageBox(PChar('Ошибка путей' + #13 + E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E: EOraError do
    begin
      Application.MessageBox(PChar('Ошибка базы данных' + #13 + E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E: EOsnNull do
    begin
      Application.MessageBox
        (PChar('Основание дожно быть заполнено' + #13 + E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
    on E: Exception do
    begin
      Application.MessageBox
        (PChar('Ошибка отправки пакета!' + #13 + E.Message), 'Ошибка', mb_Ok + mb_IconError);
    end;
  end;
//  dmSbis.qCheckSend.close;
  SbisPack.Destroy;
end;

procedure FinSchetToXML(id: integer; SbisSchet: TSbisSchet);
begin
  PlugDM.qrDocPlPor.close;
  PlugDM.qrDocPlPor.ParamByName('Id').value := id;
  PlugDM.qrDocPlPor.ParamByName('cId').value := company_id;
  PlugDM.qrDocPlPor.ParamByName('union_s').AsString := '0';
  PlugDM.qrDocPlPor.Open;

  PlugDM.qrSFList.close;
  PlugDM.qrSFList.ParamByName('union_s').AsString := '0';
  PlugDM.qrSFList.ParamByName('CID').AsInteger := company_id;
  PlugDM.qrSFList.ParamByName('DEFFRM').AsString := 'FrmInvoice';
  PlugDM.qrSFList.ParamByName('DOC_VAL').AsString := '0';
  PlugDM.qrSFList.ParamByName('ID').AsInteger := id;
  PlugDM.qrSFList.Open;

  SbisSchet.DocNum := PlugDM.qrDocPlPor.FieldByName('numpor').AsString;
  SbisSchet.DocDate := PlugDM.qrDocPlPor.FieldByName('datepor').AsString;
  SbisSchet.CSender.id := PlugDM.qrDocPlPor.FieldByName('COMPANYCCOD').AsInteger;
  SbisSchet.CDest.id := PlugDM.qrDocPlPor.FieldByName('DESTCCOD').AsInteger;
  SbisSchet.kodOKV := PlugDM.qrDocPlPor.FieldByName('code_okv').AsString;
  SbisSchet.Contract := PlugDM.qrDocPlPor.FieldByName('text').AsString;
  SbisSchet.DocSumma := PlugDM.qrDocPlPor.FieldByName('SUMMA').asfloat;

  SbisSchet.rsschet := PlugDM.qrDocPlPor.FieldByName('RS').AsString;
  SbisSchet.NaimBank := PlugDM.qrDocPlPor.FieldByName('RSbank').AsString;
  SbisSchet.BIK := PlugDM.qrDocPlPor.FieldByName('RSMFO').AsString;
  SbisSchet.CorSch := PlugDM.qrDocPlPor.FieldByName('RScorschet').AsString;

  SbisSchet.SenderTel := '20-90-31';
  SbisSchet.SenderFax := '32-21-29';
  SbisSchet.SenderSite := 'www.elmeh.ru';

  SbisSchet.SfData.DisableControls;
  SbisSchet.SfData.EmptyTable;
  SbisSchet.SfData.EnableControls;
  while not(PlugDM.qrSFList.Eof) do
  begin
    SbisSchet.SfData.Append;
    SbisSchet.SfData.FieldByName('TEXT').AsString := PlugDM.qrSFList.FieldByName('STRNAME').AsString;
    SbisSchet.SfData.FieldByName('KOD').AsString := PlugDM.qrSFList.FieldByName('KOD').AsString;
    if (PlugDM.qrSFList.FieldByName('kodei').AsString = '04') or
      (PlugDM.qrSFList.FieldByName('kodei').AsString = '10') then
    begin
      // рубли и ЕД.
      SbisSchet.SfData.FieldByName('KOLVO').AsString := '-';
      SbisSchet.SfData.FieldByName('KOD').AsString := '';
    end
    else
    begin
      if nvl(PlugDM.qrSFList.FieldByName('Ammount').value) = 0 then
      begin
        SbisSchet.SfData.FieldByName('KOLVO').AsString := '-';
        SbisSchet.SfData.FieldByName('KOD').AsString := '';
      end
      else
        SbisSchet.SfData.FieldByName('KOLVO').AsString := FloatToStr_AsEdRound
          (PlugDM.qrSFList.FieldByName('edround').asfloat,
          PlugDM.qrSFList.FieldByName('Ammount').asfloat);
    end;
    SbisSchet.SfData.FieldByName('PRICE').asfloat := PlugDM.qrSFList.FieldByName('PRICE').asfloat;
    SbisSchet.SfData.FieldByName('SUMMA').asfloat := PlugDM.qrSFList.FieldByName('SUMMA').asfloat;
    SbisSchet.SfData.FieldByName('SUMNAL').asfloat := PlugDM.qrSFList.FieldByName('TOTALSUM').asfloat;
    SbisSchet.SfData.FieldByName('NALOG').asfloat := PlugDM.qrSFList.FieldByName('SUMNDS').asfloat;
    SbisSchet.SfData.FieldByName('NALST').AsString := PlugDM.qrSFList.FieldByName('NDS').AsString;

    PlugDM.qrSFList.Next;
  end;
  SbisSchet.SfData.Post;

  PlugDM.qrSFList.close;
  PlugDM.qrDocPlPor.close;
end;

procedure FinSFTOXML(id: integer; SbisSF: TSbisSF);
var
  value: string;
begin
  try
    // Запросы у каждого свои
    PlugDM.qrDocPlPor.close;
    PlugDM.qrDocPlPor.ParamByName('Id').value := id;
    PlugDM.qrDocPlPor.ParamByName('cId').value := company_id;
    PlugDM.qrDocPlPor.ParamByName('union_s').AsString := '0';
    PlugDM.qrDocPlPor.Open;

    PlugDM.qrSFList.close;
    PlugDM.qrSFList.ParamByName('union_s').AsString := '0';
    PlugDM.qrSFList.ParamByName('CID').AsInteger := company_id;
    PlugDM.qrSFList.ParamByName('DEFFRM').AsString := 'FrmInvoice';
    PlugDM.qrSFList.ParamByName('DOC_VAL').AsString := '0';
    PlugDM.qrSFList.ParamByName('ID').AsInteger := id;
    PlugDM.qrSFList.Open;

    // ******---------------------  СУТЬ  ----------------------********//

    SbisSF.idDoc := id;
    // Заполняем шапку

    // Данные по документу
    SbisSF.DocNum := PlugDM.qrDocPlPor.FieldByName('NUMPOR').AsString;
    // Номер С/Ф
    SbisSF.DocDate := PlugDM.qrDocPlPor.FieldByName('DATEPOR').AsString;
    // Дата С/Ф
    SbisSF.kodOKV := PlugDM.qrDocPlPor.FieldByName('code_okv').AsInteger;
    // КодОКВ - код валюты (643 для рубля)

    // Продавец, покупатель
    SbisSF.CSender.id := PlugDM.qrDocPlPor.FieldByName('COMPANYCCOD').AsInteger;
    SbisSF.CDest.id := PlugDM.qrDocPlPor.FieldByName('TRUEDESTCCOD').AsInteger;
    SbisSF.sumUchNds := PlugDM.qrDocPlPor.FieldByName('SUMMA').asfloat;
    // Отправитель, получатель
    // SbisSF.CGruzOtpr.id := 0;
    // SbisSF.CGruzPol.id :=0;

    // Сведения о платёжных документах (если нужен)
    SbisSF.AddPlatDoc(PlugDM.qrDocPlPor.FieldByName('POR_NUM_EXT').AsString,
      PlugDM.qrDocPlPor.FieldByName('POR_DATE_EXT').AsString);

    //Сведения о документах об отгрузке
    if plugdm.qrDocPlPor.FieldByName('TYP').AsString <> 'F' then
      SbisSF.AddOtgrDoc(PlugDM.qrDocPlPor.FieldByName('NUMDOC').AsString, PlugDM.qrDocPlPor.FieldByName('DATE2').AsString);

    // Подписант - из настроек
    readSetting(company_id, 'EDO', 'TABNPod', value);
    SbisSF.Podpisant.tabn := value;

    SbisSF.SfData.DisableControls;
    SbisSF.SfData.EmptyTable;
    SbisSF.SfData.EnableControls;

    // Заполняем строчки: SFdata - это MemoryTable
    while not(PlugDM.qrSFList.Eof) do
    begin
      SbisSF.SfData.Append;
      SbisSF.SfData.FieldByName('TEXT').AsString := PlugDM.qrSFList.FieldByName('STRNAME').AsString;
      SbisSF.SfData.FieldByName('KOD').AsString := '';
      SbisSF.SfData.FieldByName('USL').AsString := '';
      SbisSF.SfData.FieldByName('KOLVO').AsString := '';
      SbisSF.SfData.FieldByName('PRICE').AsString := '';
      SbisSF.SfData.FieldByName('SUMMA').AsString := '';
      SbisSF.SfData.FieldByName('AKC').AsString := '';
      SbisSF.SfData.FieldByName('NALST').AsString := PlugDM.qrSFList.FieldByName('NDS').AsString + '/'
                                                      + intToStr(PlugDM.qrSFList.FieldByName('NDS').AsInteger + 100); // Налоговая ставка
      SbisSF.SfData.FieldByName('NALOG').asfloat := PlugDM.qrSFList.FieldByName('SUMNDS').asfloat; // Сумма налога
      SbisSF.SfData.FieldByName('SUMNAL').asfloat := PlugDM.qrSFList.FieldByName('TOTALSUM').asfloat; // Сумма с налогом
      SbisSF.SfData.FieldByName('CKOD').AsString := '';
      SbisSF.SfData.FieldByName('SNAME').AsString := '';
      SbisSF.SfData.FieldByName('TAMD').AsString := '';
      PlugDM.qrSFList.Next;
    end;

    SbisSF.SfData.Post;
  finally
    PlugDM.qrDocPlPor.close;
    PlugDM.qrSFList.close;
  end;

end;

procedure FacActToXML(id: integer);
begin
  PlugDM.qrDocPlPor.close;
  PlugDM.qrDocPlPor.ParamByName('Id').value := id;
  PlugDM.qrDocPlPor.ParamByName('cId').value := companyid;
  PlugDM.qrDocPlPor.ParamByName('union_s').AsString := '0';
  PlugDM.qrDocPlPor.Open;
end;

procedure ReadySFTOXML(id: integer; SbisSF: TSbisSF; p_TypeOp: string; p_DocType: TDocTypeSet; params: recRdySbisPackParams);
var
  OsnDoc: TOraQuery;
  From: integer;
  value: string;
  doc_shipping_name: string;
begin
  try

    // Запросы у каждого свои
    PlugDM.qPrint.close;
    PlugDM.qPrint.ParamByName('OPNUM').AsInteger := id;
    PlugDM.qPrint.ParamByName('in_optype').AsString := p_TypeOp;
    PlugDM.qPrint.Open;
    if (PlugDM.qPrint.RecordCount = 0) then
    begin
      PlugDM.qPrint.close;
      raise EDataFoundException.Create('Счет-фактура');
      Exit;
    end;

    if (PlugDM.qPrint.FieldByName('COR_DOC').AsString = 'Y') then
    begin
      PlugDM.qPrint.close;
      raise EDataFoundException.Create('Счет-фактура');
      Exit;
    end;

    {if (trim(PlugDM.qPrint.FieldByName('DocNumfull').AsString) = '0') or
      (trim(PlugDM.qPrint.FieldByName('DocNumfull').AsString) = '') then
    begin
      PlugDM.qPrint.close;
      raise EDataFoundException.Create('Счет-фактура');
      Exit;
    end;}

    PlugDM.qDocLines.close;
    PlugDM.qDocLines.ParamByName('OPNUM').AsInteger := id;
    PlugDM.qDocLines.ParamByName('in_optype').AsString := p_TypeOp;
    PlugDM.qDocLines.Open;

    // И проверки - тоже
    if (PlugDM.qDocLines.RecordCount = 0) then
    begin
      PlugDM.qPrint.close;
      PlugDM.qDocLines.close;
      raise EDataFoundException.Create('Счет-фактура');
      Exit;
    end;

    PlugDM.qrShippingType.Close;
    PlugDM.qrShippingType.ParamByName('frmid').AsString := PlugDM.qPrint.FieldByName('frmid').AsString;
    PlugDM.qrShippingType.Open;

    //поля документа отгрузки брались по типу распечатанного документа в РМ
{    if PlugDM.qrShippingType.RecordCount > 0 then
      begin
        case PlugDM.qrShippingType.FieldByName('Shipping_Type').AsInteger of
          0: begin
              if PlugDM.qPrint.FieldByName('PR_FAK').AsString = 'U' then
                doc_shipping_name := 'Универсальный передаточный документ № '
              else
                doc_shipping_name := 'Товарная накладная № ';
          end;
          1: doc_shipping_name := 'Акт выполненных работ № ';
        end;
      end
    else
      doc_shipping_name := '';}
    //поля документа отгрузки беруться по отмеченным галочкам при выгрузке документа в ЭДО
    if params.needNakl then
      doc_shipping_name := 'Товарная накладная № '
    else if params.needAkt then
      doc_shipping_name := 'Акт выполненных работ № '
    else if params.needSF
            and (PlugDM.qPrint.FieldByName('PR_FAK').AsString = 'U')
            and (not params.needNakl or not params.needAkt) then
      doc_shipping_name := 'Универсальный передаточный документ № '
    else
      doc_shipping_name := '';




    // ******---------------------  СУТЬ  ----------------------********//


    // Заполняем шапку

    //данные для указания ссылки на иправляемый документ
    //номер исправления равный 0 - как параметр указывающий на то, что это счёт-фактура исправление.
    if pUKDi in p_DocType then
      begin
        // Данные по документу
        // Номер С/Ф
        SbisSF.DocNum := PlugDM.qPrint.FieldByName('docnum_ispr').AsString;
        // Дата С/Ф
        SbisSF.DocDate := PlugDM.qPrint.FieldByName('date_ispr').AsString;

        SbisSF.CorrNumberSF := PlugDM.qPrint.FieldByName('num_ispr').AsString;
        SbisSF.CorrDocDateSF := PlugDM.qPrint.FieldByName('Actual_Date').AsString;
      end
    else
      begin
        // Данные по документу
        // Номер С/Ф
        SbisSF.DocNum := PlugDM.qPrint.FieldByName('DocNumfull').AsString;
        // Дата С/Ф
        SbisSF.DocDate := PlugDM.qPrint.FieldByName('Actual_Date').AsString;

        SbisSF.CorrNumberSF := '0';
        SbisSF.CorrDocDateSF := '0';
      end;

    SbisSF.kodOKV := 643; // КодОКВ - код валюты (643 для рубля)
    if PlugDM.qPrint.FieldByName('PR_FAK').AsString = 'U' then
      begin
        SbisSF.IsUPD := true;
        SbisSF.AddOtgrDoc(PlugDM.qPrint.FieldByName('DOCNUMFULL').AsString, PlugDM.qPrint.FieldByName('ACTUAL_DATE').AsString, doc_shipping_name);
      end
    else
      begin
        SbisSF.IsUPD := false;
        SbisSF.AddOtgrDoc(PlugDM.qPrint.FieldByName('DOCNUM_N').AsString, PlugDM.qPrint.FieldByName('ACTUAL_DATE_N').AsString, doc_shipping_name);
      end;

    // Платежно-расчетные документы
    PlugDM.qPrimText.close;
    PlugDM.qPrimText.ParamByName('OPNUM').asfloat := id;
    PlugDM.qPrimText.ParamByName('TYP_PRIM').asfloat := 3;
    PlugDM.qPrimText.Open;

    while not PlugDM.qPrimText.Eof do
    begin
      SbisSF.AddPlatDoc(PlugDM.qPrimText.FieldByName('PLat_num').AsString,
        PlugDM.qPrimText.FieldByName('PLat_date').AsString);
      PlugDM.qPrimText.Next;
    end;

    // Грузоотправитель
    {if PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2', [])
        or PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2a', [])
        or PlugDM.qPrint.Locate('frmid', 'ActRbUsl2', []) then
      SbisSF.CGruzOtpr.id := -1
    else
      SbisSF.CGruzOtpr.id := PlugDM.qPrint.FieldByName('gruzotpr').AsInteger;}
    case PlugDM.qrShippingType.FieldByName('Shipping_Type').AsInteger of
      0: begin
            SbisSF.CGruzOtpr.DocDate := PlugDM.qPrint.FieldByName('Actual_Date').AsString;
            SbisSF.CGruzOtpr.id := PlugDM.qPrint.FieldByName('gruzotpr').AsInteger;
      end;
      1: SbisSF.CGruzOtpr.id := -1;
    end;

    // Грузополучатель
    {if PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2', [])
        or PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2a', [])
        or PlugDM.qPrint.Locate('frmid', 'ActRbUsl2', []) then
      SbisSF.CGruzPol.id := -1
    else
      begin
        SbisSF.CGruzPol.id := PlugDM.qPrint.FieldByName('contr_id').AsInteger;
        SbisSF.CGruzPol.KPP := PlugDM.qPrint.FieldByName('PolKpp').AsString;  //07.07.2020, вывод КПП получателя, при выгрузке подставлялся КПП по умолчанию
      end;}

    case PlugDM.qrShippingType.FieldByName('Shipping_Type').AsInteger of
      0: begin
           SbisSF.CGruzPol.id := PlugDM.qPrint.FieldByName('contr_id').AsInteger;
           SbisSF.CGruzPol.KPP := PlugDM.qPrint.FieldByName('PolKpp').AsString;
         end;
      1: SbisSF.CGruzPol.id := -1;
    end;

    SbisSF.CSender.DocDate := PlugDM.qPrint.FieldByName('Actual_Date').AsString;
    SbisSF.CSender.id := PlugDM.qPrint.FieldByName('self_cod').AsInteger; //


    SbisSF.CDest.id := PlugDM.qPrint.FieldByName('truedest').AsInteger;
    SbisSF.CDest.KPP := PlugDM.qPrint.FieldByName('PokKpp').AsString;

    // Подписант - из настроек
    readSetting(company_id, 'EDO', 'TABNPod', value);
    SbisSF.Podpisant.tabn := value;

    // выводим в табличной части примечания для запчастей (если есть)
    if PlugDM.qPrint.FieldByName('DOC_CMMT').AsString <> '' then
    begin
      SbisSF.SfData.Append;
      SbisSF.SfData.FieldByName('TEXT').AsString := PlugDM.qPrint.FieldByName('DOC_CMMT').AsString;
      SbisSF.SfData.FieldByName('KOD').AsString := '';
      SbisSF.SfData.FieldByName('USL').AsString := '';
      SbisSF.SfData.FieldByName('KOLVO').AsString := '';
      SbisSF.SfData.FieldByName('PRICE').AsString := '';
      SbisSF.SfData.FieldByName('SUMMA').AsString := '';
      SbisSF.SfData.FieldByName('AKC').AsString := '';
      SbisSF.SfData.FieldByName('NALST').AsString := ''; // Налоговая ставка
      SbisSF.SfData.FieldByName('NALOG').AsString := ''; // Сумма налога
      SbisSF.SfData.FieldByName('SUMNAL').AsString := ''; // Сумма с налогом
      SbisSF.SfData.FieldByName('CKOD').AsString := '';
      SbisSF.SfData.FieldByName('SNAME').AsString := '';
      SbisSF.SfData.FieldByName('TAMD').AsString := '';
    end;

    // Заполняем строчки: SFdata - это MemoryTable
    while not(PlugDM.qDocLines.Eof) do
    begin
      SbisSF.SfData.Append;
      SbisSF.SfData.FieldByName('TEXT').AsString := ConstPrintDoc.GetNaimObosn
        (PlugDM.qDocLines.FieldByName('OBJ_ID').AsString,
        PlugDM.qDocLines.FieldByName('DECNUM').AsString)
        + PlugDM.qDocLines.FieldByName('NAIM').AsString;

      {if (PlugDM.qDocLines.FieldByName('KOD_EI').AsInteger in [10, 0])
          or PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2', [])
          or PlugDM.qPrint.Locate('frmid', '106_ysl_2021_2a', [])
          or PlugDM.qPrint.Locate('frmid', 'ActRbUsl2', []) then
      begin
        SbisSF.SfData.FieldByName('KOD').AsString := '-';
        SbisSF.SfData.FieldByName('USL').AsString := '-';
        SbisSF.SfData.FieldByName('KOLVO').AsString := '0';
        SbisSF.SfData.FieldByName('PRICE').AsString := '0';
      end
      else
      begin
        SbisSF.SfData.FieldByName('KOD').AsString := PlugDM.qDocLines.FieldByName('KOD_ED_IZM').AsString;
        SbisSF.SfData.FieldByName('USL').AsString := PlugDM.qDocLines.FieldByName('edname').AsString;
        SbisSF.SfData.FieldByName('KOLVO').AsString := PlugDM.qDocLines.FieldByName('ITEM_COUNT').value;
        SbisSF.SfData.FieldByName('PRICE').AsString := floattostr(round(PlugDM.qDocLines.FieldByName('PRICEPRX').asfloat * 100) / 100);
      end;}

      case PlugDM.qrShippingType.FieldByName('Shipping_Type').AsInteger of
        0: begin
             SbisSF.SfData.FieldByName('KOD').AsString := PlugDM.qDocLines.FieldByName('KOD_ED_IZM').AsString;
             SbisSF.SfData.FieldByName('USL').AsString := PlugDM.qDocLines.FieldByName('edname').AsString;
             SbisSF.SfData.FieldByName('KOLVO').AsString := PlugDM.qDocLines.FieldByName('ITEM_COUNT').value;
             SbisSF.SfData.FieldByName('PRICE').AsString := floattostr(round(PlugDM.qDocLines.FieldByName('PRICEPRX').asfloat * 100) / 100);
           end;
        1: begin
             SbisSF.SfData.FieldByName('KOD').AsString := '-';
             SbisSF.SfData.FieldByName('USL').AsString := '-';
             SbisSF.SfData.FieldByName('KOLVO').AsString := '0';
             SbisSF.SfData.FieldByName('PRICE').AsString := '0';
           end;
      end;

      SbisSF.SfData.FieldByName('SUMMA').AsString := floattostr(round(PlugDM.qDocLines.FieldByName('SUMMA').asfloat * 100) / 100);
      SbisSF.SfData.FieldByName('AKC').AsString := 'без акциза';
      if PlugDM.qDocLines.FieldByName('realperc').AsString = '0' then
        SbisSF.SfData.FieldByName('NALST').AsString := PlugDM.qDocLines.FieldByName('NAL_CMMT').AsString
      else
        SbisSF.SfData.FieldByName('NALST').AsString := PlugDM.qDocLines.FieldByName('realperc').AsString + '%';
      // Налоговая ставка
      if (PlugDM.qDocLines.FieldByName('SCH_NAL').AsInteger = 3) then
        SbisSF.SfData.FieldByName('NALOG').AsString := '-'
      else
        SbisSF.SfData.FieldByName('NALOG').AsString := floattostr(PlugDM.qDocLines.FieldByName('nds').asfloat);

      if PlugDM.qDocLines.FieldByName('realperc').AsString = '0' then
        begin
          SbisSF.SfData.FieldByName('SUMNAL').AsString := ''; // floattostr(round((PlugDM.qDocLines.FieldByName('SUMMA').asfloat + PlugDM.qDocLines.FieldByName('nds').asfloat) * 100) / 100);
          SbisSF.sumUchNds := 0; // SbisSF.sumUchNds + SbisSF.SfData.FieldByName('SUMNAL').asfloat;
        end
      else
        begin
          SbisSF.SfData.FieldByName('SUMNAL').AsString := floattostr(round((PlugDM.qDocLines.FieldByName('SUMMA').asfloat + PlugDM.qDocLines.FieldByName('nds').asfloat) * 100) / 100);
          SbisSF.sumUchNds := SbisSF.sumUchNds + SbisSF.SfData.FieldByName('SUMNAL').asfloat;
        end;

      SbisSF.SfData.FieldByName('CKOD').AsString := PlugDM.qDocLines.FieldByName('kod_stran').AsString;
      SbisSF.SfData.FieldByName('SNAME').AsString := PlugDM.qDocLines.FieldByName('strana').AsString;
      SbisSF.SfData.FieldByName('TAMD').AsString := PlugDM.qDocLines.FieldByName('GTD').AsString;

      //добавление данных прослеживаемости, использовать когда появяться данные в базе
      PlugDM.qrRp_log_rnpt_view.Close;
      PlugDM.qrRp_log_rnpt_view.ParamByName('p_rp_log_opnum').AsFloat := id;
      PlugDM.qrRp_log_rnpt_view.ParamByName('p_rp_log_opsubnum').AsFloat := PlugDM.qDocLines.FieldByName('MIN_OPSUBNUM').AsFloat;
      PlugDM.qrRp_log_rnpt_view.open;

//      PlugDM.qrRp_log_rnpt_edo.Close;
//      PlugDM.qrRp_log_rnpt_edo.MacroByName('macro').Value := PlugDM.qrRp_log_rnpt_view.SQL.Text;
//      PlugDM.qrRp_log_rnpt_edo.ParamByName('p_rp_log_opnum').AsFloat := id;
//      PlugDM.qrRp_log_rnpt_edo.ParamByName('p_rp_log_opsubnum').AsFloat := PlugDM.qDocLines.FieldByName('MIN_OPSUBNUM').AsFloat;
//      PlugDM.qrRp_log_rnpt_edo.Open;

      if PlugDM.qrRp_log_rnpt_view.RecordCount > 0 then
//      if PlugDM.qrRp_log_rnpt_edo.RecordCount > 0 then
        begin
          SbisSF.SfData.FieldByName('MonitorNum').AsString := PlugDM.qrRp_log_rnpt_view.FieldByName('rnpt').AsString;
          SbisSF.SfData.FieldByName('MonitorEdISM').AsString := PlugDM.qrRp_log_rnpt_view.FieldByName('kod_ei').AsString;
          SbisSF.SfData.FieldByName('MonitorNEdIsm').AsString := PlugDM.qrRp_log_rnpt_view.FieldByName('edname').AsString;
          SbisSF.SfData.FieldByName('MonitorCNT').AsString := PlugDM.qrRp_log_rnpt_view.FieldByName('item_count').AsString;
          SbisSF.SfData.FieldByName('MonitorCCountry').AsString := PlugDM.qrRp_log_rnpt_view.FieldByName('CCountry').AsString;
          SbisSF.SfData.FieldByName('MonitorNCountry').AsString := PlugDM.qrRp_log_rnpt_view.FieldByName('NCountry').AsString;
//          SbisSF.SfData.FieldByName('MonitorSum').AsString := PlugDM.qrRp_log_rnpt_view.FieldByName('price').AsString;
          SbisSF.SfData.FieldByName('MonitorSum').AsString := PlugDM.qrRp_log_rnpt_view.FieldByName('SUMMA').AsString;

//          SbisSF.SfData.FieldByName('MonitorNum').AsString := PlugDM.qrRp_log_rnpt_edo.FieldByName('rnpt').AsString;
//          SbisSF.SfData.FieldByName('MonitorEdISM').AsString := PlugDM.qrRp_log_rnpt_edo.FieldByName('kod_ei').AsString;
//          SbisSF.SfData.FieldByName('MonitorNEdIsm').AsString := PlugDM.qrRp_log_rnpt_edo.FieldByName('edname').AsString;
//          SbisSF.SfData.FieldByName('MonitorCNT').AsString := PlugDM.qrRp_log_rnpt_edo.FieldByName('item_count').AsString;
//          SbisSF.SfData.FieldByName('MonitorCCountry').AsString := PlugDM.qrRp_log_rnpt_edo.FieldByName('CCountry').AsString;
//          SbisSF.SfData.FieldByName('MonitorNCountry').AsString := PlugDM.qrRp_log_rnpt_edo.FieldByName('NCountry').AsString;
//          SbisSF.SfData.FieldByName('MonitorSum').AsString := PlugDM.qrRp_log_rnpt_edo.FieldByName('SUMMA').AsString;
        end;

      PlugDM.qDocLines.Next;
    end;

    SbisSF.SfData.Post;
    // Подписант - из настроек
    readSetting(company_id, 'EDO', 'TABNPod', value);
    SbisSF.Podpisant.tabn := value;

  finally
    PlugDM.qPrint.close;
    PlugDM.qDocLines.close;
  end;

end;

procedure ReadyNaklToXML(id: integer; SbisNakl: TSbisNakl; p_TypeOp: string);
var
  OsnDoc: TOraQuery;
  From: integer;
  value: string;
begin
  try
    // Запросы у каждого свои
    PlugDM.qPrint.close;
    PlugDM.qPrint.ParamByName('OPNUM').AsInteger := id;
    PlugDM.qPrint.ParamByName('in_optype').AsString := p_TypeOp;
    PlugDM.qPrint.Open;
    if (PlugDM.qPrint.RecordCount = 0) then
    begin
      raise EDataFoundException.Create('накладная');
      PlugDM.qPrint.close;
      Exit;
    end;

    PlugDM.qDocLines.close;
    PlugDM.qDocLines.ParamByName('OPNUM').AsInteger := id;
    PlugDM.qDocLines.ParamByName('in_optype').AsString := p_TypeOp;
    PlugDM.qDocLines.Open;

    // И проверки - тоже
    if (PlugDM.qDocLines.RecordCount = 0) then
    begin
      PlugDM.qPrint.close;
      PlugDM.qDocLines.close;
      Exit;
    end;

    SbisNakl.kodOKV := PlugDM.qPrint.FieldByName('EDOKEI').AsInteger; ; // рубль

    SbisNakl.idDoc := id;
    SbisNakl.CSender.DocDate := PlugDM.qPrint.FieldByName('Actual_Date').AsString;
    SbisNakl.CSender.id := PlugDM.qPrint.FieldByName('self_cod').AsInteger;
    SbisNakl.CSender.BankRekv.NameBank :=  PlugDM.qPrint.FieldByName('POSTBANK').AsString;
    SbisNakl.CSender.BankRekv.NomSch := PlugDM.qPrint.FieldByName('POSTSCHET').AsString;
    SbisNakl.CSender.BankRekv.bik := PlugDM.qPrint.FieldByName('POSTMFO').AsString;
    SbisNakl.CSignatory.id := PlugDM.qPrint.FieldByName('self_cod').AsInteger;
    // id отправителя
    SbisNakl.CDest.id := PlugDM.qPrint.FieldByName('truedest').AsInteger;
    SbisNakl.CDest.BankRekv.NameBank :=  PlugDM.qPrint.FieldByName('POKBANK').AsString;
    SbisNakl.CDest.BankRekv.NomSch := PlugDM.qPrint.FieldByName('POKcorschet').AsString;
    SbisNakl.CDest.BankRekv.bik := PlugDM.qPrint.FieldByName('POKMFO').AsString;
    if (PlugDM.qPrint.FieldByName('POKKPP').AsString <> '') or VarIsNull(PlugDM.qPrint.FieldByName('POKKPP').AsString) then
      SbisNakl.CDest.KPP := PlugDM.qPrint.FieldByName('POKKPP').AsString;
    // id получателя
    SbisNakl.cpostav.KPP := PlugDM.qPrint.FieldByName('POSTKpp').AsString;
    SbisNakl.cpostav.BankRekv.NameBank :=  PlugDM.qPrint.FieldByName('POSTBANK').AsString;
    SbisNakl.cpostav.BankRekv.NomSch := PlugDM.qPrint.FieldByName('POSTcorschet').AsString;
    SbisNakl.cpostav.BankRekv.bik := PlugDM.qPrint.FieldByName('POSTMFO').AsString;

    SbisNakl.CGruzOtpr.id := PlugDM.qPrint.FieldByName('gruzotpr').AsInteger;
    // id грузоотправителя
    SbisNakl.CGruzPol.id := PlugDM.qPrint.FieldByName('contr_id').AsInteger;
    // id грузополучателя
    SbisNakl.CGruzPol.KPP := PlugDM.qPrint.FieldByName('grpolkpp').AsString;
    SbisNakl.cpostav.id := PlugDM.qPrint.FieldByName('self_cod').AsInteger;
    // id поставщика
    SbisNakl.cplat.id := PlugDM.qPrint.FieldByName('payer').AsInteger;
    SbisNakl.cplat.BankRekv.NameBank :=  PlugDM.qPrint.FieldByName('PLATBANK').AsString;
    SbisNakl.cplat.BankRekv.NomSch := PlugDM.qPrint.FieldByName('PLATcorschet').AsString;
    SbisNakl.cplat.BankRekv.bik := PlugDM.qPrint.FieldByName('PLATMFO').AsString;

    // id плательщика

    // банковские реквизиты
    SbisNakl.BankOtpr.NomSch := PlugDM.qPrint.FieldByName('PostSchet').AsString;
    SbisNakl.BankOtpr.NameBank := PlugDM.qPrint.FieldByName('PostBank').AsString;
    SbisNakl.BankOtpr.BIK := PlugDM.qPrint.FieldByName('PostMFO').AsString;

    SbisNakl.BankPol.NomSch := PlugDM.qPrint.FieldByName('GrPolSchet').AsString;
    SbisNakl.BankPol.NameBank := PlugDM.qPrint.FieldByName('GrPolSchet').AsString;
    SbisNakl.BankPol.BIK := PlugDM.qPrint.FieldByName('GrPolMFO').AsString;

    SbisNakl.BankPostav.NomSch := PlugDM.qPrint.FieldByName('PostSchet').AsString;
    SbisNakl.BankPostav.NameBank := PlugDM.qPrint.FieldByName('PostBank').AsString;
    SbisNakl.BankPostav.BIK := PlugDM.qPrint.FieldByName('PostMFO').AsString;

    SbisNakl.BankPlat.NomSch := PlugDM.qPrint.FieldByName('PlatSchet').AsString;
    SbisNakl.BankPlat.NameBank := PlugDM.qPrint.FieldByName('PlatBank').AsString;
    SbisNakl.BankPlat.BIK := PlugDM.qPrint.FieldByName('PlatMFO').AsString;

    SbisNakl.DocNum := PlugDM.qPrint.FieldByName('DocNum_N').AsString;
    SbisNakl.DocDate := PlugDM.qPrint.FieldByName('Actual_Date').AsString;
    SbisNakl.DocTime := FormatDateTime('hh:mm:ss', Time);

    SbisNakl.transNakl.DocNum := PlugDM.qPrint.FieldByName('TR_NAKL_NOM').AsString;
    SbisNakl.transNakl.DocDate := PlugDM.qPrint.FieldByName('TR_NAKL_DATA').AsString;

    if (PlugDM.qPrint.FieldByName('PARENT_ID').AsString <> '') and
      (PlugDM.qPrint.FieldByName('PARENT_ID').AsString <> '0') then
      SbisNakl.osnovanie.docInfo := '(' + PlugDM.qPrint.FieldByName('STNAME_PARENT').AsString
                                    + ' ' + PlugDM.qPrint.FieldByName('DOCNUM_PARENT').AsString
                                    + ' от ' + PlugDM.qPrint.FieldByName('DATE_PARENT').AsString + ')'
    else
      SbisNakl.osnovanie.docInfo := '';
    SbisNakl.osnovanie.Docname := PlugDM.qPrint.FieldByName('STNAME').AsString + ' ' + PlugDM.qPrint.FieldByName('OBOSN_KOMMENT').AsString;
    SbisNakl.osnovanie.DocNum := PlugDM.qPrint.FieldByName('OBOSN_NOM_DOC').AsString;
    SbisNakl.osnovanie.DocDate := PlugDM.qPrint.FieldByName('OBOSN_DATA_DOC').AsString;

    SbisNakl.nomerTN := PlugDM.qPrint.FieldByName('DocNum_N').AsString;
    SbisNakl.dataTN := PlugDM.qPrint.FieldByName('Actual_Date').AsString;

    SbisNakl.sumOtpusk := PlugDM.qPrint.FieldByName('summa').value;
    SbisNakl.sumOtpuskPr := AnsiUpperCase(TextSum(PlugDM.qPrint.FieldByName('summa').value, 0));

    readSetting(company_id, 'EDO', 'TABNPod', value);
    SbisNakl.otpRazr.tabn := value;     //Отпуск разрешил

    while not(PlugDM.qDocLines.Eof) do
    begin
      SbisNakl.Nakldata.Append;
      SbisNakl.Nakldata.FieldByName('text').AsString :=
        ConstPrintDoc.GetNaimObosn(PlugDM.qDocLines.FieldByName('OBJ_ID').AsString, PlugDM.qDocLines.FieldByName('DECNUM').AsString)
        + PlugDM.qDocLines.FieldByName('NAIM').AsString;
      if PlugDM.qDocLines.FieldByName('KOD_EI').AsInteger in [10, 0] then
        SbisNakl.Nakldata.FieldByName('edname').AsString := '-'
      else
        SbisNakl.Nakldata.FieldByName('edname').AsString := PlugDM.qDocLines.FieldByName('edname').AsString;

      SbisNakl.Nakldata.FieldByName('KOD_OKEI').AsString := PlugDM.qDocLines.FieldByName('KOD_ED_IZM').AsString;
      SbisNakl.Nakldata.FieldByName('brutto').AsString := '';
      SbisNakl.Nakldata.FieldByName('netto').AsString := PlugDM.qDocLines.FieldByName('ITEM_COUNT').AsString;
      SbisNakl.Nakldata.FieldByName('price').AsString := floattostr(round(PlugDM.qDocLines.FieldByName('PRICEPRX').asfloat * 100) / 100);
      SbisNakl.Nakldata.FieldByName('summa').AsString := floattostr(round(PlugDM.qDocLines.FieldByName('SUMMA').asfloat * 100) / 100);
      SbisNakl.Nakldata.FieldByName('NALST').AsString := PlugDM.qDocLines.FieldByName('realperc').AsString; // Налоговая ставка
      if (PlugDM.qDocLines.FieldByName('SCH_NAL').AsInteger = 3) then
        SbisNakl.Nakldata.FieldByName('NALOG').AsString := '-'
      else
//        SbisNakl.Nakldata.FieldByName('NALOG').AsString := floattostr(round(PlugDM.qDocLines.FieldByName('nds').asfloat * 100) / 100);  //были расхождения в 1 копейку со счёт-фактурой
        SbisNakl.Nakldata.FieldByName('NALOG').AsString := floattostr(PlugDM.qDocLines.FieldByName('nds').asfloat);
      SbisNakl.Nakldata.FieldByName('sumnal').AsString :=
      floattostr(round((PlugDM.qDocLines.FieldByName('SUMMA').asfloat + PlugDM.qDocLines.FieldByName('nds').asfloat) * 100) / 100);
      PlugDM.qDocLines.Next;
      SbisNakl.Nakldata.Post;
    end;

    // Подписант - обязательно, но опять же, как ???
    readSetting(company_id, 'EDO', 'TABNPod', value);
    SbisNakl.Podpisant.tabn := value;
  finally
    PlugDM.qPrint.close;
    PlugDM.qDocLines.close;
  end;
end;

function PosSymbol(in_Str: string): string;
begin
  if pos('rdy', in_Str) <> 0 then
    Result := '.' + copy(in_Str, pos('rdy', in_Str), 3) + '.';
  if pos('fac', in_Str) <> 0 then
    Result := '.' + copy(in_Str, pos('fac', in_Str), 3) + '.';
  if pos('fin', in_Str) <> 0 then
    Result := '.' + copy(in_Str, pos('fin', in_Str), 3) + '.';
  if pos('crm', in_Str) <> 0 then
    Result := '.' + copy(in_Str, pos('crm', in_Str), 3) + '.';
end;

procedure ReadyUKDTOXML(id: integer; SbisUKD: TSbisUKD; p_TypeOp: string);
var
    value: string;
    SSummaB, SNDSSumB, STotalB: real;
    SSummaS, SNDSSumS, STotalS: real;
    OsnDoc: TOraQuery;
    SumStrT, NDSStrT: real;
    TotalD, SumStrTD, NDSStrTD: real;
    TotalDiff, SumStrTDiff, NDSStrTDiff: real;
begin
  try
    SSummaB := 0; // итог по увеличению суммы
    SNDSSumB := 0; // итог по увеличению суммы НДС
    STotalB := 0; // итог по увеличению стоимости
    SSummaS := 0; // итог по уменьшению суммы
    SNDSSumS := 0; // итог по уменьшению суммы НДС
    STotalS := 0; // итог по уменьшению стоимости

    PlugDM.qPrint.close;
    PlugDM.qPrint.ParamByName('OPNUM').AsInteger := id;
    PlugDM.qPrint.ParamByName('in_optype').AsString := p_TypeOp;
    PlugDM.qPrint.Open;
    if (PlugDM.qPrint.RecordCount = 0) then
      begin
        PlugDM.qPrint.close;
        raise EDataFoundException.Create('Корректировочный счет-фактура');
        Exit;
      end;
    if (Trim(PlugDM.qPrint.fieldbyname('DocNumfull').asstring) = '0') then
      begin
        raise Exception.Create('Невозможно выгрузить корректировочную счет-фактуру без номера!');
        exit;
      end;

    PlugDM.qGetCor_OPNUM.close;
    PlugDM.qGetCor_OPNUM.ParamByName('OPNUM').asinteger := id;
    PlugDM.qGetCor_OPNUM.open;
    if (PlugDM.qGetCor_OPNUM.RecordCount <= 0) then
      begin
        PlugDM.qGetCor_OPNUM.close;
        raise EDataFoundException.Create('Корректировочный счет-фактура');
        exit;
      end;

    if (Trim(PlugDM.qPrint.fieldbyname('DocNumfull').asstring) = '0') then
    begin
      raise Exception.Create('Невозможно выгрузить корректировочную счет-фактуру без номера!');
      exit;
    end;

    PlugDM.qDocLines.close;
    PlugDM.qDocLines.ParamByName('OPNUM').AsInteger := id;
    PlugDM.qDocLines.ParamByName('in_optype').AsString := p_TypeOp;
    PlugDM.qDocLines.Open;
    if (PlugDM.qDocLines.RecordCount = 0) then
      begin
        PlugDM.qPrint.close;
        PlugDM.qDocLines.close;
        raise EDataFoundException.Create('Счет-фактура');
        Exit;
      end;

    SbisUKD.DocNum := PlugDM.qPrint.fieldbyname('DocNumfull').asstring;
    SbisUKD.DocDate := PlugDM.qPrint.fieldbyname('Actual_Date').asstring;
    SbisUKD.KodOKV := PlugDM.qPrint.FieldByName('EDOKEI').AsInteger;

    // Грузоотправитель
    SbisUKD.CGruzOtpr.id := PlugDM.qPrint.FieldByName('gruzotpr').AsInteger;

    // Грузополучатель
    SbisUKD.CGruzPol.id := PlugDM.qPrint.FieldByName('contr_id').AsInteger;
//    SbisSF.CGruzPol.KPP := PlugDM.qPrint.FieldByName('PolKpp').AsString;  //07.07.2020, вывод КПП получателя, при выгрузке подставлялся КПП по умолчанию

    SbisUKD.CSender.DocDate := PlugDM.qPrint.FieldByName('Actual_Date').AsString;
    SbisUKD.CSender.id := PlugDM.qPrint.FieldByName('self_cod').AsInteger;

    SbisUKD.CDest.id := PlugDM.qPrint.FieldByName('truedest').AsInteger;

    if (PlugDM.qPrint.FieldByName('PARENT_ID').AsString <> '') and
      (PlugDM.qPrint.FieldByName('PARENT_ID').AsString <> '0') then
      SbisUKD.OsnComment := '(' + PlugDM.qPrint.FieldByName('STNAME_PARENT').AsString
                            + ' ' + PlugDM.qPrint.FieldByName('DOCNUM_PARENT').AsString
                            + ' от ' + PlugDM.qPrint.FieldByName('DATE_PARENT').AsString + ')'
    else
      SbisUKD.OsnComment := '';
    SbisUKD.OsnName := PlugDM.qPrint.FieldByName('STNAME').AsString + ' ' + PlugDM.qPrint.FieldByName('OBOSN_KOMMENT').AsString;
    SbisUKD.OsnNumber := PlugDM.qPrint.FieldByName('OBOSN_NOM_DOC').AsString;
    SbisUKD.OsnDate := PlugDM.qPrint.FieldByName('OBOSN_DATA_DOC').AsString;

    // Подписант - из настроек
    readSetting(company_id, 'EDO', 'TABNPod', value);
    SbisUKD.Podpisant.tabn := value;

    SbisUKD.NumParentDoc := PlugDM.qGetCor_OPNUM.fieldbyname('DocNum_l').asstring;
    SbisUKD.DateParentDoc := PlugDM.qGetCor_OPNUM.fieldbyname('Actual_Date_l').asstring;

    if (PlugDM.qGetCor_OPNUM.fieldbyname('OPNUM_COR').asinteger = PlugDM.qGetCor_OPNUM.fieldbyname('OPNUM_L').asinteger) then
      begin
        SbisUKD.NumIDoc := '';
        SbisUKD.DateIDoc := '';
      end
    else
      begin
        SbisUKD.NumIDoc := PlugDM.qGetCor_OPNUM.fieldbyname('DocNumfull').asstring;
        SbisUKD.DateIDoc := PlugDM.qGetCor_OPNUM.fieldbyname('Actual_Date').asstring;
      end;

    case StrToInt(p_TypeOp) of
      106, 103:
        begin // печать из реестра 103 | 106 оп.
          OsnDoc := PlugDM.qPrint103Cor;
        end;
    end;

    OsnDoc.close;
    OsnDoc.ParamByName('OPNUM').asinteger := id; // print_opnum;
    OsnDoc.open;

    PlugDM.qPrintDopStCor.close;
    PlugDM.qPrintDopStCor.ParamByName('OPNUM').asinteger := id;
    PlugDM.qPrintDopStCor.open;

    OsnDoc.First;
    while not(OsnDoc.eof) do
      begin
        SbisUKD.SFdata.Append;

        PlugDM.qProvDecNum.close;
        PlugDM.qProvDecNum.ParamByName('DECNUM').asstring := OsnDoc.fieldbyname('DECNUM').asstring;
        PlugDM.qProvDecNum.open;

        // ---- проверка - не ящик ли это----------------------------
        PlugDM.qBoxComps.close;
        PlugDM.qBoxComps.ParamByName('BOX_ID').asstring := PlugDM.qProvDecNum.fieldbyname('id').asstring;
        PlugDM.qBoxComps.open;

        if (PlugDM.qBoxComps.RecordCount > 0) then
          begin
            raise EDataFoundException.Create('Ящик в ЭДО не отправлен');
            Exit;

            {PlugDM.qBoxComps.First;
            while not(PlugDM.qBoxComps.eof) do
              begin
                b := '(' + format('%16s', [PlugDM.qBoxComps.fieldbyname('DECNUM').asstring]) + ') ' + PlugDM.qBoxComps.fieldbyname('NAIM').asstring;
                ArrWrds := DivToLen(b, NameLen);
                for i := 0 to length(ArrWrds) - 1 do
                  begin
                    case i of
                      0:
                        si.Name := 'Name1';
                      1:
                        si.Name := 'Name2';
                      2:
                        si.Name := 'Name3';
                      3:
                        si.Name := 'Name4';
                    end;
                    si.value := StrToOem(ArrWrds[i]);
                    report.SubList.Append(si);
                  end;

                si.Name := 'TNVEDKod';
                b := ' ';
                si.value := b;
                report.SubList.AppendReplace(si);

                si.Name := 'K';
                if (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 10) then
                begin
                  b := ' - ';
                  si.value := b;
                end
                else
                  si.value := StrToOem(PlugDM.qBoxComps.fieldbyname('EDNAME')
                      .asstring);
                report.SubList.AppendReplace(si);

                si.Name := 'E';
                if (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 10) then
                begin
                  b := '  -  ';
                  si.value := b;
                end
                else
                  si.value := AlignText(PlugDM.qBoxComps.fieldbyname('EDNAME')
                      .asstring, report.GetLengthItem(si.Name), al_Center);
                // Si.Value:=StrToOem(PlugDM.qBoxComps.FieldByName('EDNAME').AsString);
                report.SubList.AppendReplace(si);

                si.Name := 'AmmountD'; // к-во ДО
                fmt_str := '%' { +inttostr(Report.GetLengthItem('AmmountD')) } {+ '.';
                if (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 4) or
                  (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 10) then
                // рубли и ЕД.
                begin
                  b := '     -    ';
                  si.value := b;
                end
                else
                begin
                  if -1 <> -1 then
                    si.value := StrToOem(format(fmt_str + inttostr(-1) + 'n',
                        [OsnDoc.fieldbyname('ITEM_COUNT_COR')
                          .value * PlugDM.qBoxComps.fieldbyname('NUM').value]))
                  else
                    si.value := StrToOem(format(fmt_str + '3n',
                        [OsnDoc.fieldbyname('ITEM_COUNT_COR')
                          .value * PlugDM.qBoxComps.fieldbyname('NUM').value]));
                  si.value := AlignText(si.value, report.GetLengthItem(si.Name),
                    al_Center);
                end;
                report.SubList.AppendReplace(si);

                si.Name := 'Ammount'; // к-во ПОСЛЕ
                fmt_str := '%' { +inttostr(Report.GetLengthItem('Ammount')) } {+ '.';
                if (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 4) or
                  (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 10) then
                // рубли и ЕД.
                begin
                  b := '     -    ';
                  si.value := b;
                end
                else
                begin
                  if -1 <> -1 then
                    si.value := StrToOem(format(fmt_str + inttostr(-1) + 'n',
                        [OsnDoc.fieldbyname('ITEM_COUNT')
                          .value * PlugDM.qBoxComps.fieldbyname('NUM').value]))
                  else
                    si.value := StrToOem(format(fmt_str + '3n',
                        [OsnDoc.fieldbyname('ITEM_COUNT')
                          .value * PlugDM.qBoxComps.fieldbyname('NUM').value]));
                  si.value := AlignText(si.value, report.GetLengthItem(si.Name),
                    al_Center);
                end;
                report.SubList.AppendReplace(si);

                // цена для ящиков не меняется (пока так)
                si.Name := 'PriceD'; // цена ДО
                if (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 4) or
                  (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 10) then
                // рубли и ЕД.
                begin
                  b := '    -    ';
                  si.value := b;
                end
                else
                begin
                  si.value := StrToOem(format('%12.2n',
                      [PlugDM.qBoxComps.fieldbyname('price').value]));
                end;
                report.SubList.AppendReplace(si);

                si.Name := 'Price'; // цена ПОСЛЕ
                if (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 4) or
                  (PlugDM.qBoxComps.fieldbyname('KOD_EI').asinteger = 10) then
                // рубли и ЕД.
                begin
                  b := '    -    ';
                  si.value := b;
                end
                else
                begin
                  si.value := StrToOem(format('%12.2n',
                      [PlugDM.qBoxComps.fieldbyname('price').value]));
                end;
                report.SubList.AppendReplace(si);

                // сумма ДО
                SumStrTD := OsnDoc.fieldbyname('ITEM_COUNT_COR')
                  .value * PlugDM.qBoxComps.fieldbyname('NUM')
                  .value * PlugDM.qBoxComps.fieldbyname('price').value;
                PutAnySum(report, 'SummaD', SumStrTD);
                // сумма ПОСЛЕ
                SumStrT := OsnDoc.fieldbyname('ITEM_COUNT')
                  .value * PlugDM.qBoxComps.fieldbyname('NUM')
                  .value * PlugDM.qBoxComps.fieldbyname('price').value;
                PutAnySum(report, 'Summa', SumStrT);

                // сумма - увеличение/уменьшение
                SumStrTDiff := SumStrT - SumStrTD;
                if (SumStrTDiff = 0) then
                begin
                  si.Name := 'SummaB';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);

                  si.Name := 'SummaS';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);
                end
                else if (SumStrTDiff > 0) then
                begin
                  PutAnySum(report, 'SummaB', SumStrTDiff);

                  si.Name := 'SummaS';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);

                  SSummaB := SSummaB + SumStrTDiff;
                end
                else
                begin
                  si.Name := 'SummaB';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);

                  PutAnySum(report, 'SummaS', abs(SumStrTDiff));

                  SSummaS := SSummaS + abs(SumStrTDiff);
                end;

                si.Name := 'A';
                // b:='без акциза';
                si.value := AlignText('-', report.GetLengthItem(si.Name), al_Center);
                report.SubList.AppendReplace(si);

                // НДС ДО
                PlugDM.qNalogPerc.close;
                PlugDM.qNalogPerc.ParamByName('SCHID').asinteger := OsnDoc.fieldbyname
                  ('SCH_NAL_COR').asinteger;
                PlugDM.qNalogPerc.ParamByName('NALID').asinteger := 1;
                /// Ќ„‘
                PlugDM.qNalogPerc.open;

                si.Name := 'NDD';
                if (OsnDoc.fieldbyname('SCH_NAL_COR').asinteger = 3) then
                  si.value := ' - '
                else
                  si.value := AlignText
                    (FloatToStr(PlugDM.qNalogPerc.fieldbyname('REALPERC').AsFloat)
                      + '%', report.GetLengthItem(si.Name), al_Center);
                report.SubList.AppendReplace(si);

                NDSStrTD := OsnDoc.fieldbyname('ITEM_COUNT_COR')
                  .value * PlugDM.qBoxComps.fieldbyname('NUM')
                  .value * PlugDM.qBoxComps.fieldbyname('price')
                  .value * PlugDM.qNalogPerc.fieldbyname('NALPERC').value / 100;
                PutAnySum(report, 'NDSSUMD', NDSStrTD,
                  OsnDoc.fieldbyname('SCH_NAL_COR').asinteger);

                // НДС ПОСЛЕ
                PlugDM.qNalogPerc.close;
                PlugDM.qNalogPerc.ParamByName('SCHID').asinteger := OsnDoc.fieldbyname
                  ('SCH_NAL').asinteger;
                PlugDM.qNalogPerc.ParamByName('NALID').asinteger := 1;
                /// Ќ„‘
                PlugDM.qNalogPerc.open;

                si.Name := 'ND';
                if (OsnDoc.fieldbyname('SCH_NAL').asinteger = 3) then
                  si.value := ' - '
                else
                  si.value := AlignText
                    (FloatToStr(PlugDM.qNalogPerc.fieldbyname('REALPERC').AsFloat)
                      + '%', report.GetLengthItem(si.Name), al_Center);
                report.SubList.AppendReplace(si);

                NDSStrT := OsnDoc.fieldbyname('ITEM_COUNT')
                  .value * PlugDM.qBoxComps.fieldbyname('NUM')
                  .value * PlugDM.qBoxComps.fieldbyname('price')
                  .value * PlugDM.qNalogPerc.fieldbyname('NALPERC').value / 100;
                PutAnySum(report, 'NDSSUM', NDSStrT,
                  OsnDoc.fieldbyname('SCH_NAL').asinteger);

                // сумма НДС - увеличение/уменьшение
                NDSStrTDiff := NDSStrT - NDSStrTD;
                if (NDSStrTDiff = 0) then
                begin
                  si.Name := 'NDSSumB';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);

                  si.Name := 'NDSSumS';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);
                end
                else if (NDSStrTDiff > 0) then
                begin
                  PutAnySum(report, 'NDSSumB', NDSStrTDiff);

                  si.Name := 'NDSSumS';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);

                  SNDSSumB := SNDSSumB + NDSStrTDiff;
                end
                else
                begin
                  si.Name := 'NDSSumB';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);

                  PutAnySum(report, 'NDSSumS', abs(NDSStrTDiff));

                  SNDSSumS := SNDSSumS + abs(NDSStrTDiff);
                end;

                // стоимость ДО
                PutAnySum(report, 'TotalD', SumStrTD + NDSStrTD);
                // стоимость ПОСЛЕ
                PutAnySum(report, 'Total', SumStrT + NDSStrT);

                // стоимость - увеличение/уменьшение
                TotalDiff := (SumStrT + NDSStrT) - (SumStrTD + NDSStrTD);
                if (TotalDiff > 0) then
                begin
                  PutAnySum(report, 'TotalB', TotalDiff);

                  si.Name := 'TotalS';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);

                  STotalB := STotalB + TotalDiff;
                end
                else
                begin
                  si.Name := 'TotalB';
                  si.value := AlignText('-', report.GetLengthItem(si.Name),
                    al_Center);
                  report.SubList.AppendReplace(si);

                  PutAnySum(report, 'TotalS', abs(TotalDiff));

                  STotalS := STotalS + abs(TotalDiff);
                end;

                report.ListReplace(report.LineBody);
                // str_count:=str_count+KPodStr;

                PlugDM.qBoxComps.Next;
              end;}
          end
        else
          begin
            // 14.12.2005 условную позицию для суммовой разницы не выводить в счет-фактуру
            if (OsnDoc.fieldbyname('DECNUM').asstring <> '000000') then
              begin
                SbisUKD.SFdata.FieldByName('ProductName').AsString := GetNaimObosn(PlugDM.qProvDecNum.fieldbyname('ID').asstring, OsnDoc.fieldbyname('DECNUM').asstring) + OsnDoc.fieldbyname('NAIM').asstring;
                {si.Name := 'TNVEDKod';
                if OsnDoc.fieldbyname('tnved_code').asstring = '' then
                  b := AlignText('-', report.GetLengthItem(si.Name), al_Center)
                else
                  b := OsnDoc.fieldbyname('tnved_code').asstring;
                }

                // код ед.из. ДО
                if (OsnDoc.fieldbyname('KOD_EI').asinteger = 10) then
                  SbisUKD.SFdata.FieldByName('kodEIBefore').AsString := '000'
                else
                  SbisUKD.SFdata.FieldByName('kodEIBefore').AsString := OsnDoc.fieldbyname('KOD_ED_IZM').asstring;
                // код ед.из. ПОСЛЕ
                if (OsnDoc.fieldbyname('KOD_EI').asinteger = 10) then
                  SbisUKD.SFdata.FieldByName('kodEIAfter').AsString := '000'
                else
                  SbisUKD.SFdata.FieldByName('kodEIAfter').AsString := OsnDoc.fieldbyname('KOD_ED_IZM').asstring;
                // к-во ДО
                  SbisUKD.SFdata.FieldByName('countBefore').AsFloat := OsnDoc.fieldbyname('ITEM_COUNT_COR').AsFloat;
                // к-во ПОСЛЕ
                  SbisUKD.SFdata.FieldByName('countAfter').AsFloat := OsnDoc.fieldbyname('ITEM_COUNT').AsFloat;
                // цена ДО
                  SbisUKD.SFdata.FieldByName('priceBefore').AsFloat := OsnDoc.fieldbyname('PRICEPRX_COR').AsFloat;
                // цена ПОСЛЕ
                  SbisUKD.SFdata.FieldByName('priceAfter').AsFloat := OsnDoc.fieldbyname('PRICEPRX').AsFloat;
                // сумма ДО
                SbisUKD.SFdata.FieldByName('STnotNDSBefore').AsFloat := OsnDoc.fieldbyname('SUMMA_COR').AsFloat;
                SumStrTD := OsnDoc.fieldbyname('SUMMA_COR').AsFloat;
                // сумма ПОСЛЕ
                SbisUKD.SFdata.FieldByName('STnotNDSAfter').AsFloat := OsnDoc.fieldbyname('SUMMA').AsFloat;
                SumStrT := OsnDoc.fieldbyname('SUMMA').AsFloat;
                // сумма - увеличение/уменьшение
                SumStrTDiff := SumStrT - SumStrTD;
                if (SumStrTDiff = 0) then
                  begin
                    SbisUKD.SFdata.FieldByName('STnotNDSInc').AsFloat := 0;
                    SbisUKD.SFdata.FieldByName('STnotNDSDec').AsFloat := 0;
                  end
                else if (SumStrTDiff > 0) then
                       begin
                         SbisUKD.SFdata.FieldByName('STnotNDSDec').AsFloat := 0;
                         SbisUKD.SFdata.FieldByName('STnotNDSInc').AsFloat := ABS(SumStrTDiff);
                         SSummaB := SSummaB + SumStrTDiff;
                       end
                     else
                       begin
                         SbisUKD.SFdata.FieldByName('STnotNDSInc').AsFloat := 0;
                         SbisUKD.SFdata.FieldByName('STnotNDSDec').AsFloat := ABS(SumStrTDiff);
                         SSummaS := SSummaS + abs(SumStrTDiff);
                       end;
                // НДС ДО
                PlugDM.qNalogPerc.close;
                PlugDM.qNalogPerc.ParamByName('SCHID').asinteger := OsnDoc.fieldbyname('SCH_NAL_COR').asinteger;
                PlugDM.qNalogPerc.ParamByName('NALID').asinteger := 1;
                PlugDM.qNalogPerc.open;
                if (OsnDoc.fieldbyname('SCH_NAL_COR').asinteger = 3) then
                  SbisUKD.SFdata.FieldByName('ndsBefore').AsString := '-'
                else
                  SbisUKD.SFdata.FieldByName('ndsBefore').AsString := PlugDM.qNalogPerc.fieldbyname('REALPERC').AsString + '%';
                NDSStrTD := OsnDoc.fieldbyname('SUMMA_COR').AsFloat * PlugDM.qNalogPerc.fieldbyname('NALPERC').AsFloat / 100;
                SbisUKD.SFdata.FieldByName('sumNDSBefore').AsFloat := NDSStrTD;
                // НДС ПОСЛЕ
                PlugDM.qNalogPerc.close;
                PlugDM.qNalogPerc.ParamByName('SCHID').asinteger := OsnDoc.fieldbyname('SCH_NAL').asinteger;
                PlugDM.qNalogPerc.ParamByName('NALID').asinteger := 1;
                PlugDM.qNalogPerc.open;
                if (OsnDoc.fieldbyname('SCH_NAL').asinteger = 3) then
                  SbisUKD.SFdata.FieldByName('ndsAfter').AsString := '-'
                else
                  SbisUKD.SFdata.FieldByName('ndsAfter').AsString := PlugDM.qNalogPerc.fieldbyname('REALPERC').AsString + '%';
                NDSStrT := OsnDoc.fieldbyname('SUMMA').AsFloat * PlugDM.qNalogPerc.fieldbyname('NALPERC').AsFloat / 100;
                SbisUKD.SFdata.FieldByName('sumNDSAfter').AsFloat := NDSStrT;
                // сумма НДС - увеличение/уменьшение
                NDSStrTDiff := NDSStrT - NDSStrTD;
                if (NDSStrTDiff = 0) then
                  begin
                    SbisUKD.SFdata.FieldByName('sumNDSInc').AsFloat := 0;
                    SbisUKD.SFdata.FieldByName('sumNDSDec').AsFloat := 0;
                  end
                else if (NDSStrTDiff > 0) then
                       begin
                         SbisUKD.SFdata.FieldByName('sumNDSInc').AsFloat := ABS(NDSStrTDiff);
                         SbisUKD.SFdata.FieldByName('sumNDSDec').AsFloat := 0;
                         SNDSSumB := SNDSSumB + NDSStrTDiff;
                       end
                     else
                       begin
                         SbisUKD.SFdata.FieldByName('sumNDSInc').AsFloat := 0;
                         SbisUKD.SFdata.FieldByName('sumNDSDec').AsFloat := ABS(NDSStrTDiff);
                         SNDSSumS := SNDSSumS + abs(NDSStrTDiff);
                       end;
                // стоимость ДО
                SbisUKD.SFdata.FieldByName('STNDSBefore').AsFloat := SumStrTD + NDSStrTD;
                // стоимость ПОСЛЕ
                SbisUKD.SFdata.FieldByName('STNDSAfter').AsFloat := SumStrT + NDSStrT;
                // стоимость - увеличение/уменьшение
                TotalDiff := (SumStrT + NDSStrT) - (SumStrTD + NDSStrTD);
                if (TotalDiff > 0) then
                  begin
                    SbisUKD.SFdata.FieldByName('STNDSInc').AsFloat := ABS(TotalDiff);
                    SbisUKD.SFdata.FieldByName('STNDSDec').AsFloat := 0;
                    STotalB := STotalB + TotalDiff;
                  end
                else
                  begin
                    SbisUKD.SFdata.FieldByName('STNDSInc').AsFloat := 0;
                    SbisUKD.SFdata.FieldByName('STNDSDec').AsFloat := ABS(TotalDiff);
                    STotalS := STotalS + abs(TotalDiff);
                  end;
              end;
          end;
        SbisUKD.SFdata.Post;
        OsnDoc.Next;
      end;

    if SSummaB = 0 then
      SbisUKD.IncTotalStNotNDS := 0
    else
      SbisUKD.IncTotalStNotNDS := SSummaB;
    if SNDSSumB = 0 then
      SbisUKD.IncTotalNDS := 0
    else
      SbisUKD.IncTotalNDS := SNDSSumB;
    if STotalB = 0 then
      SbisUKD.IncTotalStNDS := 0
    else
      SbisUKD.IncTotalStNDS := STotalB;
    if SSummaS = 0 then
      SbisUKD.DecTotalStNotNDS := 0
    else
      SbisUKD.DecTotalStNotNDS := SSummaS;
    if SNDSSumS = 0 then
      SbisUKD.DecTotalNDS := 0
    else
      SbisUKD.DecTotalNDS := SNDSSumS;
    if STotalS = 0 then
      SbisUKD.DecTotalStNDS := 0
    else
      SbisUKD.DecTotalStNDS := STotalS;
  finally
    PlugDM.qPrint.close;
    PlugDM.qDocLines.close;
    PlugDM.qNalogPerc.close;
    PlugDM.qBoxComps.close;
    PlugDM.qProvDecNum.close;
    PlugDM.qPrintDopStCor.close;
    OsnDoc.close;
    PlugDM.qGetCor_OPNUM.close;
  end;
end;

procedure FacUKDTOXML(id: integer; SbisUKD: TSbisUKD; p_TypeOp: string);
var
  value:string;
  SSummaB, SNDSSumB, STotalB: real;
  SSummaS, SNDSSumS, STotalS: real;
  SumStrT, NDSStrT: real;
  TotalD, SumStrTD, NDSStrTD: real;
  TotalDiff, SumStrTDiff, NDSStrTDiff: real;
begin
  SSummaB := 0; // итог по увеличению суммы
  SNDSSumB := 0; // итог по увеличению суммы НДС
  STotalB := 0; // итог по увеличению стоимости
  SSummaS := 0; // итог по уменьшению суммы
  SNDSSumS := 0; // итог по уменьшению суммы НДС
  STotalS := 0; // итог по уменьшению стоимости

  PlugDM.qrDocPlPor.close;
  PlugDM.qrDocPlPor.ParamByName('Id').value := id;
  PlugDM.qrDocPlPor.ParamByName('cId').value := company_id;
  PlugDM.qrDocPlPor.ParamByName('union_s').AsString := '0';
  PlugDM.qrDocPlPor.Open;
  PlugDM.qrSFList.close;
  PlugDM.qrSFList.ParamByName('ID').asfloat := PlugDM.qrDocPlPor.ParamByName('Id').asfloat;
  PlugDM.qrSFList.ParamByName('cId').value := company_id;
  PlugDM.qrSFList.ParamByName('union_s').AsString := '0';
  PlugDM.qrSFList.ParamByName('deffrm').AsString := 'FrmInvoiceCor';
  PlugDM.qrSFList.Open;

  SbisUKD.CDest.id := PlugDM.qrDocPlPor.FieldByName('Dest').AsInteger;
  SbisUKD.CSender.id := PlugDM.qrDocPlPor.FieldByName('SENDERCOD').AsInteger;
  SbisUKD.CSender.Name := PlugDM.qrDocPlPor.FieldByName('RSNAME').AsString;
  SbisUKD.DocNum := PlugDM.qrDocPlPor.FieldByName('NUMPOR').AsString;
  SbisUKD.DocDate := PlugDM.qrDocPlPor.FieldByName('DATE2').AsString;
  SbisUKD.KodOKV := PlugDM.qrDocPlPor.FieldByName('CNTRKOD').AsInteger;

  SbisUKD.OsnName := PlugDM.qrDocPlPor.FieldByName('OSNTYPE').AsString;
  SbisUKD.OsnNumber := PlugDM.qrDocPlPor.FieldByName('OSNDOCNUM').AsString;
  SbisUKD.OsnDate := PlugDM.qrDocPlPor.FieldByName('OSNDOCDATE').AsString;

  if PlugDM.qrDocPlPor.FieldByName('TAB_RU').AsString <> '' then
    SbisUKD.Podpisant.tabn := PlugDM.qrDocPlPor.FieldByName('TAB_RU').AsString
  else
    begin
      // Подписант - из настроек
      readSetting(company_id, 'EDO', 'TABNPod', value);
      SbisUKD.Podpisant.tabn := value;
    end;

  PlugDM.qrSFNum_Cor.close;
  PlugDM.qrSFNum_Cor.ParamByName('pdocid').asinteger := PlugDM.qrDocPlPor.ParamByName('Id').asinteger;
  PlugDM.qrSFNum_Cor.open;
  SbisUKD.NumParentDoc := PlugDM.qrSFNum_Cor.fieldbyname('numpor_l').asstring;
  SbisUKD.DateParentDoc := PlugDM.qrSFNum_Cor.fieldbyname('datepor_l').asstring;
  if PlugDM.qrSFNum_Cor.fieldbyname('docid_out').asinteger <> PlugDM.qrSFNum_Cor.fieldbyname('docid_l').asinteger then
    begin
      SbisUKD.NumIDoc := PlugDM.qrSFNum_Cor.fieldbyname('numpor_out').asstring;
      SbisUKD.DateIDoc := PlugDM.qrSFNum_Cor.fieldbyname('datepor_out').asstring;
    end;

  PlugDM.qrSFList.First;
  while not PlugDM.qrSFList.Eof do
    begin
      SbisUKD.SFdata.Append;

      SbisUKD.SFdata.FieldByName('ProductName').AsString := PlugDM.qrSFList.fieldbyname('StrName').asstring;
      // код ед.из. ДО
      if (PlugDM.qrSFList.fieldbyname('KODEI').asinteger = 10) then
        SbisUKD.SFdata.FieldByName('kodEIBefore').AsString := '-'
      else
        SbisUKD.SFdata.FieldByName('kodEIBefore').AsString := PlugDM.qrSFList.fieldbyname('KOD').asstring;
      // код ед.из. ПОСЛЕ
      if (PlugDM.qrSFList.fieldbyname('KODEI').asinteger = 10) then
        SbisUKD.SFdata.FieldByName('kodEIAfter').AsString := '-'
      else
        SbisUKD.SFdata.FieldByName('kodEIAfter').AsString := PlugDM.qrSFList.fieldbyname('KOD').asstring;
      // к-во ДО
      SbisUKD.SFdata.FieldByName('countBefore').AsFloat := PlugDM.qrSFList.fieldbyname('Ammount').AsFloat;
      // к-во ПОСЛЕ
      SbisUKD.SFdata.FieldByName('countAfter').AsFloat := PlugDM.qrSFList.fieldbyname('Ammount').AsFloat;
      // цена ДО
      SbisUKD.SFdata.FieldByName('priceBefore').AsFloat := PlugDM.qrSFList.fieldbyname('PRICE').AsFloat;
      // цена ПОСЛЕ
      SbisUKD.SFdata.FieldByName('priceAfter').AsFloat := PlugDM.qrSFList.fieldbyname('PRICE').AsFloat;
      // сумма ДО
      SbisUKD.SFdata.FieldByName('STnotNDSBefore').AsFloat := PlugDM.qrSFList.fieldbyname('Summa_cor').AsFloat;
      SumStrTD := PlugDM.qrSFList.fieldbyname('Summa_cor').AsFloat;
      // сумма ПОСЛЕ
      SbisUKD.SFdata.FieldByName('STnotNDSAfter').AsFloat := PlugDM.qrSFList.fieldbyname('AllSum').AsFloat;
      SumStrT := PlugDM.qrSFList.fieldbyname('AllSum').AsFloat;
      // сумма - увеличение/уменьшение
      SumStrTDiff := SumStrT - SumStrTD;
      if (SumStrTDiff = 0) then
        begin
          SbisUKD.SFdata.FieldByName('STnotNDSInc').AsFloat := 0;
          SbisUKD.SFdata.FieldByName('STnotNDSDec').AsFloat := 0;
        end
      else if (SumStrTDiff > 0) then
             begin
               SbisUKD.SFdata.FieldByName('STnotNDSDec').AsFloat := 0;
               SbisUKD.SFdata.FieldByName('STnotNDSInc').AsFloat := ABS(SumStrTDiff);
               SSummaB := SSummaB + SumStrTDiff;
             end
           else
             begin
               SbisUKD.SFdata.FieldByName('STnotNDSInc').AsFloat := 0;
               SbisUKD.SFdata.FieldByName('STnotNDSDec').AsFloat := ABS(SumStrTDiff);
               SSummaS := SSummaS + abs(SumStrTDiff);
             end;
      // НДС ДО
      SbisUKD.SFdata.FieldByName('ndsBefore').AsString := PlugDM.qrSFList.fieldbyname('NDS_COR').AsString;
      NDSStrTD := PlugDM.qrSFList.fieldbyname('SumNDS_cor').AsFloat;
      SbisUKD.SFdata.FieldByName('sumNDSBefore').AsFloat := NDSStrTD;
      // НДС ПОСЛЕ
      SbisUKD.SFdata.FieldByName('ndsAfter').AsString := PlugDM.qrSFList.fieldbyname('NDS').AsString;
      NDSStrT := PlugDM.qrSFList.fieldbyname('SumNDS').AsFloat;
      SbisUKD.SFdata.FieldByName('sumNDSAfter').AsFloat := NDSStrT;
      // сумма НДС - увеличение/уменьшение
      NDSStrTDiff := NDSStrT - NDSStrTD;
      if (NDSStrTDiff = 0) then
        begin
          SbisUKD.SFdata.FieldByName('sumNDSInc').AsFloat := 0;
          SbisUKD.SFdata.FieldByName('sumNDSDec').AsFloat := 0;
        end
      else if (NDSStrTDiff > 0) then
             begin
               SbisUKD.SFdata.FieldByName('sumNDSInc').AsFloat := ABS(NDSStrTDiff);
               SbisUKD.SFdata.FieldByName('sumNDSDec').AsFloat := 0;
               SNDSSumB := SNDSSumB + NDSStrTDiff;
             end
           else
             begin
               SbisUKD.SFdata.FieldByName('sumNDSInc').AsFloat := 0;
               SbisUKD.SFdata.FieldByName('sumNDSDec').AsFloat := ABS(NDSStrTDiff);
               SNDSSumS := SNDSSumS + abs(NDSStrTDiff);
             end;
      // стоимость ДО
      SbisUKD.SFdata.FieldByName('STNDSBefore').AsFloat := PlugDM.qrSFList.fieldbyname('totalsum_cor').AsFloat; //SumStrTD + NDSStrTD;
      // стоимость ПОСЛЕ
      SbisUKD.SFdata.FieldByName('STNDSAfter').AsFloat := PlugDM.qrSFList.fieldbyname('totalsum').AsFloat; //SumStrT + NDSStrT;
      // стоимость - увеличение/уменьшение
      TotalDiff := (SumStrT + NDSStrT) - (SumStrTD + NDSStrTD);
      if (TotalDiff > 0) then
        begin
          SbisUKD.SFdata.FieldByName('STNDSInc').AsFloat := ABS(TotalDiff);
          SbisUKD.SFdata.FieldByName('STNDSDec').AsFloat := 0;
          STotalB := STotalB + TotalDiff;
        end
      else
        begin
          SbisUKD.SFdata.FieldByName('STNDSInc').AsFloat := 0;
          SbisUKD.SFdata.FieldByName('STNDSDec').AsFloat := ABS(TotalDiff);
          STotalS := STotalS + abs(TotalDiff);
        end;
      SbisUKD.SFdata.Post;
      PlugDM.qrSFList.Next;
    end;

  if SSummaB = 0 then
      SbisUKD.IncTotalStNotNDS := 0
    else
      SbisUKD.IncTotalStNotNDS := SSummaB;
    if SNDSSumB = 0 then
      SbisUKD.IncTotalNDS := 0
    else
      SbisUKD.IncTotalNDS := SNDSSumB;
    if STotalB = 0 then
      SbisUKD.IncTotalStNDS := 0
    else
      SbisUKD.IncTotalStNDS := STotalB;
    if SSummaS = 0 then
      SbisUKD.DecTotalStNotNDS := 0
    else
      SbisUKD.DecTotalStNotNDS := SSummaS;
    if SNDSSumS = 0 then
      SbisUKD.DecTotalNDS := 0
    else
      SbisUKD.DecTotalNDS := SNDSSumS;
    if STotalS = 0 then
      SbisUKD.DecTotalStNDS := 0
    else
      SbisUKD.DecTotalStNDS := STotalS;
end;

procedure CRMActTOXML(id: integer; SbisAktS: TSbisAktS; p_BegDate: string = ''; p_EndDate: string = '');
var
  value: string;
  i, RecCount: integer;
  ItogP, ItogR, StartSumma, SItogo: real;
begin
  SbisAktS.BegPeriod := p_BegDate;
  SbisAktS.EndPeriod := p_EndDate;
//  SbisAktS.DocNum := IntToStr(Random(100000));
  uDMSbis.DMSbis.qCompany.Close;
  uDMSbis.DMSbis.qCompany.ParamByName('company_id').AsInteger := Company_id;
  uDMSbis.DMSbis.qCompany.Open;

  if uDMSbis.DMSbis.qCompany.RecordCount <= 0 then
    begin
      uDMSbis.DMSbis.qCompany.Close;
      raise EDataFoundException.Create('Акт сверки. Не найден отправитель.');
      Exit;
    end;
  SbisAktS.CSender.id := uDMSbis.DMSbis.qCompany.FieldByName('contr_id').AsInteger;

  PlugDM.qrPrih.Close;
  PlugDM.qrPrih.ParamByName('CA').Value := id;
  PlugDM.qrPrih.ParamByName('Company_Id').Value := Company_id;
  PlugDM.qrPrih.ParamByName('date1').Value := p_BegDate;
  PlugDM.qrPrih.ParamByName('date2').Value := p_EndDate;
  PlugDM.qrPrih.Open;

  PlugDM.qrRash.Close;
  PlugDM.qrRash.ParamByName('CA').Value := id;
  PlugDM.qrRash.ParamByName('Company_Id').Value := Company_id;
  PlugDM.qrRash.ParamByName('date1').Value := p_BegDate;
  PlugDM.qrRash.ParamByName('date2').Value := p_EndDate;
  PlugDM.qrRash.Open;

  RecCount := PlugDM.qrPrih.RecordCount + PlugDM.qrRash.RecordCount;
  SetLength(SbisAktS.ArrDocid, RecCount);

  PlugDM.qrPrih.First;
  PlugDM.qrRash.First;
      //добавляем данные по приходу
      while not(PlugDM.qrPrih.Eof) do
        begin
          if VarIsNull(SbisAktS.CDest.id) or (SbisAktS.CDest.id = 0) then
            SbisAktS.CDest.id := PlugDM.qrPrih.FieldByName('CONTRAGENT').AsInteger;

          SbisAktS.ArrDocid[PlugDM.qrPrih.RecNo - 1] := PlugDM.qrPrih.FieldByName('DOCID').AsInteger;

          SbisAktS.AKTData.Append;
          SbisAktS.AKTData.FieldByName('NumDoc').AsString := PlugDM.qrPrih.FieldByName('NUMPOR_VIEW').AsString;
          SbisAktS.AKTData.FieldByName('DateDoc').AsDateTime := PlugDM.qrPrih.FieldByName('DAT').AsDateTime;
          SbisAktS.AKTData.FieldByName('SumDoc').AsFloat := PlugDM.qrPrih.FieldByName('SUMMA').AsFloat;
          SbisAktS.AKTData.FieldByName('PRIH_RASH').AsString := PlugDM.qrPrih.FieldByName('PRIH_RASH').AsString;
          SbisAktS.AKTData.FieldByName('Remark').AsString := PlugDM.qrPrih.FieldByName('REMARK').AsString;
          SbisAktS.AKTData.Post;
          PlugDM.qrPrih.Next;
        end;
      //добавляем данные по расходу
      while not(PlugDM.qrRash.Eof) do
        begin
          if VarIsNull(SbisAktS.CDest.id) or (SbisAktS.CDest.id = 0) then
            SbisAktS.CDest.id := PlugDM.qrRash.FieldByName('CONTRAGENT').AsInteger;

          SbisAktS.ArrDocid[PlugDM.qrPrih.RecNo + PlugDM.qrRash.RecNo - 1] := PlugDM.qrRash.FieldByName('DOCID').AsInteger;

          SbisAktS.AKTData.Append;
          SbisAktS.AKTData.FieldByName('NumDoc').AsString := PlugDM.qrRash.FieldByName('NUMPOR_VIEW').AsString;
          SbisAktS.AKTData.FieldByName('DateDoc').AsDateTime := PlugDM.qrRash.FieldByName('DAT').AsDateTime;
          SbisAktS.AKTData.FieldByName('SumDoc').AsFloat := PlugDM.qrRash.FieldByName('SUMMA').AsFloat;
          SbisAktS.AKTData.FieldByName('PRIH_RASH').AsString := PlugDM.qrRash.FieldByName('PRIH_RASH').AsString;
          SbisAktS.AKTData.FieldByName('Remark').AsString := PlugDM.qrRash.FieldByName('REMARK').AsString;
          SbisAktS.AKTData.Post;
          PlugDM.qrRash.Next;
        end;
  readSetting(company_id, 'EDO', 'TABNPod', value);
  SbisAktS.Podpisant.tabn := value;
  readSetting(company_id, 'EDO', 'Main_Buh', value);
  SbisAktS.GlavBuh.tabn := value;
  PlugDM.prcGetItogSumsOnDateWithStart.ParamByName('Contragt').Value := id;
  PlugDM.prcGetItogSumsOnDateWithStart.ParamByName('Company').Value := Company_id;
  PlugDM.prcGetItogSumsOnDateWithStart.ParamByName('Date1').Value := p_BegDate;
  PlugDM.prcGetItogSumsOnDateWithStart.ParamByName('Date2').Value := p_EndDate;
  PlugDM.prcGetItogSumsOnDateWithStart.ExecProc;
  if PlugDM.prcGetItogSumsOnDateWithStart.ParamByName('Result').Value = 0 then
    begin
      ItogP := 0;
      ItogR := 0;
      StartSumma := 0;
    end
  else
    begin
      ItogP := PlugDM.prcGetItogSumsOnDateWithStart.ParamByName('ItogP').Value;
      ItogR := PlugDM.prcGetItogSumsOnDateWithStart.ParamByName('ItogR').Value;
      StartSumma := PlugDM.prcGetItogSumsOnDateWithStart.ParamByName('StartSum').Value;
    end;
  SItogo := StartSumma - ItogP + ItogR;
  SbisAktS.StartSumma := StartSumma;
  SbisAktS.ItogP := ItogP;
  SbisAktS.ItogR := ItogR;
  SbisAktS.SItogo := SItogo;
end;

end.
