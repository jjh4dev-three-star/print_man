unit unt_CommLib;

interface

uses
  System.Classes, System.SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,IdHTTP,
  System.StrUtils
  ;





function gm_Delivery_Linkage_Insert_Invoice_Detail_For_SendToServer_EX( // 택배사서버 전송  데이터 디테일 등록 속도개선판 : 정정헌
  const szenter_item_cd :string;
  const szenter_item_nm :string;
  const szenter_item_qty:string;
  const szSeller_Code   :string;
  const szWho_Code      :string): string;

function gm_Delivery_Linkage_Insert_Invoice_Header_For_SendToServer_EX(  // send_to_server_invoice 에 인서트: 택배사서버 전송  데이터 마스터 등록 속도개선판 : 정정헌
  const nSeq                :string;
  const szinvoiceno         :string;
  const szDelivery_Code     :string;
  const szdelivery_user_id  :string;
  const szuser_id           :string;
  const szSeller_Code       :string;
  const szWho_Code          :string;
  const szsendr_nm          :string;
  const szsendr_mail_no     :string;
  const szsendr_addr        :string;
  const szsendr_detail_addr :string;
  const szsendr_remark      :string;
  const szsendr_tel_no      :string;
  const szsendr_cell_no     :string;
  const szrcvr_nm           :string;
  const szrcvr_mail_no      :string;
  const szrcvr_addr         :string;
  const szrcvr_detail_addr  :string;
  const szrcvr_remark       :string;
  const szrcvr_tel_no       :string;
  const szrcvr_cell_no      :string;
  const szfrt_uprice        :string;
  const szfrt_code          :string;
  const szcust_mgmt_no      :string;
  const szremark            :string;
  const szrcpt_code         :string;
  const szBox_Type          :string
  ): string;
function gm_getSQL(szSQL: string): string; // SQL 문중 ' -> '' 로 변경한뒤 리턴
function gm_update_printed_invoice_list( // 송장출력 카운트 및 시간 업데이트 ==> printed_invoice_list
  const szSeller_Code,
  szWarehouse_code,
  szDelivery_Code,
  szInvoice_no,
  szDelivery_userid,
  szPack_ord_inner_seq,
  szPack_item_seq,
  szsendr_nm,
  szsendr_mail_no,
  szsendr_addr,
  szsendr_detail_addr,
  szsendr_remark,
  szsendr_tel_no,
  szsendr_cell_no,
  sztran_bookno_date,
  sztran_bookno_seq,
  szInvoice_Type
  : string): string;
function StringReplaceCharNotNum(sz_Source :string):string; // 숫자만입력하세요 대신써
function SetStringStrEnd(const OptionStr: string; StrtStr, EndStr: string): string;
function InsertLineFeed(OldString: string; InputIndex: integer): string;
function gm_getZipNo(szZipno: string): string; // 우편번호 - 삽입후 리턴
function gm_setDelivery_Sendr_Data(szSeller_Code, szWho_Code, szDelivery_code, szDelivery_userid: string): boolean;
function InputText(const OldStr: string; AIndex: integer; InputStr: string): string;
function gm_Delivery_GetMaxSeq_Send_To_Server_many(szSeqCount: integer; szSeller_Code: string; szWho_Code: string): string;
function GetFareName(szCode: string): string;
function GetInvoiceNoCaption(szInvoiceNum : string) : string;
function getSecretTel(szTelNum:string):string;
function gm_getTel(szTelNum: string): string;

function g_strNowTime_PC(nOption: integer = 0):string;
function g_strTodayDate_PC(nOption: integer = 0):string;



implementation

uses
  untDatabase, untGlobal;







function gm_Delivery_Linkage_Insert_Invoice_Detail_For_SendToServer_EX( // 택배사서버 전송  데이터 디테일 등록 속도개선판 : 정정헌
  const szenter_item_cd :string;
  const szenter_item_nm :string;
  const szenter_item_qty:string;
  const szSeller_Code   :string;
  const szWho_Code      :string): string;
var
  szSQL: string;
