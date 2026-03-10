unit unt_CJ_Daetong;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  frxClass, frxBarcode,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait,
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlue, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDropDownEdit,
  cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid,
  Vcl.Printers, cxMemo, cxButtonEdit, cxCurrencyEdit, cxDBData,
  cxGridDBTableView, cxContainer, Vcl.Menus, cxButtons, cxProgressBar,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, cxGroupBox,
  FireDAC.Stan.StorageBin, Vcl.CheckLst, cxCustomListBox, cxCheckListBox,
  cxListBox;

type
  Tfrm_CJ_Daetong = class(TForm)
    Button1: TButton;
    cxGrid1: TcxGrid;
    tv1: TcxGridTableView;
    tv1Idx: TcxGridColumn;
    tv1Printer: TcxGridColumn;
    tv1Chk: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    dbtv_M: TcxGridDBTableView;
    dbtv_MRecId: TcxGridDBColumn;
    dbtv_MColumn1: TcxGridDBColumn;
    dbtv_MColumn2: TcxGridDBColumn;
    dbtv_MSame_Group: TcxGridDBColumn;
    dbtv_MTran_Comp: TcxGridDBColumn;
    dbtv_MdlvClsfCd: TcxGridDBColumn;
    dbtv_MdlvSubClsfCd: TcxGridDBColumn;
    dbtv_MdlvClsfNm: TcxGridDBColumn;
    dbtv_MStatus: TcxGridDBColumn;
    dbtv_MOrd_Inner_Seq: TcxGridDBColumn;
    dbtv_MItem_Seq: TcxGridDBColumn;
    dbtv_MAct_Seq: TcxGridDBColumn;
    dbtv_MPack_Ord_Inner_seq: TcxGridDBColumn;
    dbtv_MPack_Item_Seq: TcxGridDBColumn;
    dbtv_MInvoiceNo: TcxGridDBColumn;
    dbtv_MOrd_Name: TcxGridDBColumn;
    dbtv_MOrd_Tel: TcxGridDBColumn;
    dbtv_MOrd_HP: TcxGridDBColumn;
    dbtv_MOrd_ZipNo: TcxGridDBColumn;
    dbtv_MOrd_Addr: TcxGridDBColumn;
    dbtv_MOrd_Addr1: TcxGridDBColumn;
    dbtv_MOrd_Addr2: TcxGridDBColumn;
    dbtv_MRcv_Name: TcxGridDBColumn;
    dbtv_MRcv_Tel: TcxGridDBColumn;
    dbtv_MRcv_HP: TcxGridDBColumn;
    dbtv_MRcv_ZipNo: TcxGridDBColumn;
    dbtv_MRcv_Addr1: TcxGridDBColumn;
    dbtv_MRcv_Addr2: TcxGridDBColumn;
    dbtv_MRcv_Addr: TcxGridDBColumn;
    dbtv_MAddr_For_Check_ZipNo: TcxGridDBColumn;
    dbtv_MOrd_Comp_Code: TcxGridDBColumn;
    dbtv_MOrd_Comp_Name: TcxGridDBColumn;
    dbtv_MOrd_Date: TcxGridDBColumn;
    dbtv_MOrd_Type1: TcxGridDBColumn;
    dbtv_MOrd_Item_Code: TcxGridDBColumn;
    dbtv_MOrd_item_name: TcxGridDBColumn;
    dbtv_MOrd_Item_Opt1: TcxGridDBColumn;
    dbtv_MOrd_Item_Opt2: TcxGridDBColumn;
    dbtv_MItem_Code: TcxGridDBColumn;
    dbtv_MItem_Name: TcxGridDBColumn;
    dbtv_MOption_Name: TcxGridDBColumn;
    dbtv_MType_Name: TcxGridDBColumn;
    dbtv_MQty_Out_Fix: TcxGridDBColumn;
    dbtv_MSell_Price: TcxGridDBColumn;
    dbtv_MFix_Fare_Code: TcxGridDBColumn;
    dbtv_MOrd_No1: TcxGridDBColumn;
    dbtv_MOrd_No2: TcxGridDBColumn;
    dbtv_MFix_Fare_Code_Name: TcxGridDBColumn;
    dbtv_MBox_Type: TcxGridDBColumn;
    dbtv_MFix_Fare_Price: TcxGridDBColumn;
    dbtv_MIslandArea: TcxGridDBColumn;
    dbtv_MAir_Price: TcxGridDBColumn;
    dbtv_MShip_Price: TcxGridDBColumn;
    dbtv_MItems_List: TcxGridDBColumn;
    dbtv_MItemCode_List: TcxGridDBColumn;
    dbtv_MItemCount: TcxGridDBColumn;
    dbtv_MSumQty: TcxGridDBColumn;
    dbtv_MRackDisp: TcxGridDBColumn;
    dbtv_MSumOfPrice: TcxGridDBColumn;
    dbtv_MOrd_Memo: TcxGridDBColumn;
    dbtv_MTran_BookNo_Date: TcxGridDBColumn;
    dbtv_MTran_BookNo_Seq: TcxGridDBColumn;
    dbtv_MDel_DateTime: TcxGridDBColumn;
    dbtv_MRcv_Info: TcxGridDBColumn;
    dbtv_MOrd_State: TcxGridDBColumn;
    dbtv_MTRAN_PACKING_KEY: TcxGridDBColumn;
    dbtv_MAddr_Check: TcxGridDBColumn;
    dbtv_MRcvAddr_Old: TcxGridDBColumn;
    dbtv_MdlvPreArrBranCd: TcxGridDBColumn;
    dbtv_MdlvPreArrBranNm: TcxGridDBColumn;
    dbtv_MdlvPreArrBranShortNm: TcxGridDBColumn;
    dbtv_MdlvPreArrEmpNum: TcxGridDBColumn;
    dbtv_MdlvPreArrEmpNm: TcxGridDBColumn;
    dbtv_MdlvPreArrEmpNickNm: TcxGridDBColumn;
    dbtv_MrcvrShortAddr: TcxGridDBColumn;
    dbtv_MrcvrClsfAddr: TcxGridDBColumn;
    dbtv_MferryFare: TcxGridDBColumn;
    dbtv_MTml_Code: TcxGridDBColumn;
    dbtv_MDeleteChk: TcxGridDBColumn;
    dbtv_MAddrFixed_Chk: TcxGridDBColumn;
    dbtv_MPrintedCount: TcxGridDBColumn;
    dbtv_MPrint_reg_userid: TcxGridDBColumn;
    dbtv_MPrint_reg_datetime: TcxGridDBColumn;
    dbtv_MPrint_edt_userid: TcxGridDBColumn;
    dbtv_MPrint_edt_datetime: TcxGridDBColumn;
    dbtv_Mrcvr_NewAddr: TcxGridDBColumn;
    dbtv_Mrcvr_NewAddrDtl: TcxGridDBColumn;
    dbtv_Mrcvr_OldAddr: TcxGridDBColumn;
    dbtv_Mrcvr_OldAddrDtl: TcxGridDBColumn;
    dbtv_Mrcvr_NewAddrYn: TcxGridDBColumn;
    dbtv_MdawnDeliveryYn: TcxGridDBColumn;
    dbtv_MdawnDeliveryMessage: TcxGridDBColumn;
    dbtv_MdoorAccessType: TcxGridDBColumn;
    dbtv_MdoorPassword: TcxGridDBColumn;
    dbtv_MdawnSms: TcxGridDBColumn;
    dbtv_MzipCd: TcxGridDBColumn;
    dbtv_Mcity: TcxGridDBColumn;
    dbtv_MmallId: TcxGridDBColumn;
    dbtv_MmallNm: TcxGridDBColumn;
    dbtv_Mdong: TcxGridDBColumn;
    dbtv_MdelvType: TcxGridDBColumn;
    dbtv_MstateNm: TcxGridDBColumn;
    dbtv_MdelvTypeNm: TcxGridDBColumn;
    dbtv_D: TcxGridDBTableView;
    dbtv_DRecId: TcxGridDBColumn;
    dbtv_DStatus: TcxGridDBColumn;
    dbtv_DInvoiceNo: TcxGridDBColumn;
    dbtv_DItem_Code: TcxGridDBColumn;
    dbtv_DItem_Disp: TcxGridDBColumn;
    dbtv_DOrd_Item_Disp: TcxGridDBColumn;
    dbtv_DItem_Name: TcxGridDBColumn;
    dbtv_DOption_Name: TcxGridDBColumn;
    dbtv_DType_Name: TcxGridDBColumn;
    dbtv_DQty_Out_Fix: TcxGridDBColumn;
    dbtv_DSell_Price: TcxGridDBColumn;
    dbtv_DOrd_Item_Name: TcxGridDBColumn;
    dbtv_DOrd_Inner_seq: TcxGridDBColumn;
    dbtv_DItem_Seq: TcxGridDBColumn;
    dbtv_DQty_Out_Fix_List: TcxGridDBColumn;
    dbtv_DOrd_Item_Opt1: TcxGridDBColumn;
    dbtv_DOrd_Item_Opt2: TcxGridDBColumn;
    dbtv_DOrd_Type1: TcxGridDBColumn;
    dbtv_DOrd_No1: TcxGridDBColumn;
    dbtv_DOrd_No2: TcxGridDBColumn;
    dbtv_DOrd_Date: TcxGridDBColumn;
    dbtv_DOrd_Item_Code: TcxGridDBColumn;
    dbtv_DBacode_Scan: TcxGridDBColumn;
    dbtv_DRack_Code: TcxGridDBColumn;
    dbtv_DRack_Disp: TcxGridDBColumn;
    dbtv_DDel_Datetime: TcxGridDBColumn;
    dbtv_DOrd_Kind1: TcxGridDBColumn;
    dbtv_DCategory1: TcxGridDBColumn;
    dbtv_DCategory2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid2Level1: TcxGridLevel;
    cxGroupBox7: TcxGroupBox;
    lb_epost_install: TLabel;
    cxLabel9: TcxLabel;
    chkPrintFromTo: TcxCheckBox;
    edtPrintFrom: TcxSpinEdit;
    edtPrintTo: TcxSpinEdit;
    pbPrintDataInput: TcxProgressBar;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    md_invoice_master: TFDMemTable;
    md_invoice_masterColumn1: TStringField;
    md_invoice_masterColumn2: TStringField;
    md_invoice_masterSame_Group: TIntegerField;
    md_invoice_masterStatus: TStringField;
    md_invoice_masterOrd_Inner_Seq: TStringField;
    md_invoice_masterItem_Seq: TStringField;
    md_invoice_masterAct_Seq: TStringField;
    md_invoice_masterPack_Ord_Inner_seq: TLargeintField;
    md_invoice_masterPack_Item_Seq: TStringField;
    md_invoice_masterTran_Comp: TStringField;
    md_invoice_masterInvoiceNo: TStringField;
    md_invoice_masterOrd_Name: TStringField;
    md_invoice_masterOrd_Tel: TStringField;
    md_invoice_masterOrd_HP: TStringField;
    md_invoice_masterOrd_ZipNo: TStringField;
    md_invoice_masterOrd_Addr: TStringField;
    md_invoice_masterOrd_Addr1: TStringField;
    md_invoice_masterOrd_Addr2: TStringField;
    md_invoice_masterRcv_Name: TStringField;
    md_invoice_masterRcv_Tel: TStringField;
    md_invoice_masterRcv_HP: TStringField;
    md_invoice_masterRcv_ZipNo: TStringField;
    md_invoice_masterRcv_Addr1: TStringField;
    md_invoice_masterRcv_Addr2: TStringField;
    md_invoice_masterRcv_Addr: TStringField;
    md_invoice_masterAddr_For_Check_ZipNo: TStringField;
    md_invoice_masterOrd_Comp_Code: TStringField;
    md_invoice_masterOrd_Comp_Name: TStringField;
    md_invoice_masterOrd_Date: TStringField;
    md_invoice_masterOrd_Type1: TStringField;
    md_invoice_masterOrd_Item_Code: TStringField;
    md_invoice_masterOrd_item_name: TStringField;
    md_invoice_masterOrd_Item_Opt1: TStringField;
    md_invoice_masterOrd_Item_Opt2: TStringField;
    md_invoice_masterItem_Code: TStringField;
    md_invoice_masterItem_Name: TStringField;
    md_invoice_masterOption_Name: TStringField;
    md_invoice_masterType_Name: TStringField;
    md_invoice_masterQty_Out_Fix: TIntegerField;
    md_invoice_masterSell_Price: TCurrencyField;
    md_invoice_masterFix_Fare_Code: TStringField;
    md_invoice_masterOrd_No1: TStringField;
    md_invoice_masterOrd_No2: TStringField;
    md_invoice_masterFix_Fare_Code_Name: TStringField;
    md_invoice_masterBox_Type: TStringField;
    md_invoice_masterFix_Fare_Price: TStringField;
    md_invoice_masterIslandArea: TStringField;
    md_invoice_masterAir_Price: TStringField;
    md_invoice_masterShip_Price: TStringField;
    md_invoice_masterItems_List: TStringField;
    md_invoice_masterItemCount: TIntegerField;
    md_invoice_masterSumQty: TIntegerField;
    md_invoice_masterRackDisp: TStringField;
    md_invoice_masterSumOfPrice: TStringField;
    md_invoice_masterOrd_Memo: TStringField;
    md_invoice_masterTran_BookNo_Date: TStringField;
    md_invoice_masterTran_BookNo_Seq: TIntegerField;
    md_invoice_masterDel_DateTime: TStringField;
    md_invoice_masterRcv_Info: TStringField;
    md_invoice_masterOrd_State: TStringField;
    md_invoice_masterTRAN_PACKING_KEY: TStringField;
    md_invoice_masterAddr_Check: TStringField;
    md_invoice_masterRcvAddr_Old: TStringField;
    md_invoice_masterdlvPreArrBranCd: TStringField;
    md_invoice_masterdlvPreArrBranNm: TStringField;
    md_invoice_masterdlvPreArrBranShortNm: TStringField;
    md_invoice_masterdlvPreArrEmpNum: TStringField;
    md_invoice_masterdlvPreArrEmpNm: TStringField;
    md_invoice_masterdlvPreArrEmpNickNm: TStringField;
    md_invoice_masterdlvClsfCd: TStringField;
    md_invoice_masterdlvSubClsfCd: TStringField;
    md_invoice_masterdlvClsfNm: TStringField;
    md_invoice_masterrcvrShortAddr: TStringField;
    md_invoice_masterrcvrClsfAddr: TStringField;
    md_invoice_masterferryFare: TStringField;
    md_invoice_masterTml_Code: TStringField;
    md_invoice_masterDeleteChk: TStringField;
    md_invoice_masterAddrFixed_Chk: TStringField;
    md_invoice_masterPrintedCount: TStringField;
    md_invoice_masterPrint_reg_userid: TStringField;
    md_invoice_masterPrint_reg_datetime: TStringField;
    md_invoice_masterPrint_edt_userid: TStringField;
    md_invoice_masterPrint_edt_datetime: TStringField;
    md_invoice_masteritemCode_List: TStringField;
    md_invoice_masterrcvr_NewAddr: TMemoField;
    md_invoice_masterrcvr_NewAddrDtl: TMemoField;
    md_invoice_masterrcvr_OldAddr: TMemoField;
    md_invoice_masterrcvr_OldAddrDtl: TMemoField;
    md_invoice_masterrcvr_NewAddrYn: TStringField;
    md_invoice_masterMID: TIntegerField;
    md_invoice_masterdawnDeliveryYn: TStringField;
    md_invoice_masterdawnDeliveryMessage: TStringField;
    md_invoice_masterdoorAccessType: TStringField;
    md_invoice_masterdoorPassword: TStringField;
    md_invoice_masterdawnSms: TStringField;
    md_invoice_masterzipCd: TStringField;
    md_invoice_mastercity: TStringField;
    md_invoice_mastermallId: TStringField;
    md_invoice_mastermallNm: TStringField;
    md_invoice_masterdong: TStringField;
    md_invoice_masterdelvType: TStringField;
    md_invoice_masterstateNm: TStringField;
    md_invoice_masterdelvTypeNm: TStringField;
    md_invoice_detail: TFDMemTable;
    md_invoice_detailStatus: TStringField;
    md_invoice_detailInvoiceNo: TStringField;
    md_invoice_detailItem_Disp: TStringField;
    md_invoice_detailOrd_Item_Disp: TStringField;
    md_invoice_detailItem_Name: TStringField;
    md_invoice_detailOption_Name: TStringField;
    md_invoice_detailType_Name: TStringField;
    md_invoice_detailQty_Out_Fix: TStringField;
    md_invoice_detailSell_Price: TStringField;
    md_invoice_detailOrd_Item_Name: TStringField;
    md_invoice_detailOrd_Inner_seq: TStringField;
    md_invoice_detailItem_Seq: TStringField;
    md_invoice_detailQty_Out_Fix_List: TStringField;
    md_invoice_detailOrd_Item_Opt1: TStringField;
    md_invoice_detailOrd_Item_Opt2: TStringField;
    md_invoice_detailOrd_Type1: TStringField;
    md_invoice_detailOrd_No1: TStringField;
    md_invoice_detailOrd_No2: TStringField;
    md_invoice_detailOrd_Date: TStringField;
    md_invoice_detailOrd_Item_Code: TStringField;
    md_invoice_detailItem_Code: TStringField;
    md_invoice_detailBacode_Scan: TStringField;
    md_invoice_detailRack_Code: TStringField;
    md_invoice_detailRack_Disp: TStringField;
    md_invoice_detailDel_Datetime: TStringField;
    md_invoice_detailOrd_Kind1: TStringField;
    md_invoice_detailCategory1: TStringField;
    md_invoice_detailCategory2: TStringField;
    md_invoice_detailMid: TIntegerField;
    mem_non_print: TcxMemo;
    cxCheckListBox1: TcxCheckListBox;
    cxListBox1: TcxListBox;
    CHKLISTBOX1: TcxCheckListBox;
    LISTBOX1: TcxListBox;
    chk_Korex_Addr: TcxCheckBox;
    procedure FR_InvoiceBeforePrint(Sender: TfrxReportComponent);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);



  private
    { Private declarations }


    szFontSize: Integer;
    ValidPrinterList: TStringList; // 체크한 프린터리스트
    PrinterIdx: Integer; // 프린터 순서를 전역변수로 저장
    PrinterCount: Integer; // 체크한 프린터 수를 전역변수로 저장

    procedure printCJInvoice();
    function Get_Valid_Printer: string;
    procedure InitPrinterGrid;
    function InputPrintData: Boolean;
    procedure printDb(const PrintType: string);
    function PrintDataDB_K_TYPE_1: boolean;

    procedure SetKorexInvoice_Type1(
      strBarArriveCode  : string;
      strmemArriveCode  : string;
      strmemArrivename  : string;
      strmemSendCode    : string;
      strBarInvoiceNo1  : string;
      strmemItemList    : string;
      strBarInvoiceNo2  : string;
      strmemInvoiceNo1  : string;
      strmemDate1       : string;
      strmemInvoiceNo2  : string;
      strmemDate2       : string;
      strmemFareType    : string;
      strmemFarePrice   : string;
      strmemReceiveData1: string;
      strmemSendData1   : string;
      strmemReceiveData2: string;
      strmemSendData2   : string;
      strSenderRemark   : string;
      strmem_zn_dv      : string;
      strmem_end_nm     : string;
      strmem_mang_brn_nm: string;
      strmem_dlv_emp_nm : string;
      strRemark         : string;
      strSenderMsg      : string);

    function gm_Delivery_Linkage_Insert_Invoice_Header_For_Print( // 송장출력 데이터 마스터 등록 ** 공통함수 아님.
      szSeq               : string;
      szinvoiceno         : string;
      szDelivery_Code     : string;
      szdelivery_user_id  : string;
      szuser_id           : string;
      szSeller_Code       : string;
      szWho_Code          : string;
      szsendr_nm          : string;
      szsendr_mail_no     : string;
      szsendr_addr        : string;
      szsendr_detail_addr : string;
      szsendr_remark      : string;
      szsendr_tel_no      : string;
      szsendr_cell_no     : string;
      szrcvr_nm           : string;
      szrcvr_mail_no      : string;
      szrcvr_addr         : string;
      szrcvr_detail_addr  : string;
      szrcvr_remark       : string;
      szrcvr_tel_no       : string;
      szrcvr_cell_no      : string;
      szfrt_uprice        : string;
      szfrt_code          : string;
      szcust_mgmt_no      : string;
      szremark            : string;
      szrcpt_code         : string;
      szBox_Type          : string;
      szEnd_no            : string;
      szSub_end_no        : string;
      szEnd_nm            : string;
      szMan_bran_nm       : string;
      szBranShortNm       : string;
      szCldv_emp_nm       : string;
      use_refine_Addr     : Boolean;
      szOrd_No1           : string;
      szPrintCount        : string='1'): Double;

    function SetDisplayText(CHKLISTBOX: TcxCheckListBox; LISTBOX: TcxListBox; RecordIdx: Integer): string;


  public
    { Public declarations }
    ApplyPrinted: Boolean;
    lszSumQty: string;
    lszTran_Code: string;
    lszDelivery_User_ID: string;
    lszTran_Bookno_date: String;
    lszTran_Bookno_seq: String;

    DividePrintCount: Integer; // 프린터마다 인쇄할 수량 저장

  end;


