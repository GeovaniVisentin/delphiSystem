unit uMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons, ZDataset, DB;

type

  { TfrmMenu }

  TfrmMenu = class(TForm)
    btnPDV: TSpeedButton;
    btnPDV1: TSpeedButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Panel1: TPanel;
    btnCadastroClientes: TSpeedButton;
    qryUltimaChaveVendaADD: TLargeintField;
    Sair: TMainMenu;
    btnCadastroProdutos: TSpeedButton;
    qryUltimaChaveVenda: TZQuery;
    procedure btnCadastroClientesClick(Sender: TObject);
    procedure btnPDV1Click(Sender: TObject);
    procedure btnPDVClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure btnCadastroProdutosClick(Sender: TObject);
  private

  public

  end;

var
  frmMenu: TfrmMenu;

implementation

uses ucadClientes, uDataModule, uCadProduto, updv, uContasaReceber;

{$R *.lfm}

{ TfrmMenu }

procedure TfrmMenu.MenuItem2Click(Sender: TObject);
begin
  frmCadastroClientes := TfrmCadastroClientes.Create(Self);
  frmCadastroClientes.ShowModal;

end;

procedure TfrmMenu.MenuItem3Click(Sender: TObject);
begin
  frmCadastroProduto := TfrmCadastroProduto.Create(Self);
  frmCadastroProduto.ShowModal;
end;

procedure TfrmMenu.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMenu.btnCadastroProdutosClick(Sender: TObject);
begin
  frmCadastroProduto := TfrmCadastroProduto.Create(Self);
  frmCadastroProduto.ShowModal;

end;

procedure TfrmMenu.btnCadastroClientesClick(Sender: TObject);
begin
  frmCadastroClientes := TfrmCadastroClientes.Create(Self);
  frmCadastroClientes.ShowModal;

end;

procedure TfrmMenu.btnPDV1Click(Sender: TObject);
begin
  frmContasaReceber := TfrmContasaReceber.Create(Self);
  frmContasaReceber.ShowModal;
end;

procedure TfrmMenu.btnPDVClick(Sender: TObject);
begin
  qryUltimaChaveVenda.Close;
  qryUltimaChaveVenda.Open;
  DataModule1.tb_venda.Insert;
  DataModule1.tb_vendaCHAVE.Value := qryUltimaChaveVendaADD.Value;
  DataModule1.tb_vendaDATA.Value := Date;
  DataModule1.tb_vendaHORARIO.Value := Time;
  DataModule1.tb_vendaNUMERO.Value := qryUltimaChaveVendaADD.Value;

  frmPdv := TfrmPdv.Create(Self);
  frmPdv.BorderIcons := BorderIcons - [biSystemMenu, biMinimize, biMaximize];
  frmPdv.ShowModal;


  DataModule1.tb_itemVenda.Close;
  DataModule1.tb_itemVenda.Open;
  //DataModule1.tb_itemVenda.Edit;
  DataModule1.tb_Venda.Insert;

end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin

    DataModule1.tb_produtos.Open;
    DataModule1.tb_Clientes.Open;
    DataModule1.tb_venda.Open;
    DataModule1.tb_itemVenda.Open;
    DataModule1.tb_contaAReceber.Open;
    DataModule1.tb_itemVenda.Insert;

end;

end.
