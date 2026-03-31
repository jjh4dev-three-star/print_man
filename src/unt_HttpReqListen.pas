unit unt_HttpReqListen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.AppEvnts,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, Vcl.StdCtrls, IdContext, IdHeaderList, IdGlobal;

type
  Tfrm_HttpReqListen = class(TForm)
    IdHTTPServer1: TIdHTTPServer;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo_Error: TMemo;
    procedure IdHTTPServer1CreatePostStream(AContext: TIdContext;
      AHeaders: TIdHeaderList; var VPostStream: TStream);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure FormCreate(Sender: TObject);
    procedure IdHTTPServer1CommandOther(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  private
    { Private declarations }
    //frm_CJ_Korea: Tfrm_CJ_Korea;
  public
    { Public declarations }
  end;

var
  frm_HttpReqListen: Tfrm_HttpReqListen;


implementation

uses unt_CJ_Korea, unt_Barcode_Sample, untGlobal, uJSON;

{$R *.dfm}


//  POST 방식으로 아래와 같은 형식의 JSON 전문 송신 ==> 송장출력
//  {
//    "access_key": ''
//    "user_id": "admin",
//    "bunch_id": "20240514_154351_F04A1",
//  }//  POST 방식으로 아래와 같은 형식의 JSON 전문 송신 ==> 바코드출력//  {
//    "access_key": ''
//    "user_id": "jjh103",
//    "bunch_id": "20260312_194351_F04A1",
//  }
//Response Example
//{
//  "code": "200",
//  "message": "",
//  "data": {
//    "code": "SUCCESS",
//    "message": "",
//    "data": 427011919
//  }
//}//{
//  "code": "SUCCESS",
//  "message": "삭제되었습니다",
//  "data": "10***16568"
//}//{//  "code": "SUCCESS",
//  "message": "판매 중지 처리되었습니다."
//}


procedure Tfrm_HttpReqListen.FormCreate(Sender: TObject);
begin
  //frm_CJ_Korea := Tfrm_CJ_Korea.Create(self);
end;

procedure Tfrm_HttpReqListen.IdHTTPServer1CommandOther(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
   AForm : TStringList;
   Stream : TStream;
   S : string;
   obj_Json: TJSONObject;
   nJsonCnt: Integer;
   szUSER_ID, szBUNCH_ID: string;
   nResultCnt: Integer;
   szResponse: string;
begin

  //if gHttpRecieving then Exit;

  //gHttpRecieving := True;

  //try

    if ARequestInfo.Command = 'OPTIONS' then
    begin

//      AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Credentials','true');
      //AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Origin'] := '*';
      //AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin','http://localhost:48080');
      AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin','*');
      AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Methods','GET,POST,OPTIONS,PATCH');

      AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Headers','Content-Type, Authorization');

//      AResponseInfo.CustomHeaders.AddValue('Connection','keep-alive');
      //AResponseInfo.CustomHeaders.AddValue('Content-Length','0');
  //    AResponseInfo.CustomHeaders.AddValue('Access-Control-Max-Age','86400');
      AResponseInfo.WriteHeader;



    end;  //if ARequestInfo.Command = 'OPTIONS' then


    if ARequestInfo.Command = 'OPTIONS' then
    begin
      AResponseInfo.ResponseNo := 200;
//      AResponseInfo.ResponseText := 'OK';
      // OPTIONS 요청은 내용 없이 헤더만 보내면 되므로 바로 전송
      AResponseInfo.WriteContent;
      Exit;
    end;


  //finally
    //gHttpRecieving := False;
 // end;

//
//  if ARequestInfo.Command = 'POST' then
//  begin
//    Stream := ARequestInfo.PostStream;
//    if assigned(Stream) then
//    begin
//      Stream.Position := 0;
//      S := ReadStringFromStream(Stream); // IdGlobal
//
//      obj_json := TJSONObject.create(S);
//      nJsonCnt:= obj_json.keys.Count;
//      if nJsonCnt = 2  then
//      begin
//        szUSER_ID  := VarToStrDef( obj_json.getString('USER_ID'), '' );
//        szBUNCH_ID := VarToStrDef( obj_json.getString('BUNCH_ID'), '' );
//
//        //frm_CJ_Korea.do_Print_CJ('admin', '20240514_154351_F04A1');
//
//        nResultCnt := frm_CJ_Korea.do_Print_CJ(szUSER_ID, szBUNCH_ID);
//
//
//        // response
//        szResponse := '';
//        szResponse := szResponse + '{'+#13#10;
//        szResponse := szResponse + '  "code": "SUCCESS",'+#13#10;
//        szResponse := szResponse + '  "print_cnt": ' + IntToStr(nResultCnt) + ','+#13#10;
//        szResponse := szResponse + '  "message": "출력완료"'+#13#10;
//        szResponse := szResponse + '}'+#13#10;
//
//
//        //AResponseInfo.CharSet := 'UTF-8';
//        //AResponseInfo.ContentType := 'application/json';
//        AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin','*');
//        AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Credentials','true');
//        AResponseInfo.ContentText := szResponse;
//        //AResponseInfo.WriteContent;
//
//
//      end;
//
//
//
////        TThread.Synchronize(nil,
////        procedure
////        begin
////        Memo2.Lines.Add(S);
////        end);
//
//    end;
//  end;


end;

procedure Tfrm_HttpReqListen.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
   AForm : TStringList;
   Stream : TStream;
   S : string;
   obj_Json: TJSONObject;
   nJsonCnt: Integer;
   szUSER_ID, szBUNCH_ID: string;
   nResultCnt: Integer;
   szResponse: string;
   key_1,    value_1      , key_2  , value_2: string;
begin

  if gHttpRecieving then Exit;

  gHttpRecieving := True;




  // 1. 모든 응답에 대해 CORS 헤더 설정
  // 특정 도메인만 허용하려면 'http://localhost:37467'을 적으시고,
  // 범용적으로 쓰려면 '*'를 사용합니다.
//  AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Origin'] := 'http://localhost:37467';
  AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Origin'] := '*';
  AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Methods'] := 'POST, GET, OPTIONS';
  AResponseInfo.CustomHeaders.Values['Access-Control-Allow-Headers'] := 'Content-Type, Authorization, X-Requested-With';


  try
    //  if IdHTTPServer1.Active then
  //    IdHTTPServer1.Active := False;

    //Memo2.Lines.Add( AContext.ToString() );

  //  if not IdHTTPServer1.Active then
  //    IdHTTPServer1.Active := True;


    try

      // 2. 브라우저의 Preflight (OPTIONS) 요청 처리
      if ARequestInfo.Command = 'OPTIONS' then
      begin
        AResponseInfo.ResponseNo := 200;
        AResponseInfo.ResponseText := 'OK';
        // OPTIONS 요청은 내용 없이 헤더만 보내면 되므로 바로 전송
        AResponseInfo.WriteContent;
        Exit;
      end;

      if ARequestInfo.Command = 'GET' then
      begin

        if ARequestInfo.Params.Count = 2 then
        begin

          key_1   := ARequestInfo.Params.Names[0];
          value_1 := ARequestInfo.Params.ValueFromIndex[0];

          key_2   := ARequestInfo.Params.Names[1];
          value_2 := ARequestInfo.Params.ValueFromIndex[1];

          if (key_1 = 'user_id') and (key_2 = 'bunch_id') then
          begin
            szUSER_ID  := value_1;
            szBUNCH_ID := value_2;

            // 이건 송장 테스트
  //          nResultCnt := frm_CJ_Korea.do_Print_CJ(szUSER_ID, szBUNCH_ID);


            // 이건 바코드 테스트
            nResultCnt := frm_Barcode_Sample.do_Print_CJ(szUSER_ID, szBUNCH_ID);


            // response
            szResponse := '';
            szResponse := szResponse + '{'+#13#10;
            szResponse := szResponse + '  "code": "SUCCESS",'+#13#10;
            szResponse := szResponse + '  "print_cnt": ' + IntToStr(nResultCnt) + ','+#13#10;
            szResponse := szResponse + '  "message": "출력완료"'+#13#10;
            szResponse := szResponse + '}'+#13#10;


            AResponseInfo.CharSet := 'UTF-8';
            AResponseInfo.ContentType := 'application/json';
            AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin','*');
            AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Credentials','true');
            AResponseInfo.ContentText := szResponse;
            AResponseInfo.WriteContent;


          end;


        end;






      end; //if ARequestInfo.Command = 'GET' then


      if ARequestInfo.Command = 'POST' then
      begin
        Stream := ARequestInfo.PostStream;
        if assigned(Stream) then
        begin
          Stream.Position := 0;
          S := ReadStringFromStream(Stream); // IdGlobal

          obj_json := TJSONObject.create(S);
          nJsonCnt:= obj_json.keys.Count;
          if nJsonCnt = 2  then
          begin
            szUSER_ID  := VarToStrDef( obj_json.getString('USER_ID'), '' );
            szBUNCH_ID := VarToStrDef( obj_json.getString('BUNCH_ID'), '' );

            //frm_CJ_Korea.do_Print_CJ('admin', '20240514_154351_F04A1');
            //  POST 방식으로 아래와 같은 형식의 JSON 전문 송신 ==> 바코드출력
  //  {
  //    "access_key": ''
  //    "user_id": "jjh103",
  //    "bunch_id": "20260312_194351_F04A1",
  //  }

            // 이건 송장테스트
            //nResultCnt := frm_CJ_Korea.do_Print_CJ(szUSER_ID, szBUNCH_ID);


            // 이건 바코드 테스트
            nResultCnt := frm_Barcode_Sample.do_Print_CJ(szUSER_ID, szBUNCH_ID);


            // response
            szResponse := '';
            szResponse := szResponse + '{'+#13#10;
            szResponse := szResponse + '  "code": "SUCCESS",'+#13#10;
            szResponse := szResponse + '  "print_cnt": ' + IntToStr(nResultCnt) + ','+#13#10;
            szResponse := szResponse + '  "message": "출력완료"'+#13#10;
            szResponse := szResponse + '}'+#13#10;


            AResponseInfo.CharSet := 'UTF-8';
            AResponseInfo.ResponseNo := 200;
            AResponseInfo.ContentType := 'application/json';
            AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin','*');
            AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Credentials','true');
            AResponseInfo.ContentText := szResponse;
            AResponseInfo.WriteContent;


          end;



  //        TThread.Synchronize(nil,
  //        procedure
  //        begin
  //        Memo2.Lines.Add(S);
  //        end);

        end;


      end;

    except
      on E: Exception do
      begin
        AResponseInfo.ResponseNo := 500;
        AResponseInfo.ContentText := E.Message;
      end;
    end;
  finally
    gHttpRecieving := False;
  end;


end;



procedure Tfrm_HttpReqListen.IdHTTPServer1CreatePostStream(AContext: TIdContext;
  AHeaders: TIdHeaderList; var VPostStream: TStream);
begin

  //if gHttpRecieving then Exit;

  //gHttpRecieving := True;

//  if IdHTTPServer1.Active then
//    IdHTTPServer1.Active := False;
  try

    //VPostStream := TMemoryStream.Create;

    //Memo1.Lines.Add( AContext.ToString() );

  //  if not IdHTTPServer1.Active then
  //    IdHTTPServer1.Active := True;



    //frm_CJ_Korea.do_Print_CJ('admin', '20240514_154351_F04A1');


  finally
    //gHttpRecieving := False;
  end;




end;

end.
