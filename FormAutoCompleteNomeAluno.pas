unit FormAutoCompleteNomeAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TfrmAutoCompleteNomeAluno = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    var texto:string;
  public
    { Public declarations }
  end;

var
  frmAutoCompleteNomeAluno: TfrmAutoCompleteNomeAluno;

implementation
uses FormDataModule;

{$R *.dfm}

procedure TfrmAutoCompleteNomeAluno.DBGrid1DblClick(Sender: TObject);
begin
  frmDataModule.IBTableAlunos.Locate('id', frmDataModule.IBQueryAutoCompleteid.Value, []);
  self.Close;
end;

procedure TfrmAutoCompleteNomeAluno.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
    begin
      frmDataModule.IBTableAlunos.Locate('id', frmDataModule.IBQueryAutoCompleteid.Value, []);
      self.Close;
    end;
    if key = #27  then
      self.Close;
end;

procedure TfrmAutoCompleteNomeAluno.Edit1Change(Sender: TObject);
begin
  with frmDataModule.IBQueryAutoComplete do
    begin
      Active := false;
      SQL.Clear;
      SQL.Add('select distinct "a"."id", "a"."nome", "a"."matricula" from "alunos" "a" where "a"."nome" like :descricao');
      ParamByName('descricao').AsString:= '%'+edit1.Text+'%';
      Active := true;
      First;
    end;
end;

procedure TfrmAutoCompleteNomeAluno.Edit1Enter(Sender: TObject);
begin
  edit1.Color := clMoneyGreen;
end;

procedure TfrmAutoCompleteNomeAluno.Edit1Exit(Sender: TObject);
begin
  Edit1.Color := clWindow;
end;

procedure TfrmAutoCompleteNomeAluno.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  begin
    if (key = #13) then
    begin
      frmDataModule.IBTableAlunos.Locate('id', frmDataModule.IBQueryAutoCompleteid.Value, []);
      self.Close;
    end;
    if key = #27  then
      self.Close;

  end;
end;

end.
