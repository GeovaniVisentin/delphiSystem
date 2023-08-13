unit ufrmEdicaoCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, StdCtrls,
  DBCtrls;

type

  { TfrmEdicaoCliente }

  TfrmEdicaoCliente = class(TForm)
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure FormClose(Sender: TObject);
  private

  public

  end;

var
  frmEdicaoCliente: TfrmEdicaoCliente;

implementation

uses uDataModule;

{$R *.lfm}

{ TfrmEdicaoCliente }

procedure TfrmEdicaoCliente.btnSalvarClick(Sender: TObject);
begin
  with DataModule1 do
     begin
     tb_Clientes.Post;
     tb_Clientes.ApplyUpdates;
     Close;

     end;
end;

procedure TfrmEdicaoCliente.DBEdit5Change(Sender: TObject);
begin
  if DataModule1.tb_Clientes.IndexFieldNames = 'j' then
  begin
     frmEdicaoCliente.DBEdit5.Clear;
     frmEdicaoCliente.DBRadioGroup1.SetFocus;
  end;

end;

procedure TfrmEdicaoCliente.DBRadioGroup1Change(Sender: TObject);
begin

    {if DataModule1.tb_Clientes.DataSetField.AsString = 'f' then
  begin
    DataModule1.tb_ClientesCPF_CNPJ.EditMask := '##.###.###/####-##;1;_';

  end
  else if DataModule1.tb_Clientes.DataSetField.AsString = 'j' then
  begin
      DataModule1.tb_ClientesCPF_CNPJ.EditMask := '###.###.###-##;1;_';
  end;  }

end;

procedure TfrmEdicaoCliente.FormClose(Sender: TObject);
begin

  DataModule1.tb_Clientes.LinkedFields:='';
  DataModule1.tb_Clientes.ApplyUpdates;
  Close;


end;

procedure TfrmEdicaoCliente.btnCancelarClick(Sender: TObject);
begin
  DataModule1.tb_Clientes.Cancel;
   Close;
end;

end.
