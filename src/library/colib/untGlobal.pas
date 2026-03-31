unit untGlobal;

interface

uses
  Classes, frxClass; //, System.SysUtils, Vcl.Forms;

//인쇄 프린터 정보
type
  TPrintInfo = packed record
    delivery_code: string;
    print_type_code: string;
    print_type_name: string;
    print_type_filename: string;
    print_index : Integer;
    name: string;
    nLeftMargin : Integer;
    nTopMargin : Integer;
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
    sendr_nm            : string;     // 발송인 이름
    sendr_mail_no       : string;     // 발송인 우편번호
    sendr_addr          : string;
    sendr_detail_addr   : string;
    sendr_remark        : string;
    sendr_tel_no        : string;
    sendr_cell_no       : string;
    rcvr_nm             : string;     // 수취인 이름
    rcvr_mail_no        : string;     // 수취인 우편번호
    rcvr_addr           : string;
    rcvr_detail_addr    : string;
    rcvr_remark         : string;
    rcvr_tel_no         : string;
    rcvr_cell_no        : string;
    detail_item_count   : Integer;    //상품 수   (추가2024.02.23)
    detail_item_data    : string;     //상품디테일(추가2024.02.23) ItemList    Invoice_Detail_Item
    frt_uprice          : string;
    frt_code            : string; // '0010':'신용'  '0020':'착불'
    frt_name            : string; // GetFareName(KorexMaster.frt_code) 추가 2024.04.04
    cust_mgmt_no        : string;
    remark              : string;
    rcpt_code           : string;
    reg_datetime        : string;
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
    font_size           : Integer;    // 송장에 인쇄할 글씨 폰트 크기. 추가 2024.04.04
    pages               : string;     // 신규송장의 코스정보. 추가 2024.04.04
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

  /// <summary>
  /// 로그인 상태 여부--> 메인폼이 show/hide 가 변경되므로(트렐이아이콘)
  /// </summary>
  gszLoginYN : string;

  {로그인}
  gszHomePath : string;

  szReport: TfrxReport;




  gszUser_Id : string; //로그인 아이디
  PrintInfo: TPrintInfo;
  inPages, inPage, inPage_suv: Integer;

  gszFontSize :Integer ;
  gszChrCnt   :Integer ;
  gszLineCnt  :Integer ;

  gszPrintedCount: Integer;
  Detail_Item_Count: integer; //상품 수

  gszDelivery_Sendr_NM          : string; // 택배발송인명
  gszDelivery_Sendr_Tel1        : string; // 택배발송인전화1
  gszDelivery_Sendr_Tel2        : string; // 택배발송인전화2
  gszDelivery_Sendr_Mail_NO     : string; // 택배발송인 우편번호
  gszDelivery_Sendr_addr        : string; // 택배발송인 주소
  gszDelivery_Sendr_detail_addr : string; // 택배발송인 상세주소
  gszDelivery_Sendr_Remark      : string; // 발송인 배송메시지

  Invoice_Detail_Item: string; //상품디테일
  gszSendTML: string; //터미널코드(대리점, 집하점) 일부택배사의 경우 해당값을 입력해두었다가 출력해야함. (예 KGB)
  //gszAuthLogin_ID : string; //로그인 아이디

  gInvPrinting: Boolean; // 사용자 실수등으로 출력버튼이 순간적으로 여러번 눌리더라도 한번만 출력하기위한 플래그
  gHttpRecieving: Boolean; // 사용자, 시스템 오류등으로 http req 가 순간적으로 여러번 들어오는 것을 방지

const
  INVOICE_FR3_PATH = 'invoice\';
  BARCODE_FR3_PATH = 'barcode\';
  PROGRAM_VER = '1.1.1'; // 2024-02-02(1)
  PROGRAM_TITLE = 'PrintMan';

  CODE_FARE_CREDIT    = '0010'; //신용
  CODE_FARE_DEFERRED  = '0020'; //착불

  NAME_FARE_CREDIT    = '신용'; //신용
  NAME_FARE_DEFERRED  = '착불'; //착불


  CODE_DELIVERY_KOREX = 'D001';
  NAME_DELIVERY_KOREX = 'CJ대한통운';

  CODE_DELIVERY_HANJIN = 'D002';
  NAME_DELIVERY_HANJIN = '한진택배';

  EXCUTE_COUNT = 50;






implementation



end.

