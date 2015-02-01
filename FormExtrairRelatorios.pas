unit FormExtrairRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TfrmExtrairRelatorios = class(TForm)
    GroupBox1: TGroupBox;
    rbFaltasAluno: TRadioButton;
    rbFaltasTurma: TRadioButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    dtInicial: TDateTimePicker;
    dtFinal: TDateTimePicker;
    ComboBoxTurma: TDBLookupComboBox;
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rbFaltasPeriodo: TRadioButton;
    Label2: TLabel;
    txtMatricula: TEdit;
    procedure GroupBox3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    vl_fecha_form : boolean;
  public
    { Public declarations }
  end;

var
  frmExtrairRelatorios: TfrmExtrairRelatorios;

implementation

{$R *.dfm}

function FormatDataAccess(dData : TDateTime): String;
begin
   Result := '"' + FormatDateTime('yyyy-mm-dd', dData) + '"';
end;

procedure TfrmExtrairRelatorios.BitBtn1Click(Sender: TObject);
begin
  if ( (rbFaltasAluno.Checked) and (txtMatricula.Text = '') )then
  begin
    Application.MessageBox('Matrícula deve conter um valor!', ' Atenção!', mb_IconInformation);
    Abort;
  end;
  if ( (rbFaltasTurma.Checked) and (ComboBoxTurma.Text = '') ) then
  begin
    Application.MessageBox('Selecione uma turma da lista!', ' Atenção!', mb_IconInformation);
    Abort;
  end;

end;

procedure TfrmExtrairRelatorios.BitBtn2Click(Sender: TObject);
begin
  vl_fecha_form := true;
end;

procedure TfrmExtrairRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not vl_fecha_form then
    Abort
  else
    self.Close;
end;

procedure TfrmExtrairRelatorios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := vl_fecha_form;
end;

procedure TfrmExtrairRelatorios.FormCreate(Sender: TObject);
begin
  vl_fecha_form := false;
end;

procedure TfrmExtrairRelatorios.GroupBox3Click(Sender: TObject);
begin
  dtInicial.Date := now;
  dtFinal.Date   := now;
end;

end.
