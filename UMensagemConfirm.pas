unit UmensagemConfirm;

interface
function mensagem(corpo: string): integer;

implementation
uses
 Messages, Controls, Dialogs, FMTBcd, StdCtrls, Buttons, Forms;

function mensagem(corpo: string): integer;
var
  mensagem : TForm;
begin
  mensagem := CreateMessageDialog(''+corpo+'', mtConfirmation, [mbYes, mbNo]);
  (mensagem.FindComponent('YES') as TButton).Caption := 'Sim';
  (mensagem.FindComponent('NO') as TButton).Caption := 'Não';
  mensagem.Caption := 'Atenção!';
  mensagem.Position := poMainFormCenter;
  result := mensagem.ShowModal;
end;

end.
 