//////////////////////////////
  TKorexMaster = packed record
    seq                 : string;     //
    invoiceno           : string;     // 송장번호
    delivery_code       : string;     //
    delivery_user_id    : string;     // 신용코드
    user_id             : string;     // 사용자아이디
    seller_code         : string;     // 화주
    who_code            : string;     // 물류센터코드
    sendr_nm            : string;     // 발송인
    sendr_mail_no       : string;
    sendr_addr          : string;
    sendr_detail_addr   : string;
    sendr_remark        : string;
    sendr_tel_no        : string;
    sendr_cell_no       : string;
    rcvr_nm             : string;     // 수취인
    rcvr_mail_no        : string;
    rcvr_addr           : string;
    rcvr_detail_addr    : string;
    rcvr_remark         : string;
    rcvr_tel_no         : string;
    rcvr_cell_no        : string;
    Detail_Item_Count   : Integer;    //상품 수   (추가2024.02.23)
    Invoice_Detail_Item : string;     //상품디테일(추가2024.02.23)
    frt_uprice          : string;
    frt_code            : string;
    cust_mgmt_no        : string;
    remark              : string;
    rcpt_code           : string;
    reg_datetime        : TDateTime;
    box_type            : string;     // 박스타입
    send_tml            : string;
    end_no              : string;
    sub_end_no          : string;
    end_nm              : string;
    man_bran_nm         : string;
    man_Shot_bran_nm    : string;
    cldv_emp_nm         : string;
    chk_korex_addr      : boolean;
    Ord_No1             : string;     // 주문번호1
    printCount          : string;     // 출력횟수
    Cos                 : string;     // 신규송장의 코스정보
  end;

  TRefineAddr = packed record
    rcvrShortAddr       : string;
    rcvrClsfAddr        : string;
    dlvPreArrEmpNickNm  : string;
    OldAddr             : string;
    OldAddrFull         : string;
    ferryFare           : string;
  end;
//////////////////////////////

var
  frm_CJ_Daetong: Tfrm_CJ_Daetong;
  KorexMaster: TKorexMaster;
  RefineAddr: TRefineAddr;

const
  MAXLINE = 10;


implementation

uses
  untGlobal, untDatabase, unt_CommLib;

{$R *.dfm}

{ Tfrm_CJ_Daetong }



function Tfrm_CJ_Daetong.gm_Delivery_Linkage_Insert_Invoice_Header_For_Print( // 송장출력 데이터 마스터 등록 ** 공통함수 아님.
  szSeq               : string;
  szinvoiceno         : string;
  szDelivery_Code     : string;
  szdelivery_user_id  : string;
  szuser_id           : string;
  szSeller_Code       : string;
  szWho_Code          : string;
  szsendr_nm          : string;
  szsendr_mail_no     : string;
  szsendr_addr        : string;
  szsendr_detail_addr : string;
  szsendr_remark      : string;
  szsendr_tel_no      : string;
  szsendr_cell_no     : string;
  szrcvr_nm           : string;
  szrcvr_mail_no      : string;
  szrcvr_addr         : string;
  szrcvr_detail_addr  : string;
  szrcvr_remark       : string;
  szrcvr_tel_no       : string;
  szrcvr_cell_no      : string;
  szfrt_uprice        : string;
  szfrt_code          : string;
  szcust_mgmt_no      : string;
  szremark            : string;
  szrcpt_code         : string;
  szBox_Type          : string;
  szEnd_no            : string;
  szSub_end_no        : string;
  szEnd_nm            : string;
  szMan_bran_nm       : string;
  szBranShortNm       : string;
  szCldv_emp_nm       : string;
  use_refine_Addr     : Boolean;
  szOrd_No1           : string;
  szPrintCount        : string='1'
  ): Double;
