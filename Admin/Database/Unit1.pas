unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Criptografia, IniFiles,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edit: TLabel;
    txtIP: TEdit;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    txtPorta: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var iniFile: TIniFile;
begin
  try
    iniFile := TIniFile.Create(ExtractFileDir(Application.exeName) + '\Setings.ini');

    iniFile.WriteString('database', 'serverIP', self.txtIP.Text);
    iniFile.WriteString('database', 'serverUserName', cript(self.txtUsuario.Text));
    iniFile.WriteString('database', 'serverPort', cript(self.txtPorta.Text));
    iniFile.WriteString('database', 'serverPassword', cript(self.txtSenha.Text));

    iniFile.Free;

    ShowMessage('     Dados Gravados com Sucesso!     ');
  except
    ShowMessage('Ocorreu um Erro ao Tentar Gravar' + #13 + 'no Arquivo de Configurações!');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var iniFile: TIniFile;
begin
  try
    iniFile := TIniFile.Create(ExtractFileDir(Application.exeName) + '\Setings.ini');

    self.txtIP.Text      := iniFile.ReadString('database', 'serverIP', '');
    self.txtUsuario.Text := decript(iniFile.ReadString('database', 'serverUserName', ''));
    self.txtPorta.Text := decript(iniFile.ReadString('database', 'serverPort', ''));
    self.txtSenha.Text   := decript(iniFile.ReadString('database', 'serverPassword', ''));

    iniFile.Free;
  except
    ShowMessage('Ocorreu um Erro ao Tentar Ler' + #13 + 'do Arquivo de Configurações!');
  end;
end;

end.
