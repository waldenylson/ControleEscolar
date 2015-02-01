unit FormVaParaAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmVaParaAluno = class(TForm)
    txtMatricula: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure txtMatriculaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vl_fecha_form : boolean;
  public
    { Public declarations }
  end;

var
  frmVaParaAluno: TfrmVaParaAluno;

implementation

uses FormDataModule;

{$R *.dfm}

procedure TfrmVaParaAluno.BitBtn1Click(Sender: TObject);
begin
  if txtMatricula.Text = '' then
  begin
    Application.MessageBox('Matrícula não poder ser vazio!', ' Atenção!', mb_IconInformation);
    Abort;
  end;

  frmDataModule.IBTableAlunos.Locate('matricula', StrToInt(txtMatricula.Text), []);

  if frmDataModule.IBTableAlunosmatricula.Value <> StrToInt(txtMatricula.Text) then
  begin
    Application.MessageBox('Aluno não encontrado c/ matrícula informada!', ' Atenção!', mb_IconInformation);
    Abort;
  end
  else
    vl_fecha_form:= true;  
end;

procedure TfrmVaParaAluno.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= vl_fecha_form;
end;

procedure TfrmVaParaAluno.FormCreate(Sender: TObject);
begin
  vl_fecha_form:= false;
end;

procedure TfrmVaParaAluno.txtMatriculaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    self.Close;
end;

end.
