unit unt_Barcode_Sample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlue, Vcl.StdCtrls,
  cxButtons, frxClass, frxBarcode,

  untGlobal,

  cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDropDownEdit,
  cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.Printers,

  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.Pool, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.DataSet;



type
  Tfrm_Barcode_Sample = class(TForm)
    cxButton1: TcxButton;
    cxGrid1: TcxGrid;
    tv1: TcxGridTableView;
    tv1Idx: TcxGridColumn;
    tv1Printer: TcxGridColumn;
    tv1Chk: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    Memo_Error: TMemo;
    frxReport1: TfrxReport;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
    szFontSize: Integer;

    procedure SetKorexInvoice_Type1(oRS: TFDQuery);

    procedure SetKoreaMaster_onePageTEST_01(var KorexMaster: TKorexMaster);
    procedure SetKoreaMaster_onePageTEST_02(var KorexMaster: TKorexMaster);
    procedure SetKoreaMaster_onePageTEST_03(var KorexMaster: TKorexMaster);
    procedure SetKoreaMaster_onePageTEST_04(var KorexMaster: TKorexMaster);
    procedure SetKoreaMaster_onePageTEST_05(var KorexMaster: TKorexMaster);
    procedure SetKoreaMaster_onePageTEST_06(var KorexMaster: TKorexMaster);
    procedure SetKoreaMaster(var KorexMaster: TKorexMaster);
    procedure PrintKoreaMaster(KorexMaster: TKorexMaster);
    procedure FR_InvoiceBeforePrint(Sender: TfrxReportComponent);

    function Get_Valid_Printer: string;
    procedure InitPrinterGrid;

  public
    { Public declarations }
    ValidPrinterList: TStringList; // 체크한 프린터리스트

    function do_Print_CJ(szUSER_ID, szBUNCH_ID: string): Integer;



  end;




var
  frm_Barcode_Sample: Tfrm_Barcode_Sample;

implementation

uses untDatabase, unt_CommLib; //untGlobal,

{$R *.dfm}

{ Tfrm_CJ_Korea }

procedure Tfrm_Barcode_Sample.cxButton1Click(Sender: TObject);
begin
  do_Print_CJ('jjh103', '20260312_194351_F04A1');
end;

function Tfrm_Barcode_Sample.do_Print_CJ(szUSER_ID, szBUNCH_ID: string): Integer;
var
  KorexMaster: TKorexMaster;
  oRS: TFDQuery;
  szQry: string;
  nInvCnt: Integer;
  nTotalCnt: Integer;
begin