begin
  szSQL := szSQL + '' + #13 + #10;
  szSQL := szSQL + '	select @nitem_Seq = isnull(max(item_Seq)+1,1) from send_to_server_invoice_items where m_seq = @nSeq' + #13 + #10;
  szSQL := szSQL + 'INSERT INTO ' + #13 + #10;
  szSQL := szSQL + '  dbo.send_to_server_invoice_items' + #13 + #10;
  szSQL := szSQL + '(' + #13 + #10;
  szSQL := szSQL + '  seller_code,' + #13 + #10;
  szSQL := szSQL + '  who_code,' + #13 + #10;
  szSQL := szSQL + '  m_seq,' + #13 + #10;
  szSQL := szSQL + '  item_seq,' + #13 + #10;
  szSQL := szSQL + '  enter_item_cd,' + #13 + #10;
  szSQL := szSQL + '  enter_item_nm,' + #13 + #10;
  szSQL := szSQL + '  enter_item_qty' + #13 + #10;
  szSQL := szSQL + ') ' + #13 + #10;
  szSQL := szSQL + 'VALUES (' + #13 + #10;
  szSQL := szSQL + '  ''' + szSeller_Code + ''' --seller_code,' + #13 + #10;
  szSQL := szSQL + '  ,''' + szWho_Code + ''' --who_code,' + #13 + #10;
  szSQL := szSQL + '  , @nSeq' + #13 + #10;
  szSQL := szSQL + '  , @nitem_Seq --item_seq,' + #13 + #10;
  szSQL := szSQL + '  , ''' + gm_getSQL(szenter_item_cd) + ''' --enter_item_cd,' + #13 + #10;
  szSQL := szSQL + '  , ''' + gm_getSQL(szenter_item_nm) + ''' --enter_item_nm,' + #13 + #10;
  szSQL := szSQL + '  , ''' + gm_getSQL(szenter_item_qty) + ''' --enter_item_qty' + #13 + #10;
  szSQL := szSQL + ')' + #13 + #10;
  result := szSQL;
end;

function gm_Delivery_Linkage_Insert_Invoice_Header_For_SendToServer_EX(  // send_to_server_invoice 에 인서트: 택배사서버 전송  데이터 마스터 등록 속도개선판 : 정정헌
  const nSeq                :string;
  const szinvoiceno         :string;
  const szDelivery_Code     :string;
  const szdelivery_user_id  :string;
  const szuser_id           :string;
  const szSeller_Code       :string;
  const szWho_Code          :string;
  const szsendr_nm          :string;
  const szsendr_mail_no     :string;
  const szsendr_addr        :string;
  const szsendr_detail_addr :string;
  const szsendr_remark      :string;
  const szsendr_tel_no      :string;
  const szsendr_cell_no     :string;
  const szrcvr_nm           :string;
  const szrcvr_mail_no      :string;
  const szrcvr_addr         :string;
  const szrcvr_detail_addr  :string;
  const szrcvr_remark       :string;
  const szrcvr_tel_no       :string;
  const szrcvr_cell_no      :string;
  const szfrt_uprice        :string;
  const szfrt_code          :string;
  const szcust_mgmt_no      :string;
  const szremark            :string;
  const szrcpt_code         :string;
  const szBox_Type          :string
  ): string;
var
  szRslt_state: string;
  szSQL: string;
  tmp_cust_mgmt_no: string;
begin
  Result := '';

  tmp_cust_mgmt_no := szcust_mgmt_no;
  tmp_cust_mgmt_no := StringReplace(szcust_mgmt_no, '[-', '', [rfReplaceAll]);
  tmp_cust_mgmt_no := StringReplace(tmp_cust_mgmt_no, '[', '', [rfReplaceAll]);
  tmp_cust_mgmt_no := StringReplace(tmp_cust_mgmt_no, ']', '', [rfReplaceAll]);

  if szrcpt_code = '01' then
    szRslt_state := 'P'
  else if szrcpt_code = '04' then
    szRslt_state := 'O';

  szSQL := '';
  szSQL := szSQL + '' + #13 + #10;
  // 데이타가 있는지 확인
  // szSQL := szSQL + 'declare @Cnt int' + #13 + #10;
  // szSQL := szSQL + 'declare @nSeq bigint' + #13 + #10;
  // szSQL := szSQL + 'declare @nitem_Seq bigint' + #13 + #10;
  szSQL := szSQL + 'Set @nSeq = ' + nSeq + '' + #13 + #10;

  // szSQL := szSQL + 'select @Cnt = count(*) from send_to_server_invoice' + #13 + #10;
  // szSQL := szSQL + 'where invoiceno = ''' + gm_getSQL(szinvoiceno) + ''' --invoiceno,' + #13 + #10;
  // szSQL := szSQL + '  and delivery_code = ''' + gm_getSQL(szDelivery_code) + ''' --delivery_code,' + #13 + #10;
  // szSQL := szSQL + '  and delivery_user_id = ''' + gm_getSQL(szdelivery_user_id) + ''' --delivery_user_id,' + #13 + #10;
  // szSQL := szSQL + '  and user_id = ''' + gm_getSQL(szuser_id) + ''' --user_id,' + #13 + #10;
  // szSQL := szSQL + '  and seller_code = ''' + gm_getSQL(szSeller_Code) + ''' --seller_code,' + #13 + #10;
  // szSQL := szSQL + '  and who_code = ''' + gm_getSQL(szWho_Code) + ''' --who_code,' + #13 + #10;
  // szSQL := szSQL + '  and rcpt_code = ''' + gm_getSQL(szrcpt_code) + ''' --rcpt_code,' + #13 + #10;

  /// //////////////////////
  // szSQL := szSQL + 'if @Cnt <> 0' + #13 + #10;
  // begin의 끝은 디테일 쿼리를 전부 더하고 end해준다
  // szSQL := szSQL + 'begin' + #13 + #10;

  // szSQL := szSQL + 'exec @nSeq = dbo.sp_GetMaxSeq_For_Send_To_Server ''' + szSeller_Code + ''', ''' + szWho_Code + ''' ' + #13 + #10;
  szSQL := szSQL + '' + #13 + #10;

  szSQL := szSQL + 'INSERT INTO ' + #13 + #10;
  szSQL := szSQL + '  dbo.send_to_server_invoice' + #13 + #10;
  szSQL := szSQL + '(' + #13 + #10;
  szSQL := szSQL + '  seq, ' + #13 + #10;
  szSQL := szSQL + '  invoiceno,' + #13 + #10;
  szSQL := szSQL + '  delivery_code,' + #13 + #10;
  szSQL := szSQL + '  delivery_user_id,' + #13 + #10;
  szSQL := szSQL + '  user_id,' + #13 + #10;
  szSQL := szSQL + '  seller_code,' + #13 + #10;
  szSQL := szSQL + '  who_code,' + #13 + #10;
  szSQL := szSQL + '  sendr_nm,' + #13 + #10;
  szSQL := szSQL + '  sendr_mail_no,' + #13 + #10;
  szSQL := szSQL + '  sendr_addr,' + #13 + #10;
  szSQL := szSQL + '  sendr_detail_addr,' + #13 + #10;
  szSQL := szSQL + '  sendr_remark,' + #13 + #10;
  szSQL := szSQL + '  sendr_tel_no,' + #13 + #10;
  szSQL := szSQL + '  sendr_cell_no,' + #13 + #10;
  szSQL := szSQL + '  rcvr_nm,' + #13 + #10;
  szSQL := szSQL + '  rcvr_mail_no,' + #13 + #10;
  szSQL := szSQL + '  rcvr_addr,' + #13 + #10;
  szSQL := szSQL + '  rcvr_detail_addr,' + #13 + #10;
  szSQL := szSQL + '  rcvr_remark,' + #13 + #10;
  szSQL := szSQL + '  rcvr_tel_no,' + #13 + #10;
  szSQL := szSQL + '  rcvr_cell_no,' + #13 + #10;
  szSQL := szSQL + '  frt_uprice,' + #13 + #10;
  szSQL := szSQL + '  frt_code,' + #13 + #10;
  szSQL := szSQL + '  cust_mgmt_no,' + #13 + #10;
  szSQL := szSQL + '  remark,' + #13 + #10;
  szSQL := szSQL + '  rcpt_code,' + #13 + #10;
  szSQL := szSQL + '  reg_datetime,' + #13 + #10;
  szSQL := szSQL + '  rslt_state, ' + #13 + #10;
  szSQL := szSQL + '  box_type ' + #13 + #10;
  szSQL := szSQL + ') ' + #13 + #10;
  szSQL := szSQL + 'VALUES (' + #13 + #10;
  szSQL := szSQL + '  @nSeq' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szinvoiceno) + ''' --invoiceno,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szDelivery_Code) + ''' --delivery_code,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szdelivery_user_id) + ''' --delivery_user_id,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szuser_id) + ''' --user_id,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szSeller_Code) + ''' --seller_code,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szWho_Code) + ''' --who_code,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szsendr_nm) + ''' --sendr_nm,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(StringReplaceCharNotNum(szsendr_mail_no)) + '''  --sendr_mail_no,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szsendr_addr) + '''  --sendr_addr,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szsendr_detail_addr) + '''  --sendr_detail_addr,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szsendr_remark) + '''--sendr_remark,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(StringReplaceCharNotNum(szsendr_tel_no)) + ''' --sendr_tel_no,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(StringReplaceCharNotNum(szsendr_cell_no)) + ''' --sendr_cell_no,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szrcvr_nm) + '''  --rcvr_nm,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(StringReplaceCharNotNum(szrcvr_mail_no)) + ''' --rcvr_mail_no,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szrcvr_addr) + ''' --rcvr_addr,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szrcvr_detail_addr) + '''--rcvr_detail_addr,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szrcvr_remark) + ''' --rcvr_remark,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(StringReplaceCharNotNum(szrcvr_tel_no)) + ''' --rcvr_tel_no,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(StringReplaceCharNotNum(szrcvr_cell_no)) + ''' --rcvr_cell_no,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szfrt_uprice) + ''' --frt_uprice,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szfrt_code) + ''' --frt_code,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(tmp_cust_mgmt_no) + ''' --cust_mgmt_no,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szremark) + ''' --remark,' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szrcpt_code) + '''  --rcpt_code,' + #13 + #10;
  szSQL := szSQL + ' , dbo.fn_getDateTime()  --reg_datetime' + #13 + #10;
  szSQL := szSQL + ' , ''' + szRslt_state + '''  --rslt_state' + #13 + #10;
  szSQL := szSQL + ' , ''' + gm_getSQL(szBox_Type) + '''  --box_type,' + #13 + #10;
  szSQL := szSQL + ')' + #13 + #10;
  szSQL := szSQL + 'SET @nResult = @@error' + #13 + #10;
  szSQL := szSQL + 'insert into @tmpTableResult (nResult) values (@nResult)' + #13 + #10;
  szSQL := szSQL + 'if @nResult <> 0 goto ERROR_TRANSACTION' + #13 + #10;
  szSQL := szSQL + '' + #13 + #10;

  Result := szSQL;
end;

function gm_getSQL(szSQL: string): string; // SQL 문중 ' -> '' 로 변경한뒤 리턴
begin
  //문자열에 따옴표가 들어오게 될경우 에러가 발생하여 송장이 뽑히지 않는 경우 방지
  Result := StringReplace(szSQL, '''', '''''', [rfReplaceAll]);
end;

function gm_update_printed_invoice_list( // 송장출력 카운트 및 시간 업데이트 ==> printed_invoice_list
  const szSeller_Code,
  szWarehouse_code,
  szDelivery_Code,
  szInvoice_no,
  szDelivery_userid,
  szPack_ord_inner_seq,
  szPack_item_seq,
  szsendr_nm,
  szsendr_mail_no,
  szsendr_addr,
  szsendr_detail_addr,
  szsendr_remark,
  szsendr_tel_no,
  szsendr_cell_no,
  sztran_bookno_date,
  sztran_bookno_seq,
  szInvoice_Type
  : string): string;
var
  szSQL: string;
  //szDatetime: string;
begin
  //szDatetime := formatdatetime('yyyymmddhhnnss', now);
  result := '';

  //송장번호가 공백으로 발번된것이 있으면, 출력횟수 카운트에 추가하지 않도록
  if Trim(stringreplace(szInvoice_no, '-', '', [rfReplaceAll])) = ''  then
    exit;

  szSQL := szSQL + #13#10;
  szSQL := szSQL + 'if not exists(select invoice_no from printed_invoice_list where 1=1' + #13 + #10;
  szSQL := szSQL + '			  and seller_code = ''' + szSeller_Code + '''' + #13 + #10;
  szSQL := szSQL + '			  and warehouse_code = ''' + szWarehouse_code + '''' + #13 + #10;
  szSQL := szSQL + '			  and delivery_code = ''' + szDelivery_Code + '''' + #13 + #10;
  szSQL := szSQL + '			  and invoice_no = ''' + szInvoice_no + ''')' + #13 + #10;
  szSQL := szSQL + 'begin' + #13 + #10;
  szSQL := szSQL + '	INSERT INTO printed_invoice_list' + #13 + #10;
  szSQL := szSQL + '           (seller_code' + #13 + #10;
  szSQL := szSQL + '           ,warehouse_code' + #13 + #10;
  szSQL := szSQL + '           ,delivery_code' + #13 + #10;
  szSQL := szSQL + '           ,invoice_no' + #13 + #10;
  szSQL := szSQL + '           ,delivery_userid' + #13 + #10;
  szSQL := szSQL + '           ,print_count' + #13 + #10;
  szSQL := szSQL + '           ,reg_userid' + #13 + #10;
  szSQL := szSQL + '           ,reg_datetime' + #13 + #10;
  szSQL := szSQL + '           ,edt_userid' + #13 + #10;
  szSQL := szSQL + '           ,edt_Datetime' + #13 + #10;
  szSQL := szSQL + '           ,Pack_ord_inner_Seq' + #13 + #10;
  szSQL := szSQL + '           ,Pack_item_Seq' + #13 + #10;
  szSQL := szSQL + '           ,sendr_nm' + #13 + #10;
  szSQL := szSQL + '           ,sendr_mail_no' + #13 + #10;
  szSQL := szSQL + '           ,sendr_addr' + #13 + #10;
  szSQL := szSQL + '           ,sendr_detail_addr' + #13 + #10;
  szSQL := szSQL + '           ,sendr_remark' + #13 + #10;
  szSQL := szSQL + '           ,sendr_tel_no' + #13 + #10;
  szSQL := szSQL + '           ,sendr_cell_no ' + #13 + #10;
  szSQL := szSQL + '           ,TRAN_BOOKNO_DATE ' + #13 + #10;
  szSQL := szSQL + '           ,TRAN_BOOKNO_SEQ ' + #13 + #10;
  szSQL := szSQL + '           ,Invoice_Type ' + #13 + #10;
  szSQL := szSQL + '           )' + #13 + #10;
  szSQL := szSQL + '     VALUES       ' + #13 + #10;
  szSQL := szSQL + '		   (' + #13 + #10;
  szSQL := szSQL + '		        ''' + szSeller_Code + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + szWarehouse_code + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + szDelivery_Code + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + szInvoice_no + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + szDelivery_userid + '''' + #13 + #10;
  szSQL := szSQL + '           ,1' + #13 + #10;
  szSQL := szSQL + '           ,''' + gszUser_Id + ''' ' + #13 + #10;
  szSQL := szSQL + '           ,dbo.fn_getdatetime()' + #13 + #10;
  szSQL := szSQL + '           ,''' + gszUser_Id + '''' + #13 + #10;
  szSQL := szSQL + '           ,dbo.fn_getdatetime()' + #13 + #10;
  szSQL := szSQL + '           ,' + szPack_ord_inner_seq + ' ' + #13 + #10;
  szSQL := szSQL + '           ,' + szPack_item_seq + ' ' + #13 + #10;
  szSQL := szSQL + '           ,''' + gm_getSQL(szsendr_nm) + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + gm_getSQL(szsendr_mail_no) + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + gm_getSQL(szsendr_addr) + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + gm_getSQL(szsendr_detail_addr) + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + gm_getSQL(szsendr_remark) + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + gm_getSQL(szsendr_tel_no) + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + gm_getSQL(szsendr_cell_no) + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + sztran_bookno_date + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + sztran_bookno_seq + '''' + #13 + #10;
  szSQL := szSQL + '           ,''' + szInvoice_Type + '''' + #13 + #10;
  szSQL := szSQL + '		   )' + #13 + #10;
  szSQL := szSQL + 'end' + #13 + #10;
  szSQL := szSQL + 'else' + #13 + #10;
  szSQL := szSQL + 'begin' + #13 + #10;
  szSQL := szSQL + '	UPDATE printed_invoice_list' + #13 + #10;
  szSQL := szSQL + '   SET  ' + #13 + #10;
  szSQL := szSQL + '       delivery_userid = ''' + szDelivery_userid + '''' + #13 + #10;
  szSQL := szSQL + '      ,print_count = print_count + 1' + #13 + #10;
  szSQL := szSQL + '      ,Invoice_Type = ''' + szInvoice_Type + '''' + #13 + #10;
  szSQL := szSQL + '      ,edt_userid = ''' + gszUser_Id + '''' + #13 + #10;
  szSQL := szSQL + '      ,edt_Datetime = dbo.fn_getdatetime() ' + #13 + #10;
  szSQL := szSQL + '	WHERE 1=1' + #13 + #10;
  szSQL := szSQL + '			  and seller_code = ''' + szSeller_Code + '''' + #13 + #10;
  szSQL := szSQL + '			  and warehouse_code = ''' + szWarehouse_code + '''' + #13 + #10;
  szSQL := szSQL + '			  and delivery_code = ''' + szDelivery_Code + '''' + #13 + #10;
  szSQL := szSQL + '			  and invoice_no = ''' + szInvoice_no + '''' + #13 + #10;
  szSQL := szSQL + 'end' + #13 + #10;
  result := szSQL;
end;

function StringReplaceCharNotNum(sz_Source :string):string; // 숫자만입력하세요 대신써
begin
  sz_Source := StringReplace(sz_Source , ' ' , '', [rfReplaceAll]);
  sz_Source := StringReplace(sz_Source , '-' , '', [rfReplaceAll]);
  sz_Source := StringReplace(sz_Source , '/' , '', [rfReplaceAll]);
  sz_Source := StringReplace(sz_Source , '.' , '', [rfReplaceAll]);
  sz_Source := StringReplace(sz_Source , ',' , '', [rfReplaceAll]);
  Result := sz_Source;
end;

function SetStringStrEnd(const OptionStr: string; StrtStr, EndStr: string): string;
begin
  if OptionStr = '' then
  begin
    result := '';
    exit;
  end;
  result := StrtStr + OptionStr + EndStr;
end;

function InsertLineFeed(OldString: string; InputIndex: integer): string;
var
  divOldStrCount: integer;
  modOldStrCount: integer;
  TempStr: string;
  idx: integer;
begin
  // 송장출력에 활용하기위해 InputIndex 다음에 개행문자를 넣어주기 위한 작업
  // InputIndex의 배수로 문자열이 끝날때까지 넣어준다.
  Result := '';
  if Length(OldString) <= InputIndex then
  begin
    Result := OldString;
    Exit;
  end;
  TempStr := OldString;
  divOldStrCount := Length(OldString) div InputIndex;
  modOldStrCount := Length(OldString) - (divOldStrCount * InputIndex);
  for idx := 1 to divOldStrCount do
  begin
    // 마지막 문자열에는 개행문자를 넣지 않는다.
    if idx <> divOldStrCount then
      Result := trim(Result + Copy(TempStr, (InputIndex * idx + 1) - InputIndex, InputIndex)) + #13#10 + '   '
    else
      Result := trim(Result + Copy(TempStr, (InputIndex * idx + 1) - InputIndex, InputIndex));
  end;
  // 나머지 문자열을 넣어준다.
  if modOldStrCount <> 0 then
    Result := Result + #13#10 + '   ' + trim(RightStr(TempStr, modOldStrCount));
end;

function gm_getZipNo(szZipno: string): string; // 우편번호 - 삽입후 리턴
begin
  szZipno := StringReplace(szZipno, '-', '', [rfReplaceAll]);
  Result := '';
  if trim(szZipno) = '' then
    Exit;
  Result := Copy(szZipno, 1, 3) + '-' + Copy(szZipno, 4, 3);
end;

function gm_setDelivery_Sendr_Data(szSeller_Code, szWho_Code, szDelivery_code, szDelivery_userid: string): boolean;
var
  oRS: TFDQuery;
  szSQL: string;
begin

  Result := False;

  gszDelivery_Sendr_NM := '';
  gszDelivery_Sendr_Tel1 := '';
  gszDelivery_Sendr_Tel2 := '';
  gszDelivery_Sendr_Mail_NO := '';
  gszDelivery_Sendr_addr := '';
  gszDelivery_Sendr_detail_addr := '';
  gszDelivery_Sendr_Remark := '';
//  gszSendTML := '';
//  gszCago_Size := '';

  szSQL := '';
  szSQL := szSQL + 'select * ' + #13 + #10;
  szSQL := szSQL + 'from dbo.k_contract_delivery_head' + #13 + #10;
  szSQL := szSQL + 'where seller_code = ''' + szSeller_Code + '''' + #13 + #10;
  szSQL := szSQL + '  and who_code = ''' + szWho_Code + '''' + #13 + #10;
  szSQL := szSQL + '  and delivery_code =''' + szDelivery_code + '''' + #13 + #10;
  szSQL := szSQL + '  and delivery_userid = ''' + szDelivery_userid + '''' + #13 + #10;
  oRS := TFDQuery.Create(nil);
  try

    oRS.Connection := dmMain.dbLinkage;

    try
      //dmMain.g_queryOpen(szSeller_Code, szSQL, oRS);

      with oRS do
      begin
         Close;
         SQL.Text := szSQL;
         //Prepare;
         Open;
        if not oRS.Eof then
        begin
          gszDelivery_Sendr_NM          := oRS.FieldByName('sendr_nm')          .AsString;
          gszDelivery_Sendr_Tel1        := oRS.FieldByName('sendr_tel_no')      .AsString;
          gszDelivery_Sendr_Tel2        := oRS.FieldByName('sendr_tel_no2')     .AsString;
          gszDelivery_Sendr_Mail_NO     := oRS.FieldByName('sendr_mail_no')     .AsString;
          gszDelivery_Sendr_addr        := oRS.FieldByName('sendr_addr')        .AsString;
          gszDelivery_Sendr_detail_addr := oRS.FieldByName('sendr_detail_addr') .AsString;
          gszDelivery_Sendr_Remark      := oRS.FieldByName('sendr_remark')      .AsString;

          Result := True;

          if (gszDelivery_Sendr_NM = '')
          or (gszDelivery_Sendr_Tel1 = '')
          or (gszDelivery_Sendr_Mail_NO = '')
          or (gszDelivery_Sendr_addr = '')
          or (gszDelivery_Sendr_detail_addr = '')
          then
            Result := False;

          gszDelivery_Sendr_Tel1 := gm_getTel(gszDelivery_Sendr_Tel1);

          if gszDelivery_Sendr_Tel2 <> '' then
            gszDelivery_Sendr_Tel2 := gm_getTel(gszDelivery_Sendr_Tel2);

          gszDelivery_Sendr_Mail_NO := gm_getZipNo(gszDelivery_Sendr_Mail_NO);

        end;
      end;
    except
    end;
  finally
    oRS.Free;
  end;

end;

function InputText(const OldStr: string; AIndex: integer; InputStr: string): string;
var
  tmpStr: string;
begin
  if (Length(OldStr) < AIndex) or (OldStr = '') or (AIndex < 0) then
  begin
    Result := OldStr;
    Exit;
  end;

  tmpStr := Copy(OldStr, 1, AIndex);
  tmpStr := tmpStr + InputStr + Copy(OldStr, AIndex + 1, Length(OldStr));
  Result := tmpStr;
end;

function gm_Delivery_GetMaxSeq_Send_To_Server_many(szSeqCount: integer; szSeller_Code: string; szWho_Code: string): string;
var
  oRS: TFDQuery;
  szSQL: string;
  tmpStr : TStringList;
begin
  szSQL := '';
  szSQL := szSQL + 'exec dbo.sp_GetMaxSeq_For_Send_To_Server_many '+#13+#10;
  szSQL := szSQL + '    ' + inttostr(szSeqCount) + '   ' +#13+#10;
  szSQL := szSQL + ', ''' + szSeller_Code        + ''' ' +#13+#10;
  szSQL := szSQL + ', ''' + szWho_Code           + ''' ' +#13+#10;
  oRS := TFDQuery.Create(nil);
  tmpStr := TStringList.create;
  try
    try
      oRS.Connection := dmMain.dbLinkage;

      with oRS do
      begin
        close;
        sql.Text := szSQL;
        //Get_Querytext(szSQL);
        //Prepare;
        open;
        while not oRS.eof do
        begin
          tmpStr.Add(oRS.FieldByName('seq').Asstring);
          oRS.Next;
        end;

        result := tmpStr.text;
      end;
    except
      result := '';
    end;
  finally
    oRS.Free;
    tmpStr.free;
  end;
end;




function GetFareName(szCode: string): string;
begin
  // 01 : 선불, 02 : 착불, 03 : 신용, 04 : 착지신용
  if szCode = '0010' then
    result := '신용'
  else if szCode = '0020' then
    result := '착불'

end;

function g_strTodayDate_PC(nOption: integer = 0):string;
begin
  if nOption = 0 then Result := Trim(FormatDateTime('yyyymmdd', now));
  if nOption = 1 then Result := Trim(FormatDateTime('yyyy-mm-dd', now));
  //if nOption = 2 then Result := Trim(FormatDateTime('yyyy.mm.dd', now)); //특정PC에서 .날짜를 확장자로 인식하여 문제가 발생하는 경우가 있음.
end;

function g_strNowTime_PC(nOption: integer = 0):string;
begin
  if nOption = 0 then Result := FormatDateTime('hhnnss', now);
  if nOption = 1 then Result := FormatDateTime('hh:nn:ss', now);


  //DefaultLCID := GetThreadLocale;
  //ShortDateFormat := TranslateDateFormat(GetLocaleStr(DefaultLCID, LOCALE_SSHORTDATE, 'm/d/yy'));
  //FormatDateTime( ShortDateFormat + ' hh:nn:ss' , Now);
end;

function GetInvoiceNoCaption(szInvoiceNum: string): string;
begin

  if (length(trim(szInvoiceNum)) = 12) then
    Result :=
      copy(szInvoiceNum, 1, 4) + '-' +
      copy(szInvoiceNum, 5, 4) + '-' +
      copy(szInvoiceNum, 9, 4)
  else if (length(trim(szInvoiceNum)) = 10) then
    Result :=
      copy(szInvoiceNum, 1, 3) + '-' +
      copy(szInvoiceNum, 4, 4) + '-' +
      copy(szInvoiceNum, 8, 3)
  else if (length(trim(szInvoiceNum)) = 11) then
    Result :=
      copy(szInvoiceNum, 1, 3) + '-' +
      copy(szInvoiceNum, 4, 4) + '-' +
      copy(szInvoiceNum, 8, 4)
  else
    Result := szInvoiceNum;

end;


function getSecretTel(szTelNum:string):string;
var
  szTempStr : string;
begin
  if szTelNum  = '' then exit;
  szTempStr := copy(szTelNum, 1, length(szTelNum) - 4) + '****';
  Result := szTempStr;
end;

function gm_getTel(szTelNum: string): string;
var
  idx: Integer;
  szTempStr: string;
  szResult: string;
  oDDD: TStringList; // System.Classes;
  n1: Integer;
  n2: Integer;
  n3: Integer;
begin
  Result := szTelNum;
  oDDD := TStringList.Create;

  // 긴번호 순서로 추가
  oDDD.Add('0501');
  oDDD.Add('0502');
  oDDD.Add('0503');
  oDDD.Add('0504');
  oDDD.Add('0505');
  oDDD.Add('0506');
  oDDD.Add('0507');
  oDDD.Add('0508');
  oDDD.Add('0509');
  oDDD.Add('031');
  oDDD.Add('032');
  oDDD.Add('033');
  oDDD.Add('041');
  oDDD.Add('042');
  oDDD.Add('043');
  oDDD.Add('051');
  oDDD.Add('052');
  oDDD.Add('053');
  oDDD.Add('054');
  oDDD.Add('055');
  oDDD.Add('061');
  oDDD.Add('062');
  oDDD.Add('063');
  oDDD.Add('064');
  oDDD.Add('011');
  oDDD.Add('016');
  oDDD.Add('017');
  oDDD.Add('018');
  oDDD.Add('019');
  oDDD.Add('010');
  oDDD.Add('700');
  oDDD.Add('050');
  oDDD.Add('060');
  oDDD.Add('070');
  oDDD.Add('080');
  oDDD.Add('02');

  try
    szTempStr := szTelNum;
    szTempStr := StringReplace(szTempStr, ' ', '', [rfReplaceAll]);  // System.SysUtils
    szTempStr := StringReplace(szTempStr, ')', '', [rfReplaceAll]);
    szTempStr := StringReplace(szTempStr, '-', '', [rfReplaceAll]);
    szTempStr := StringReplace(szTempStr, '(', '', [rfReplaceAll]);
    szTempStr := StringReplace(szTempStr, '.', '', [rfReplaceAll]);
    szTempStr := StringReplace(szTempStr, ',', '', [rfReplaceAll]);
    //szTempStr := StringReplace(szTempStr, '*', '', [rfReplaceAll]);

    // 번호가 9자리 미만이면 exit
    if Length(szTempStr) < 7 then
      Exit;

    n1 := 0;
    for idx := 0 to oDDD.Count - 1 do
    begin
      if Copy(szTempStr, 1, Length(oDDD.strings[idx])) = oDDD[idx] then
      begin
        n1 := Length(oDDD[idx]); // 지역번호매치
        break;
      end;
    end;

    n2 := 0;
    n3 := 0;

    if (Length(szTempStr) - n1) = 7 then
    begin
      n2 := 3;
      n3 := 4;
    end
    else
    begin
      n2 := 4;
      n3 := 4;
    end;
    // DDD 존재
    if (n1 <> 0) and (n2 <> 0) and (n3 <> 0) then
    begin
      Result :=
        Copy(szTempStr, 1, n1) + '-' +
        Copy(szTempStr, n1 + 1, n2) + '-' +
        Copy(szTempStr, n1 + n2 + 1, Length(szTempStr));
    end
    // DDD 부존재
    else if (n1 = 0) and (n2 <> 0) and (n3 <> 0) then
    begin
      Result :=
        Copy(szTempStr, 1, n2) + '-' +
        Copy(szTempStr, n2 + 1, Length(szTempStr));
    end;

  finally
    oDDD.Free;
  end;
end;


end.
