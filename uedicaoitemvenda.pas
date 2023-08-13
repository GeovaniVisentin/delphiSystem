unit uEdicaoItemVenda;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons, ExtCtrls, ZDataset, DB;

type

  { TfrmEdicaoItemVenda }

  TfrmEdicaoItemVenda = class(TForm)
    dbEditProduto: TDBEdit;
    dbEditPrecoUnit: TDBEdit;
    dbEditQTDE: TDBEdit;
    dbEditValorTotal: TDBEdit;
    dbLookupComboBoxDescricao: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbEditPrecoUnitChange(Sender: TObject);
    procedure dbEditProdutoExit(Sender: TObject);
    procedure dbEditPrecoUnitExit(Sender: TObject);
    procedure dbEditQTDEExit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure dbLookupComboBoxDescricaoChange(Sender: TObject);
    procedure FormClose(Sender: TObject);
  private

  public

  end;

var
  frmEdicaoItemVenda: TfrmEdicaoItemVenda;

implementation

uses updv ,uDataModule;

{$R *.lfm}

{ TfrmEdicaoItemVenda }

procedure TfrmEdicaoItemVenda.FormClose(Sender: TObject);
begin

  DataModule1.tb_itemVenda.Cancel;
  DataModule1.tb_itemVenda.Close;
   DataModule1.tb_itemVenda.Open;
  DataModule1.tb_itemVenda.LinkedFields := '';
  DataModule1.tb_itemVenda.ApplyUpdates;
  frmEdicaoItemVenda.Close;

end;

procedure TfrmEdicaoItemVenda.btnSalvarClick(Sender: TObject);
begin

  {if frmPdv.DBGrid1.Columns.ColumnByFieldname('CHAVE_PRODUTO') and
  frmPdv.DBGrid1.Columns.ColumnByFieldname('DESCRICAO') and
  frmPdv.DBGrid1.Columns.ColumnByFieldname('PRECO_UNITARIO') and
  frmPdv.DBGrid1.Columns.ColumnByFieldname('QUANTIDADE') and
  frmPdv.DBGrid1.Columns.ColumnByFieldname('VALOR_TOTAL') = '' then
  begin
    btnSalvar.Enabled:= false;
  end;    }
    with DataModule1.tb_itemVenda do
    begin
      Open;
      Edit;
      Post;
      ApplyUpdates;
    end;
  Close;
end;

procedure TfrmEdicaoItemVenda.dbEditPrecoUnitChange(Sender: TObject);
begin

end;

procedure TfrmEdicaoItemVenda.dbEditProdutoExit(Sender: TObject);
begin
    if (DataModule1.tb_produtos.Locate('CHAVE', DataModule1.tb_itemVendaCHAVE_PRODUTO.Value, [])) then
    begin
      DataModule1.tb_produtos.Locate('CHAVE', DataModule1.tb_itemVendaCHAVE_PRODUTO.Value, []);
      DataModule1.tb_itemVendaPRECO_UNITARIO.Value:= DataModule1.tb_produtosPRECO_VENDA.Value;
      //frmEdicaoItemVenda.qryBuscaPrecoPARAM.Value;
      DataModule1.tb_itemVendaVALOR_TOTAL.Value:= DataModule1.tb_itemVendaPRECO_UNITARIO.Value * DataModule1.tb_itemVendaQUANTIDADE.Value;
    end;
end;
procedure TfrmEdicaoItemVenda.dbEditPrecoUnitExit(Sender: TObject);
begin
   if (DataModule1.tb_produtos.Locate('CHAVE', DataModule1.tb_itemVendaCHAVE_PRODUTO.Value, [])) then
    begin
      DataModule1.tb_produtos.Locate('CHAVE', DataModule1.tb_itemVendaCHAVE_PRODUTO.Value, []);
      DataModule1.tb_itemVendaPRECO_UNITARIO.Value:= DataModule1.tb_produtosPRECO_VENDA.Value;
      if (DataModule1.tb_itemVendaPRECO_UNITARIO.Value = Null) then
       begin
         DataModule1.tb_itemVendaPRECO_UNITARIO.Value:= 0.00;
       end;
      DataModule1.tb_itemVendaVALOR_TOTAL.Value:= DataModule1.tb_itemVendaPRECO_UNITARIO.Value * DataModule1.tb_itemVendaQUANTIDADE.Value;
    end;
end;

procedure TfrmEdicaoItemVenda.dbEditQTDEExit(Sender: TObject);
begin
   if (DataModule1.tb_produtos.Locate('CHAVE', DataModule1.tb_itemVendaCHAVE_PRODUTO.Value, [])) then
    begin
      DataModule1.tb_produtos.Locate('CHAVE', DataModule1.tb_itemVendaCHAVE_PRODUTO.Value, []);
      DataModule1.tb_itemVendaPRECO_UNITARIO.Value:= DataModule1.tb_produtosPRECO_VENDA.Value;
      DataModule1.tb_itemVendaVALOR_TOTAL.Value:= DataModule1.tb_itemVendaPRECO_UNITARIO.Value * DataModule1.tb_itemVendaQUANTIDADE.Value;
    end;
end;
procedure TfrmEdicaoItemVenda.DBLookupComboBox1Exit(Sender: TObject);
begin

     if (DataModule1.tb_produtos.Locate('CHAVE', DataModule1.tb_itemVendaCHAVE_PRODUTO.Value, [])) then
    begin
      DataModule1.tb_produtos.Locate('CHAVE', DataModule1.tb_itemVendaCHAVE_PRODUTO.Value, []);
      DataModule1.tb_itemVendaPRECO_UNITARIO.Value:= DataModule1.tb_produtosPRECO_VENDA.Value;
      DataModule1.tb_itemVendaVALOR_TOTAL.Value:= DataModule1.tb_itemVendaPRECO_UNITARIO.Value * DataModule1.tb_itemVendaQUANTIDADE.Value;
    end;
end;

procedure TfrmEdicaoItemVenda.dbLookupComboBoxDescricaoChange(Sender: TObject);
begin

end;

procedure TfrmEdicaoItemVenda.btnCancelarClick(Sender: TObject);
begin
  DataModule1.tb_itemVenda.Close;
  DataModule1.tb_itemVenda.Open;
  Close;
end;

end.
