unit uProcuraClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  DBCtrls, ZDataset;

type

  { TfrmProcuraClientes }

  TfrmProcuraClientes = class(TForm)
    btnBuscarClientes: TButton;
    DGMostraClientes: TDBGrid;
    eProcuraClientes: TEdit;
    qryProcuraClientes: TZQuery;
    procedure btnBuscarClientesClick(Sender: TObject);
    procedure eProcuraClientesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmProcuraClientes: TfrmProcuraClientes;

implementation

uses uDataModule;
{$R *.lfm}

{ TfrmProcuraClientes }

procedure TfrmProcuraClientes.FormCreate(Sender: TObject);
begin

end;

procedure TfrmProcuraClientes.eProcuraClientesChange(Sender: TObject);
begin

end;

procedure TfrmProcuraClientes.btnBuscarClientesClick(Sender: TObject);
begin
  qryProcuraClientes.Open;

end;


end.

