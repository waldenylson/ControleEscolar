program PDV;

uses
  Forms,
  FormFrequencia in 'FormFrequencia.pas' {frmFrequencia},
  FormSobre in 'FormSobre.pas' {frmSobre},
  Criptografia in 'Criptografia.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'CFEscolar';
  Application.CreateForm(TfrmFrequencia, frmFrequencia);
  Application.Run;
end.
