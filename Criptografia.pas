unit Criptografia;

interface
  function cript(x:string):string;
  function decript(x:string):string;

implementation


function cript(x:string):string;
var   i: byte;
    aux: string;
begin
  cript := '';
    aux := '';
  for i := 1 to length(x) do
  begin
  x[i] := chr(ord(x[i]) + 2);
   aux := aux + x[i];
  end;
  cript := aux;
end;

function decript(x:string):string;
var   i: byte;
    aux: string;
begin
  decript := '';
      aux := '';
  for i := 1 to length(x) do
  begin
    x[i] := chr(ord(x[i]) - 2);
     aux := aux + x[i];
  end;
  decript := aux;
end;

end.
