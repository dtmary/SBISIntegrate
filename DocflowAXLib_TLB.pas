unit DocflowAXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 17244 $
// File generated on 18.05.2022 11:17:01 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\SBIS3SDK\Library\Sbis3SDK.dll (1)
// LIBID: {8C38FE88-A599-4292-843C-8246BA41FF88}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DocflowAXLibMajorVersion = 1;
  DocflowAXLibMinorVersion = 0;

  LIBID_DocflowAXLib: TGUID = '{8C38FE88-A599-4292-843C-8246BA41FF88}';

  IID_ISimpleObject: TGUID = '{8F173AD5-8E2B-47BB-9055-F6C5F4C1B7A6}';
  CLASS_SimpleObject: TGUID = '{555AB111-EABD-4F80-AEE8-E01BF2551970}';
  IID_ISimpleObjectList: TGUID = '{B0543731-02D7-4C30-9932-BC70A5B43996}';
  CLASS_SimpleObjectList: TGUID = '{4556AD24-A0A8-4D3B-95CD-B93FBDFD0DAD}';
  IID_IDocflow: TGUID = '{22312D9E-FB2D-4F36-B8A8-CC37258EA6E8}';
  CLASS_Docflow: TGUID = '{B6DD4549-4191-415E-A0AF-0B50434ABF39}';
  IID_IStreamHelper: TGUID = '{C7FCAEA2-8CDB-41A8-8C1D-FF3656FE438C}';
  CLASS_StreamHelper: TGUID = '{E7E7DC0E-50B2-4869-8491-0E96AF274531}';
  IID_IInvoke1S: TGUID = '{89EF899A-45ED-4153-8F22-0F88DA6F228D}';
  CLASS_Invoke1S: TGUID = '{A49B4692-F945-474E-97EC-7F1DF4292E30}';
  IID_ILog: TGUID = '{57077488-2A88-4ACD-9091-66DC6EFFAB49}';
  CLASS_Log: TGUID = '{2FC86A70-8E1C-4CA3-A13F-D0F5E98C392F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISimpleObject = interface;
  ISimpleObjectDisp = dispinterface;
  ISimpleObjectList = interface;
  ISimpleObjectListDisp = dispinterface;
  IDocflow = interface;
  IDocflowDisp = dispinterface;
  IStreamHelper = interface;
  IStreamHelperDisp = dispinterface;
  IInvoke1S = interface;
  IInvoke1SDisp = dispinterface;
  ILog = interface;
  ILogDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SimpleObject = ISimpleObject;
  SimpleObjectList = ISimpleObjectList;
  Docflow = IDocflow;
  StreamHelper = IStreamHelper;
  Invoke1S = IInvoke1S;
  Log = ILog;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PSYSINT1 = ^SYSINT; {*}


// *********************************************************************//
// Interface: ISimpleObject
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8F173AD5-8E2B-47BB-9055-F6C5F4C1B7A6}
// *********************************************************************//
  ISimpleObject = interface(IDispatch)
    ['{8F173AD5-8E2B-47BB-9055-F6C5F4C1B7A6}']
    function ReadLastErrorEx: ISimpleObject; safecall;
    function ReadLastError: WideString; safecall;
    function Exists(const key_in: WideString): Integer; safecall;
    function IsEmpty: Integer; safecall;
    function Remove(const key_in: WideString): Integer; safecall;
    function Clear: Integer; safecall;
    function TypeOf(const key_in: WideString): WideString; safecall;
    function ReadType: WideString; safecall;
    function Write(const key_in: WideString; const value_in: WideString): Integer; safecall;
    function WriteObject(const key_in: WideString; const value_in: ISimpleObject): Integer; safecall;
    function WriteObjectList(const key_in: WideString; const value_in: ISimpleObjectList): Integer; safecall;
    function Read(const key_in: WideString): WideString; safecall;
    function ReadObject(const key_in: WideString): ISimpleObject; safecall;
    function ReadObjectList(const key_in: WideString): ISimpleObjectList; safecall;
    function ReadKeyByIndex(index: Integer): WideString; safecall;
    function ReadKeys: PSafeArray; safecall;
    function Get_keys: PSafeArray; safecall;
    function ReadCount: Integer; safecall;
    function Get_count: Integer; safecall;
    property keys: PSafeArray read Get_keys;
    property count: Integer read Get_count;
  end;