//  Sleep(3000);

  Result := 0;

  szUSER_ID := Trim(szUSER_ID);
  szBUNCH_ID := Trim(szBUNCH_ID);

  if szUSER_ID = '' then Exit;
  if szBUNCH_ID = '' then Exit;


  if gInvPrinting then Exit;
  gInvPrinting := True;

  oRS := TFDQuery.Create(self);

  try
    try
      oRS.Connection := dmMain.db_Oracle; //dbLinkage;


      ValidPrinterList := TStringList.Create;
      ValidPrinterList.Text := Get_Valid_Printer;

      ////////////////////////////////////////////////////////////////
      /// 프린터 출력 준비
      szReport := TfrxReport.Create(self);
      szReport.Clear;
      szReport.Report.Clear;

      szReport.LoadFromFile(gszHomePath + BARCODE_FR3_PATH + 'barcode_sample.fr3');
      //szReport.LoadFromFile(gszHomePath + INVOICE_FR3_PATH + 'CJ대한통운01.fr3');
      szReport.OnBeforePrint := FR_InvoiceBeforePrint;
      szReport.PrintOptions.printer := pchar(ValidPrinterList.Strings[0]);
      szReport.PrintOptions.ShowDialog := False; // 인쇄 대화상자 표시 안함
      szReport.SelectPrinter;
      ////////////////////////////////////////////////////////////////


      szQry := '';
      szQry := szQry + 'select * from DMT_PRT_BARCODE ' + #13 + #10;
      szQry := szQry + 'where 1=1 ' + #13 + #10;
      szQry := szQry + 'and USER_ID = ''' + szUSER_ID + ''' ' + #13 + #10;
      szQry := szQry + 'and BUNCH_ID = ''' + szBUNCH_ID + ''' ' + #13 + #10;
      szQry := szQry + 'and RSLT_STATE = ''R'' ' + #13 + #10;
      szQry := szQry + 'order by SORT_NUM ' + #13 + #10;
      oRS.SQL.Text := szQry; //Get_Querytext(szQry);
      oRS.Open;

      nTotalCnt := oRS.RecordCount; // 출력할 송장 수

      nInvCnt := 0;
      while (not oRS.Eof) do
      begin
        SetKorexInvoice_Type1(oRS);

        nInvCnt := nInvCnt + 1;

        if nInvCnt = 100 then // 100장 단위로 출력하도록 제한
        begin
          szReport.Print;
          szReport.Clear;
          szReport.Report.Clear;
          FreeAndNil(szReport); // szReport.Free;

          ////////////////////////////////////////////////////////////////
          /// 100장 단위로 끊어서 처리하기 위해 다시 리포트 준비 시작
          szReport := TfrxReport.Create(self);
          szReport.Clear;
          szReport.Report.Clear;

          //szReport.LoadFromFile(gszHomePath + INVOICE_FR3_PATH + 'CJ대한통운01.fr3');
          szReport.LoadFromFile(gszHomePath + BARCODE_FR3_PATH + 'barcode_sample.fr3');

          szReport.OnBeforePrint := FR_InvoiceBeforePrint;
          szReport.PrintOptions.printer := pchar(ValidPrinterList.Strings[0]);
          szReport.PrintOptions.ShowDialog := False; // 인쇄 대화상자 표시 안함
          szReport.SelectPrinter;
          ////////////////////////////////////////////////////////////////

          nInvCnt := 0;
        end;


        oRS.Next;

      end;

      if nInvCnt <> 0 then
      begin

        szReport.Print;
        szReport.Clear;
        szReport.Report.Clear;
        FreeAndNil(szReport); // szReport.Free;
      end;

//      SetKoreaMaster_onePageTEST_01(KorexMaster);
//      SetKorexInvoice_Type1(KorexMaster);
//      SetKoreaMaster_onePageTEST_02(KorexMaster);
//      SetKorexInvoice_Type1(KorexMaster);
//      SetKoreaMaster_onePageTEST_03(KorexMaster);
//      SetKorexInvoice_Type1(KorexMaster);
//      SetKoreaMaster_onePageTEST_04(KorexMaster);
//      SetKorexInvoice_Type1(KorexMaster);
//      SetKoreaMaster_onePageTEST_05(KorexMaster);
//      SetKorexInvoice_Type1(KorexMaster);
//      SetKoreaMaster_onePageTEST_06(KorexMaster);
//      SetKorexInvoice_Type1(KorexMaster);

      szQry := '';
      szQry := szQry + 'update DMT_PRT_BARCODE set ' + #13 + #10;
      szQry := szQry + '   RSLT_STATE = ''P'' ' + #13 + #10; // R:출력요청, P:출력완료, O:배송처리됨, Y:전송됨, E:에러, D:중복
      szQry := szQry + '  ,PRINT_COUNT = PRINT_COUNT + 1 ' + #13 + #10;
      szQry := szQry + 'where 1=1 ' + #13 + #10;
      szQry := szQry + 'and USER_ID = ''' + szUSER_ID + ''' ' + #13 + #10;
      szQry := szQry + 'and BUNCH_ID = ''' + szBUNCH_ID + ''' ' + #13 + #10;
      szQry := szQry + 'and RSLT_STATE = ''R'' ' + #13 + #10;
      oRS.SQL.Text := szQry; //Get_Querytext(szQry);
      //oRS.Execute;

      Result := nTotalCnt;

    except
      on e: Exception do
      begin
        Memo_Error.Text := e.Message + #13#10 + #13#10 + oRS.SQL.Text;
        Memo_Error.Lines.SaveToFile(
              'ERROR_PrintMan_' +
              g_strTodayDate_PC() + '_' + g_strNowTime_PC() +
              '.txt'
            );

        ShowMessage(e.Message);
        Result := -1;
      end;


    end;
  finally

    if szReport = nil then
    begin
       FreeAndNil(szReport);
    end;

    //szReport.Free;
    oRS.Close;
    oRS.Free;


    gInvPrinting := False;
  end;

end;


procedure Tfrm_Barcode_Sample.PrintKoreaMaster(KorexMaster: TKorexMaster);
begin
  // KorexMaster:TKorexMaster 에 설정된 값 그대로 송장출력정보 세팅 후 출력
  // ( untGlobal . szReport: TfrxReport; 에 세팅 )
  szReport := TfrxReport.Create(self);
  try

    //--------------------------------------------------------------------------
    szReport.Clear;
    szReport.Report.Clear;

    //--------------------------------------------------------------------------
    szReport.LoadFromFile(gszHomePath + BARCODE_FR3_PATH + 'barcode_sample.fr3');
    szReport.OnBeforePrint := FR_InvoiceBeforePrint;
    szReport.PrintOptions.printer := pchar(ValidPrinterList.Strings[0]);
    szReport.SelectPrinter;

    //--------------------------------------------------------------------------
    //SetKorexInvoice_Type1(KorexMaster);
    szReport.Print;

    //--------------------------------------------------------------------------
    //szReport.Clear;
    //szReport.Report.Clear;

  finally
    szReport.Free;
  end;
end;


procedure Tfrm_Barcode_Sample.SetKoreaMaster(var KorexMaster: TKorexMaster);
begin
  //
end;


procedure Tfrm_Barcode_Sample.SetKorexInvoice_Type1(oRS: TFDQuery); // 1장의 출력물의 내용을 정의
begin
  with szReport do
  begin
    TfrxBarCodeView (FindObject('Barcode_Ord_No')).Text       := oRS.FieldByName('BAR_CODE').AsString;
    TfrxBarCodeView (FindObject('Barcode_Ord_No')).Expression := oRS.FieldByName('BAR_CODE').AsString;
    TfrxMemoView    (FindObject('Memo_Deal_Comp_Name')).Text  := oRS.FieldByName('DEAL_COMP_NAME').AsString;
    TfrxMemoView    (FindObject('Memo_Box_no')).Text          := oRS.FieldByName('BOX_NO').AsString;
    PrepareReport(false);
  end;
end;


procedure Tfrm_Barcode_Sample.FormCreate(Sender: TObject);
begin
  InitPrinterGrid; // 선택가능한 프린터 보여주기
end;

procedure Tfrm_Barcode_Sample.FormShow(Sender: TObject);
begin
  //
end;

procedure Tfrm_Barcode_Sample.FR_InvoiceBeforePrint(Sender: TfrxReportComponent);
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


function Tfrm_Barcode_Sample.Get_Valid_Printer: string;
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

procedure Tfrm_Barcode_Sample.InitPrinterGrid;
var
  idx: Integer;
  idx_2: Integer;
begin

  // 기본적으로 한대의 프린터로 출력.  복수의 프린터 출력은 추후 지원
  tv1.DataController.RecordCount := 1;
  tv1Chk.Visible := False;
  tv1Idx.Visible := False;

//  tv1.DataController.RecordCount := 5;
//  tv1Chk.Visible := True;
//  tv1Idx.Visible := True;


  tv1.BeginUpdate();

  for idx := 0 to tv1.DataController.RecordCount - 1 do
  begin

    TcxComboBoxProperties(tv1Printer.Properties).Items.Assign(printer.Printers);   // unit Vcl.Printers;

    tv1.DataController.Values[idx, tv1Printer.Index] :=
          TcxComboBoxProperties(tv1Printer.Properties).Items[printer.PrinterIndex]; // unit Vcl.Printers;

    if idx = 0 then
      tv1.DataController.Values[idx, tv1Chk.Index] := True    // 최소 한대의 프린터는 선택을 해야함.
    else
      tv1.DataController.Values[idx, tv1Chk.Index] := False;


  end;
  tv1.EndUpdate;

end;

























procedure Tfrm_Barcode_Sample.SetKoreaMaster_onePageTEST_01(var KorexMaster: TKorexMaster);
begin



  with KorexMaster do
  begin
    seq := '1';
    invoiceno := '312402709242';
    delivery_code := 'D001';
    delivery_user_id := '30271546';
    user_id := 'admin';
    seller_code := 'A002';
    who_code := 'C001';

    sendr_nm := '밸류체인발송_01';
    sendr_mail_no := '047-91';
    sendr_addr := '서울 성동구 상원12길 1';
    sendr_detail_addr := '3층';
    sendr_remark := '딜리버리랩 [딜리버리랩][1/25]-->2023-10-10';
    sendr_tel_no := '010-7758-3541';
    sendr_cell_no := '';

    rcvr_nm := '도시곳간광교점';
    rcvr_mail_no := '16515';
    rcvr_addr := '경기 수원시 영통구 광교호수공원로 20(상가동115116호)'; //szrcvr_addr;
    rcvr_detail_addr := '' + '[원천동 , 더샵광교레이크시티]'; //szrcvr_detail_addr + RefineAddr.OldAddr;
    rcvr_remark := '전체 일괄 발송메시지 테스트'; //szrcvr_remark;
    rcvr_tel_no := ''; //szrcvr_tel_no;
    rcvr_cell_no := '010-3180-2286'; //szrcvr_cell_no;


    detail_item_count := 3;
    detail_item_data := '상품명 A  1EA' + #13#10 +
                        '상품명 B  3EA' + #13#10 +
                        '상품명 C  4EA' + #13#10
                        ;


    frt_code := '0100'; //szfrt_code;
    frt_name := GetFareName(frt_code); // '0010':'신용'  '0020':'착불'

    if frt_code = '0010' then
      frt_uprice := '0'
    else
      frt_uprice := '2500'; //szfrt_uprice;


    cust_mgmt_no := 'A002_C001_2771-1'; //Tmp_szcust_mgmt_no;
    remark := ''; //szremark;
    rcpt_code := '01'; //szrcpt_code;
    reg_datetime := FormatDateTime('YYYY.MM.DD', now);
    box_type := '2'; //szBox_Type;
    send_tml := ''; //gszSendTML;

    Ord_No1 := '20231011-2'; //szOrd_No1;
    printCount := '1'; //szPrintCount;
  end; // with KorexMaster do

//  if use_refine_Addr = false then
//  begin
//    KorexMaster.end_no := oRS.FieldByName('end_no').AsString;
//    KorexMaster.sub_end_no := oRS.FieldByName('sub_end_no').AsString;
//    KorexMaster.end_nm := oRS.FieldByName('end_nm').AsString;
//    KorexMaster.man_bran_nm := oRS.FieldByName('man_bran_nm').AsString;
//    KorexMaster.cldv_emp_nm := oRS.FieldByName('cldv_emp_nm').AsString;
//  end
//  else
  begin
    KorexMaster.end_no := '6Z65'; // szEnd_no;
    KorexMaster.sub_end_no := '2k'; //szSub_end_no;
    KorexMaster.end_nm := '영통Sub'; //szEnd_nm;
    KorexMaster.man_bran_nm := '경기수원아주'; //szMan_bran_nm;
    KorexMaster.man_Shot_bran_nm := '수원아주'; //szBranShortNm;
    KorexMaster.cldv_emp_nm := '##'; //szCldv_emp_nm;


    KorexMaster.chk_korex_addr := true;

    KorexMaster.Cos := '';
    KorexMaster.font_size := 10;

    KorexMaster.pages := '';

  end;



end;




procedure Tfrm_Barcode_Sample.SetKoreaMaster_onePageTEST_02(var KorexMaster: TKorexMaster);
begin



  with KorexMaster do
  begin
    seq := '2';
    invoiceno := '312402709242';
    delivery_code := 'D001';
    delivery_user_id := '30271546';
    user_id := 'admin';
    seller_code := 'A002';
    who_code := 'C001';

    sendr_nm := '밸류체인발송_02';
    sendr_mail_no := '047-91';
    sendr_addr := '서울 성동구 상원12길 1';
    sendr_detail_addr := '3층';
    sendr_remark := '딜리버리랩 [딜리버리랩][1/25]-->2023-10-10';
    sendr_tel_no := '010-7758-3541';
    sendr_cell_no := '';

    rcvr_nm := '도시곳간광교점';
    rcvr_mail_no := '16515';
    rcvr_addr := '경기 수원시 영통구 광교호수공원로 20(상가동115116호)'; //szrcvr_addr;
    rcvr_detail_addr := '' + '[원천동 , 더샵광교레이크시티]'; //szrcvr_detail_addr + RefineAddr.OldAddr;
    rcvr_remark := '전체 일괄 발송메시지 테스트'; //szrcvr_remark;
    rcvr_tel_no := ''; //szrcvr_tel_no;
    rcvr_cell_no := '010-3180-2286'; //szrcvr_cell_no;


    detail_item_count := 3;
    detail_item_data := '상품명 A  1EA' + #13#10 +
                        '상품명 B  3EA' + #13#10 +
                        '상품명 C  4EA' + #13#10
                        ;


    frt_code := '0100'; //szfrt_code;
    frt_name := GetFareName(frt_code); // '0010':'신용'  '0020':'착불'

    if frt_code = '0010' then
      frt_uprice := '0'
    else
      frt_uprice := '2500'; //szfrt_uprice;


    cust_mgmt_no := 'A002_C001_2771-1'; //Tmp_szcust_mgmt_no;
    remark := ''; //szremark;
    rcpt_code := '01'; //szrcpt_code;
    reg_datetime := FormatDateTime('YYYY.MM.DD', now);
    box_type := '2'; //szBox_Type;
    send_tml := ''; //gszSendTML;

    Ord_No1 := '20231011-2'; //szOrd_No1;
    printCount := '1'; //szPrintCount;
  end; // with KorexMaster do

//  if use_refine_Addr = false then
//  begin
//    KorexMaster.end_no := oRS.FieldByName('end_no').AsString;
//    KorexMaster.sub_end_no := oRS.FieldByName('sub_end_no').AsString;
//    KorexMaster.end_nm := oRS.FieldByName('end_nm').AsString;
//    KorexMaster.man_bran_nm := oRS.FieldByName('man_bran_nm').AsString;
//    KorexMaster.cldv_emp_nm := oRS.FieldByName('cldv_emp_nm').AsString;
//  end
//  else
  begin
    KorexMaster.end_no := '6Z65'; // szEnd_no;
    KorexMaster.sub_end_no := '2k'; //szSub_end_no;
    KorexMaster.end_nm := '영통Sub'; //szEnd_nm;
    KorexMaster.man_bran_nm := '경기수원아주'; //szMan_bran_nm;
    KorexMaster.man_Shot_bran_nm := '수원아주'; //szBranShortNm;
    KorexMaster.cldv_emp_nm := '##'; //szCldv_emp_nm;


    KorexMaster.chk_korex_addr := true;

    KorexMaster.Cos := '';
    KorexMaster.font_size := 10;

    KorexMaster.pages := '';

  end;



end;



procedure Tfrm_Barcode_Sample.SetKoreaMaster_onePageTEST_03(var KorexMaster: TKorexMaster);
begin



  with KorexMaster do
  begin
    seq := '3';
    invoiceno := '312402709242';
    delivery_code := 'D001';
    delivery_user_id := '30271546';
    user_id := 'admin';
    seller_code := 'A002';
    who_code := 'C001';

    sendr_nm := '밸류체인발송_03';
    sendr_mail_no := '047-91';
    sendr_addr := '서울 성동구 상원12길 1';
    sendr_detail_addr := '3층';
    sendr_remark := '딜리버리랩 [딜리버리랩][1/25]-->2023-10-10';
    sendr_tel_no := '010-7758-3541';
    sendr_cell_no := '';

    rcvr_nm := '도시곳간광교점';
    rcvr_mail_no := '16515';
    rcvr_addr := '경기 수원시 영통구 광교호수공원로 20(상가동115116호)'; //szrcvr_addr;
    rcvr_detail_addr := '' + '[원천동 , 더샵광교레이크시티]'; //szrcvr_detail_addr + RefineAddr.OldAddr;
    rcvr_remark := '전체 일괄 발송메시지 테스트'; //szrcvr_remark;
    rcvr_tel_no := ''; //szrcvr_tel_no;
    rcvr_cell_no := '010-3180-2286'; //szrcvr_cell_no;


    detail_item_count := 3;
    detail_item_data := '상품명 A  1EA' + #13#10 +
                        '상품명 B  3EA' + #13#10 +
                        '상품명 C  4EA' + #13#10
                        ;


    frt_code := '0100'; //szfrt_code;
    frt_name := GetFareName(frt_code); // '0010':'신용'  '0020':'착불'

    if frt_code = '0010' then
      frt_uprice := '0'
    else
      frt_uprice := '2500'; //szfrt_uprice;


    cust_mgmt_no := 'A002_C001_2771-1'; //Tmp_szcust_mgmt_no;
    remark := ''; //szremark;
    rcpt_code := '01'; //szrcpt_code;
    reg_datetime := FormatDateTime('YYYY.MM.DD', now);
    box_type := '2'; //szBox_Type;
    send_tml := ''; //gszSendTML;

    Ord_No1 := '20231011-2'; //szOrd_No1;
    printCount := '1'; //szPrintCount;
  end; // with KorexMaster do

//  if use_refine_Addr = false then
//  begin
//    KorexMaster.end_no := oRS.FieldByName('end_no').AsString;
//    KorexMaster.sub_end_no := oRS.FieldByName('sub_end_no').AsString;
//    KorexMaster.end_nm := oRS.FieldByName('end_nm').AsString;
//    KorexMaster.man_bran_nm := oRS.FieldByName('man_bran_nm').AsString;
//    KorexMaster.cldv_emp_nm := oRS.FieldByName('cldv_emp_nm').AsString;
//  end
//  else
  begin
    KorexMaster.end_no := '6Z65'; // szEnd_no;
    KorexMaster.sub_end_no := '2k'; //szSub_end_no;
    KorexMaster.end_nm := '영통Sub'; //szEnd_nm;
    KorexMaster.man_bran_nm := '경기수원아주'; //szMan_bran_nm;
    KorexMaster.man_Shot_bran_nm := '수원아주'; //szBranShortNm;
    KorexMaster.cldv_emp_nm := '##'; //szCldv_emp_nm;


    KorexMaster.chk_korex_addr := true;

    KorexMaster.Cos := '';
    KorexMaster.font_size := 10;

    KorexMaster.pages := '';

  end;



end;



procedure Tfrm_Barcode_Sample.SetKoreaMaster_onePageTEST_04(var KorexMaster: TKorexMaster);
begin



  with KorexMaster do
  begin
    seq := '4';
    invoiceno := '312402709242';
    delivery_code := 'D001';
    delivery_user_id := '30271546';
    user_id := 'admin';
    seller_code := 'A002';
    who_code := 'C001';

    sendr_nm := '밸류체인발송_04';
    sendr_mail_no := '047-91';
    sendr_addr := '서울 성동구 상원12길 1';
    sendr_detail_addr := '3층';
    sendr_remark := '딜리버리랩 [딜리버리랩][1/25]-->2023-10-10';
    sendr_tel_no := '010-7758-3541';
    sendr_cell_no := '';

    rcvr_nm := '도시곳간광교점';
    rcvr_mail_no := '16515';
    rcvr_addr := '경기 수원시 영통구 광교호수공원로 20(상가동115116호)'; //szrcvr_addr;
    rcvr_detail_addr := '' + '[원천동 , 더샵광교레이크시티]'; //szrcvr_detail_addr + RefineAddr.OldAddr;
    rcvr_remark := '전체 일괄 발송메시지 테스트'; //szrcvr_remark;
    rcvr_tel_no := ''; //szrcvr_tel_no;
    rcvr_cell_no := '010-3180-2286'; //szrcvr_cell_no;


    detail_item_count := 3;
    detail_item_data := '상품명 A  1EA' + #13#10 +
                        '상품명 B  3EA' + #13#10 +
                        '상품명 C  4EA' + #13#10
                        ;


    frt_code := '0100'; //szfrt_code;
    frt_name := GetFareName(frt_code); // '0010':'신용'  '0020':'착불'

    if frt_code = '0010' then
      frt_uprice := '0'
    else
      frt_uprice := '2500'; //szfrt_uprice;


    cust_mgmt_no := 'A002_C001_2771-1'; //Tmp_szcust_mgmt_no;
    remark := ''; //szremark;
    rcpt_code := '01'; //szrcpt_code;
    reg_datetime := FormatDateTime('YYYY.MM.DD', now);
    box_type := '2'; //szBox_Type;
    send_tml := ''; //gszSendTML;

    Ord_No1 := '20231011-2'; //szOrd_No1;
    printCount := '1'; //szPrintCount;
  end; // with KorexMaster do

//  if use_refine_Addr = false then
//  begin
//    KorexMaster.end_no := oRS.FieldByName('end_no').AsString;
//    KorexMaster.sub_end_no := oRS.FieldByName('sub_end_no').AsString;
//    KorexMaster.end_nm := oRS.FieldByName('end_nm').AsString;
//    KorexMaster.man_bran_nm := oRS.FieldByName('man_bran_nm').AsString;
//    KorexMaster.cldv_emp_nm := oRS.FieldByName('cldv_emp_nm').AsString;
//  end
//  else
  begin
    KorexMaster.end_no := '6Z65'; // szEnd_no;
    KorexMaster.sub_end_no := '2k'; //szSub_end_no;
    KorexMaster.end_nm := '영통Sub'; //szEnd_nm;
    KorexMaster.man_bran_nm := '경기수원아주'; //szMan_bran_nm;
    KorexMaster.man_Shot_bran_nm := '수원아주'; //szBranShortNm;
    KorexMaster.cldv_emp_nm := '##'; //szCldv_emp_nm;


    KorexMaster.chk_korex_addr := true;

    KorexMaster.Cos := '';
    KorexMaster.font_size := 10;

    KorexMaster.pages := '';

  end;



end;




procedure Tfrm_Barcode_Sample.SetKoreaMaster_onePageTEST_05(var KorexMaster: TKorexMaster);
begin



  with KorexMaster do
  begin
    seq := '5';
    invoiceno := '312402709242';
    delivery_code := 'D001';
    delivery_user_id := '30271546';
    user_id := 'admin';
    seller_code := 'A002';
    who_code := 'C001';

    sendr_nm := '밸류체인발송_05';
    sendr_mail_no := '047-91';
    sendr_addr := '서울 성동구 상원12길 1';
    sendr_detail_addr := '3층';
    sendr_remark := '딜리버리랩 [딜리버리랩][1/25]-->2023-10-10';
    sendr_tel_no := '010-7758-3541';
    sendr_cell_no := '';

    rcvr_nm := '도시곳간광교점';
    rcvr_mail_no := '16515';
    rcvr_addr := '경기 수원시 영통구 광교호수공원로 20(상가동115116호)'; //szrcvr_addr;
    rcvr_detail_addr := '' + '[원천동 , 더샵광교레이크시티]'; //szrcvr_detail_addr + RefineAddr.OldAddr;
    rcvr_remark := '전체 일괄 발송메시지 테스트'; //szrcvr_remark;
    rcvr_tel_no := ''; //szrcvr_tel_no;
    rcvr_cell_no := '010-3180-2286'; //szrcvr_cell_no;


    detail_item_count := 3;
    detail_item_data := '상품명 A  1EA' + #13#10 +
                        '상품명 B  3EA' + #13#10 +
                        '상품명 C  4EA' + #13#10
                        ;


    frt_code := '0100'; //szfrt_code;
    frt_name := GetFareName(frt_code); // '0010':'신용'  '0020':'착불'

    if frt_code = '0010' then
      frt_uprice := '0'
    else
      frt_uprice := '2500'; //szfrt_uprice;


    cust_mgmt_no := 'A002_C001_2771-1'; //Tmp_szcust_mgmt_no;
    remark := ''; //szremark;
    rcpt_code := '01'; //szrcpt_code;
    reg_datetime := FormatDateTime('YYYY.MM.DD', now);
    box_type := '2'; //szBox_Type;
    send_tml := ''; //gszSendTML;

    Ord_No1 := '20231011-2'; //szOrd_No1;
    printCount := '1'; //szPrintCount;
  end; // with KorexMaster do

//  if use_refine_Addr = false then
//  begin
//    KorexMaster.end_no := oRS.FieldByName('end_no').AsString;
//    KorexMaster.sub_end_no := oRS.FieldByName('sub_end_no').AsString;
//    KorexMaster.end_nm := oRS.FieldByName('end_nm').AsString;
//    KorexMaster.man_bran_nm := oRS.FieldByName('man_bran_nm').AsString;
//    KorexMaster.cldv_emp_nm := oRS.FieldByName('cldv_emp_nm').AsString;
//  end
//  else
  begin
    KorexMaster.end_no := '6Z65'; // szEnd_no;
    KorexMaster.sub_end_no := '2k'; //szSub_end_no;
    KorexMaster.end_nm := '영통Sub'; //szEnd_nm;
    KorexMaster.man_bran_nm := '경기수원아주'; //szMan_bran_nm;
    KorexMaster.man_Shot_bran_nm := '수원아주'; //szBranShortNm;
    KorexMaster.cldv_emp_nm := '##'; //szCldv_emp_nm;


    KorexMaster.chk_korex_addr := true;

    KorexMaster.Cos := '';
    KorexMaster.font_size := 10;

    KorexMaster.pages := '';

  end;



end;




procedure Tfrm_Barcode_Sample.SetKoreaMaster_onePageTEST_06(var KorexMaster: TKorexMaster);
begin



  with KorexMaster do
  begin
    seq := '6';
    invoiceno := '312402709242';
    delivery_code := 'D001';
    delivery_user_id := '30271546';
    user_id := 'admin';
    seller_code := 'A002';
    who_code := 'C001';

    sendr_nm := '밸류체인발송_06';
    sendr_mail_no := '047-91';
    sendr_addr := '서울 성동구 상원12길 1';
    sendr_detail_addr := '3층';
    sendr_remark := '딜리버리랩 [딜리버리랩][1/25]-->2023-10-10';
    sendr_tel_no := '010-7758-3541';
    sendr_cell_no := '';

    rcvr_nm := '도시곳간광교점';
    rcvr_mail_no := '16515';
    rcvr_addr := '경기 수원시 영통구 광교호수공원로 20(상가동115116호)'; //szrcvr_addr;
    rcvr_detail_addr := '' + '[원천동 , 더샵광교레이크시티]'; //szrcvr_detail_addr + RefineAddr.OldAddr;
    rcvr_remark := '전체 일괄 발송메시지 테스트'; //szrcvr_remark;
    rcvr_tel_no := ''; //szrcvr_tel_no;
    rcvr_cell_no := '010-3180-2286'; //szrcvr_cell_no;


    detail_item_count := 3;
    detail_item_data := '상품명 A  1EA' + #13#10 +
                        '상품명 B  3EA' + #13#10 +
                        '상품명 C  4EA' + #13#10
                        ;


    frt_code := '0100'; //szfrt_code;
    frt_name := GetFareName(frt_code); // '0010':'신용'  '0020':'착불'

    if frt_code = '0010' then
      frt_uprice := '0'
    else
      frt_uprice := '2500'; //szfrt_uprice;


    cust_mgmt_no := 'A002_C001_2771-1'; //Tmp_szcust_mgmt_no;
    remark := ''; //szremark;
    rcpt_code := '01'; //szrcpt_code;
    reg_datetime := FormatDateTime('YYYY.MM.DD', now);
    box_type := '2'; //szBox_Type;
    send_tml := ''; //gszSendTML;

    Ord_No1 := '20231011-2'; //szOrd_No1;
    printCount := '1'; //szPrintCount;
  end; // with KorexMaster do

//  if use_refine_Addr = false then
//  begin
//    KorexMaster.end_no := oRS.FieldByName('end_no').AsString;
//    KorexMaster.sub_end_no := oRS.FieldByName('sub_end_no').AsString;
//    KorexMaster.end_nm := oRS.FieldByName('end_nm').AsString;
//    KorexMaster.man_bran_nm := oRS.FieldByName('man_bran_nm').AsString;
//    KorexMaster.cldv_emp_nm := oRS.FieldByName('cldv_emp_nm').AsString;
//  end
//  else
  begin
    KorexMaster.end_no := '6Z65'; // szEnd_no;
    KorexMaster.sub_end_no := '2k'; //szSub_end_no;
    KorexMaster.end_nm := '영통Sub'; //szEnd_nm;
    KorexMaster.man_bran_nm := '경기수원아주'; //szMan_bran_nm;
    KorexMaster.man_Shot_bran_nm := '수원아주'; //szBranShortNm;
    KorexMaster.cldv_emp_nm := '##'; //szCldv_emp_nm;


    KorexMaster.chk_korex_addr := true;

    KorexMaster.Cos := '';
    KorexMaster.font_size := 10;

    KorexMaster.pages := '';

  end;



end;



{

-- 송장출력용 테이블 인서트문


-- select * from DMT_PRT_INVOICE



INSERT INTO DMT_PRT_INVOICE (
	 SEQ_NUM
	,BUNCH_ID
	,SORT_NUM
	,INVOICENO
	,DELIVERY_CODE
	,DELIVERY_USER_ID
	,USER_ID
	,OWNER_ID
	,WH_ID
	,SENDR_NM
	,SENDR_MAIL_NO
	,SENDR_ADDR
	,SENDR_DETAIL_ADDR
	,SENDR_REMARK
	,SENDR_TEL_NO
	,SENDR_CELL_NO
	,RCVR_NM
	,RCVR_MAIL_NO
	,RCVR_ADDR
	,RCVR_DETAIL_ADDR
	,RCVR_REMARK
	,RCVR_TEL_NO
	,RCVR_CELL_NO

  ,ITEM_COUNT
  ,ITEM_DATA

	,FRT_UPRICE
	,FRT_CODE
	,CUST_MGMT_NO
	,REMARK
	,RCPT_CODE
	,BOX_TYPE
	,ERR_MSG

  ,ORD_NO
	,PRINT_COUNT
	,FONT_SIZE

	,DAEMON_RETRY
	,SEND_TML
	,END_NO
	,SUB_END_NO
	,END_NM
	,MAN_BRAN_NM
	,MAN_SHOT_BRAN_NM
	,CLDV_EMP_NM
	,INS_DATE
	,INS_TIME
	,RSLT_STATE
)
VALUES
(
	DMS_PRT_INVOICE_SEQ.NEXTVAL -- SEQ_NUM  WMS_OB_OUTB_HR.NEXTVAL
	,'20240514_154351_F0400'-- BUNCH_ID -- 한차례의 출력 요청을 구분하는 식별용 문자열. 요청일자(8)_요청일시(6)_임의의숫자난수(5)
	,'2' -- SORT_NUM
	,'312402709362'-- INVOICENO
	,'D001'-- DELIVERY_CODE
	,'30271546'-- DELIVERY_USER_ID
	,'admin'-- USER_ID
	,'A002'-- OWNER_ID
	,'C001'-- WH_ID
	,'밸류체인발송_08'-- SENDR_NM
	,'047-91'-- SENDR_MAIL_NO
	,'서울 성동구 상원12길 1' -- SENDR_ADDR
	,'3층' -- SENDR_DETAIL_ADDR
	,'딜리버리랩 [딜리버리랩][1/25]-->2023-10-10' -- SENDR_REMARK
	,'010-7758-3541' -- SENDR_TEL_NO
	,'02-124-3541' -- SENDR_CELL_NO
	,'도시곳간광교점' -- RCVR_NM
	,'16515' -- RCVR_MAIL_NO
	,'경기 수원시 영통구 광교호수공원로 20(상가동115116호)' -- RCVR_ADDR
	,'[원천동 , 더샵광교레이크시티]' -- RCVR_DETAIL_ADDR
	,'전체 일괄 발송메시지 테스트' -- RCVR_REMARK
	,'02-789-4123' -- RCVR_TEL_NO
	,'010-3180-1166' -- RCVR_CELL_NO

  ,'3' -- ITEM_COUNT
  ,'상품명 A  1EA
상품명 B  2EA
상품명 C  3EA
  ' -- ITEM_DATA

	,'2500' -- FRT_UPRICE
	,'0010'  -- FRT_CODE
	,'A002_C001_2771-1'  -- CUST_MGMT_NO
	,''  -- REMARK
	,'01'  -- RCPT_CODE
	,'2'  -- BOX_TYPE
	,''  -- ERR_MSG

  ,'' -- ORD_NO
	,'' -- PRINT_COUNT
	,'' -- FONT_SIZE

	,''  -- DAEMON_RETRY
	,''  -- SEND_TML
	,'6Z65'  -- END_NO
	,'2k'  -- SUB_END_NO
	,'영통Sub'  -- END_NM
	,'경기수원아주'  -- MAN_BRAN_NM
	,'수원아주'  -- MAN_SHOT_BRAN_NM
	,'##'  -- CLDV_EMP_NM
	,'20240514'  -- INS_DATE
	,'155026'  -- INS_TIME
	,'P'  -- RSLT_STATE -- R:출력요청, P:출력완료, O:배송처리됨, Y:전송됨, E:에러, D:중복
);





/*
SELECT * FROM DMT_PRT_INVOICE


CREATE TABLE DMT_PRT_INVOICE_BAK_2024_05_14 AS SELECT * FROM DMT_PRT_INVOICE
SELECT * FROM DMT_PRT_INVOICE
SELECT * FROM DMT_PRT_INVOICE_BAK_2024_05_14


*/


-- SAASDEV.DMT_PRT_INVOICE definition

DROP TABLE DMT_PRT_INVOICE

CREATE TABLE "SAASDEV"."DMT_PRT_INVOICE"
   (	"SEQ_NUM" NUMBER(19,0) NOT NULL ENABLE,
	"BUNCH_ID" VARCHAR2(50) NOT NULL ENABLE,
	"SORT_NUM" NUMBER(7,0) NOT NULL ENABLE,
	"INVOICENO" VARCHAR2(15),
	"DELIVERY_CODE" VARCHAR2(5) NOT NULL ENABLE,
	"DELIVERY_USER_ID" VARCHAR2(20) NOT NULL ENABLE,
	"USER_ID" VARCHAR2(30) ,
	"OWNER_ID" VARCHAR2(20) ,
	"WH_ID" VARCHAR2(20) ,
	"SENDR_NM" VARCHAR2(50) NOT NULL ENABLE,
	"SENDR_MAIL_NO" VARCHAR2(6) NOT NULL ENABLE,
	"SENDR_ADDR" VARCHAR2(200) NOT NULL ENABLE,
	"SENDR_DETAIL_ADDR" VARCHAR2(200) NOT NULL ENABLE,
	"SENDR_REMARK" VARCHAR2(3000) NOT NULL ENABLE,
	"SENDR_TEL_NO" VARCHAR2(20) NOT NULL ENABLE,
	"SENDR_CELL_NO" VARCHAR2(20) NOT NULL ENABLE,
	"RCVR_NM" VARCHAR2(50) NOT NULL ENABLE,
	"RCVR_MAIL_NO" VARCHAR2(6) NOT NULL ENABLE,
	"RCVR_ADDR" VARCHAR2(200) NOT NULL ENABLE,
	"RCVR_DETAIL_ADDR" VARCHAR2(200) NOT NULL ENABLE,
	"RCVR_REMARK" VARCHAR2(3000) NOT NULL ENABLE,
	"RCVR_TEL_NO" VARCHAR2(20) NOT NULL ENABLE,
	"RCVR_CELL_NO" VARCHAR2(20) NOT NULL ENABLE,

	"ITEM_COUNT" NUMBER(4,0) ,
	"ITEM_DATA" VARCHAR2(1000) ,

	"FRT_UPRICE" NUMBER(10,0),
	"FRT_CODE" VARCHAR2(4) NOT NULL ENABLE,
	"FRT_NAME" VARCHAR2(10) NOT NULL ENABLE,
	"CUST_MGMT_NO" VARCHAR2(50) NOT NULL ENABLE,
	"REMARK" VARCHAR2(3000),
	"RCPT_CODE" VARCHAR2(2) NOT NULL ENABLE,
	"BOX_TYPE" VARCHAR2(2) NOT NULL ENABLE,
	"ERR_MSG" VARCHAR2(1000),

	"ORD_NO" VARCHAR2(50),
	"PRINT_COUNT" NUMBER(4,0),
	"FONT_SIZE" NUMBER(4,0),

	"DAEMON_RETRY" VARCHAR2(14),
	"SEND_TML" VARCHAR2(10),
	"END_NO" VARCHAR2(30),
	"SUB_END_NO" VARCHAR2(30),
	"END_NM" VARCHAR2(30),
	"MAN_BRAN_NM" VARCHAR2(30),
	"MAN_SHOT_BRAN_NM" VARCHAR2(30),
	"CLDV_EMP_NM" VARCHAR2(30),
	"INS_DATE" VARCHAR2(8),
	"INS_TIME" VARCHAR2(6),
	"RSLT_STATE" VARCHAR2(1) NOT NULL ENABLE,
	 CONSTRAINT "PK_DMT_PRT_INVOICE" PRIMARY KEY ("SEQ_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "SAASDEV"."PK_DMT_PRT_INVOICE" ON "SAASDEV"."DMT_PRT_INVOICE" ("SEQ_NUM")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

COMMENT ON TABLE SAASDEV.DMT_PRT_INVOICE IS '송장출력용 테이블';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SEQ_NUM IS '기본키값. DMS_PRT_INVOICE_SEQ 로 발번';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.BUNCH_ID IS '한차례의 출력 요청을 구분하는 식별용 문자열. 요청일자(8)_요청일시(6)_임의의숫자난수(5)';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SORT_NUM IS '한차례의 출력 요청한 데이터의 출력 순서';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.INVOICENO IS '송장번호';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.DELIVERY_CODE IS '택배사 코드';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.DELIVERY_USER_ID IS '택배사 아이디';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.USER_ID IS 'WMS 사용자 아이디';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.OWNER_ID IS 'WMS 화주코드';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.WH_ID IS 'WMS 창고코드';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SENDR_NM IS '발송자 명';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SENDR_MAIL_NO IS '발송자 우편번호';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SENDR_ADDR IS '발송자 주소';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SENDR_DETAIL_ADDR IS '발송자 상세주소';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SENDR_REMARK IS '발송자 메모';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SENDR_TEL_NO IS '발송자 전화번호';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SENDR_CELL_NO IS '발송자 핸드폰번호';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RCVR_NM IS '수취인 명';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RCVR_MAIL_NO IS '수취인 우편번호';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RCVR_ADDR IS '수취인 주소';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RCVR_DETAIL_ADDR IS '수취인 상세주소';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RCVR_REMARK IS '수취인 메모';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RCVR_TEL_NO IS '수취인 전화번호';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RCVR_CELL_NO IS '수취인 핸드폰번호';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.FRT_UPRICE IS '택배금액';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.FRT_CODE IS '운임구분 0010:신용, 0020:착불';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.CUST_MGMT_NO IS 'WMS/OMS 등 연계시스템 주문번호';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.REMARK IS '배송메모';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RCPT_CODE IS '송장구분 01:일반, 04:반품';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.BOX_TYPE IS '박스타입 1:극소, 2:소, 3:중, 4:대, 5:특대';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.ERR_MSG IS '전송시 에러메시지';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.DAEMON_RETRY IS '재전송일시';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SEND_TML IS '택배사 내부 코드(주소정제를 통해 구한다)';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.END_NO IS '택배사 내부 코드(주소정제를 통해 구한다)';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.SUB_END_NO IS '택배사 내부 코드(주소정제를 통해 구한다)';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.END_NM IS '택배사 내부 코드(주소정제를 통해 구한다)';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.MAN_BRAN_NM IS '택배사 내부 코드(주소정제를 통해 구한다)';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.MAN_SHOT_BRAN_NM IS '택배사 내부 코드(주소정제를 통해 구한다)';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.CLDV_EMP_NM IS '택배사 내부 코드(주소정제를 통해 구한다)';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.INS_DATE IS '출력일자';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.INS_TIME IS '출력시각';
COMMENT ON COLUMN SAASDEV.DMT_PRT_INVOICE.RSLT_STATE IS 'R:출력요청, P:출력완료, O:배송처리됨, Y:전송됨, E:에러, D:중복';




}

end.
