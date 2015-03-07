program DataBaseConfig;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Criptografia in 'Criptografia.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
