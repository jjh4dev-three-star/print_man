unit unt_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.IniFiles,
  Vcl.AppEvnts, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Stan.Param, FireDAC.Comp.DataSet;

type
  Tfrm_Main = class(TForm)
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    procedure BeginListen;
    procedure StopListen;



  public
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;
  //m_LoginYN: string; // 로그인성공여부

implementation

uses
  untGlobal, untDatabase, unt_HttpReqListen, unt_Login, unt_CJ_Daetong, unt_CJ_Korea;

{$R *.dfm}



procedure Tfrm_Main.ApplicationEvents1Minimize(Sender: TObject);
begin
  //Show();
  TrayIcon1DblClick(Sender);

  Hide(); // 메인폼 감춰

  WindowState := wsMinimized; // 메인폼 크기 최소화

  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;

end;

procedure Tfrm_Main.BeginListen;
begin
  frm_HttpReqListen.Show;
  frm_HttpReqListen.IdHTTPServer1.Active := True;
end;
procedure Tfrm_Main.StopListen;
begin
  frm_HttpReqListen.Hide;
  frm_HttpReqListen.IdHTTPServer1.Active := False;
end;

procedure Tfrm_Main.Timer1Timer(Sender: TObject);
begin

  Timer1.Enabled := False;

  ApplicationEvents1Minimize(Sender);


  //self.Caption := '송장 출력 대기중';

  {
  self.AlphaBlend := True;
  self.AlphaBlendValue := 0;
  //self.Visible := False;
  self.Label1.Visible := False;
  self.Label2.Visible := False;
  self.edt_ID.Visible := False;
  self.edt_PW.Visible := False;
  self.btn_Login.Visible := False;
  self.Width := 0;
  self.Height := 0;
  }


  //frm_HttpReqListen.Show;
  BeginListen;



end;

procedure Tfrm_Main.TrayIcon1DblClick(Sender: TObject);
begin
  Exit;
  TrayIcon1.Visible := False;
  Show(); //Self.Show;
  WindowState := wsNormal;
  Application.BringToFront();

  //BeginListen;
end;

procedure Tfrm_Main.FormShow(Sender: TObject);
var
  oFrm: Tfrm_Login;
  oFrm2: Tfrm_CJ_Daetong;
  //oFrm3: Tfrm_CJ_Korea;   frm_CJ_Korea
  szModalResult: Boolean;
begin
  if gszLoginYN = 'Y' then
  begin

  end
  else
  begin

    oFrm := Tfrm_Login.Create(self);
    try
      try

//        oFrm.ShowModal;
//        szModalResult := oFrm.szModalResult;
        szModalResult := True;

        if szModalResult then
        begin
          gszLoginYN := 'Y';
          Timer1.Enabled := True;

          // 대통송장출력폼
//          oFrm2 := Tfrm_CJ_Daetong.Create(self);
//          oFrm2.Show;


          // 대통송장출력폼
          //oFrm3 := Tfrm_CJ_Korea.Create(self);
          //frm_CJ_Korea.Show;


        end
        else
        begin
          Application.Terminate;
        end;
      except
        Application.Terminate;
      end;
    finally
      oFrm.Free;
    end;

  end;

end;

procedure Tfrm_Main.N2Click(Sender: TObject);
begin
  // 팝업메뉴 - 화면보이기
  TrayIcon1DblClick(Sender);
end;

procedure Tfrm_Main.N3Click(Sender: TObject);
begin
  // 팝업메뉴 - 화면감추기
  ApplicationEvents1Minimize(Sender);
end;

procedure Tfrm_Main.N4Click(Sender: TObject);
begin
  // 팝업메뉴 - 종료
  Close;
end;



procedure Tfrm_Main.N6Click(Sender: TObject);
begin
  //송장출력대기
  BeginListen;
end;

procedure Tfrm_Main.N7Click(Sender: TObject);
begin
  //송장출력대기 중단
  StopListen;
end;


procedure Tfrm_Main.FormCreate(Sender: TObject);
begin

  TrayIcon1.Hint := '송장출력 대기 중(모비어스)';
  TrayIcon1.AnimateInterval := 1000;

  //TrayIcon1.BalloonTitle := '모비어스송장출력';
  TrayIcon1.BalloonHint := '송장출력 대기 중(모비어스)';
  TrayIcon1.BalloonFlags := bfNone; // bfInfo;

end;


initialization

  gszHomePath := ExtractFilePath(Application.ExeName); // System.SysUtils, Vcl.Forms
  gszLoginYN := 'N';

  gszFontSize := 10;
  gszChrCnt := 31;
  gszLineCnt := 0;

  gInvPrinting := False;
  gHttpRecieving := False;

end.
