unit unt_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.IniFiles, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.Pool, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.DataSet;

type
  Tfrm_Login = class(TForm)
    Label1: TLabel;
    edt_ID: TEdit;
    Label2: TLabel;
    edt_PW: TEdit;
    btn_Login: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn_LoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SaveIni;
    procedure LoadIni;

    function Login(sz_ID, sz_PW: string): Boolean;
    //function Get_Token(sz_ID, sz_PW: string): Boolean;

  public
    { Public declarations }
    szModalResult : Boolean;

  end;

var
  frm_Login: Tfrm_Login;
  ngLoginFail: Integer;


const
  INI_FILE_NAME = 'settings.ini';

implementation

uses
  untGlobal, untDatabase; //unt_Main

{$R *.dfm}

function Tfrm_Login.Login(sz_ID, sz_PW: string): Boolean;
var
  oRS: TFDQuery;
  szQry: string;
begin
  Result := True;
  Exit;

  Result := False;

  oRS := TFDQuery.Create(self);
  try
    try
      oRS.Connection := dmMain.dbLinkage;

      szQry := '';
      szQry := szQry + '' + #13 + #10;
      szQry := szQry + 'select 1 from tbl_user ' + #13 + #10;
      szQry := szQry + 'where user_id = ''' + sz_ID + ''' ' + #13 + #10;
      szQry := szQry + 'and pass_word = ''' + sz_PW + ''' ' + #13 + #10;
      oRS.SQL.Text := szQry;
      //Get_Querytext(szQry);
      oRS.Open;

      if oRS.RecordCount = 1 then
      begin
        Result := True;
      end;

    except

    end;
  finally
    oRS.Close;
    oRS.Free;
  end;


end;


procedure Tfrm_Login.btn_LoginClick(Sender: TObject);
var
  sz_ID, sz_PW: string;
begin

  // 사용자 인증 절차 성공시, 다음창 모달로(?) 띄워 + 트레이아이콘
  SaveIni;

  sz_ID := Trim(edt_ID.Text);
  sz_PW := Trim(edt_PW.Text);

  if (sz_ID = '') or (sz_PW = '') then
  begin
    Exit;
  end;


//  if not dmMain.dbLinkage.Connected then
//  begin
//    if dmMain.DBConn_Linkage then
//    begin
//      ShowMessage(PChar('Invoice Print DB 연결 성공'));
//
//    end
//    else
//    begin
//      ShowMessage(PChar('Invoice Print DB 연결 실패'));
//      //Result := False;
//      Exit;
//    end;
//  end;


  if Login(sz_ID, sz_PW) then
  begin
    ShowMessage(PChar('사용자 인증 성공'));
    gszUser_Id := sz_ID;
    szModalResult := True;
    Close;

  end
  else
  begin
    ShowMessage(PChar('사용자 인증 실패'));
    ngLoginFail := ngLoginFail + 1;
    if ngLoginFail >= 5 then
      Application.Terminate;

  end;

end;

procedure Tfrm_Login.FormCreate(Sender: TObject);
begin
  szModalResult := False;
end;

procedure Tfrm_Login.FormShow(Sender: TObject);
begin

  LoadIni;

  ngLoginFail := 0;

  edt_ID.SetFocus;

  if Trim(edt_ID.Text) <> '' then
    edt_PW.SetFocus;

  if Trim(edt_PW.Text) <> '' then
    btn_Login.SetFocus;

end;

procedure Tfrm_Login.LoadIni;
var
  f_ini: TMemIniFile;   //System.IniFiles;
begin
  f_ini := TMemIniFile.Create(gszHomePath + INI_FILE_NAME);
  try
    edt_ID.Text := f_ini.ReadString(Tfrm_Login.ClassName, 'edt_ID', ''); // 암복호화 요망
    edt_PW.Text := f_ini.ReadString(Tfrm_Login.ClassName, 'edt_PW', ''); // 암복호화 요망
  finally
    f_ini.Free;
  end;
end;


procedure Tfrm_Login.SaveIni;
var
  f_ini: TMemIniFile;  //System.IniFiles;
begin
  f_ini := TMemIniFile.Create(gszHomePath + INI_FILE_NAME);
  try
    f_ini.WriteString(Tfrm_Login.ClassName, 'edt_ID', Trim(edt_ID.Text) ); // 암복호화 요망
    f_ini.WriteString(Tfrm_Login.ClassName, 'edt_PW', Trim(edt_PW.Text) ); // 암복호화 요망
    f_ini.UpdateFile;
  finally
    f_ini.Free;
  end;
end;



end.
