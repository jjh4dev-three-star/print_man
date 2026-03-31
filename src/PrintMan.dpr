program PrintMan;

uses
  Vcl.Forms,
  Windows,
  unt_Main in 'unt_Main.pas' {frm_Main},
  untDatabase in 'library\untDatabase.pas' {dmMain: TDataModule},
  unt_HttpReqListen in 'unt_HttpReqListen.pas' {frm_HttpReqListen},
  unt_Login in 'unt_Login.pas' {frm_Login},
  Vcl.Themes,
  Vcl.Styles,
  unt_CJ_Daetong in 'unt_CJ_Daetong.pas' {frm_CJ_Daetong},
  untGlobal in 'library\colib\untGlobal.pas',
  unt_CommLib in 'library\colib\unt_CommLib.pas',
  unt_CJ_Korea in 'unt_CJ_Korea.pas' {frm_CJ_Korea},
  uJSON in 'uJSON.pas',
  unt_Barcode_Sample in 'unt_Barcode_Sample.pas' {frm_Barcode_Sample};

{$R *.res}

var
  handle : longint;

begin

  CreateMutex(nil, True, 'PrintMan');

  if ( GetLastError() = ERROR_ALREADY_EXISTS ) then
  begin
    handle := FindWindow('Tfrm_Main', nil);

    if handle <> 0 then
    begin

      SetForegroundWindow(handle);
      ShowWindow(handle, SW_RESTORE);

    end;

    Halt;

  end;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Light');
  Application.Title := '출력대기(PrintMan)';
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(Tfrm_HttpReqListen, frm_HttpReqListen);
  Application.CreateForm(Tfrm_CJ_Korea, frm_CJ_Korea);
  Application.CreateForm(Tfrm_Barcode_Sample, frm_Barcode_Sample);
  Application.Run;
end.
