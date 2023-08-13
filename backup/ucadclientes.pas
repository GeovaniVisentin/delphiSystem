unit uCadClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls, Buttons, ZDataset, DB, TAGraph;

type

  { TfrmCadastroClientes }

  TfrmCadastroClientes = class(TForm)
    DBGrid1: TDBGrid;
    EditBusca: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnInserir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnConsultar: TSpeedButton;
    qryUltimaChaveCliente: TZQuery;
    qryUltimaChaveClienteADD: TLargeintField;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure EditBuscaChange(Sender: TObject);
  private

  public

  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

uses uDataModule, ufrmEdicaoCliente;

{$R *.lfm}



{ TfrmCadastroClientes }

procedure TfrmCadastroClientes.btnInserirClick(Sender: TObject);
begin
  qryUltimaChaveCliente.Close;
  qryUltimaChaveCliente.Open;

  with DataModule1 do
  begin
    tb_Clientes.Open;
    tb_Clientes.Insert;
    tb_ClientesCHAVE.Value := qryUltimaChaveClienteADD.Value;
  end;

  frmEdicaoCliente := TfrmEdicaoCliente.Create(Self);
  frmEdicaoCliente.BorderIcons := BorderIcons - [biSystemMenu, biMinimize, biMaximize];
  frmEdicaoCliente.ShowModal;

end;

procedure TfrmCadastroClientes.EditBuscaChange(Sender: TObject);
begin
  with DataModule1 do
  begin
    tb_Clientes.Filtered := True;
    tb_Clientes.Filter := 'Nome Like' + QuotedStr('*' + EditBusca.Text + '*');
  end;

end;

procedure TfrmCadastroClientes.btnAlterarClick(Sender: TObject);
begin

  if DataModule1.tb_Clientes.IsEmpty then
  begin
    with DataModule1 do
    begin
      tb_Clientes.Insert;
      tb_ClientesCHAVE.Value := qryUltimaChaveClienteADD.Value;
    end;

  end;
  DataModule1.tb_Clientes.Edit;
  frmEdicaoCliente := TfrmEdicaoCliente.Create(Self);
  frmEdicaoCliente.BorderIcons := BorderIcons - [biSystemMenu, biMinimize, biMaximize];
  frmEdicaoCliente.ShowModal;


end;

procedure TfrmCadastroClientes.btnExcluirClick(Sender: TObject);
begin

  if not DataModule1.tb_Clientes.IsEmpty then
  begin
    if application.messagebox('Deseja excluir este Registro?',
      '***Atenção***', 36) = 6 then
    begin
      with DataModule1 do
      begin
        tb_Clientes.Delete;
        tb_Clientes.Refresh;
        tb_Clientes.First;
        tb_Clientes.ApplyUpdates;
      end;

    end;
  end;
end;

end.
