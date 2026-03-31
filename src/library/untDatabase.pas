unit untDatabase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,
  Vcl.Dialogs,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.Win.ADODB, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.Comp.UI;


type
  TdmMain = class(TDataModule)
    dbLinkage: TFDConnection;
    dbZipNo: TADOConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    db_Oracle: TFDConnection;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function DBConn_Linkage: Boolean;
    function DBConn_MVC_ORACLE: Boolean;

  end;

var
  dmMain: TdmMain;

  LINKAGE_SERVER   :string;
  LINKAGE_DATABASE :string;
  LINKAGE_USERNAME :string;
  LINKAGE_PASSWORD :string;


implementation

uses
  untGlobal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmMain }

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin

  LINKAGE_SERVER   := 'jjh103.iptime.org,64707';
  LINKAGE_DATABASE := 'teak_bae';
  LINKAGE_USERNAME := 'mlm_admin';
  LINKAGE_PASSWORD := 'mlm2024!';


  //dmMain.DBConn_Linkage;

  dmMain.DBConn_MVC_ORACLE;

end;


function TdmMain.DBConn_MVC_ORACLE: Boolean;
begin
  Result := False;

  try
    try
      with dmMain do
      begin
        db_Oracle.Connected := False;
        db_Oracle.DriverName := 'Ora';
        db_Oracle.FetchOptions.Mode := fmAll;
        db_Oracle.Params.Values['Database'] := '221.149.104.164:31521/ORCL';
        //dbLinkage.Authentication := auServer;
        db_Oracle.Params.Values['User_name'] := 'SAASDEV';    //'SAAS_OMS'; //'SAASDEV';
        db_Oracle.Params.Values['Password'] := 'monvc2021@';  //'SAAS_OMS'; //'monvc2021@';
        //db_Oracle.Params.Values['Database'] := LINKAGE_DATABASE;
        //db_Oracle.Params.Values['ApplicationName'] := PROGRAM_TITLE + '('+ PROGRAM_VER + ')' + '_dbLinkage_' + gszUser_Id;
        db_Oracle.LoginPrompt := False;

        db_Oracle.Connected := True;

        Result := True;


      end;
    except
      on E: Exception do
      begin
        //raise Exception.Create(e.Message);
        ShowMessage(PChar('Link DB 연결 실패' + #13 + #10 + E.Message)); // Vcl.Dialogs;

        Result := False;
      end;
    end;
  finally
  end;

end;


function TdmMain.DBConn_Linkage: Boolean;
begin
  Result := False;

  try
    try
      with dmMain do
      begin
        dbLinkage.Connected := False;
        dbLinkage.DriverName := 'MSSQL';
        dbLinkage.FetchOptions.Mode := fmAll;
        dbLinkage.Params.Values['Server'] := LINKAGE_SERVER;
        //dbLinkage.Authentication := auServer;
        dbLinkage.Params.Values['User_name'] := LINKAGE_USERNAME;
        dbLinkage.Params.Values['Password'] := LINKAGE_PASSWORD;
        dbLinkage.Params.Values['Database'] := LINKAGE_DATABASE;
        dbLinkage.Params.Values['ApplicationName'] := PROGRAM_TITLE + '('+ PROGRAM_VER + ')' + '_dbLinkage_' + gszUser_Id;
        dbLinkage.LoginPrompt := False;

        dbLinkage.Connected := True;

        Result := True;


      end;
    except
      on E: Exception do
      begin
        //raise Exception.Create(e.Message);
        //ShowMessage(PChar('Link DB 연결 실패' + #13 + #10 + E.Message)); // Vcl.Dialogs;

        Result := False;
      end;
    end;
  finally
  end;

end;



end.
