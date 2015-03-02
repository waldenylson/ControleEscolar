unit FormSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellApi;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {frmSobre.Release;
  frmSobre := nil;
  frmSobre.Free;}
end;

procedure TfrmSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of

    VK_ESCAPE : self.Close;
  end;
end;

procedure TfrmSobre.Label3Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.ws-systemas.com.br'), nil, nil, SW_SHOWNORMAL);
end;

end.
