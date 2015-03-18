unit FormFrequencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IBDatabase, DB, ExtDlgs, StdCtrls, INIFiles, UmensagemConfirm,
  IBCustomDataSet, IBQuery, DBCtrls, ComCtrls, DateUtils, Jpeg, PNGImage,
  UniProvider, MySQLUniProvider, MemDS, DBAccess, Uni;

type
  TfrmFrequencia = class(TForm)
    DataSource: TDataSource;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Connection: TUniConnection;
    QueryEntrada: TUniQuery;
    MySQLProvider: TMySQLUniProvider;
    QuerySaida: TUniQuery;
    QueryEntradaid: TIntegerField;
    QueryEntradaaluno_id: TIntegerField;
    QueryEntradadata: TDateField;
    QueryEntradahora: TTimeField;
    QuerySaidaid: TIntegerField;
    QuerySaidaaluno_id: TIntegerField;
    QuerySaidadata: TDateField;
    QuerySaidahora: TTimeField;
    Query: TUniQuery;
    Querynome: TStringField;
    Queryfoto: TStringField;
    Querydata_nasc: TStringField;
    Queryturma: TStringField;
    Queryturno: TStringField;
    lblAviso: TLabel;
    lblAviso2: TLabel;
    TimerLimpaTela: TTimer;
    lblAviso3: TLabel;
    Image2: TImage;
    txtMatricula: TEdit;
    DBText1: TDBText;
    DBText3: TDBText;
    foto: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    DBText4: TDBText;
    lblData: TLabel;
    lblHora: TLabel;
    procedure txtMatriculaEnter(Sender: TObject);
    procedure txtMatriculaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtMatriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerLimpaTelaTimer(Sender: TObject);
  private
    { Private declarations }
    procedure showFormSobre;
    function findAluno(matricula:Integer):bool;
    function findAlunoEntrada(matricula:Integer):bool;
    function findAlunoSaida(matricula:Integer):bool;
    procedure loadFotoAluno;

  public
    { Public declarations }
    procedure buscarAluno;
  end;

var
  frmFrequencia: TfrmFrequencia;

implementation

uses FormSobre;

{$R *.dfm}

procedure TfrmFrequencia.buscarAluno;
begin
  self.lblAviso2.Visible := false;
  self.lblAviso3.Visible := false;

  try
    if not self.findAluno(StrToInt(self.txtMatricula.Text)) then
    begin
      //Application.MessageBox('Não foi possível encontrar o aluno!', ' Atenção!', mb_IconInformation)
      lblAviso3.Caption := 'Não foi possível encontrar o aluno!';
      lblAviso3.Visible := true;
    end
    else
    begin
      if findAlunoEntrada(StrToInt(self.txtMatricula.Text)) then //aluno já entrou
      begin
        if findAlunoSaida(StrToInt(self.txtMatricula.Text)) then  //aluno já saiu
        begin
          self.lblAviso.Caption  := 'SAÍDA JÁ EFETUADA!';
          self.lblAviso2.Caption := 'REGISTRO DE ENTRADA JÁ EFETUADO PARA ESTA DATA!';
          self.lblAviso.Visible  := true;
          self.lblAviso2.Visible := true;
        end
        else
        begin // verifica tempo de entrada
          if MinutesBetween(QueryEntradahora.AsDateTime, TimeOf(now)) < 30  then
          begin
            self.lblAviso.Caption  := 'SAÍDA NÃO LIBERADA!';
            self.lblAviso2.Caption := '         ENTRADA REGISTRADA A MENOS DE 30 MINUTOS!';
            self.lblAviso.Visible  := true;
            self.lblAviso2.Visible := true;
          end
          else
          begin
            self.lblAviso.Caption := 'SAÍDA LIBERADA!';
            self.lblAviso.Visible := true;
            self.lblData.Caption  := FormatDateTime('dd/mm/yyyy', Now());
            self.lblHora.Caption  := FormatDateTime('hh:nn:ss',Now());
            with QuerySaida do
            begin
              SQL.Clear;
              SQL.Add('INSERT INTO "saida" VALUES(null, (SELECT "id" FROM "alunos" "a" WHERE("a"."matricula" = :matricula)), CURRENT_DATE, CURRENT_TIME)');
              ParamByName('matricula').AsInteger := StrToInt(self.txtMatricula.Text);
              ExecSQL;
            end;
          end;
        end;
      end
      else  //alunos ainda nao entrou
      begin
        self.lblAviso.Caption := 'ENTRADA LIBERADA!';
        self.lblAviso.Visible := true;
        self.lblData.Caption  := FormatDateTime('dd/mm/yyyy', Now());
        self.lblHora.Caption  := FormatDateTime('hh:nn:ss',Now());
        with QuerySaida do
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO "entrada" VALUES(null, (SELECT "id" FROM "alunos" "a" WHERE("a"."matricula" = :matricula)), CURRENT_DATE, CURRENT_TIME)');
          ParamByName('matricula').AsInteger := StrToInt(self.txtMatricula.Text);
          ExecSQL;
        end;
      end;
    end;
  except
  end;
  TimerLimpaTela.Enabled := true;
