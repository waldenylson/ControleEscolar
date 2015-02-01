unit FormDataModule;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBTable, Dialogs, Forms,
  IBQuery, inifiles, UMensagemConfirm, Windows, WideStrings,
  FMTBcd;

type
  TfrmDataModule = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTableAlunos: TIBTable;
    IBTransaction: TIBTransaction;
    IBTableTurmas: TIBTable;
    DataSourceListTurmas: TDataSource;
    IBQueryLogin: TIBQuery;
    IBQueryLoginid_usuario: TIntegerField;
    IBQueryLoginlogin: TIBStringField;
    IBQueryLoginsenha: TIBStringField;
    IBQueryLoginusuario: TIBStringField;
    IBTableUsuarios: TIBTable;
    IBTableTurmasid: TIntegerField;
    IBTableTurmasturma: TIBStringField;
    IBTableTurmasturno: TIBStringField;
    IBTableUsuariosid_usuario: TIntegerField;
    IBTableUsuarioslogin: TIBStringField;
    IBTableUsuariossenha: TIBStringField;
    IBTableUsuariosusuario: TIBStringField;
    IBTableAlunosid: TIntegerField;
    IBTableAlunosturma_id: TIntegerField;
    IBTableAlunosmatricula: TIntegerField;
    IBTableAlunosnome: TIBStringField;
    IBTableAlunosrg: TIBStringField;
    IBTableAlunossexo: TIBStringField;
    IBTableAlunosendereco: TIBStringField;
    IBTableAlunosbairro: TIBStringField;
    IBTableAlunoscidade: TIBStringField;
    IBTableAlunosfone: TIBStringField;
    IBTableAlunosfoto: TIBStringField;
    DataSourceEmpresas: TDataSource;
    IBTableEmpresas: TIBTable;
    IBTableEmpresasid: TIntegerField;
    IBTableEmpresasNome: TIBStringField;
    IBTableEmpresasRazaoSocial: TIBStringField;
    IBTableEmpresasEmail: TIBStringField;
    IBTableEmpresashome: TIBStringField;
    IBTableEmpresascnpj: TIBStringField;
    IBTableEmpresasendereco: TIBStringField;
    IBTableEmpresasestado: TIBStringField;
    IBTableEmpresascidade: TIBStringField;
    IBTableEmpresasbairro: TIBStringField;
    IBTableEmpresascep: TIBStringField;
    IBTableEmpresasfone1: TIBStringField;
    IBTableEmpresasfone2: TIBStringField;
    IBTableEmpresasfax: TIBStringField;
    IBTableEmpresasNportaria: TIBStringField;
    IBTableEmpresasDataPuclicacao: TDateField;
    IBTableEmpresasMedia: TIBStringField;
    IBQueryMatricula: TIBQuery;
    IBTableFeriados: TIBTable;
    IBTableAlunosdata_nasc: TDateField;
    IBTableFeriadosdata: TDateTimeField;
    IBTableFeriadosdescricao: TIBStringField;
    IBQueryMatriculaqtd: TIntegerField;
    IBQueryAutoComplete: TIBQuery;
    IBQueryAutoCompleteid: TIntegerField;
    IBQueryAutoCompletenome: TIBStringField;
    DataSourceAutoComplete: TDataSource;
    IBQueryAutoCompletematricula: TIntegerField;
    procedure IBTableAlunosAfterCancel(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure IBTableAlunosBeforeDelete(DataSet: TDataSet);
    procedure IBTableTurmasBeforeDelete(DataSet: TDataSet);
    procedure IBTableAlunosAfterPost(DataSet: TDataSet);
    procedure IBTableTurmasAfterPost(DataSet: TDataSet);
    procedure IBTableUsuariosAfterPost(DataSet: TDataSet);
    procedure IBTableAlunosBeforePost(DataSet: TDataSet);
    procedure IBTableTurmasBeforePost(DataSet: TDataSet);
    procedure IBTableUsuariosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    var semaforo: Integer;
  public
    { Public declarations }
  end;

var
  frmDataModule: TfrmDataModule;

implementation

uses FormGerenciarCadastroAlunos;

{$R *.dfm}

procedure TfrmDataModule.DataModuleCreate(Sender: TObject);
var iniFile: TIniFile;
begin
  try
    iniFile := TIniFile.Create(ExtractFileDir(Application.exeName) + '\Setings.ini');

    with self.IBDatabase do
    begin
      Connected    := false;
      DatabaseName := iniFile.ReadString('database', 'serverIP', '') + ':' + ExtractFilePath(Application.ExeName) + '\DATABASE\Banco.fdb';
      Connected    := true;
    end;

    with frmDataModule do
    begin
      IBTransaction.Active   := true;
      IBTableAlunos.Active   := true;
      IBTableTurmas.Active   := true;
      IBQueryLogin.Active    := true;
      IBTableUsuarios.Active := true;
      IBTableEmpresas.Active := true;
      IBTableFeriados.Active := true;
    end;

    iniFile.Free;
  except
    ShowMessage('Ocorreu um Erro ao Tentar Conectar com o' + #13 + 'Servidor de Banco de Dados!' + #13 + 'Entre em contato com o suporte técnico!');
    Application.Terminate;
  end;
end;

procedure TfrmDataModule.IBTableAlunosAfterCancel(DataSet: TDataSet);
begin
  frmGerenciarCadastroAlunos.foto.Picture := nil;
end;

procedure TfrmDataModule.IBTableAlunosAfterPost(DataSet: TDataSet);
begin
  if semaforo = 1 then
  begin
    IBTableAlunos.Refresh;
    IBTableAlunos.Last;
  end;
end;

procedure TfrmDataModule.IBTableAlunosBeforeDelete(DataSet: TDataSet);
begin
  If ( mensagem('Deseja mesmo excluir o Registro?') <> Idyes ) then
    Abort;
end;

procedure TfrmDataModule.IBTableAlunosBeforePost(DataSet: TDataSet);
begin
  if frmGerenciarCadastroAlunos.DBEdit6.Text = '' then
  begin
    Application.MessageBox('Campo matrícula deve conter um valor!', ' Atenção!', mb_IconInformation);
    Abort;
  end;
  if frmGerenciarCadastroAlunos.DBEdit2.Text = '' then
  begin
    Application.MessageBox('Campo Nome é obrigátório!', ' Atenção!', mb_IconInformation);
    Abort;
  end;
  if frmGerenciarCadastroAlunos.ComboBoxTurma.Text = '' then
  begin
    Application.MessageBox('Campo Turma é obrigátório!', ' Atenção!', mb_IconInformation);
    Abort;
  end;

  if IBTableAlunos.State = dsInsert then  // Verifica se a matricula existe somente quando inserindo um novo registro  ----
  begin
    with IBQueryMatricula do
    begin
      Active := false;

      SQL.Clear;
      SQL.Add('SELECT COUNT(*) as "qtd" FROM "alunos" "a" WHERE("a"."matricula" = :matricula)');
      ParamByName('matricula').AsInteger := StrToInt(frmGerenciarCadastroAlunos.DBEdit6.Text);

      Active := true;


      if IBQueryMatriculaqtd.Value > 0 then
      begin
        Application.MessageBox('Número de matrícula já existe!', ' Atenção!', mb_IconInformation);
        Abort;
      end;
    end;
  end;  //--------


  if IBTableAlunos.State = dsInsert then
    semaforo := 1
  else semaforo := 0;
end;

procedure TfrmDataModule.IBTableTurmasAfterPost(DataSet: TDataSet);
begin
  if semaforo = 1 then
  begin
    IBTableTurmas.Refresh;
    IBTableTurmas.Last;
  end;
end;

procedure TfrmDataModule.IBTableTurmasBeforeDelete(DataSet: TDataSet);
begin
  If ( mensagem('Deseja mesmo excluir o Registro?') <> Idyes ) then
    Abort;
end;

procedure TfrmDataModule.IBTableTurmasBeforePost(DataSet: TDataSet);
begin
  if IBTableTurmas.State = dsInsert then
    semaforo := 1
  else semaforo := 0;
end;

procedure TfrmDataModule.IBTableUsuariosAfterPost(DataSet: TDataSet);
begin
  if semaforo = 1 then
  begin
    IBTableUsuarios.Refresh;
    IBTableUsuarios.Last;
  end;
end;

procedure TfrmDataModule.IBTableUsuariosBeforePost(DataSet: TDataSet);
begin
  if IBTableUsuarios.State = dsInsert then
    semaforo := 1
  else semaforo := 0;
end;

end.
