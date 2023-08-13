unit ucadproduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  StdCtrls, Buttons, ZDataset, DB;

type

  { TfrmCadastroProduto }

  TfrmCadastroProduto = class(TForm)
    brnInserirProduto: TButton;
    btnAlterarProduto: TButton;
    btnExcluirProduto: TButton;
    DBGrid2: TDBGrid;
    EditBuscaProdutos: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    qryUltimaChaveProduto: TZQuery;
    qryUltimaChaveProdutoADD: TLargeintField;
    procedure brnInserirProdutoClick(Sender: TObject);
    procedure btnAlterarProdutoClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure EditBuscaProdutosChange(Sender: TObject);

  private

  public

  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

uses uDataModule, uedicaoProduto;

{$R *.lfm}

{ TfrmCadastroProduto }


procedure TfrmCadastroProduto.btnAlterarProdutoClick(Sender: TObject);
begin

  if DataModule1.tb_produtos.IsEmpty then
  begin
    with DataModule1 do
    begin
      tb_produtos.Insert;
      tb_produtosCHAVE.Value := qryUltimaChaveProdutoADD.Value;
    end;

  end;
  DataModule1.tb_produtos.Edit;
  frmEdicaoProduto := TfrmEdicaoProduto.Create(Self);
  frmEdicaoProduto.ShowModal;

end;

procedure TfrmCadastroProduto.btnExcluirProdutoClick(Sender: TObject);
begin
  if not DataModule1.tb_produtos.IsEmpty then
  begin
    if application.messagebox('Deseja excluir este Registro?',
      '***Atenção***', 36) = 6 then
    begin
      with DataModule1.tb_produtos do
      begin
        Delete;
        Refresh;
        First;
        ApplyUpdates;
      end;

    end;
  end;

end;

procedure TfrmCadastroProduto.EditBuscaProdutosChange(Sender: TObject);
begin
  with DataModule1 do
  begin
    tb_produtos.Filtered := True;
    tb_produtos.Filter := 'Descricao Like' + QuotedStr('*' + EditBuscaProdutos.Text + '*');
  end;
end;

procedure TfrmCadastroProduto.brnInserirProdutoClick(Sender: TObject);
begin
  qryUltimaChaveProduto.Close;
   DataModule1.tb_produtos.Insert;
  qryUltimaChaveProduto.Open;

  DataModule1.tb_produtosCHAVE.Value := qryUltimaChaveProdutoADD.Value;
  frmEdicaoProduto := TfrmEdicaoProduto.Create(Self);

  frmEdicaoProduto.BorderIcons := BorderIcons - [biSystemMenu, biMinimize, biMaximize];
  frmEdicaoProduto.ShowModal;


end;

end.
