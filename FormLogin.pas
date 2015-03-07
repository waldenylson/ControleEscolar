unit FormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ShellAPI;

type
  TfrmLogin = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtUser: TEdit;
    Label2: TLabel;
    txtPass: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    procedure txtUserEnter(Sender: TObject);
    procedure txtUserExit(Sender: TObject);
    procedure txtPassEnter(Sender: TObject);
    procedure txtPassExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure txtUserKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtPassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtUserKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    vl_fecha_form : boolean;
    function verificaLogin():bool;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses FormDataModule, FormPrincipal, UMensagemConfirm;

{$R *.dfm}



procedure TfrmLogin.BitBtn1Click(Sender: TObject);
begin
  if verificaLogin then
  begin
    frmPrincipal.cadastros.Enabled     := true;
    frmPrincipal.relatorios.Enabled    := true;
    frmPrincipal.configuracoes.Enabled := true;

    frmPrincipal.Visible               := true;

    frmPrincipal.StatusBar1.Panels[0].Text := 'Usuário Logado:  ' + txtUser.Text + '  ';

    vl_fecha_form := true;
    self.Close;

  end
  else
  begin
    Application.MessageBox('   Usuário e/ou Senha Inválidos!   ', 'CFEscolar - Atenção!   ');
    frmPrincipal.cadastros.Enabled     := false;
    frmPrincipal.relatorios.Enabled    := false;
    frmPrincipal.configuracoes.Enabled := false;

    frmPrincipal.StatusBar1.Panels[0].Text := 'Nenhum Usuário Logado...  ';

    self.Close;
  end;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= vl_fecha_form;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  frmPrincipal.Visible := false;
  vl_fecha_form:= false;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  txtUser.Clear;
  txtPass.Clear;
  txtUser.SetFocus;
end;

procedure TfrmLogin.Label3Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.ws-systemas.com.br'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmLogin.Label4Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.dbsites.com.br'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmLogin.txtPassEnter(Sender: TObject);
begin
  txtPass.Color := clMoneyGreen;
end;

procedure TfrmLogin.txtPassExit(Sender: TObject);
begin
  txtPass.Color := clWindow;
end;

procedure TfrmLogin.txtPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
      Application.Terminate;
end;

procedure TfrmLogin.txtUserEnter(Sender: TObject);
begin
  txtUser.Color := clMoneyGreen;
end;

procedure TfrmLogin.txtUserExit(Sender: TObject);
begin
  txtUser.Color := clWindow;
end;

procedure TfrmLogin.txtUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
      Application.Terminate;
end;

procedure TfrmLogin.txtUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
     Key := #0;
     SelectNext(ActiveControl, True, True);
  end;
end;

function TfrmLogin.verificaLogin: bool;
begin
  frmDataModule.tbUsuarios.Active := false;

  frmDataModule.QueryLogin.SQL.Clear;
  frmDataModule.QueryLogin.SQL.Add('SELECT * FROM "usuario" u WHERE( (u."login" = :usuario) AND ("senha" = :senha) )');
  frmDataModule.QueryLogin.ParamByName('usuario').AsString := txtUser.Text;
  frmDataModule.QueryLogin.ParamByName('senha').AsString   := txtPass.Text;
  frmDataModule.QueryLogin.Active := true;

  if frmDataModule.QueryLoginlogin.Value = '' then
    Result := false
  else
    Result := true;

end;

end.
