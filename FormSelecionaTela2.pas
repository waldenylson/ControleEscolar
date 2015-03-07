unit FormSelecionaTela2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmSelecionaTela2 = class(TForm)
    Image3: TImage;
    Label3: TLabel;
    Image1: TImage;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionaTela2: TfrmSelecionaTela2;

implementation

uses FormCadUsuarios, FormCadEmpresas;

{$R *.dfm}

procedure TfrmSelecionaTela2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    self.Close;
end;

procedure TfrmSelecionaTela2.Image1Click(Sender: TObject);
begin
  frmCadEmpresas := TfrmCadEmpresas.Create(Self);
  try
    frmCadEmpresas.ShowModal;
  finally
    frmCadEmpresas.Release;
    frmCadEmpresas.Free;
  end;
end;

procedure TfrmSelecionaTela2.Image3Click(Sender: TObject);
begin
  frmCadUsuarios := TfrmCadUsuarios.Create(Self);
  try
    frmCadUsuarios.ShowModal;
  finally
    frmCadUsuarios.Release;
    frmCadUsuarios.Free;
  end;
end;

end.
