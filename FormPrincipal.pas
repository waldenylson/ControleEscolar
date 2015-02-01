unit FormPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGDIPlusClasses, ExtCtrls, Menus, ComCtrls, DtsExcel;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    cadastros: TImage;
    relatorios: TImage;
    login: TImage;
    Image6: TImage;
    TrayIcon1: TTrayIcon;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    BalloonHint1: TBalloonHint;
    configuracoes: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure cadastrosClick(Sender: TObject);
    procedure loginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure relatoriosClick(Sender: TObject);
    procedure configuracoesClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses FormSelecionaTela, FormLogin, UMensagemConfirm, FormCadEmpresas,
  FormSelecionaTela2, FormExtrairRelatorios;

{$R *.dfm}

procedure TfrmPrincipal.cadastrosClick(Sender: TObject);
begin
  frmSelecionaTela := TfrmSelecionaTela.Create(Application);
  try
    frmSelecionaTela.ShowModal;
  finally
    frmSelecionaTela.Release;
    frmSelecionaTela.Free;
  end;
end;

procedure TfrmPrincipal.configuracoesClick(Sender: TObject);
begin
  frmSelecionaTela2 := TfrmSelecionaTela2.Create(Self);
  try
    frmSelecionaTela2.ShowModal;
  finally
    frmSelecionaTela2.Release;
    frmSelecionaTela2.Free;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If ( mensagem('Deseja mesmo Sair do Sistema?') <> Idyes ) then
    Abort
  else
    Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(Application);
  try
    frmLogin.ShowModal;
  finally
    frmLogin.Release;
    frmLogin.Free;
  end;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    self.Close;
end;

procedure TfrmPrincipal.loginClick(Sender: TObject);
begin
  self.Visible := false;

  frmLogin := TfrmLogin.Create(Application);
  try
    frmLogin.ShowModal;
  finally
    frmLogin.Release;
    frmLogin.Free;
  end;
end;

procedure TfrmPrincipal.relatoriosClick(Sender: TObject);
begin
  //Application.MessageBox('Funcionalidade em Desenvolvimento!', ' Atenção!', mb_IconInformation);
  frmExtrairRelatorios := TfrmExtrairRelatorios.Create(Self);
  try
    frmExtrairRelatorios.ShowModal;
  finally
    frmExtrairRelatorios.Release;
    frmExtrairRelatorios.Free;
  end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := FormatDateTime('dddd ", " dd " de " mmmm " de " yyyy',Now());
  StatusBar1.Panels[1].Text := TimeToStr(Time);
  StatusBar1.Panels[1].Text := FormatDateTime('hh":"nn":"ss"',Now());
end;

end.
