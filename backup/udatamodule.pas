unit uDataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)

    dsClientes: TDataSource;
    dsItemVenda: TDataSource;
    dsVenda: TDataSource;
    dsContaAReceber: TDataSource;
    dsProdutos: TDataSource;
    tb_ClientesATIVO: TStringField;
    tb_ClientesBAIRRO: TStringField;
    tb_ClientesCEP: TStringField;
    tb_ClientesCHAVE: TLongintField;
    tb_ClientesCIDADE: TStringField;
    tb_ClientesCOMPLEMENTO: TStringField;
    tb_ClientesCPF_CNPJ: TStringField;
    tb_ClientesEMAIL: TStringField;
    tb_ClientesLOGRADOURO: TStringField;
    tb_ClientesNOME: TStringField;
    tb_ClientesNUMERO: TStringField;
    tb_ClientesOBSERVACAO: TStringField;
    tb_ClientesRG_IE: TStringField;
    tb_ClientesSEXO: TStringField;
    tb_ClientesTELEFONE_1: TStringField;
    tb_ClientesTELEFONE_2: TStringField;
    tb_ClientesTIPO_DE_PESSOA: TStringField;
    tb_ClientesUF: TStringField;
    tb_contaAReceberCHAVE: TLongintField;
    tb_contaAReceberCHAVE_CLIENTE: TLongintField;
    tb_contaAReceberCHAVE_VENDA: TLongintField;
    tb_contaAReceberDATA_PAGAMEMTO: TDateField;
    tb_contaAReceberDATA_VENCIMENTO: TDateField;
    tb_contaAReceberFORMA_PGTO: TStringField;
    tb_contaAReceberSTATUS: TStringField;
    tb_contaAReceberVALOR: TFloatField;
    tb_itemVendaCHAVE: TLongintField;
    tb_itemVendaCHAVE_PRODUTO: TLongintField;
    tb_itemVendaCHAVE_VENDA: TLongintField;
    tb_itemVendaPRECO_UNITARIO: TFloatField;
    tb_itemVendaQUANTIDADE: TFloatField;
    tb_itemVendaVALOR_TOTAL: TFloatField;
    tb_produtos: TZTable;
    tb_produtosCHAVE: TLongintField;
    tb_produtosCODIGO_BARRAS: TStringField;
    tb_produtosDESCRICAO: TStringField;
    tb_produtosESTOQUE: TFloatField;
    tb_produtosOBSERVACAO: TStringField;
    tb_produtosPRECO_COMPRA: TFloatField;
    tb_produtosPRECO_VENDA: TFloatField;
    tb_produtosUNIDADE: TStringField;
    tb_vendaCHAVE: TLongintField;
    tb_vendaCHAVE_CLIENTE: TLongintField;
    tb_vendaDATA: TDateField;
    tb_vendaDIA_DO_MES_PRA_VENCER: TLongintField;
    tb_vendaHORARIO: TTimeField;
    tb_vendaNUMERO: TLongintField;
    tb_vendaQUANTIDADE_PARCELAS: TLongintField;
    tb_vendaVALOR_PAGO_ENTRADA: TFloatField;
    tb_vendaVALOR_TOTAL: TFloatField;
    ZConnection1: TZConnection;
    tb_Clientes: TZTable;
    tb_venda: TZTable;
    tb_itemVenda: TZTable;
    tb_contaAReceber: TZTable;
    procedure dsContaAReceberDataChange(Sender: TObject);
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation


{$R *.lfm}

{ TDataModule1 }

procedure TDataModule1.dsContaAReceberDataChange(Sender: TObject);
begin

end;

end.