end;

function TfrmFrequencia.findAluno(matricula: Integer): bool;
begin
  with Query do
  begin
    Active := false;
    SQL.Clear;
    SQL.Add('SELECT "a"."nome", "a"."foto", "a"."data_nasc", "t"."turma", "t"."turno" FROM "alunos" "a", "turmas" "t" WHERE("a"."turma_id" = "t"."id" AND "a"."matricula" = :matricula)');
    ParamByName('matricula').AsInteger := matricula;
    Active := true;

    if RecordCount = 0 then
      Result := false
    else
      Result := true;
  end;
  self.loadFotoAluno;
end;

function TfrmFrequencia.findAlunoEntrada(matricula: Integer): bool;
begin
  self.lblAviso.Visible := false;
  with QueryEntrada do
  begin
    Active := false;
    SQL.Clear;
    SQL.Add('SELECT * FROM "entrada" "e" WHERE("e"."data" = CURRENT_DATE AND "e"."aluno_id" = (SELECT "id" FROM "alunos" "a" WHERE("a"."matricula" = :matricula)))');
    ParamByName('matricula').AsInteger := matricula;
    Active := true;

    if RecordCount = 0 then
      Result := false
    else
      Result := true;
  end;
end;

function TfrmFrequencia.findAlunoSaida(matricula: Integer): bool;
begin
  self.lblAviso.Visible := false;
  with QuerySaida do
  begin
    Active := false;
    SQL.Clear;
    SQL.Add('SELECT * FROM "saida" "s" WHERE("s"."data" = CURRENT_DATE AND "s"."aluno_id" = (SELECT "id" FROM "alunos" "a" WHERE("a"."matricula" = :matricula)))');
    ParamByName('matricula').AsInteger := matricula;
    Active := true;

    if RecordCount = 0 then
      Result := false
    else
      Result := true;
  end;
end;

procedure TfrmFrequencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If ( mensagem('Deseja mesmo Sair do Sistema?') <> Idyes ) then
    Abort
  else
    Application.Terminate;
end;

procedure TfrmFrequencia.FormCreate(Sender: TObject);
var iniFile: TIniFile;
begin
     Self.Connection.Connected := true;

     self.lblData.Caption  := '';
     self.lblHora.Caption  := '';

  {try
    iniFile := TIniFile.Create(ExtractFileDir(Application.exeName) + '\Setings.ini');

    with self.IBDatabase do
    begin
      Connected    := false;
      DatabaseName := iniFile.ReadString('database', 'serverIP', '') + ':' + ExtractFilePath(Application.ExeName) + '\DATABASE\Banco.fdb';
      Connected    := true;
    end;

    IBTransaction.Active   := true;

    iniFile.Free;
  except
    ShowMessage('Ocorreu um Erro ao Tentar Conectar com o' + #13 + 'Servidor de Banco de Dados!' + #13 + 'Entre em contato com o suporte técnico!');
    Application.Terminate;
  end;    }
  frmFrequencia.Color := RGB(230, 231, 232);
end;

procedure TfrmFrequencia.loadFotoAluno;
begin
  try
    self.foto.Picture.LoadFromFile(Queryfoto.AsString);
  except
    //Application.MessageBox('Não foi possível encontrar a imagem cadastrada!', 'Atenção!', mb_IconInformation);
    //self.foto.Picture := nil;
    self.foto.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Imagens/avatar.png');
  end;
end;

procedure TfrmFrequencia.showFormSobre;
begin
  frmSobre := TfrmSobre.Create(Application);
  try
    frmSobre.ShowModal;
  finally
    frmSobre.Release;
    frmSobre.Free;
  end;
end;

procedure TfrmFrequencia.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := FormatDateTime('dddd ", " dd " de " mmmm " de " yyyy',Now());
  StatusBar1.Panels[1].Text := TimeToStr(Time);
  StatusBar1.Panels[1].Text := FormatDateTime('hh":"nn":"ss"',Now());
end;

procedure TfrmFrequencia.TimerLimpaTelaTimer(Sender: TObject);
begin
  txtMatricula.Clear;
  DBText1.Caption   := '';
  DBText3.Caption   := '';
  DBText4.Caption   := '';
  lblAviso.Caption  := '';
  lblAviso2.Caption := '';
  lblAviso3.Caption := '';
  lblData.Caption   := '';
  lblHora.Caption   := '';

  TimerLimpaTela.Enabled := false;
end;

procedure TfrmFrequencia.txtMatriculaEnter(Sender: TObject);
begin
  txtMatricula.Color := clMoneyGreen;
end;

procedure TfrmFrequencia.txtMatriculaExit(Sender: TObject);
begin
  txtMatricula.Color := clWindow;
end;

procedure TfrmFrequencia.txtMatriculaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1     : self.showFormSobre;
    VK_RETURN : self.buscarAluno;
    VK_ESCAPE : self.Close;
  end;
end;

end.
