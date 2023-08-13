unit uContasaReceber;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, DBGrids,
  StdCtrls;

type

  { TfrmContasaReceber }

  TfrmContasaReceber = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  frmContasaReceber: TfrmContasaReceber;

implementation

uses uProcuraClientes;

{$R *.lfm}

{ TfrmContasaReceber }

procedure TfrmContasaReceber.Button1Click(Sender: TObject);
begin
    frmProcuraClientes := TfrmProcuraClientes.Create(Self);
    frmProcuraClientes.ShowModal;
end;

end.