var
  szSQL: string;
  oRS: TFDQuery;
  fResult: Boolean;
  szSend_Tml: string;
  Tmp_szcust_mgmt_no: string;
  szSido, szGugun, szDong, szRi: string;
  TmpStr: TStringList;
  tmpStr2: RawByteString;
  tmpStr3: RawByteString;
  idx: Integer;
  tmpStr4: string;
begin

  Result := -1;

  Tmp_szcust_mgmt_no := szcust_mgmt_no;
  Tmp_szcust_mgmt_no := StringReplace(szcust_mgmt_no, '[-', '', [rfReplaceAll]);
  Tmp_szcust_mgmt_no := StringReplace(szcust_mgmt_no, '[' , '', [rfReplaceAll]);
  Tmp_szcust_mgmt_no := StringReplace(szcust_mgmt_no, ']' , '', [rfReplaceAll]);
  // szSend_Tml := gm_Delivery_Linkage_getSendTml(szseller_code, szwho_code, szdelivery_code, szdelivery_user_id);

  KorexMaster.seq               := szSeq;
  KorexMaster.invoiceno         := szinvoiceno;
  KorexMaster.delivery_code     := szDelivery_Code;
  KorexMaster.delivery_user_id  := szdelivery_user_id;
  KorexMaster.user_id           := szuser_id;
  KorexMaster.seller_code       := szSeller_Code;
  KorexMaster.who_code          := szWho_Code;
  KorexMaster.sendr_nm          := szsendr_nm;
  KorexMaster.sendr_mail_no     := szsendr_mail_no;
  KorexMaster.sendr_addr        := szsendr_addr;
  KorexMaster.sendr_detail_addr := szsendr_detail_addr;
  KorexMaster.sendr_remark      := szsendr_remark;
  KorexMaster.sendr_tel_no      := szsendr_tel_no;
  KorexMaster.sendr_cell_no     := szsendr_cell_no;
  KorexMaster.rcvr_nm           := szrcvr_nm;
  KorexMaster.rcvr_mail_no      := szrcvr_mail_no;
  KorexMaster.rcvr_addr         := szrcvr_addr;
  KorexMaster.rcvr_detail_addr  := szrcvr_detail_addr + RefineAddr.OldAddr;
  KorexMaster.rcvr_remark       := szrcvr_remark;
  KorexMaster.rcvr_tel_no       := szrcvr_tel_no;
  KorexMaster.rcvr_cell_no      := szrcvr_cell_no;

  if szfrt_code = '0010' then
    KorexMaster.frt_uprice      := '0'
  else
    KorexMaster.frt_uprice      := szfrt_uprice;

  KorexMaster.frt_code          := szfrt_code;
  KorexMaster.cust_mgmt_no      := Tmp_szcust_mgmt_no;
  KorexMaster.remark            := szremark;
  KorexMaster.rcpt_code         := szrcpt_code;
  KorexMaster.reg_datetime      := now;
  KorexMaster.box_type          := szBox_Type;
  KorexMaster.send_tml          := gszSendTML;
  KorexMaster.Ord_No1           := szOrd_No1;
  KorexMaster.printCount        := szPrintCount;

  if use_refine_Addr = False then
  begin

    oRS := TFDQuery.Create(nil);
    try
      oRS.Connection := dmMain.dbLinkage;

      szSQL := '';
      szSQL := szSQL + 'declare @nSeq bigint' + #13 + #10;
      szSQL := szSQL + 'set @nSeq = ' + szSeq + #13 + #10;
      szSQL := szSQL + 'select @nSeq as seq' + #13 + #10;
      szSQL := szSQL + '--korex, abroad--' + #13 + #10;
      szSQL := szSQL + '    ,end_no' + #13 + #10;
      szSQL := szSQL + '	  ,sub_end_no' + #13 + #10;
      szSQL := szSQL + '	  ,end_nm' + #13 + #10;
      szSQL := szSQL + '	  ,man_bran_nm' + #13 + #10;
      szSQL := szSQL + '	  ,cldv_emp_nm' + #13 + #10;

      szSQL := szSQL + '	  from korex_tb_post010' + #13 + #10;
      szSQL := szSQL + '	  where zip_no = ''' + StringReplaceCharNotNum(szrcvr_mail_no) + '''' + #13 + #10;
      szSQL := szSQL + '' + #13 + #10;
      // szSQL := szSQL + '    ,DELIVERY_LINKAGE.dbo.fn_get_korex_end_no(''' + StringReplaceCharNotNum(szrcvr_mail_no) + ''') as end_no' + #13 + #10;
      // szSQL := szSQL + '	  ,DELIVERY_LINKAGE.dbo.fn_get_korex_sub_end_no(''' + StringReplaceCharNotNum(szrcvr_mail_no) + ''') as sub_end_no' + #13 + #10;
      // szSQL := szSQL + '	  ,DELIVERY_LINKAGE.dbo.fn_get_korex_end_nm(''' + StringReplaceCharNotNum(szrcvr_mail_no) + ''') as end_nm' + #13 + #10;
      // szSQL := szSQL + '	  ,DELIVERY_LINKAGE.dbo.fn_get_korex_man_bran_nm(''' + StringReplaceCharNotNum(szrcvr_mail_no) + ''') as man_bran_nm' + #13 + #10;
      // szSQL := szSQL + '	  ,DELIVERY_LINKAGE.dbo.fn_get_korex_cldv_emp_nm(''' + StringReplaceCharNotNum(szrcvr_mail_no) + ''')as cldv_emp_nm' + #13 + #10;

      oRS.Close;
      oRS.SQL.Text := szSQL;
      oRS.Prepare;
      oRS.Open;

      KorexMaster.end_no      := oRS.FieldByName('end_no').AsString;
      KorexMaster.sub_end_no  := oRS.FieldByName('sub_end_no').AsString;
      KorexMaster.end_nm      := oRS.FieldByName('end_nm').AsString;
      KorexMaster.man_bran_nm := oRS.FieldByName('man_bran_nm').AsString;
      KorexMaster.cldv_emp_nm := oRS.FieldByName('cldv_emp_nm').AsString;

    finally
      oRS.Free;
    end;


  end
  else
  begin
    KorexMaster.end_no            := szEnd_no;
    KorexMaster.sub_end_no        := szSub_end_no;
    KorexMaster.end_nm            := szEnd_nm;
    KorexMaster.man_bran_nm       := szMan_bran_nm;
    KorexMaster.man_Shot_bran_nm  := szBranShortNm;
    KorexMaster.cldv_emp_nm       := szCldv_emp_nm;
    KorexMaster.chk_korex_addr    := True;
  end;

  Result := StrToFloat(szSeq);

end;



function Tfrm_CJ_Daetong.SetDisplayText(CHKLISTBOX: TcxCheckListBox; LISTBOX: TcxListBox; RecordIdx: Integer): string;
var
  idx: Integer;
  TempStr: string;
begin

  //수정시 주의
  //송장 출력과 엑셀파일 생성시에 모두 쓰이기에 두곳 모두 확인후 수정이 필요

  result := '';
  md_invoice_Detail.RecNo := RecordIdx+1;
  for idx := 0 to LISTBOX.Items.Count - 1 do
    TempStr := TempStr + LISTBOX.Items[idx];

  for idx := 0 to CHKLISTBOX.Items.Count - 1 do
  begin

    {2017-05-17 최병구 수정
    엑셀파일 생성시 로켕션 명칭이 달라서 출력할수 없던 문제 수정}
    {2017-05-29 최병구 수정
    해당 함수가 송장 명칭 표시까지 물려 있어 기존으로 돌리며
    송장 출력 파일 생성 부분의 명칭을 변경하는것으로 수정함}
    if (CHKLISTBOX.Items.Items[idx].Text = '로케이션') and (CHKLISTBOX.Items.Items[idx].Checked = true) then
    begin
      TempStr := StringReplace(TempStr, '로케이션', SetStringStrEnd(md_invoice_DetailRack_Disp.AsString, '[', ']'),
        [rfReplaceAll]);
    end

    else if (CHKLISTBOX.Items.Items[idx].Text = '상품코드') and (CHKLISTBOX.Items.Items[idx].Checked = true) then
    begin
      TempStr := StringReplace(TempStr, '상품코드', SetStringStrEnd(md_invoice_DetailItem_Code.AsString, '[', ']'),
        [rfReplaceAll]);
    end

    else if (CHKLISTBOX.Items.Items[idx].Text = '자사코드') and (CHKLISTBOX.Items.Items[idx].Checked = true) then
    begin
      TempStr := StringReplace(TempStr, '자사코드', SetStringStrEnd(md_invoice_DetailBacode_Scan.AsString, '[', ']'),
        [rfReplaceAll]);
    end

    else if (CHKLISTBOX.Items.Items[idx].Text = '상품명') and (CHKLISTBOX.Items.Items[idx].Checked = true) then
    begin
      TempStr := StringReplace(TempStr, '상품명', SetStringStrEnd(md_invoice_DetailItem_Name.AsString, '', ''),
        [rfReplaceAll]);
    end

    else if (CHKLISTBOX.Items.Items[idx].Text = '옵션') and (CHKLISTBOX.Items.Items[idx].Checked = true) then
    begin
      TempStr := StringReplace(TempStr, '옵션', SetStringStrEnd(md_invoice_DetailOption_Name.AsString, '[', ']'),
        [rfReplaceAll]);
    end

    else if (CHKLISTBOX.Items.Items[idx].Text = '타입') and (CHKLISTBOX.Items.Items[idx].Checked = true) then
    begin
      TempStr := StringReplace(TempStr, '타입', SetStringStrEnd(md_invoice_DetailType_Name.AsString, '[', ']'),
        [rfReplaceAll]);
    end

    else if (CHKLISTBOX.Items.Items[idx].Text = '수량') and (CHKLISTBOX.Items.Items[idx].Checked = true) then
    begin
      TempStr := StringReplace(TempStr, '수량', SetStringStrEnd(md_invoice_DetailQty_Out_Fix.AsString, '●', '개 '),
        [rfReplaceAll]);
    end;

  end;
  result := trim(TempStr);

end;


procedure Tfrm_CJ_Daetong.Button1Click(Sender: TObject);
begin
  printCJInvoice;
end;

procedure Tfrm_CJ_Daetong.FormCreate(Sender: TObject);
begin
  szFontSize := 10;
end;

procedure Tfrm_CJ_Daetong.FormShow(Sender: TObject);
begin
  InitPrinterGrid;
end;

procedure Tfrm_CJ_Daetong.FR_InvoiceBeforePrint(Sender: TfrxReportComponent);
var
  i: integer;
begin
  if printinfo.nLeftMargin <> 0 then
    (Sender as TfrxReportComponent).Left := (Sender as TfrxReportComponent).Left + (printinfo.nLeftMargin);
  if printinfo.nTopMargin <> 0 then
    (Sender as TfrxReportComponent).Top := (Sender as TfrxReportComponent).Top + (printinfo.nTopMargin);

  if (Sender as TfrxReportComponent).ClassType = TfrxMemoView then
    TfrxMemoView((Sender as TfrxReportComponent)).ExpressionDelimiters := '(!<,>!)';

end;

procedure Tfrm_CJ_Daetong.printCJInvoice;
var
  oRS: TFDQuery;
  szQry: string;
begin
  szReport := TfrxReport.Create(self);
  szReport.Clear;
  szReport.Report.Clear;

  printinfo.print_type_filename := 'CJ대한통운01.fr3';

  //szReport.LoadFromFile(gszHomePath + INVOICE_FR3_PATH + printinfo.print_type_filename);
  szReport.LoadFromFile(gszHomePath + INVOICE_FR3_PATH + 'CJ대한통운01.fr3');
  szReport.OnBeforePrint := FR_InvoiceBeforePrint;



  oRS := TFDQuery.Create(nil);
  try
    try
      oRS.Connection := dmMain.dbLinkage;


      ValidPrinterList := TStringList.Create;
      ValidPrinterList.Text := Get_Valid_Printer;
      PrinterIdx := 0;
      PrinterCount := ValidPrinterList.Count; // 프린터 개수를 저장한다.
      //DividePrintCount := 1; //

      szReport.PrintOptions.printer := pchar(ValidPrinterList.Strings[0]);
      szReport.SelectPrinter;


      PrintDataDB_K_TYPE_1;



    except

    end;


  finally
    oRS.Close;
    oRS.Free;
  end;

end;

procedure Tfrm_CJ_Daetong.printDb(const PrintType: string);
begin
  if PrintType = 'K_TYPE_1' then
  begin
    PrintDataDB_K_TYPE_1;
  end;
end;


function Tfrm_CJ_Daetong.PrintDataDB_K_TYPE_1: boolean;
var
  idx, idx2, idx_sub, idx_sub_div, idx_div, idx_mod: integer;
  ItemList, ItemList_sub: TStringList;
  szSQL: string;
  strM_SEQ: string;
  strSendData1: string;
  strReceiveData1: string;
  strSendData2: string;
  strReceiveData2: string;
  strItemList: string;
  strInvoiceNo: string;
  strFareCode: string;
  strFarePrice: string;
  strSend_code: string;
  strRecv_code: string;
  strRecv_zn_dv: string;
  strRecv_cnsl_end_no: string;
  strRecv_addr_town: string;
  strSenderRemark: string;
  strRemark: string;
  strSener_TelNo: string;
  strRecv_TelNo: string;
  strend_nm: string;
  strmang_brn_nm: string;
  strdlv_emp_nm: string;
  strSenderMsg: string;
begin
  result := true;
  try
    try
//      with frmDelivery_Cooperation_Trans_0100 do
//      begin
        // cxProgressBar1.Properties.Max := QryMaster.RecordCount;
        // QryMaster.First;
        // for idx := 0 to QryMaster.RecordCount -1 do
        // for idx := 0 to 1 do
        // begin

        strSendData1 := '';
        strReceiveData1 := '';
        strSendData2 := '';
        strReceiveData2 := '';
        strInvoiceNo := '';
        strFareCode := '';
        strSend_code := '';
        strRecv_code := '';
        strRecv_zn_dv := '';
        strRecv_cnsl_end_no := '';
        strRecv_addr_town := '';
        strItemList := '';
        strFarePrice := '0';
        strSenderRemark := '';
        strRemark := '';
        strSener_TelNo := '';
        strRecv_TelNo := '';
        strend_nm := '';
        strmang_brn_nm := '';
        strdlv_emp_nm := '';
        strSenderMsg := '';
        strSendData1    := KorexMaster.SENDR_ADDR + ' ' + KorexMaster.SENDR_DETAIL_ADDR + #13 + #10 + KorexMaster.SENDR_NM + ' ' + gm_getTel(KorexMaster.SENDR_TEL_NO);
        strReceiveData1 := KorexMaster.RCVR_ADDR  + ' ' + KorexMaster.RCVR_DETAIL_ADDR  + #13 + #10 + KorexMaster.RCVR_NM  + ' ' + getSecretTel(gm_getTel(KorexMaster.RCVR_CELL_NO)) + '   ' + getSecretTel(gm_getTel(KorexMaster.RCVR_TEL_NO));
        strSendData2    := KorexMaster.SENDR_ADDR + ' ' + KorexMaster.SENDR_DETAIL_ADDR + #13 + #10 + KorexMaster.SENDR_NM + ' ' + gm_getTel(KorexMaster.SENDR_TEL_NO);
        strReceiveData2 := KorexMaster.RCVR_ADDR  + ' ' + KorexMaster.RCVR_DETAIL_ADDR  + #13 + #10 + KorexMaster.RCVR_NM  + ' ' + gm_getTel(KorexMaster.RCVR_CELL_NO) + '   ' + gm_getTel(KorexMaster.RCVR_TEL_NO);

        strInvoiceNo  := KorexMaster.INVOICENO;
        strFareCode   := KorexMaster.frt_code;

        // strSend_code := KorexMaster.END_NO ;
        strRecv_code  := KorexMaster.END_NO;
        strRecv_zn_dv := KorexMaster.SUB_END_NO;
        // strRecv_cnsl_end_no := GetRecv_cnsl_end_no(KorexMaster.RCVR_MAIL_NO );
        // strRecv_addr_town := GetRecv_addr_town(KorexMaster.RCVR_MAIL_NO );
        strend_nm := KorexMaster.END_NM;
        strmang_brn_nm := KorexMaster.MAN_BRAN_NM;
        strdlv_emp_nm := KorexMaster.CLDV_EMP_NM;
        strSenderMsg := KorexMaster.rcvr_remark;

        if strFareCode = '0010' then // 신용일 경우는 무조건 0으로 나타나도록 한다.
          strFarePrice := '0'
        else
          strFarePrice := KorexMaster.FRT_UPRICE;

        strSenderRemark := KorexMaster.SENDR_REMARK;
        strRemark := KorexMaster.REMARK;

        { strM_SEQ := QryMaster.FieldByName('SEQ').AsString;

          szSQL := '';
          szSQL := 'select * from print_invoice_items where m_seq = ' + strM_SEQ + ' order by item_seq';

          with QryDetail do
          begin
          close;
          sql.Text := szSQL;
          Prepare;
          Open;
          end;

          QryDetail.First; }
        /// ////////////////////////////라인넘기기///////////////////////////////
        ItemList := TStringList.Create;
        ItemList_sub := TStringList.Create;
        inPage_suv := 0;
        { for idx2 := 0 to QryDetail.RecordCount - 1 do
          begin

          // if (idx2 + 1) <= 11 then
          //  begin
          if strItemList = '' then
          strItemList := inttostr(idx2 + 1)+ '. ' + QryDetail.FieldByName('ENTER_ITEM_NM').AsString
          else
          strItemList := strItemList +#13+#10+ inttostr(idx2 + 1)+ '. ' + QryDetail.FieldByName('ENTER_ITEM_NM').AsString;
          QryDetail.Next;
          //  end;
          end; }

        ItemList.Text := KorexMaster.Invoice_Detail_Item;
        idx_div := ItemList.Count div MAXLINE;
        idx_mod := ItemList.Count mod MAXLINE;
        // showmessage(inttostr(idx_mod));

        for idx_sub := 0 to idx_div do
        begin

          if idx_sub = 0 then
          begin
            if KorexMaster.Detail_Item_Count <= MAXLINE then
            begin
              for idx_sub_div := MAXLINE * idx_sub to MAXLINE * idx_sub + (ItemList.Count - 1) do
                ItemList_sub.Add(ItemList.Strings[idx_sub_div]);
            end
            else
            begin
              for idx_sub_div := MAXLINE * idx_sub to MAXLINE * idx_sub + (MAXLINE - 1) do
                ItemList_sub.Add(ItemList.Strings[idx_sub_div]);
            end;

            SetKorexInvoice_Type1(
              strRecv_code,   // strRecv_code  := KorexMaster.END_NO;
              strRecv_code,   // strRecv_code  := KorexMaster.END_NO;
              strRecv_code + ' ' + strRecv_addr_town, // strRecv_code  := KorexMaster.END_NO;  strRecv_addr_town := '';
              copy(strSend_code, 1, 3) + '-' + copy(strSend_code, 4, 1), // strSend_code := '';
              strInvoiceNo,   // strInvoiceNo  := KorexMaster.INVOICENO;

              ItemList_sub.Text,
              strInvoiceNo, // strInvoiceNo  := KorexMaster.INVOICENO;
              strInvoiceNo, // strInvoiceNo  := KorexMaster.INVOICENO;
              FormatDateTime('YYYY.MM.DD', now),
              strInvoiceNo, // strInvoiceNo  := KorexMaster.INVOICENO;

              FormatDateTime('YYYY.MM.DD', now),
              GetFareName(strFareCode), // strFareCode   := KorexMaster.frt_code;
              strFarePrice,     // if strFareCode = '0010' then strFarePrice := '0' else strFarePrice := KorexMaster.FRT_UPRICE; // 신용일 경우는 무조건 0으로 나타나도록 한다.
              strReceiveData1,  // strReceiveData1 := KorexMaster.RCVR_ADDR  + ' ' + KorexMaster.RCVR_DETAIL_ADDR  + #13 + #10 + KorexMaster.RCVR_NM  + ' ' + getSecretTel(gm_getTel(KorexMaster.RCVR_CELL_NO)) + '   ' + getSecretTel(gm_getTel(KorexMaster.RCVR_TEL_NO));
              strSendData1,     // strSendData1    := KorexMaster.SENDR_ADDR + ' ' + KorexMaster.SENDR_DETAIL_ADDR + #13 + #10 + KorexMaster.SENDR_NM + ' ' + gm_getTel(KorexMaster.SENDR_TEL_NO);

              strReceiveData2,  // strReceiveData2 := KorexMaster.RCVR_ADDR  + ' ' + KorexMaster.RCVR_DETAIL_ADDR  + #13 + #10 + KorexMaster.RCVR_NM  + ' ' + gm_getTel(KorexMaster.RCVR_CELL_NO) + '   ' + gm_getTel(KorexMaster.RCVR_TEL_NO);
              strSendData2,     // strSendData2    := KorexMaster.SENDR_ADDR + ' ' + KorexMaster.SENDR_DETAIL_ADDR + #13 + #10 + KorexMaster.SENDR_NM + ' ' + gm_getTel(KorexMaster.SENDR_TEL_NO);
              strSenderRemark,  // strSenderRemark := KorexMaster.SENDR_REMARK;
              strRecv_zn_dv,    // strRecv_zn_dv := KorexMaster.SUB_END_NO;
              strend_nm,        // strend_nm := KorexMaster.END_NM;

              strmang_brn_nm,   // strmang_brn_nm := KorexMaster.MAN_BRAN_NM;
              strdlv_emp_nm,    // strdlv_emp_nm  := KorexMaster.CLDV_EMP_NM;
              strRemark,        // strRemark      := KorexMaster.REMARK;
              strSenderMsg      // strSenderMsg   := KorexMaster.rcvr_remark;
              );
            ItemList_sub.Clear;
          end
          else
          begin
            if MAXLINE * idx_sub div MAXLINE <> ItemList.Count div MAXLINE then
            begin
              for idx_sub_div := MAXLINE * idx_sub to MAXLINE * idx_sub + (MAXLINE - 1) do
              begin
                ItemList_sub.Add(ItemList.Strings[idx_sub_div]);
              end;
            end
            else
            begin
              for idx_sub_div := MAXLINE * idx_sub to ItemList.Count - 1 do
              begin
                ItemList_sub.Add(ItemList.Strings[idx_sub_div]);
              end;
            end;
            if ItemList_sub.Text <> '' then
              SetKorexInvoice_Type1(
                '', '', '', '', '', ItemList_sub.Text, // memItemList,
                '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''
                );
            ItemList_sub.Clear;

          end;
        end;

    except
      on e: Exception do
      begin
        showmessage(e.Message);
        result := false;
      end;
    end;
  finally
    ItemList.Free;
    ItemList_sub.Free;
  end;
end;


procedure Tfrm_CJ_Daetong.SetKorexInvoice_Type1(
      strBarArriveCode  : string;   // strRecv_code := KorexMaster.END_NO;
      strmemArriveCode  : string;   // strRecv_code := KorexMaster.END_NO;
      strmemArrivename  : string;
      strmemSendCode    : string;
      strBarInvoiceNo1  : string;
      strmemItemList    : string;
      strBarInvoiceNo2  : string;
      strmemInvoiceNo1  : string;
      strmemDate1       : string;
      strmemInvoiceNo2  : string;
      strmemDate2       : string;
      strmemFareType    : string;
      strmemFarePrice   : string;
      strmemReceiveData1: string;
      strmemSendData1   : string;
      strmemReceiveData2: string;
      strmemSendData2   : string;
      strSenderRemark   : string;
      strmem_zn_dv      : string;   // strRecv_zn_dv := KorexMaster.SUB_END_NO;
      strmem_end_nm     : string;   // strend_nm     := KorexMaster.END_NM;
      strmem_mang_brn_nm: string;
      strmem_dlv_emp_nm : string;
      strRemark         : string;
      strSenderMsg      : string);
begin
  with szReport do
  begin
    TfrxBarCodeView (FindObject('BarArriveCode')).Text              := strBarArriveCode;              // strRecv_code  := KorexMaster.END_NO;
    TfrxBarCodeView (FindObject('BarArriveCode')).Expression        := QuotedStr(strBarArriveCode);   // strRecv_code  := KorexMaster.END_NO;
    TfrxMemoView    (FindObject('memArriveCode')).Text              := copy(strmemArriveCode, 2, 3);  // strRecv_code  := KorexMaster.END_NO;
    TfrxMemoView    (FindObject('memArriveCode1st')).Text           := copy(strmemArriveCode, 1, 1);  // strRecv_code  := KorexMaster.END_NO;
    TfrxMemoView    (FindObject('mem_zn_dv')).Text                  := '-' + strmem_zn_dv;            // strRecv_zn_dv := KorexMaster.SUB_END_NO;
    TfrxMemoView    (FindObject('mem_end_nm')).Text                 := strmem_end_nm;                 // strend_nm     := KorexMaster.END_NM;
    TfrxMemoView    (FindObject('mem_mang_brn_nm')).Text            := strmem_mang_brn_nm;
    TfrxMemoView    (FindObject('mem_dlv_emp_nm')).Text             := '배달사원:' + strmem_dlv_emp_nm;
    TfrxBarCodeView (FindObject('BarInvoiceNo1')).Text              := strBarInvoiceNo1;
    TfrxBarCodeView (FindObject('BarInvoiceNo1')).Expression        := strBarInvoiceNo1;
    TfrxMemoView    (FindObject('mem_BarInvoiceNo1_caption')).Text  := GetInvoiceNoCaption(strBarInvoiceNo1);
    TfrxMemoView    (FindObject('memItemList')).Font.Size           := szFontSize;
    TfrxMemoView    (FindObject('memItemList')).Text                := strmemItemList;
    TfrxBarCodeView (FindObject('BarInvoiceNo2')).Text              := strBarInvoiceNo2;
    TfrxBarCodeView (FindObject('BarInvoiceNo2')).Expression        := strBarInvoiceNo2;
    TfrxMemoView    (FindObject('mem_BarInvoiceNo2_caption')).Text  := GetInvoiceNoCaption(strBarInvoiceNo1);
    TfrxMemoView    (FindObject('memInvoiceNo1')).Text              := GetInvoiceNoCaption(strBarInvoiceNo1);
    TfrxMemoView    (FindObject('memDate1')).Text                   := strmemDate1;
    TfrxMemoView    (FindObject('memInvoiceNo2')).Text              := GetInvoiceNoCaption(strBarInvoiceNo1);
    TfrxMemoView    (FindObject('memDate2')).Text                   := strmemDate2;
    TfrxMemoView    (FindObject('memFareType')).Text                := strmemFareType;
    TfrxMemoView    (FindObject('memFarePrice')).Text               := strmemFarePrice;
    TfrxMemoView    (FindObject('memReceiveData1')).Text            := strmemReceiveData1;
    TfrxMemoView    (FindObject('memSendData1')).Text               := strmemSendData1;
    TfrxMemoView    (FindObject('memReceiveData2')).Text            := strmemReceiveData2;
    TfrxMemoView    (FindObject('memSendData2')).Text               := strmemSendData2;
    TfrxMemoView    (FindObject('memSenderRemark')).Text            := strSenderRemark;
    TfrxMemoView    (FindObject('memRemark')).Text                  := StringReplace(StringReplace(strRemark, '<', '', [rfReplaceAll]), '>', '', [rfReplaceAll]);;
    TfrxMemoView    (FindObject('mem_senderRemark')).Text           := strSenderMsg;

    if strBarInvoiceNo1 = '' then
    begin
      TfrxBarCodeView(FindObject('BarArriveCode'))  .Visible := false;
      TfrxBarCodeView(FindObject('mem_zn_dv'))      .Visible := false;
      TfrxBarCodeView(FindObject('BarInvoiceNo1'))  .Visible := false;
      TfrxBarCodeView(FindObject('mem_dlv_emp_nm')) .Visible := false;
      TfrxBarCodeView(FindObject('BarInvoiceNo2'))  .Visible := false;

      inPage_suv := inPage_suv + 1;
      TfrxMemoView(FindObject('memPages')).Text := '[' + inttostr(inPage) + '-' + inttostr(inPage_suv) + ' / ' + inttostr(inPages) + ']';
    end
    else
    begin
      inPage := inPage + 1;
      TfrxMemoView(FindObject('memPages')).Text := '[' + inttostr(inPage) + ' / ' + inttostr(inPages) + ']';
    end;

    PrepareReport(false);
    TfrxBarCodeView(FindObject('BarArriveCode'))  .Visible := true;
    TfrxBarCodeView(FindObject('mem_zn_dv'))      .Visible := true;
    TfrxBarCodeView(FindObject('BarInvoiceNo1'))  .Visible := true;
    TfrxBarCodeView(FindObject('mem_dlv_emp_nm')) .Visible := true;
    TfrxBarCodeView(FindObject('BarInvoiceNo2'))  .Visible := true;
  end;

  // TfrxMemoView(FR_invoice.FindObject('mem_BarArriveCode_caption')).Text := strBarArriveCode;
  // TfrxMemoView(FR_invoice.FindObject('memArrivename')).Text := strmemArrivename;
  // TfrxMemoView(FR_invoice.FindObject('memSendCode')).Text := strmemSendCode;
  // TfrxMemoView(FindObject('memItemList')).Clipped := false;

end;



function Tfrm_CJ_Daetong.Get_Valid_Printer: string;
var
  idx: Integer;
begin
  result := '';
  for idx := 0 to tv1.DataController.RecordCount - 1 do
  begin
    if tv1.DataController.Values[idx, tv1Chk.Index] = true then
    begin
      if idx = tv1.DataController.RecordCount - 1 then
        result := result + tv1.DataController.Values[idx, tv1Printer.Index]
      else
        result := result + tv1.DataController.Values[idx, tv1Printer.Index] + #13#10;
    end;
  end;
end;

procedure Tfrm_CJ_Daetong.InitPrinterGrid;
var
  idx: Integer;
  idx_2: Integer;
begin
  tv1.DataController.RecordCount := 5;
  tv1.BeginUpdate();

  for idx := 0 to tv1.DataController.RecordCount - 1 do
  begin

    TcxComboBoxProperties(tv1Printer.Properties).Items.Assign(printer.Printers);

    tv1.DataController.Values[idx, tv1Printer.Index] :=
          TcxComboBoxProperties(tv1Printer.Properties).Items[printer.PrinterIndex];

    tv1.DataController.Values[idx, tv1Chk.Index] := false;

  end;
  tv1.EndUpdate;

end;




function Tfrm_CJ_Daetong.InputPrintData: Boolean;
type
  TFunc = function(): Integer; stdcall;
var
  lszSeller_Code: string;
  lszWarehouse_Code: string;

  FuncPtr: TFarProc;
  //GetFunc3: TFunc3;

  idx: Integer;
  InvoiceCount: Integer;
  InvoiceAllCount: Integer;
  InnerIdx: Integer;

  IsFail: Boolean;
  szErrFields: string;
  szFarePrice: string;
  szFarePrice_Send_To_Server: string;
  szFareCode: string;
  szSummary: string;
  oRSMaster, oRSDetail: TFDQuery;
  szSQL1, szSQL2: string;
  nSEQ: string;
  nSender_SEQ: string;
  szItem_Seq: string;
  szSender_Tml: string;

  nRowIdx_M: Integer;
  nRowIdx_D: Integer;
  oRowInfo_M: TcxRowInfo;
  oRowInfo_D: TcxRowInfo;
  // ADetail_DataController: TcxCustomDataController;
  Multiplex_Invoice: Boolean;
  StrCount: Integer;
  oRS: TFDQuery;
  oRS2: TFDQuery;
  szSQL: string;

//  oSP: TStringList;
  szSeller_Code: string;
  szReady_Date: String;
  szOut_Ready_BookNo: string;
  Search_Type, Search_Type2: string;
//  Val1, val2: Integer;

  szSender_nm: string; // 발송인 명
  szSender_Tel1: string; // 발송인 전화1
  szSender_Tel2: string; // 발송인 전화2
  szSender_ZipNo: string; // 발송인 우편번호
  szSender_Addr: string; // 발송인 주소
  szSender_Addr_detail: string; // 발송인 주소
//  ServerInvoice: TStringList;
//  LocalInvoice: TStringList;
  Idx_Val: Integer;
  printed_count: Integer;
  i: Integer;
  OldAddr, OldAddr_Dtl: string;
  aStatus: cardinal;
  aNrJob: Integer;
  oTMSConn_BySeller: TFDCustomConnection;
  // 전송SEQ발번 카운트 개수
  SeqCount: Integer;
  // 전송SEQ가져온 데이터
  Send_SEQ_List: TStringList;
  SeqIndex: Integer;
  szFrtCode: string;
  szTranCode: string;
  temp : string;
  szInvoice_Type : string;
begin
  PrinterCount := 1;
  lszTran_Code := CODE_DELIVERY_KOREX;

  lszSeller_Code := 'C001'; // 임의의 화주코드
  lszWarehouse_Code := 'W001'; // 임의의 물류창고코드
  printinfo.print_type_filename := 'CJ대한통운01.fr3';

  szInvoice_Type := 'K_TYPE_1'; // 대한통운 1번 양식  //cboxInvoiceType.Code;
  StrCount := gszChrCnt;
  InvoiceCount := 0;
  SeqCount := 0;
  SeqIndex := 0;
  result := true;
  Multiplex_Invoice := false;

  // 이전 출력한 데이터가 남아있을수 있으므로 삭제처리
  // gm_Delivery_Linkage_Init_Delivery_Print_Data(lszSeller_Code, lszTran_Code);
  // print invoice를 사용하지 않으므로 삭제 불필요  2011-12-01 정정헌
  IsFail := false;
  oRSMaster := TFDQuery.Create(self);
  oRSDetail := TFDQuery.Create(self);
  Send_SEQ_List := TStringList.Create;


  oRSMaster.Connection := dmMain.dbLinkage;

  // 프린터정보를 여기서 로드하는걸로 변경
  // 리포트 객체는 필요한 경우 FREE시키기 위해 런타임에서 생성함
  // Free 시키는 이유는 Prepared된 리포트가 Clear가 안되어(오류발생) 객체를 아예 죽이고 다시로드함.
  // 우선 일정 수량이 채워지면 먼저 Print 시키기 위해 변경
  szReport := TfrxReport.Create(self);
  szReport.Clear;
  szReport.Report.Clear;

  try

    szReport.LoadFromFile(gszHomePath + INVOICE_FR3_PATH + printinfo.print_type_filename);
    szReport.OnBeforePrint := FR_InvoiceBeforePrint;



    // 트랜젝션을 걸지 않고, 출력용 데이터를 넣는다.
    // 출력완료 후 출력전  모든 데이터를 지운다.
    // 에러 발생시 데이터를 지운다.
    oRS := TFDQuery.Create(nil);
    oRS.Connection := dmMain.dbLinkage;

    oRS2 := TFDQuery.Create(nil);
    oRS2.Connection := dmMain.dbLinkage;

    //with Tfrm_Order_OutReady_Delivery(owner) do
    begin
      try
        try
        

          pbPrintDataInput.Properties.Text := '발번송장번호 검사중...잠시만 기다리세요';
          pbPrintDataInput.Update;
          


          for nRowIdx_M := 0 to dbtv_M.DataController.GetRowCount - 1 do
          begin
            if chkPrintFromTo.Checked then
              if (edtPrintFrom.Value > (nRowIdx_M + 1)) or (edtPrintTo.Value < (nRowIdx_M + 1)) then
              begin
                continue;
              end;

            oRowInfo_M := dbtv_M.DataController.GetRowInfo(nRowIdx_M);
            inc(SeqCount);
            if VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrintedCount.Index], '') <> '' then
              inc(printed_count);
          end;

          // 송장중복출력을 막는루틴 제거함. 2013-08-08. 정정헌.

          // if Find_Printed_Invoice(LocalInvoice) = true then
//          if gszRealIP <> gszCommerceIP then
//          begin
//            if printed_count <> 0 then
//            begin
//              if Application.MessageBox(PWideChar('이미 출력된 송장이 포함되어 있습니다.' + #13#10 + '출력된 송장을 다시 출력하시겠습니까?'), '알림', MB_YESNO + MB_ICONQUESTION) = IDYES then
//              begin
//                if gm_confirm_login = true then
//                  ApplyPrinted := true
//                else
//                begin
//                  Application.MessageBox(PWideChar('인증실패하여 출력된 송장을 제외하고 출력합니다.'), '알림', 0);
//                end;
//              end;
//            end;
//          end
//          else
//            ApplyPrinted := true;


          if ApplyPrinted = false then
            SeqCount := SeqCount - printed_count;

          // seqCount 에는 출력할 송장의 수량이 들어간다
          Send_SEQ_List.Text := gm_Delivery_GetMaxSeq_Send_To_Server_many(seqCount, lszSeller_Code, lszWarehouse_Code);




          pbPrintDataInput.Properties.Max := dbtv_M.DataController.GetRowCount - 1;
          szSQL := '';
          szSQL := szSQL + 'declare @tmpTableResult TABLE (nResult int)' + #13 + #10;
          szSQL := szSQL + 'declare @nResult int;' + #13 + #10;
          szSQL := szSQL + 'declare @nResultSum int;' + #13 + #10;
          szSQL := szSQL + 'declare @Cnt int' + #13 + #10;
          szSQL := szSQL + 'declare @nSeq bigint' + #13 + #10;
          szSQL := szSQL + 'declare @nitem_Seq bigint' + #13 + #10;
          szSQL := szSQL + '' + #13 + #10;
          szSQL := szSQL + '--  트랜잭션 시작' + #13 + #10;
          szSQL := szSQL + 'begin tran' + #13 + #10;
          szSQL := szSQL + 'set @nResultSum = -1 ' + #13 + #10;
          szSQL := szSQL + '' + #13 + #10;

          szSQL2 := '';
          szSQL2 := szSQL2 + 'declare @tmpTableResult TABLE (nResult int)' + #13 + #10;
          szSQL2 := szSQL2 + 'declare @nResult int;' + #13 + #10;
          szSQL2 := szSQL2 + 'declare @nResultSum int;' + #13 + #10;
          szSQL2 := szSQL2 + '' + #13 + #10;
          szSQL2 := szSQL2 + '--  트랜잭션 시작' + #13 + #10;
          szSQL2 := szSQL2 + 'begin tran' + #13 + #10;
          szSQL2 := szSQL2 + 'set @nResultSum = -1 ' + #13 + #10;
          szSQL2 := szSQL2 + '' + #13 + #10;

          inPages := edtPrintTo.Value; // 전체페이지 ==> 2024.02.26. 값이 할당되지 않는다..



          szReport.PrintOptions.printer := pchar(ValidPrinterList.Strings[0]);
          szReport.SelectPrinter;


          // dbtv_M.BeginUpdate();
          for nRowIdx_M := 0 to dbtv_M.DataController.GetRowCount - 1 do // 탭개출고준비화면 그리드 루프
          begin
            if (edtPrintFrom.Value <= nRowIdx_M + 1) and (edtPrintTo.Value >= nRowIdx_M + 1) then
            begin
              pbPrintDataInput.Position := nRowIdx_M;
              pbPrintDataInput.Properties.Text := inttostr(nRowIdx_M);
              pbPrintDataInput.Update;
            end;
            if chkPrintFromTo.Checked then
              if (edtPrintFrom.Value > (nRowIdx_M + 1)) or (edtPrintTo.Value < (nRowIdx_M + 1)) then
                continue;

            oRowInfo_M := dbtv_M.DataController.GetRowInfo(nRowIdx_M);
            md_invoice_master.RecNo := oRowInfo_M.RecordIndex + 1;
            // ADetail_DataController := dbtv_M.DataController.GetDetailDataController(oRowInfo_M.RecordIndex, 0);
            // 삭제된 건 건너뛰기
            if dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MDeleteChk.Index] = '2' then
            begin
              mem_non_print.lines.add('▶' + inttostr(nRowIdx_M + 1) + '번 송장 은 삭제된 송장입니다.');
              continue;
            end;
            // 출력된 송장 건너뛰기
            if (VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrintedCount.Index], '') <> '') and (ApplyPrinted = false) then
            begin
              mem_non_print.lines.add('▶' + inttostr(nRowIdx_M + 1) + '번 ' + dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MInvoiceNo.Index] +
                ' 송장 은 이미 출력된 송장입니다.');
              continue;
            end;
            if VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrintedCount.Index], '') = '' then
            begin
              gszPrintedCount := 1;
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrintedCount.Index] := '1';
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrint_reg_userid.Index] := gszAuthLogin_ID;
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrint_reg_datetime.Index] := formatdatetime('yy-mm-dd hh시nn분ss초', now);
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrint_edt_userid.Index] := gszAuthLogin_ID;
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrint_edt_datetime.Index] := formatdatetime('yy-mm-dd hh시nn분ss초', now);
            end
            else
            begin
              gszPrintedCount := dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrintedCount.Index] + 1;
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrintedCount.Index] :=
              // inttostr(strtoint(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrintedCount.Index]) + 1);
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrint_edt_userid.Index] := gszAuthLogin_ID;
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrint_edt_datetime.Index] := formatdatetime('yy-mm-dd hh시nn분ss초', now);
            end;

            { 송장데이터 입력 시작 }
            if dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MFix_Fare_Code.Index] = CODE_FARE_DEFERRED then
            // 착불일경우만 금액을 표시
            begin
              szFarePrice                := inttostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MFix_Fare_Price.Index]);
              szFarePrice_Send_To_Server := inttostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MFix_Fare_Price.Index]);
            end
            else
            begin
              // 이제 배송금액은 신용이더라도 데몬에 원래 금액을 넘긴다.  2015-05-15 정정헌
              // if lszTran_Code = CODE_DELIVERY_KGB then
              // begin
              szFarePrice                := inttostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MFix_Fare_Price.Index]);
              szFarePrice_Send_To_Server := inttostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MFix_Fare_Price.Index]);
              // end
              // else
              // begin
              // szFarePrice_Send_To_Server := '0';
              // szFarePrice := '0';
              // end;
            end;

            inPage := nRowIdx_M;
            inPage_suv := 0;
            lszSumQty := inttostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MSumQty.Index]);
            szSummary := '';
            szSummary :=
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_Comp_Name.Index] +
              '[' +
              inttostr(md_invoice_detail.RecordCount) +
              '/' +
              lszSumQty +
              ']' +
              '-->' +
              md_invoice_detailOrd_Date.AsString;

            // 일자는 아무거나 하나

            nSEQ := '0';
            // gm_Delivery_GetMaxSeq_Print(lszSeller_Code, lszWarehouse_Code);
            Detail_Item_Count := md_invoice_detail.RecordCount; // Detail 상품 수
            RefineAddr.rcvrShortAddr := VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MrcvrShortAddr.Index], '');
            RefineAddr.rcvrClsfAddr  := VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MrcvrClsfAddr.Index], '');
            RefineAddr.dlvPreArrEmpNickNm := InputText(VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MdlvPreArrEmpNickNm.Index],
              ''), 1, '-');

            if VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcvAddr_Old.Index], '') <> '' then
              RefineAddr.OldAddr := '[' + dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcvAddr_Old.Index] + ']';

            RefineAddr.OldAddrFull := trim(VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_Mrcvr_OldAddr.Index], '') + ' ' +
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_Mrcvr_OldAddrDtl.Index], ''));
            RefineAddr.ferryFare := VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MferryFare.Index], '');



          // for nRowIdx_M := 0 to dbtv_M.DataController.GetRowCount - 1 do // 탭개출고준비화면 그리드 루프 - 들여쓰기된것 표시


            // 발송인 정보 세팅
            // 발송인명
            szSender_nm := gszDelivery_Sendr_NM;

            // 발송인전화
            szSender_Tel1 := gszDelivery_Sendr_Tel1;
            szSender_Tel2 := gszDelivery_Sendr_Tel2;


            // 발송인주소
            szSender_ZipNo        := gszDelivery_Sendr_Mail_NO;
            szSender_Addr         := gszDelivery_Sendr_addr;
            szSender_Addr_detail  := gszDelivery_Sendr_detail_addr;


          // for nRowIdx_M := 0 to dbtv_M.DataController.GetRowCount - 1 do // 탭개출고준비화면 그리드 루프 - 들여쓰기된것 표시


            { 내품 데이터(상품) 입력 시작 }
            Invoice_Detail_Item := '';
            for nRowIdx_D := 0 to md_invoice_detail.RecordCount - 1 do
            begin
              md_invoice_detail.RecNo := nRowIdx_D + 1;
              // oRowInfo_D := ADetail_DataController.GetRowInfo(nRowIdx_D);
              if nRowIdx_D = md_invoice_detail.RecordCount - 1 then
              begin
                // Invoice_Detail_Item := Invoice_Detail_Item + InsertLineFeed(inttostr(nRowIdx_D + 1) + '▶ ' + ADetail_DataController.Values
                // [nRowIdx_D, dbtv_DItem_Disp.Index], 35);

                temp := md_invoice_detailDel_Datetime.AsString;

                if md_invoice_detailDel_Datetime.AsString = '' then
                // 삭제되지 않은건만 넘겨준다.
                begin
                  Invoice_Detail_Item := Invoice_Detail_Item +
                  InsertLineFeed(inttostr(nRowIdx_D + 1) + '▶' + SetDisplayText(CHKLISTBOX1, LISTBOX1, nRowIdx_D),
                    StrCount);
                end
                else
                begin
                  mem_non_print.lines.add('▶' + inttostr(nRowIdx_M + 1) + '번 송장' + inttostr(nRowIdx_D + 1) + '번째 상품은 삭제된 내역입니다.');
                end;
              end
              else
              begin
                // Invoice_Detail_Item := Invoice_Detail_Item + InsertLineFeed(inttostr(nRowIdx_D + 1) + '▶ ' + ADetail_DataController.Values
                // [nRowIdx_D, dbtv_DItem_Disp.Index], 35) + #13#10;
                if md_invoice_detailDel_Datetime.AsString = '' then
                // 삭제되지 않은건만 넘겨준다.
                begin
                  Invoice_Detail_Item := Invoice_Detail_Item + InsertLineFeed(inttostr(nRowIdx_D + 1) + '▶' + SetDisplayText(CHKLISTBOX1, LISTBOX1, nRowIdx_D),
                    StrCount) + #13#10;
                end
                else
                begin
                  mem_non_print.lines.add('▶' + inttostr(nRowIdx_M + 1) + '번 송장' + inttostr(nRowIdx_D + 1) + '번째 상품은 삭제된 내역입니다.');
                end;
              end;

              // gm_Delivery_Linkage_Insert_Invoice_Detail_For_Print(nSEQ, '', CutString(md_invoice_detailItem_Disp.Index], 197), md_invoice_detailQty_Out_Fix.Index], lszSeller_Code, gszWHO_Cde);
            end; // for nRowIdx_D := 0 to ADetail_DataController.GetRowCount - 1 do


            OldAddr := VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Addr.Index], '');
            OldAddr_Dtl := '';
            // end;
            // 송장 출력용 마스터 등록 print_invoice
            // 이제 송장 출력용 마스터를 서버에 등록하지 않고 바로 리포트에 추가한다.
            // if chk_sender_info.EditValue = false then //발송인 정보를 주문인 정보로 표시 체크 FALSE : 주문사 , true : 주문인정보 :
            // GTX 신용 착불 코드는 다르게 한다
            //
            szFrtCode := VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MFix_Fare_Code.Index], '');

            szTranCode := lszTran_Code;






          // for nRowIdx_M := 0 to dbtv_M.DataController.GetRowCount - 1 do // 탭개출고준비화면 그리드 루프 - 들여쓰기된것 표시

            // 송장출력 데이터를 마스터 구조체에  등록 ( TKorexMaster = packed record )
            gm_Delivery_Linkage_Insert_Invoice_Header_For_Print(
              nSEQ,
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MInvoiceNo.Index], ''),
              // szinvoiceno: string;
              szTranCode, // szdelivery_code: string;
              lszDelivery_User_ID, // szdelivery_user_id: string;
              gszUser_Id, // szuser_id: string;
              lszSeller_Code, // szseller_code: string;
              lszWarehouse_Code, // szwho_code: string;
              szSender_nm, // gszDelivery_Sendr_NM, // szsendr_nm: string;
              szSender_ZipNo,
              // gszDelivery_Sendr_Mail_NO, // szsendr_mail_no: string;
              szSender_Addr, // gszDelivery_Sendr_addr, // szsendr_addr: string;
              szSender_Addr_detail,
              // gszDelivery_Sendr_detail_addr, // szsendr_detail_addr: string;
              szSummary, // szsendr_remark: string;
              szSender_Tel1,
              // gszDelivery_Sendr_Tel1, // szsendr_tel_no: string;
              szSender_Tel2,
              // gszDelivery_Sendr_Tel2, // szsendr_cell_no: string;
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Name.Index], ''), // szrcvr_nm: string;
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_ZipNo.Index], ''), // szrcvr_mail_no: string;
              OldAddr,
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Addr1.index] + ' ' + dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Addr2.index], //szrcvr_addr: string;
              OldAddr_Dtl, // szrcvr_detail_addr: string;
              gszDelivery_Sendr_Remark, // szrcvr_remark: string; 발송인 배송 메시지로 씀.
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Tel.Index], ''), // szrcvr_tel_no: string;
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_HP.Index], ''), // szrcvr_cell_no: string;
              szFarePrice, // szfrt_uprice: string;
              szFrtCode, // szfrt_code: string;
              lszSeller_Code + '_' +
                lszWarehouse_Code + '_' +
                vartostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPack_Ord_Inner_seq.Index]) + '-' +
                vartostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPack_Item_Seq.Index]),
              // szcust_mgmt_no: string;
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_Memo.Index], ''), // szremark: string;
              '01', VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MBox_Type.Index], ''),
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MdlvClsfCd.Index], ''),
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MdlvSubClsfCd.Index], ''),
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MdlvClsfNm.Index], ''),
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MdlvPreArrBranNm.Index], ''),
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MdlvPreArrBranShortNm.Index], ''),
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MdlvPreArrEmpNm.Index], ''),
              chk_Korex_Addr.EditValue,
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_No1.Index], ''),
              VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPrintedCount.Index], '1')
            ); // szrcpt_code: string //2018-06-27 최병구구 추가  출력횟수 표기


            inc(InvoiceAllCount);

            // 서버에 이미 있는 값인지를 체크함.
            // if not gm_Delivery_Linkage_Check_Data_For_SendToServer(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, tv -o정정헌헌2-c쿼리문 일괄 작업 속도개선(작업완료)zinvoiceno: string;
            // lszTran_Code, // szdelivery_code: string;
            // lszDelivery_User_ID, // szdelivery_user_id: string;
            // gszAuthLogin_ID, // szuser_id: string;
            // lszSeller_Code, // szseller_code: string;
            // lszWarehouse_Code, '01') // szwho_code: string;
            // then
            // begin


          // for nRowIdx_M := 0 to dbtv_M.DataController.GetRowCount - 1 do // 탭개출고준비화면 그리드 루프 - 들여쓰기된것 표시


            //nSender_SEQ := gm_Delivery_GetMaxSeq_Send_To_Server(lszSeller_Code, lszWarehouse_Code);
            nSender_SEQ := Send_SEQ_List.Strings[SeqIndex];
            inc(SeqIndex);

            // 송장 출력 카운트 수 증가 업데이트
            // 송장 출력 카운트 및 시간 업데이트 ==> printed_invoice_list
            szSQL2 := szSQL2 + gm_update_printed_invoice_list(lszSeller_Code, lszWarehouse_Code, dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MTran_Comp.Index],
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MInvoiceNo.Index], lszDelivery_User_ID,
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPack_Ord_Inner_seq.Index], dbtv_M.DataController.Values[oRowInfo_M.RecordIndex,
              dbtv_MPack_Item_Seq.Index], dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_Name.Index],
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_ZipNo.Index], dbtv_M.DataController.Values[oRowInfo_M.RecordIndex,
              dbtv_MOrd_Addr1.Index], dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_Addr2.Index], szSummary,
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_Tel.Index], dbtv_M.DataController.Values[oRowInfo_M.RecordIndex,
              dbtv_MOrd_HP.Index], lszTran_Bookno_date, lszTran_Bookno_seq, szInvoice_Type

              );

            { TODO -o정정헌헌 -c쿼리문 일괄 작업 속도개선(작업완료 : 마스터 테이블과 디테일 테이블 입력 쿼리를 묶어서 한번에 처리 }
            // 택배사 전송용 마스터 등록 send_to_server_invoice  속도개선판
            // if chk_sender_info.EditValue = false then //발송인 정보를 주문인 정보로 표시 체크 FALSE : 주문사 , true : 주문인정보 :

//            if (dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MAddr_Check.Index] = '0') and
//              (gszInvalidated_InovicePrint_YN <> 'Y') then



            // send_to_server_invoice 에 인서트: 택배사서버 전송  데이터 마스터 등록
            szSQL := szSQL + gm_Delivery_Linkage_Insert_Invoice_Header_For_SendToServer_EX(nSender_SEQ,
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MInvoiceNo.Index], // szinvoiceno: string;
              szTranCode, // szdelivery_code: string;
              lszDelivery_User_ID, // szdelivery_user_id: string;
              gszUser_Id, // szuser_id: string;
              lszSeller_Code, // szseller_code: string;
              lszWarehouse_Code, // szwho_code: string;
              szSender_nm, // gszDelivery_Sendr_NM, // szsendr_nm: string;
              szSender_ZipNo,
              // gszDelivery_Sendr_Mail_NO, // szsendr_mail_no: string;
              szSender_Addr, // gszDelivery_Sendr_addr, // szsendr_addr: string;
              szSender_Addr_detail,
              // gszDelivery_Sendr_detail_addr, // szsendr_detail_addr: string;
              szSummary, // szsendr_remark: string;
              szSender_Tel1,
              // gszDelivery_Sendr_Tel1, // szsendr_tel_no: string;
              szSender_Tel2,
              // gszDelivery_Sendr_Tel2, // szsendr_cell_no: string;
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Name.Index], // szrcvr_nm: string;
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_ZipNo.Index], // szrcvr_mail_no: string;
              OldAddr,
              // dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Addr1.index] + ' ' + dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Addr2.index], //szrcvr_addr: string;
              OldAddr_Dtl, // szrcvr_detail_addr: string;
              gszDelivery_Sendr_Remark, // szrcvr_remark: string;
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Tel.Index], // szrcvr_tel_no: string;
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_HP.Index], // szrcvr_cell_no: string;
              szFarePrice_Send_To_Server, // szfrt_uprice: string;
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MFix_Fare_Code.Index], // szfrt_code: string;
              lszSeller_Code + '_' +
                lszWarehouse_Code + '_' +
                vartostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPack_Ord_Inner_seq.Index]) + '-' +
                vartostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPack_Item_Seq.Index]),
              // szcust_mgmt_no: string;
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_Memo.Index], // szremark: string;
              '01',
              dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MBox_Type.Index] // szrcpt_code: string
            );


            for nRowIdx_D := 0 to md_invoice_detail.RecordCount - 1 do
            begin
              // oRowInfo_D := ADetail_DataController.GetRowInfo(nRowIdx_D);
              md_invoice_detail.RecNo := nRowIdx_D + 1;
              if md_invoice_detailDel_Datetime.AsString = '' then
                // 삭제되지 않은건만 넘겨준다.
                szSQL := szSQL + gm_Delivery_Linkage_Insert_Invoice_Detail_For_SendToServer_Ex(md_invoice_detailOrd_Kind1.AsString,
                  md_invoice_detailItem_Name.AsString, md_invoice_detailQty_Out_Fix.AsString, lszSeller_Code, lszWarehouse_Code);
            end;
            // szSQL := szSQL + ' end ' + #13#10;
            szSQL := szSQL + ' ' + #13#10;

            // end;

            { 내품 데이터(상품) 입력 끝 }


          // for nRowIdx_M := 0 to dbtv_M.DataController.GetRowCount - 1 do // 탭개출고준비화면 그리드 루프 - 들여쓰기된것 표시


            printDb(printinfo.print_type_code);




            // 일정수량이 되면 Print시켜버림
            // 수량이 채워지지 않더라도 반복문이 끝나는 시점에서 다시 프린트함.
            // Prepare된 리포트가 없으면 (= 100장뽑는데 100장씩 뽑는걸로 설정되어 있다면)
            // 일단 프린트하고
            // PrePare된 리포트가 없기때문에 반복문이 끝나는 시점에서
            // 다시 프린트 해도 아무것도 프린트 할 것이 없기 때문에 정상적으로 진행됨.
            // 50장이 채워지면 print

            // InvoiceAllCount ===> 그리드에서 프린터로 넘긴 출력할 주문 카운트된것( 출력이 예정된 송장 총수량이 아님)
            //                     DividePrintCount ===> 송장수 / 프린터수 ==> 복수의 프린터기를 이용할 경우, 한대의 프린터에서 출력이 예정된 송장수
            if InvoiceAllCount mod DividePrintCount = 0 then // 지금까지 프린터로 넘긴 수 나누기 프린터당 출력할 수량의 나머지
            begin                                            // 넘긴게 10장, 프린터당 출력할 송장수가 30장이면, 30장이 되어야 나머지가 0이됨.
                                                             // 10 mod 30 = 10  30 mod 30 = 0


              // 정확하게 나누어지지 않으므로 마지막 나머지 송장이 있으면
              // 마지막 프린터에 추가하므로 프린터를 바꿔주는 작업을 하지 않음.



              // InvoiceAllCount ==> szReport와 DB로 넘겨진 송장정보의 수(출력정보가 전달된 송장수)

              // PrinterCount ==> 체크한 프린터 수
              // PrinterCount := ValidPrinterList.Count; // 프린터 개수를 저장한다.

              // DividePrintCount ==> 프린터마다 인쇄할 수량(프린터가 1대면 송장수와 같다)
              // DividePrintCount := (strtoint(edtPrintTo.Text) - strtoint(edtPrintFrom.Text) + 1) div PrinterCount;

              if DividePrintCount <> InvoiceAllCount div PrinterCount then // 넘긴송장 10장 나누기프린터수(보통1) 몫(보통10) 이 출력예정된 송장수
              begin
                szReport.PrintOptions.printer := pchar(ValidPrinterList.Strings[PrinterIdx]);

                // index 따라서 프린터를 따라간다.
                szReport.SelectPrinter;

                szReport.Print;
                szReport.Free;
                PrinterIdx := PrinterIdx + 1;

                /////////////////////////////////////////////////
                // 처음 부분 반복부분
                szReport := TfrxReport.Create(self);
                szReport.Clear;
                szReport.Report.Clear;

                szReport.LoadFromFile(gszHomePath + INVOICE_FR3_PATH + printinfo.print_type_filename);

                szReport.OnBeforePrint := FR_InvoiceBeforePrint;
                /////////////////////////////////////////////////


                if PrinterIdx = PrinterCount then
                  PrinterIdx := 0;

                szReport.PrintOptions.printer := pchar(ValidPrinterList.Strings[PrinterIdx]);
                szReport.SelectPrinter;
              end;

              // 이미 prepare된 리포트가 clear가 안되기때문에 (버그인것으로보임)
              // 객체를 지우고 다시생성
            end; // if InvoiceAllCount mod DividePrintCount = 0 then

            RefineAddr.rcvrShortAddr := '';
            RefineAddr.rcvrClsfAddr := '';
            RefineAddr.dlvPreArrEmpNickNm := '';
            RefineAddr.OldAddr := '';
            RefineAddr.ferryFare := '';

            if (nRowIdx_M mod EXCUTE_COUNT = 0) and (nRowIdx_M <> 0) then
            begin
              szSQL := szSQL + '' + #13 + #10;
              szSQL := szSQL + 'select @nResultSum = sum(nResult) from @tmpTableResult' + #13 + #10;
              szSQL := szSQL + '' + #13 + #10;
              szSQL := szSQL + 'if @nResultSum > 0 goto ERROR_TRANSACTION ' + #13 + #10;
              szSQL := szSQL + '' + #13 + #10;
              szSQL := szSQL + 'commit tran' + #13 + #10;
              szSQL := szSQL + '--트랜잭션 이후로 보내서 롤백을 타지 않도록 함.' + #13 + #10;
              szSQL := szSQL + 'goto END_TRANSACTION' + #13 + #10;
              szSQL := szSQL + '--에러일 경우 롤백' + #13 + #10;
              szSQL := szSQL + 'ERROR_TRANSACTION:' + #13 + #10;
              szSQL := szSQL + 'rollback tran' + #13 + #10;
              szSQL := szSQL + 'END_TRANSACTION:' + #13 + #10;
              szSQL := szSQL + 'select @nResultSum as nResultSum ' + #13 + #10;
              oRS.SQL.Text := szSQL;

              //Get_QueryText(szSQL);

              szSQL2 := szSQL2 + '' + #13 + #10;
              szSQL2 := szSQL2 + 'select @nResultSum = sum(nResult) from @tmpTableResult' + #13 + #10;
              szSQL2 := szSQL2 + '' + #13 + #10;
              szSQL2 := szSQL2 + 'if @nResultSum > 0 goto ERROR_TRANSACTION ' + #13 + #10;
              szSQL2 := szSQL2 + '' + #13 + #10;
              szSQL2 := szSQL2 + 'commit tran' + #13 + #10;
              szSQL2 := szSQL2 + '--트랜잭션 이후로 보내서 롤백을 타지 않도록 함.' + #13 + #10;
              szSQL2 := szSQL2 + 'goto END_TRANSACTION' + #13 + #10;
              szSQL2 := szSQL2 + '--에러일 경우 롤백' + #13 + #10;
              szSQL2 := szSQL2 + 'ERROR_TRANSACTION:' + #13 + #10;
              szSQL2 := szSQL2 + 'rollback tran' + #13 + #10;
              szSQL2 := szSQL2 + 'END_TRANSACTION:' + #13 + #10;
              szSQL2 := szSQL2 + 'select @nResultSum as nResultSum ' + #13 + #10;
              oRS2.SQL.Text := szSQL2;

              //Get_QueryText(szSQL);
              // Get_QueryText(szSQL2);

              pbPrintDataInput.Properties.Text := pbPrintDataInput.Properties.Text + ' (중간전송중)';
              pbPrintDataInput.Update;

              oRS.Open;
              if oRS.Fieldbyname('nResultSum').AsInteger = 0 then
              begin
                result := true
              end
              else if oRS.Fieldbyname('nResultSum').AsInteger >= 1 then
              begin
                Application.MessageBox(pchar('송장출력중 에러. 다시 조회후 출력하세요.'), '알림', MB_ICONINFORMATION + MB_OK);
                result := false;
                Close;
              end
              else
              begin
                Application.MessageBox(pchar('알수없는 에러'), '에러', MB_ICONERROR + MB_OK);
                result := false;
                Close;
              end;

              szSQL := '';
              if (nRowIdx_M <> dbtv_M.DataController.GetRowCount - 1) then
              begin

                szSQL := szSQL + 'declare @tmpTableResult TABLE (nResult int)' + #13 + #10;
                szSQL := szSQL + 'declare @nResult int;' + #13 + #10;
                szSQL := szSQL + 'declare @nResultSum int;' + #13 + #10;
                szSQL := szSQL + 'declare @Cnt int' + #13 + #10;
                szSQL := szSQL + 'declare @nSeq bigint' + #13 + #10;
                szSQL := szSQL + 'declare @nitem_Seq bigint' + #13 + #10;
                szSQL := szSQL + '' + #13 + #10;
                szSQL := szSQL + '--  트랜잭션 시작' + #13 + #10;
                szSQL := szSQL + 'begin tran' + #13 + #10;
                szSQL := szSQL + 'set @nResultSum = -1 ' + #13 + #10;
                szSQL := szSQL + '' + #13 + #10;
              end;


              oRS2.Open;
              if oRS2.Fieldbyname('nResultSum').AsInteger = 0 then
              begin
                result := true
              end
              else if oRS2.Fieldbyname('nResultSum').AsInteger >= 1 then
              begin
                Application.MessageBox(pchar('송장출력중 에러. 다시 조회후 출력하세요.'), '알림', MB_ICONINFORMATION + MB_OK);
                result := false;
                Close;
              end
              else
              begin
                Application.MessageBox(pchar('알수없는 에러'), '에러', MB_ICONERROR + MB_OK);
                result := false;
                Close;
              end;


              szSQL2 := '';
              if (nRowIdx_M <> dbtv_M.DataController.GetRowCount - 1) then
              begin
                szSQL2 := szSQL2 + 'declare @tmpTableResult TABLE (nResult int)' + #13 + #10;
                szSQL2 := szSQL2 + 'declare @nResult int;' + #13 + #10;
                szSQL2 := szSQL2 + 'declare @nResultSum int;' + #13 + #10;
                szSQL2 := szSQL2 + '' + #13 + #10;
                szSQL2 := szSQL2 + '--  트랜잭션 시작' + #13 + #10;
                szSQL2 := szSQL2 + 'begin tran' + #13 + #10;
                szSQL2 := szSQL2 + 'set @nResultSum = -1 ' + #13 + #10;
                szSQL2 := szSQL2 + '' + #13 + #10;
              end;
            end;  // if (nRowIdx_M mod EXCUTE_COUNT = 0) and (nRowIdx_M <> 0) then


          end; // for nRowIdx_M := 0 to dbtv_M.DataController.GetRowCount - 1 do // 탭개출고준비화면 그리드 루프 끝


          if szSQL <> '' then
          // 50건으로 딱 떨어졌을때 빈 쿼리문을 날리지 않을까? 에러가 날 확율이 높아서 수정함
          begin
            szSQL := szSQL + '' + #13 + #10;
            szSQL := szSQL + 'select @nResultSum = sum(nResult) from @tmpTableResult' + #13 + #10;
            szSQL := szSQL + '' + #13 + #10;
            szSQL := szSQL + 'if @nResultSum > 0 goto ERROR_TRANSACTION ' + #13 + #10;
            szSQL := szSQL + '' + #13 + #10;
            szSQL := szSQL + 'commit tran' + #13 + #10;
            szSQL := szSQL + '--트랜잭션 이후로 보내서 롤백을 타지 않도록 함.' + #13 + #10;
            szSQL := szSQL + 'goto END_TRANSACTION' + #13 + #10;
            szSQL := szSQL + '--에러일 경우 롤백' + #13 + #10;
            szSQL := szSQL + 'ERROR_TRANSACTION:' + #13 + #10;
            szSQL := szSQL + 'rollback tran' + #13 + #10;
            szSQL := szSQL + 'END_TRANSACTION:' + #13 + #10;
            szSQL := szSQL + 'select @nResultSum as nResultSum ' + #13 + #10;
            oRS.SQL.Text := szSQL;
            // Get_QueryText(szSQL);
            szSQL2 := szSQL2 + '' + #13 + #10;
            szSQL2 := szSQL2 + 'select @nResultSum = sum(nResult) from @tmpTableResult' + #13 + #10;
            szSQL2 := szSQL2 + '' + #13 + #10;
            szSQL2 := szSQL2 + 'if @nResultSum > 0 goto ERROR_TRANSACTION ' + #13 + #10;
            szSQL2 := szSQL2 + '' + #13 + #10;
            szSQL2 := szSQL2 + 'commit tran' + #13 + #10;
            szSQL2 := szSQL2 + '--트랜잭션 이후로 보내서 롤백을 타지 않도록 함.' + #13 + #10;
            szSQL2 := szSQL2 + 'goto END_TRANSACTION' + #13 + #10;
            szSQL2 := szSQL2 + '--에러일 경우 롤백' + #13 + #10;
            szSQL2 := szSQL2 + 'ERROR_TRANSACTION:' + #13 + #10;
            szSQL2 := szSQL2 + 'rollback tran' + #13 + #10;
            szSQL2 := szSQL2 + 'END_TRANSACTION:' + #13 + #10;
            szSQL2 := szSQL2 + 'select @nResultSum as nResultSum ' + #13 + #10;
            oRS2.SQL.Text := szSQL2;
            // Get_QueryText(szSQL2);

            oRS.Open;

            if oRS.Fieldbyname('nResultSum').AsInteger = 0 then
            begin
              result := true
            end
            else if oRS.Fieldbyname('nResultSum').AsInteger >= 1 then
            begin
              Application.MessageBox(pchar('송장전송중 에러. 다시 조회후 출력하세요.'), '알림', MB_ICONINFORMATION + MB_OK);
              result := false;
              Close;
            end
            else
            begin
              Application.MessageBox(pchar('알수없는 에러'), '에러', MB_ICONERROR + MB_OK);
              result := false;
              Close;
            end;


            oRS2.Open;

            if oRS2.Fieldbyname('nResultSum').AsInteger = 0 then
            begin
              result := true
            end
            else if oRS2.Fieldbyname('nResultSum').AsInteger >= 1 then
            begin
              Application.MessageBox(pchar('송장전송중 에러. 다시 조회후 출력하세요.'), '알림', MB_ICONINFORMATION + MB_OK);
              result := false;
              Close;
            end
            else
            begin
              Application.MessageBox(pchar('알수없는 에러'), '에러', MB_ICONERROR + MB_OK);
              result := false;
              Close;
            end;


          end;  // if szSQL <> '' then



          pbPrintDataInput.Properties.Text := '출력완료';
          pbPrintDataInput.Update;
          
          szReport.Print;

        except
          on e: exception do
          begin
            result := false;

            //오류메세지에서도 에러가나서 메세지가 안나오는 경우가 있어 수정함
            szErrFields := '';
            szErrFields := szErrFields + e.Message + #13 + #10;
            szErrFields := szErrFields + '에러항목' + #13 + #10;
            szErrFields := szErrFields + lszDelivery_User_ID + #13 + #10;
            szErrFields := szErrFields + gszDelivery_Sendr_NM + #13 + #10;
            szErrFields := szErrFields + gszDelivery_Sendr_Mail_NO + #13 + #10;
            szErrFields := szErrFields + gszDelivery_Sendr_addr + #13 + #10;
            szErrFields := szErrFields + gszDelivery_Sendr_detail_addr + #13 + #10;
            szErrFields := szErrFields + szSummary + #13 + #10;
            szErrFields := szErrFields + gszDelivery_Sendr_Tel1 + #13 + #10;
            szErrFields := szErrFields + gszDelivery_Sendr_Tel2 + #13 + #10;
            szErrFields := szErrFields + VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Name.Index], '') + #13 + #10;
            szErrFields := szErrFields + VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_ZipNo.Index], '') + #13 + #10;
            szErrFields := szErrFields + VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Addr1.Index], '') + #13 + #10;
            szErrFields := szErrFields + VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Addr2.Index], '') + #13 + #10;
            szErrFields := szErrFields + VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_Tel.Index], '') + #13 + #10;
            szErrFields := szErrFields + VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MRcv_HP.Index], '') + #13 + #10;
            szErrFields := szErrFields + VarToStrDef(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MInvoiceNo.Index], '') + #13 + #10;
            szErrFields := szErrFields + vartostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPack_Ord_Inner_seq.Index]) + '-';
            szErrFields := szErrFields + vartostr(dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MPack_Item_Seq.Index]) + #13 + #10;
            szErrFields := szErrFields + dbtv_M.DataController.Values[oRowInfo_M.RecordIndex, dbtv_MOrd_Memo.Index] + #13 + #10;
            //szErrFields := szErrFields + inttostr(gnUser_Seq) + #13 + #10;
            szErrFields := szErrFields + inttostr(InnerIdx + 1) + #13 + #10;
            szErrFields := szErrFields + md_invoice_detailItem_Disp.AsString + #13 + #10;
            szErrFields := szErrFields + md_invoice_detailQty_Out_Fix.AsString + #13 + #10;
            //szErrFields := szErrFields + inttostr(gnUser_Seq);

            Application.MessageBox(pchar(szErrFields), '에러', MB_ICONERROR + MB_OK);

          end; // on e: exception do




        end  // try except
      finally  // try
        szReport.Free;
        oRS.Free;
        oRS2.Free;

        // dbtv_M.EndUpdate;
//        LocalInvoice.Free;
      end;



    end; // with   with Tfrm_Order_OutReady_Delivery(owner) do

  finally
    //dmMain.Disconnect_Seller_DB(oTMSConn_BySeller); // ********* 요부분

    //2018-11-29 최병구구 추가
    //oTMSConn_BySeller 해제하지 않아 메모리누수가 발생 하여 추가함
    //oTMSConn_BySeller 해제시 nil을 주지 않으면 포인터 구조상 연결된 커넥션을 전부 지워버려 문제가 발생함
    //해제전 무조건 nil을 주고 해제 해야함
    //oTMSConn_BySeller := nil;
    //oTMSConn_BySeller.Free;  // 2020-02-18.정. 이걸 하면 컨넥션이 끊김, 주석처리

    oRSMaster.Free;
    oRSDetail.Free;
    Send_SEQ_List.Free;
//    oSP.Free;

  end; // try

end;



end.
