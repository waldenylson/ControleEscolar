unit FormGerenciarCadastroAlunos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, DB, StdCtrls, Mask, ImgList, ActnList,
  XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, ActnMenus, ExtCtrls, ExtDlgs,
  Jpeg, PNGImage, Buttons, System.Actions;

type
  TfrmGerenciarCadastroAlunos = class(TForm)
    DBNavigator1: TDBNavigator;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager1: TActionManager;
    fist: TAction;
    prev: TAction;
    next: TAction;
    last: TAction;
    add: TAction;
    del: TAction;
    edit: TAction;
    post: TAction;
    cancel: TAction;
    refresh: TAction;
    sair: TAction;
    about: TAction;
    ImageList1: TImageList;
    TabControl1: TTabControl;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    StatusBar1: TStatusBar;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    ComboBoxTurma: TDBLookupComboBox;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    abreFoto: TOpenPictureDialog;
    GroupBox1: TGroupBox;
    foto: TImage;
    btnSearchAlunos: TBitBtn;
    BitBtn1: TBitBtn;
    procedure fotoDblClick(Sender: TObject);
    procedure aboutExecute(Sender: TObject);
    procedure fistExecute(Sender: TObject);
    procedure prevExecute(Sender: TObject);
    procedure nextExecute(Sender: TObject);
    procedure lastExecute(Sender: TObject);
    procedure addExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure postExecute(Sender: TObject);
    procedure cancelExecute(Sender: TObject);
    procedure refreshExecute(Sender: TObject);
    procedure sairExecute(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure btnSearchAlunosClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciarCadastroAlunos: TfrmGerenciarCadastroAlunos;

implementation

uses FormDataModule, FormSobre, UMensagemConfirm, FormAutoCompleteNomeAluno,
  FormVaParaAluno;


{$R *.dfm}

procedure TfrmGerenciarCadastroAlunos.aboutExecute(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Application);
  try
    frmSobre.ShowModal;
  finally
    frmSobre.Release;
    frmSobre.Free;
  end;
end;

procedure TfrmGerenciarCadastroAlunos.addExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Insert;
end;

procedure TfrmGerenciarCadastroAlunos.BitBtn1Click(Sender: TObject);
begin
  frmVaParaAluno := TfrmVaParaAluno.Create(Application);
  try
    frmVaParaAluno.ShowModal;
  finally
    frmVaParaAluno.Release;
    frmVaParaAluno.Free;
  end;
end;

procedure TfrmGerenciarCadastroAlunos.btnSearchAlunosClick(Sender: TObject);
begin
  frmAutoCompleteNomeAluno := TfrmAutoCompleteNomeAluno.Create(Application);
  try
    frmAutoCompleteNomeAluno.ShowModal;
  finally
    frmAutoCompleteNomeAluno.Release;
    frmAutoCompleteNomeAluno.Free;
  end;
end;

procedure TfrmGerenciarCadastroAlunos.cancelExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Cancel;
end;

procedure TfrmGerenciarCadastroAlunos.DBEdit1Change(Sender: TObject);
begin
  if (frmDataModule.IBTableAlunos.State <> dsInsert) and (frmDataModule.IBTableAlunos.State <> dsEdit) and (frmDataModule.IBTableAlunosfoto.Value <> '') then
  begin
    try
      self.foto.Picture.LoadFromFile(frmDataModule.IBTableAlunosFOTO.Value);
    except
      Application.MessageBox('Não foi possível encontrar a imagem cadastrada!' + #13+
      'Altere a imagem p/ corrigir o problema.', 'Atenção!');
      self.foto.Picture := nil;
    end;
  end;

  if frmDataModule.IBTableAlunosfoto.Value = '' then
    self.foto.Picture := nil;
end;

procedure TfrmGerenciarCadastroAlunos.delExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Delete;
end;

procedure TfrmGerenciarCadastroAlunos.editExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Edit;
end;

procedure TfrmGerenciarCadastroAlunos.fistExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.First;
end;

procedure TfrmGerenciarCadastroAlunos.fotoDblClick(Sender: TObject);
begin
  if ( (frmDataModule.IBTableAlunos.State = dsInsert) OR (frmDataModule.IBTableAlunos.State = dsEdit) )  then
  begin
    if abreFoto.Execute then
    begin
      foto.Picture.LoadFromFile(abreFoto.FileName);
      frmDataModule.IBTableAlunosFOTO.asString := abreFoto.FileName;
    end;
  end;
end;

procedure TfrmGerenciarCadastroAlunos.lastExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Last;
end;

procedure TfrmGerenciarCadastroAlunos.nextExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Next;
end;

procedure TfrmGerenciarCadastroAlunos.postExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Post;
end;

procedure TfrmGerenciarCadastroAlunos.prevExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Prior;
end;

procedure TfrmGerenciarCadastroAlunos.refreshExecute(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Refresh;
end;

procedure TfrmGerenciarCadastroAlunos.sairExecute(Sender: TObject);
begin
  self.Close;
end;

end.