// *********************************************************************//
// DispIntf:  ISimpleObjectDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {8F173AD5-8E2B-47BB-9055-F6C5F4C1B7A6}
// *********************************************************************//
  ISimpleObjectDisp = dispinterface
    ['{8F173AD5-8E2B-47BB-9055-F6C5F4C1B7A6}']
    function ReadLastErrorEx: ISimpleObject; dispid 1610743808;
    function ReadLastError: WideString; dispid 1610743809;
    function Exists(const key_in: WideString): Integer; dispid 1610743810;
    function IsEmpty: Integer; dispid 1610743811;
    function Remove(const key_in: WideString): Integer; dispid 1610743812;
    function Clear: Integer; dispid 1610743813;
    function TypeOf(const key_in: WideString): WideString; dispid 1610743814;
    function ReadType: WideString; dispid 1610743815;
    function Write(const key_in: WideString; const value_in: WideString): Integer; dispid 1610743816;
    function WriteObject(const key_in: WideString; const value_in: ISimpleObject): Integer; dispid 1610743817;
    function WriteObjectList(const key_in: WideString; const value_in: ISimpleObjectList): Integer; dispid 1610743818;
    function Read(const key_in: WideString): WideString; dispid 1610743819;
    function ReadObject(const key_in: WideString): ISimpleObject; dispid 1610743820;
    function ReadObjectList(const key_in: WideString): ISimpleObjectList; dispid 1610743821;
    function ReadKeyByIndex(index: Integer): WideString; dispid 1610743822;
    function ReadKeys: {??PSafeArray}OleVariant; dispid 1610743823;
    property keys: {??PSafeArray}OleVariant readonly dispid 1610743824;
    function ReadCount: Integer; dispid 1610743825;
    property count: Integer readonly dispid 1610743826;
  end;

// *********************************************************************//
// Interface: ISimpleObjectList
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {B0543731-02D7-4C30-9932-BC70A5B43996}
// *********************************************************************//
  ISimpleObjectList = interface(IDispatch)
    ['{B0543731-02D7-4C30-9932-BC70A5B43996}']
    function ReadLastErrorEx: ISimpleObject; safecall;
    function ReadLastError: WideString; safecall;
    function Add(const value_in: ISimpleObject): Integer; safecall;
    function Delete(item_index_in: Integer): Integer; safecall;
    function Clear: Integer; safecall;
    function At(item_index_in: Integer): ISimpleObject; safecall;
    function ReadType: WideString; safecall;
    function ReadCount: Integer; safecall;
    function Get_count: Integer; safecall;
    property count: Integer read Get_count;
  end;

// *********************************************************************//
// DispIntf:  ISimpleObjectListDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {B0543731-02D7-4C30-9932-BC70A5B43996}
// *********************************************************************//
  ISimpleObjectListDisp = dispinterface
    ['{B0543731-02D7-4C30-9932-BC70A5B43996}']
    function ReadLastErrorEx: ISimpleObject; dispid 1610743808;
    function ReadLastError: WideString; dispid 1610743809;
    function Add(const value_in: ISimpleObject): Integer; dispid 1610743810;
    function Delete(item_index_in: Integer): Integer; dispid 1610743811;
    function Clear: Integer; dispid 1610743812;
    function At(item_index_in: Integer): ISimpleObject; dispid 1610743813;
    function ReadType: WideString; dispid 1610743814;
    function ReadCount: Integer; dispid 1610743815;
    property count: Integer readonly dispid 1610743816;
  end;

