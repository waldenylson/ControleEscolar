unit FormSelecionaTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmSelecionaTela = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Image2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaTela: TfrmSelecionaTela;

implementation

uses FormGerenciarCadastroAlunos, FormGerenciarCadastroTurmas;

{$R *.dfm}

procedure TfrmSelecionaTela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    self.Close;
end;

procedure TfrmSelecionaTela.Image2Click(Sender: TObject);
begin
  frmGerenciarCadastroTurmas := TfrmGerenciarCadastroTurmas.Create(Application);
  try
    frmGerenciarCadastroTurmas.ShowModal;
  finally
    frmGerenciarCadastroTurmas.Release;
    frmGerenciarCadastroTurmas.Free;
  end;
end;

end.
