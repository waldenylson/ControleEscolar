program CFEscolar;

uses
  Forms,
  FormPrincipal in 'FormPrincipal.pas' {frmPrincipal},
  FormGerenciarCadastroAlunos in 'FormGerenciarCadastroAlunos.pas' {frmGerenciarCadastroAlunos},
  FormDataModule in 'FormDataModule.pas' {frmDataModule: TDataModule},
  FormSobre in 'FormSobre.pas' {frmSobre},
  FormGerenciarCadastroTurmas in 'FormGerenciarCadastroTurmas.pas' {frmGerenciarCadastroTurmas},
  FormSelecionaTela in 'FormSelecionaTela.pas' {frmSelecionaTela},
  untSplash in 'untSplash.pas' {FrmSplash},
  FormLogin in 'FormLogin.pas' {frmLogin},
  FormCadUsuarios in 'FormCadUsuarios.pas' {frmCadUsusarios},
  FormSelecionaTela2 in 'FormSelecionaTela2.pas' {frmSelecionaTela2},
  FormCadEmpresas in 'FormCadEmpresas.pas' {frmCadEmpresas},
  FormExtrairRelatorios in 'FormExtrairRelatorios.pas' {frmExtrairRelatorios},
  FormCadFeriados in 'FormCadFeriados.pas' {frmCadFeriados},
  FormAutoCompleteNomeAluno in 'FormAutoCompleteNomeAluno.pas' {frmAutoCompleteNomeAluno},
  FormVaParaAluno in 'FormVaParaAluno.pas' {frmVaParaAluno};

{$R *.res}

begin
  Contador := Contador + 1;
  TAguarde := 2000;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '  CFEscolar ';
  Application.CreateForm(TfrmDataModule, frmDataModule);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

  {
  with TFrmSplash.Create(nil) do
    try
      Show; //Mostra o Formulario
      Update; //Atualiza o Splash
      IniciaSplash(Sender);
      Close;
      Application.CreateForm(TfrmDataModule, frmDataModule);
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
      Application.CreateForm(TFrmSplash, FrmSplash);
      Application.Run;
    finally
      close;
      Free;
      FrmPrincipal.Show;
    end;   }
end.
