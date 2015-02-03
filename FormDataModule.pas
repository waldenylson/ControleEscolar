unit FormDataModule;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBDatabase, IBTable, Dialogs, Forms,
  IBQuery, inifiles, UMensagemConfirm, Windows, WideStrings,
  FMTBcd, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Comp.Client, UniProvider, MySQLUniProvider, MemDS, DBAccess, Uni;

type
  TfrmDataModule = class(TDataModule)
    DataSourceListTurmas: TDataSource;
    DataSourceEmpresas: TDataSource;
    DataSourceAutoComplete: TDataSource;
    UniConnection: TUniConnection;
    tbAlunos: TUniTable;
    tbTurmas: TUniTable;
    tbUsuarios: TUniTable;
    tbEmpresas: TUniTable;
    tbFeriados: TUniTable;
    MySQLProvider: TMySQLUniProvider;
    tbAlunosid: TIntegerField;
    tbAlunosturma_id: TIntegerField;
    tbAlunosmatricula: TIntegerField;
    tbAlunosnome: TStringField;
    tbAlunosrg: TStringField;
    tbAlunosdata_nasc: TStringField;
    tbAlunossexo: TStringField;
    tbAlunosendereco: TStringField;
    tbAlunosbairro: TStringField;
    tbAlunoscidade: TStringField;
    tbAlunosfone: TStringField;
    tbAlunosfoto: TStringField;
    tbTurmasid: TIntegerField;
    tbTurmasturma: TStringField;
    tbTurmasturno: TStringField;
    tbUsuariosid_usuario: TIntegerField;
    tbUsuarioslogin: TStringField;
    tbUsuariossenha: TStringField;
    tbUsuariosusuario: TStringField;
    tbEmpresasid: TIntegerField;
    tbEmpresasNome: TStringField;
    tbEmpresasRazaoSocial: TStringField;
    tbEmpresasEmail: TStringField;
    tbEmpresashome: TStringField;
    tbEmpresascnpj: TStringField;
    tbEmpresasendereco: TStringField;
    tbEmpresasestado: TStringField;
    tbEmpresascidade: TStringField;
    tbEmpresasbairro: TStringField;
    tbEmpresascep: TStringField;
    tbEmpresasfone1: TStringField;
    tbEmpresasfone2: TStringField;
    tbEmpresasfax: TStringField;
    tbEmpresasNportaria: TStringField;
    tbEmpresasDataPuclicacao: TDateField;
    tbEmpresasMedia: TStringField;
    QueryLogin: TUniQuery;
    QueryMatricula: TUniQuery;
    QueryLoginid_usuario: TIntegerField;
    QueryLoginlogin: TStringField;
    QueryLoginsenha: TStringField;
    QueryLoginusuario: TStringField;
    QueryMatriculaqtd: TLargeintField;
    QueryAutoComplete: TUniQuery;
    QueryAutoCompleteid: TIntegerField;
    QueryAutoCompletenome: TStringField;
    QueryAutoCompletematricula: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbUsuariosAfterPost(DataSet: TDataSet);
    procedure tbUsuariosBeforePost(DataSet: TDataSet);
    procedure tbAlunosAfterPost(DataSet: TDataSet);
    procedure tbAlunosAfterCancel(DataSet: TDataSet);
    procedure tbAlunosBeforeDelete(DataSet: TDataSet);
    procedure tbAlunosBeforePost(DataSet: TDataSet);
    procedure tbTurmasAfterPost(DataSet: TDataSet);
    procedure tbTurmasBeforeDelete(DataSet: TDataSet);
    procedure tbTurmasBeforePost(DataSet: TDataSet);
    procedure tbUsuariosBeforeDelete(DataSet: TDataSet);
    procedure tbEmpresasBeforeDelete(DataSet: TDataSet);
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
  {try
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
  end;  }
end;

procedure TfrmDataModule.tbAlunosAfterCancel(DataSet: TDataSet);
begin
  frmGerenciarCadastroAlunos.foto.Picture := nil;
end;

procedure TfrmDataModule.tbAlunosAfterPost(DataSet: TDataSet);
begin
  if semaforo = 1 then
  begin
    tbAlunos.Refresh;
    tbAlunos.Last;
  end;
end;

procedure TfrmDataModule.tbAlunosBeforeDelete(DataSet: TDataSet);
begin
  If ( mensagem('Deseja mesmo excluir o Registro?') <> Idyes ) then
    Abort;
end;

procedure TfrmDataModule.tbAlunosBeforePost(DataSet: TDataSet);
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

  if tbAlunos.State = dsInsert then  // Verifica se a matricula existe somente quando inserindo um novo registro  ----
  begin
    with QueryMatricula do
    begin
      Active := false;

      SQL.Clear;
      SQL.Add('SELECT COUNT(*) as "qtd" FROM "alunos" "a" WHERE("a"."matricula" = :matricula)');
      ParamByName('matricula').AsInteger := StrToInt(frmGerenciarCadastroAlunos.DBEdit6.Text);

      Active := true;


      if QueryMatriculaqtd.Value > 0 then
      begin
        Application.MessageBox('Número de matrícula já existe!', ' Atenção!', mb_IconInformation);
        Abort;
      end;
    end;
  end;  //--------


  if tbAlunos.State = dsInsert then
    semaforo := 1
  else semaforo := 0;
end;

procedure TfrmDataModule.tbEmpresasBeforeDelete(DataSet: TDataSet);
begin
  If ( mensagem('Deseja mesmo excluir o Registro?') <> Idyes ) then
    Abort;
end;

procedure TfrmDataModule.tbTurmasAfterPost(DataSet: TDataSet);
begin
  if semaforo = 1 then
  begin
    tbTurmas.Refresh;
    tbTurmas.Last;
  end;
end;

procedure TfrmDataModule.tbTurmasBeforeDelete(DataSet: TDataSet);
begin
  If ( mensagem('Deseja mesmo excluir o Registro?') <> Idyes ) then
    Abort;
end;

procedure TfrmDataModule.tbTurmasBeforePost(DataSet: TDataSet);
begin
  if tbTurmas.State = dsInsert then
    semaforo := 1
  else semaforo := 0;
end;

procedure TfrmDataModule.tbUsuariosAfterPost(DataSet: TDataSet);
begin
   if semaforo = 1 then
  begin
    tbUsuarios.Refresh;
    tbUsuarios.Last;
  end;
end;

procedure TfrmDataModule.tbUsuariosBeforeDelete(DataSet: TDataSet);
begin
  If ( mensagem('Deseja mesmo excluir o Registro?') <> Idyes ) then
    Abort;
end;

procedure TfrmDataModule.tbUsuariosBeforePost(DataSet: TDataSet);
begin
  if tbUsuarios.State = dsInsert then
    semaforo := 1
  else semaforo := 0;
end;

end.
