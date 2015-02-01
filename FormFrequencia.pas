unit FormFrequencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGDIPlusClasses, ExtCtrls, IBDatabase, DB, ExtDlgs, StdCtrls, INIFiles, UmensagemConfirm,
  IBCustomDataSet, IBQuery, DBCtrls, ComCtrls, DateUtils, Jpeg, PNGImage;

type
  TfrmFrequencia = class(TForm)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    foto: TImage;
    Label1: TLabel;
    txtMatricula: TEdit;
    Label4: TLabel;
    IBQuery: TIBQuery;
    DBText1: TDBText;
    DataSource: TDataSource;
    Label5: TLabel;
    Label7: TLabel;
    DBText3: TDBText;
    Label8: TLabel;
    DBText4: TDBText;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    IBQueryEntrada: TIBQuery;
    IBQuerySaida: TIBQuery;
    lblAviso: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    lblAviso2: TLabel;
    IBQueryEntradaid: TIntegerField;
    IBQueryEntradaaluno_id: TIntegerField;
    IBQuerySaidaid: TIntegerField;
    IBQuerySaidaaluno_id: TIntegerField;
    IBQuerynome: TIBStringField;
    IBQueryfoto: TIBStringField;
    IBQueryturma: TIBStringField;
    IBQueryturno: TIBStringField;
    IBQueryEntradadata: TDateField;
    IBQueryEntradahora: TTimeField;
    IBQuerySaidadata: TDateField;
    IBQuerySaidahora: TTimeField;
    IBQuerydata_nasc: TDateField;
    procedure txtMatriculaEnter(Sender: TObject);
    procedure txtMatriculaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtMatriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
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

  if not self.findAluno(StrToInt(self.txtMatricula.Text)) then
    Application.MessageBox('Não foi possível encontrar o aluno!', ' Atenção!', mb_IconInformation)
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
        if MinutesBetween(IBQueryEntradahora.AsDateTime, TimeOf(now)) < 30  then
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
          with IBQuerySaida do
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
      with IBQuerySaida do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO "entrada" VALUES(null, (SELECT "id" FROM "alunos" "a" WHERE("a"."matricula" = :matricula)), CURRENT_DATE, CURRENT_TIME)');
        ParamByName('matricula').AsInteger := StrToInt(self.txtMatricula.Text);
        ExecSQL;
      end;
    end;
  end;
  txtMatricula.Clear;
end;

function TfrmFrequencia.findAluno(matricula: Integer): bool;
begin
  with IBQuery do
  begin
    Active := false;
    SQL.Clear;
    SQL.Add('SELECT "a"."nome", "a"."foto", "a"."data_nasc", "t"."turma", "t"."turno" FROM "alunos" "a", "turmas" "t" WHERE("a"."turma_id" = "t"."id" AND "a"."matricula" = :matricula)');
    ParamByName('matricula').AsString := matricula;
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
  with IBQueryEntrada do
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
  with IBQuerySaida do
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
  try
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
  end;
  frmFrequencia.Color := RGB(230, 231, 232);
end;

procedure TfrmFrequencia.loadFotoAluno;
begin
  try
    self.foto.Picture.LoadFromFile(IBQueryfoto.AsString);
  except
    Application.MessageBox('Não foi possível encontrar a imagem cadastrada!', 'Atenção!', mb_IconInformation);
    self.foto.Picture := nil;
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
    //VK_F2     : self.Close;
    VK_F1     : self.showFormSobre;
    VK_RETURN : self.buscarAluno;
    VK_ESCAPE : self.Close;
  end;
end;

end.