// *********************************************************************//
// Interface: IDocflow
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {22312D9E-FB2D-4F36-B8A8-CC37258EA6E8}
// *********************************************************************//
  IDocflow = interface(IDispatch)
    ['{22312D9E-FB2D-4F36-B8A8-CC37258EA6E8}']
    function ReadLastErrorEx: ISimpleObject; safecall;
    function ReadLastError: WideString; safecall;
    function CreateSimpleObject: ISimpleObject; safecall;
    function CreateSimpleObjectList: ISimpleObjectList; safecall;
    function Authenticate(const auth_login_in: WideString; const auth_password_in: WideString): Integer; safecall;
    function AuthenticateByUserInfo(const user_info_in: ISimpleObject): Integer; safecall;
    function AuthenticateByCertificate(const certificate_info_in: ISimpleObject): Integer; safecall;
    function ConfirmAuth(const code: WideString): Integer; safecall;
    function ConfirmAuthByCertificate(const code: WideString; 
                                      const certificate_info_in: ISimpleObject): Integer; safecall;
    function ReadCertificates(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function VerifyCertificates(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function ReadCertificatesForAuth(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function WriteConnectionInfo(const connection_info_in: ISimpleObject): Integer; safecall;
    function ReadConnectionInfo: ISimpleObject; safecall;
    function TerminateSession: Integer; safecall;
    function CheckSession: Integer; safecall;
    function AccountsList: ISimpleObject; safecall;
    function SwitchAccount(const param_in: ISimpleObject): Integer; safecall;
    function ReadServerVersionInformation: ISimpleObject; safecall;
    function ReadVersion: WideString; safecall;
    function WriteAttachment(const document_in: ISimpleObject): ISimpleObject; safecall;
    function WriteDocument(const document_in: ISimpleObject): ISimpleObject; safecall;
    function WritePackage(const documents_in: ISimpleObjectList): ISimpleObjectList; safecall;
    function UpdateDocument(const addressing_in: ISimpleObject; const document_in: ISimpleObject): ISimpleObject; safecall;
    function ReadDocument(const document_in: ISimpleObject): ISimpleObject; safecall;
    function DeleteDocument(const document_in: ISimpleObject): Integer; safecall;
    function EliminateDocument(const document_in: ISimpleObject): Integer; safecall;
    function RestoreDocument(const document_in: ISimpleObject): Integer; safecall;
    function PrepareAction(const document_in: ISimpleObject): ISimpleObject; safecall;
    function ExecuteAction(const document_in: ISimpleObject): ISimpleObject; safecall;
    function ReadServiceStagesInfo(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function ReadServiceStages(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function ReadChanges(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function ReadDocuments(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function ReadDocumentsByEvents(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function ReadOurOrganizations(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function ReadDocumentAsHTML(const document_in: ISimpleObject): ISimpleObject; safecall;
    function GenerateHTMLFromXML(const param_in: ISimpleObject): ISimpleObject; safecall;
    function ReadContragentInfo(const value_in: ISimpleObject): ISimpleObject; safecall;
    function ProcessServiceStagesEx(const param_in: ISimpleObject): ISimpleObject; safecall;
    function WriteDocumentEx(const document_in: ISimpleObject): ISimpleObject; safecall;
    function WriteDocumentsEx(const param_in: ISimpleObject): ISimpleObject; safecall;
    function ExecuteActionEx(const document_in: ISimpleObject): ISimpleObject; safecall;
    function AcquireCertificateActivation(const certificate_info_in: ISimpleObject): Integer; safecall;
    function ActivateCertificate(const certificate_info_in: ISimpleObject): Integer; safecall;
    function ReadCurrentUserInfo: ISimpleObject; safecall;
    function EnableEmulation: Integer; safecall;
    function LoadDataFromURI(const uri_in: WideString): WideString; safecall;
    function LoadBinaryDataFromURI(const uri_in: WideString): WideString; safecall;
    function LoadDataFromURIToFile(const uri_in: WideString; const filename_in: WideString): Integer; safecall;
    function ImportNomenclatureFromCML(const param_in: ISimpleObject): ISimpleObject; safecall;
    function NomenclatureGetEGAISInfo(const param_in: WideString): ISimpleObject; safecall;
    function RetailWorkplaceList: ISimpleObject; safecall;
    function GetWorkplaceSettings(var param_in: SYSINT): ISimpleObject; safecall;
    function NomenclatureCarrySmartCreate(const batch: ISimpleObject; canUpdate: Integer): ISimpleObject; safecall;
    function NomenclatureGetGoodByEGAIS(const param_in: WideString): SYSINT; safecall;
    function NomenclatureRead(id: SYSINT; const params: ISimpleObject): ISimpleObject; safecall;
    function NomenclatureGetGoodByEAN(const code: WideString): SYSINT; safecall;
    function NomenclatureReadGoodByEGAIS(const code: WideString; const params: WideString): ISimpleObject; safecall;
    function NomenclatureReadGoodByEAN(const code: WideString; const params: WideString): ISimpleObject; safecall;
    function GetStringUserInfo: WideString; safecall;
    function VerifyPinCode(var param_in: SYSINT): SYSINT; safecall;
    function WritePinCode(var param_in: SYSINT): SYSINT; safecall;
    function LockSession: SYSINT; safecall;
    function WriteEmployee(const param_in: ISimpleObject): ISimpleObject; safecall;
    function ReadUserParam(const path: WideString): WideString; safecall;
    function WriteUserParam(const path: WideString; const value: WideString): Integer; safecall;
    function ReadIntegrationConfig(const path: WideString): ISimpleObject; safecall;
    function ReadConfig(const filter_in: ISimpleObject; const ini_in: ISimpleObjectList): ISimpleObject; safecall;
    function GetTaskList(const filter_in: ISimpleObject): ISimpleObject; safecall;
    function ReadConnectionList(const filter_in: ISimpleObject; const ini_in: ISimpleObjectList): ISimpleObjectList; safecall;
    function ReadConnection(const filter_in: ISimpleObject; const ini_in: ISimpleObjectList): ISimpleObject; safecall;
    function WriteConnection(const filter_in: ISimpleObject; const ini_in: ISimpleObjectList): WideString; safecall;
    function WriteError(const error: ISimpleObject): ISimpleObject; safecall;
    function WriteStat(const stat: ISimpleObject): ISimpleObject; safecall;
    function WriteConfig_v2(const param: ISimpleObject): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDocflowDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {22312D9E-FB2D-4F36-B8A8-CC37258EA6E8}
// *********************************************************************//
  IDocflowDisp = dispinterface
    ['{22312D9E-FB2D-4F36-B8A8-CC37258EA6E8}']
    function ReadLastErrorEx: ISimpleObject; dispid 1610743808;
    function ReadLastError: WideString; dispid 1610743809;
    function CreateSimpleObject: ISimpleObject; dispid 1610743810;
    function CreateSimpleObjectList: ISimpleObjectList; dispid 1610743811;
    function Authenticate(const auth_login_in: WideString; const auth_password_in: WideString): Integer; dispid 1610743812;
    function AuthenticateByUserInfo(const user_info_in: ISimpleObject): Integer; dispid 1610743813;
    function AuthenticateByCertificate(const certificate_info_in: ISimpleObject): Integer; dispid 1610743814;
    function ConfirmAuth(const code: WideString): Integer; dispid 1610743815;
    function ConfirmAuthByCertificate(const code: WideString; 
                                      const certificate_info_in: ISimpleObject): Integer; dispid 1610743816;
    function ReadCertificates(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743817;
    function VerifyCertificates(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743818;
    function ReadCertificatesForAuth(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743819;
    function WriteConnectionInfo(const connection_info_in: ISimpleObject): Integer; dispid 1610743820;
    function ReadConnectionInfo: ISimpleObject; dispid 1610743821;
    function TerminateSession: Integer; dispid 1610743822;
    function CheckSession: Integer; dispid 1610743823;
    function AccountsList: ISimpleObject; dispid 1610743824;
    function SwitchAccount(const param_in: ISimpleObject): Integer; dispid 1610743825;
    function ReadServerVersionInformation: ISimpleObject; dispid 1610743826;
    function ReadVersion: WideString; dispid 1610743827;
    function WriteAttachment(const document_in: ISimpleObject): ISimpleObject; dispid 1610743828;
    function WriteDocument(const document_in: ISimpleObject): ISimpleObject; dispid 1610743829;
    function WritePackage(const documents_in: ISimpleObjectList): ISimpleObjectList; dispid 1610743830;
    function UpdateDocument(const addressing_in: ISimpleObject; const document_in: ISimpleObject): ISimpleObject; dispid 1610743831;
    function ReadDocument(const document_in: ISimpleObject): ISimpleObject; dispid 1610743832;
    function DeleteDocument(const document_in: ISimpleObject): Integer; dispid 1610743833;
    function EliminateDocument(const document_in: ISimpleObject): Integer; dispid 1610743834;
    function RestoreDocument(const document_in: ISimpleObject): Integer; dispid 1610743835;
    function PrepareAction(const document_in: ISimpleObject): ISimpleObject; dispid 1610743836;
    function ExecuteAction(const document_in: ISimpleObject): ISimpleObject; dispid 1610743837;
    function ReadServiceStagesInfo(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743838;
    function ReadServiceStages(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743839;
    function ReadChanges(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743840;
    function ReadDocuments(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743841;
    function ReadDocumentsByEvents(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743842;
    function ReadOurOrganizations(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743843;
    function ReadDocumentAsHTML(const document_in: ISimpleObject): ISimpleObject; dispid 1610743844;
    function GenerateHTMLFromXML(const param_in: ISimpleObject): ISimpleObject; dispid 1610743845;
    function ReadContragentInfo(const value_in: ISimpleObject): ISimpleObject; dispid 1610743846;
    function ProcessServiceStagesEx(const param_in: ISimpleObject): ISimpleObject; dispid 1610743847;
    function WriteDocumentEx(const document_in: ISimpleObject): ISimpleObject; dispid 1610743848;
    function WriteDocumentsEx(const param_in: ISimpleObject): ISimpleObject; dispid 1610743849;
    function ExecuteActionEx(const document_in: ISimpleObject): ISimpleObject; dispid 1610743850;
    function AcquireCertificateActivation(const certificate_info_in: ISimpleObject): Integer; dispid 1610743851;
    function ActivateCertificate(const certificate_info_in: ISimpleObject): Integer; dispid 1610743852;
    function ReadCurrentUserInfo: ISimpleObject; dispid 1610743853;
    function EnableEmulation: Integer; dispid 1610743854;
    function LoadDataFromURI(const uri_in: WideString): WideString; dispid 1610743855;
    function LoadBinaryDataFromURI(const uri_in: WideString): WideString; dispid 1610743856;
    function LoadDataFromURIToFile(const uri_in: WideString; const filename_in: WideString): Integer; dispid 1610743857;
    function ImportNomenclatureFromCML(const param_in: ISimpleObject): ISimpleObject; dispid 1610743858;
    function NomenclatureGetEGAISInfo(const param_in: WideString): ISimpleObject; dispid 1610743859;
    function RetailWorkplaceList: ISimpleObject; dispid 1610743860;
    function GetWorkplaceSettings(var param_in: SYSINT): ISimpleObject; dispid 1610743861;
    function NomenclatureCarrySmartCreate(const batch: ISimpleObject; canUpdate: Integer): ISimpleObject; dispid 1610743862;
    function NomenclatureGetGoodByEGAIS(const param_in: WideString): SYSINT; dispid 1610743863;
    function NomenclatureRead(id: SYSINT; const params: ISimpleObject): ISimpleObject; dispid 1610743864;
    function NomenclatureGetGoodByEAN(const code: WideString): SYSINT; dispid 1610743865;
    function NomenclatureReadGoodByEGAIS(const code: WideString; const params: WideString): ISimpleObject; dispid 1610743866;
    function NomenclatureReadGoodByEAN(const code: WideString; const params: WideString): ISimpleObject; dispid 1610743867;
    function GetStringUserInfo: WideString; dispid 1610743868;
    function VerifyPinCode(var param_in: SYSINT): SYSINT; dispid 1610743869;
    function WritePinCode(var param_in: SYSINT): SYSINT; dispid 1610743870;
    function LockSession: SYSINT; dispid 1610743871;
    function WriteEmployee(const param_in: ISimpleObject): ISimpleObject; dispid 1610743872;
    function ReadUserParam(const path: WideString): WideString; dispid 1610743873;
    function WriteUserParam(const path: WideString; const value: WideString): Integer; dispid 1610743874;
    function ReadIntegrationConfig(const path: WideString): ISimpleObject; dispid 1610743875;
    function ReadConfig(const filter_in: ISimpleObject; const ini_in: ISimpleObjectList): ISimpleObject; dispid 1610743876;
    function GetTaskList(const filter_in: ISimpleObject): ISimpleObject; dispid 1610743877;
    function ReadConnectionList(const filter_in: ISimpleObject; const ini_in: ISimpleObjectList): ISimpleObjectList; dispid 1610743878;
    function ReadConnection(const filter_in: ISimpleObject; const ini_in: ISimpleObjectList): ISimpleObject; dispid 1610743879;
    function WriteConnection(const filter_in: ISimpleObject; const ini_in: ISimpleObjectList): WideString; dispid 1610743880;
    function WriteError(const error: ISimpleObject): ISimpleObject; dispid 1610743881;
    function WriteStat(const stat: ISimpleObject): ISimpleObject; dispid 1610743882;
    function WriteConfig_v2(const param: ISimpleObject): Integer; dispid 1610743883;
  end;

// *********************************************************************//
// Interface: IStreamHelper
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C7FCAEA2-8CDB-41A8-8C1D-FF3656FE438C}
// *********************************************************************//
  IStreamHelper = interface(IDispatch)
    ['{C7FCAEA2-8CDB-41A8-8C1D-FF3656FE438C}']
    function ReadLastErrorEx: ISimpleObject; safecall;
    function ReadLastError: WideString; safecall;
    function Base64ToFile(const base64_string: WideString; const file_path: WideString): Integer; safecall;
    function StringToFile(const plain_string: WideString; const file_path: WideString): Integer; safecall;
    function FileToBase64(const file_path: WideString): WideString; safecall;
    function StringToBase64(const plain_string: WideString): WideString; safecall;
    function FileToString(const file_path: WideString): WideString; safecall;
    function Base64ToString(const base64_string: WideString): WideString; safecall;
    function TransformXSLFile(const xml_file_in: WideString; const xslt_file_in: WideString; 
                              const result_xml_file_in: WideString; const params_in: ISimpleObject): Integer; safecall;
    function TransformXSL(const xml_str_in: WideString; const xslt_str_in: WideString; 
                          const params_in: ISimpleObject): WideString; safecall;
    function GenerateUUID: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IStreamHelperDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C7FCAEA2-8CDB-41A8-8C1D-FF3656FE438C}
// *********************************************************************//
  IStreamHelperDisp = dispinterface
    ['{C7FCAEA2-8CDB-41A8-8C1D-FF3656FE438C}']
    function ReadLastErrorEx: ISimpleObject; dispid 1610743808;
    function ReadLastError: WideString; dispid 1610743809;
    function Base64ToFile(const base64_string: WideString; const file_path: WideString): Integer; dispid 1610743810;
    function StringToFile(const plain_string: WideString; const file_path: WideString): Integer; dispid 1610743811;
    function FileToBase64(const file_path: WideString): WideString; dispid 1610743812;
    function StringToBase64(const plain_string: WideString): WideString; dispid 1610743813;
    function FileToString(const file_path: WideString): WideString; dispid 1610743814;
    function Base64ToString(const base64_string: WideString): WideString; dispid 1610743815;
    function TransformXSLFile(const xml_file_in: WideString; const xslt_file_in: WideString; 
                              const result_xml_file_in: WideString; const params_in: ISimpleObject): Integer; dispid 1610743816;
    function TransformXSL(const xml_str_in: WideString; const xslt_str_in: WideString; 
                          const params_in: ISimpleObject): WideString; dispid 1610743817;
    function GenerateUUID: WideString; dispid 1610743818;
  end;

// *********************************************************************//
// Interface: IInvoke1S
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {89EF899A-45ED-4153-8F22-0F88DA6F228D}
// *********************************************************************//
  IInvoke1S = interface(IDispatch)
    ['{89EF899A-45ED-4153-8F22-0F88DA6F228D}']
  end;

// *********************************************************************//
// DispIntf:  IInvoke1SDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {89EF899A-45ED-4153-8F22-0F88DA6F228D}
// *********************************************************************//
  IInvoke1SDisp = dispinterface
    ['{89EF899A-45ED-4153-8F22-0F88DA6F228D}']
  end;

// *********************************************************************//
// Interface: ILog
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {57077488-2A88-4ACD-9091-66DC6EFFAB49}
// *********************************************************************//
  ILog = interface(IDispatch)
    ['{57077488-2A88-4ACD-9091-66DC6EFFAB49}']
    function WriteLogInfo(const log_info_in: ISimpleObject): Integer; safecall;
    function ReadLogInfo: ISimpleObject; safecall;
    function ReadLastErrorEx: ISimpleObject; safecall;
    function ReadLastError: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  ILogDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {57077488-2A88-4ACD-9091-66DC6EFFAB49}
// *********************************************************************//
  ILogDisp = dispinterface
    ['{57077488-2A88-4ACD-9091-66DC6EFFAB49}']
    function WriteLogInfo(const log_info_in: ISimpleObject): Integer; dispid 1610743808;
    function ReadLogInfo: ISimpleObject; dispid 1610743809;
    function ReadLastErrorEx: ISimpleObject; dispid 1610743810;
    function ReadLastError: WideString; dispid 1610743811;
  end;

// *********************************************************************//
// The Class CoSimpleObject provides a Create and CreateRemote method to          
// create instances of the default interface ISimpleObject exposed by              
// the CoClass SimpleObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSimpleObject = class
    class function Create: ISimpleObject;
    class function CreateRemote(const MachineName: string): ISimpleObject;
  end;

// *********************************************************************//
// The Class CoSimpleObjectList provides a Create and CreateRemote method to          
// create instances of the default interface ISimpleObjectList exposed by              
// the CoClass SimpleObjectList. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSimpleObjectList = class
    class function Create: ISimpleObjectList;
    class function CreateRemote(const MachineName: string): ISimpleObjectList;
  end;

// *********************************************************************//
// The Class CoDocflow provides a Create and CreateRemote method to          
// create instances of the default interface IDocflow exposed by              
// the CoClass Docflow. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDocflow = class
    class function Create: IDocflow;
    class function CreateRemote(const MachineName: string): IDocflow;
  end;

// *********************************************************************//
// The Class CoStreamHelper provides a Create and CreateRemote method to          
// create instances of the default interface IStreamHelper exposed by              
// the CoClass StreamHelper. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoStreamHelper = class
    class function Create: IStreamHelper;
    class function CreateRemote(const MachineName: string): IStreamHelper;
  end;

// *********************************************************************//
// The Class CoInvoke1S provides a Create and CreateRemote method to          
// create instances of the default interface IInvoke1S exposed by              
// the CoClass Invoke1S. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoInvoke1S = class
    class function Create: IInvoke1S;
    class function CreateRemote(const MachineName: string): IInvoke1S;
  end;

// *********************************************************************//
// The Class CoLog provides a Create and CreateRemote method to          
// create instances of the default interface ILog exposed by              
// the CoClass Log. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLog = class
    class function Create: ILog;
    class function CreateRemote(const MachineName: string): ILog;
  end;

implementation

uses ComObj;

class function CoSimpleObject.Create: ISimpleObject;
begin
  Result := CreateComObject(CLASS_SimpleObject) as ISimpleObject;
end;

class function CoSimpleObject.CreateRemote(const MachineName: string): ISimpleObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SimpleObject) as ISimpleObject;
end;

class function CoSimpleObjectList.Create: ISimpleObjectList;
begin
  Result := CreateComObject(CLASS_SimpleObjectList) as ISimpleObjectList;
end;

class function CoSimpleObjectList.CreateRemote(const MachineName: string): ISimpleObjectList;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SimpleObjectList) as ISimpleObjectList;
end;

class function CoDocflow.Create: IDocflow;
begin
  Result := CreateComObject(CLASS_Docflow) as IDocflow;
end;

class function CoDocflow.CreateRemote(const MachineName: string): IDocflow;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Docflow) as IDocflow;
end;

class function CoStreamHelper.Create: IStreamHelper;
begin
  Result := CreateComObject(CLASS_StreamHelper) as IStreamHelper;
end;

class function CoStreamHelper.CreateRemote(const MachineName: string): IStreamHelper;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_StreamHelper) as IStreamHelper;
end;

class function CoInvoke1S.Create: IInvoke1S;
begin
  Result := CreateComObject(CLASS_Invoke1S) as IInvoke1S;
end;

class function CoInvoke1S.CreateRemote(const MachineName: string): IInvoke1S;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Invoke1S) as IInvoke1S;
end;

class function CoLog.Create: ILog;
begin
  Result := CreateComObject(CLASS_Log) as ILog;
end;

class function CoLog.CreateRemote(const MachineName: string): ILog;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Log) as ILog;
end;

end.
