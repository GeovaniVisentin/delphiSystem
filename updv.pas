unit updv;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons, DBGrids, DBCtrls, StdCtrls, ZDataset, DB;

type

  { TfrmPdv }

  TfrmPdv = class(TForm)
    btnEditarItem: TSpeedButton;
    btnBuscar: TSpeedButton;
    btnExcluirItem: TSpeedButton;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnInserirItem: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    qrySomaItensSUM: TFloatField;
    qryUltimaChaveContaAReceberADD: TLargeintField;
    qryUltimaChaveItemVendaADD: TLargeintField;
    btnGerarParcelas: TSpeedButton;
    btnConcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    qryUltimaChaveItemVenda: TZQuery;
    qryUltimaChaveContaAReceber: TZQuery;
    qrySomaItens: TZQuery;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure btnEditarItemClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnInserirItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
  private

  public

  end;

var
  frmPdv: TfrmPdv;
  inserindo_novo_item: boolean;

implementation

uses uDataModule, uEdicaoItemVenda;

{$R *.lfm}

{ TfrmPdv }

procedure TfrmPdv.btnGerarParcelasClick(Sender: TObject);
var
  valor_parcela: double;
  dia: smallint;
  mes: smallint;
  ano: smallint;
  data_vencimento: string;
  parcelas_lancadas: smallint;
begin
  DataModule1.tb_contaAReceber.First;
  while DataModule1.tb_itemVenda.EOF do
  begin
    DataModule1.tb_contaAReceber.Delete;
    DataModule1.tb_contaAReceber.ApplyUpdates;
  end;
  if (DataModule1.tb_vendaQUANTIDADE_PARCELAS.Value > 0) then
  begin
    valor_parcela := (DataModule1.tb_vendaVALOR_TOTAL.Value -
      DataModule1.tb_vendaVALOR_PAGO_ENTRADA.Value) /
      DataModule1.tb_vendaQUANTIDADE_PARCELAS.Value;
  end;
  if (DataModule1.tb_vendaVALOR_PAGO_ENTRADA.Value > 0) then
  begin
    with DataModule1 do
    begin
      qryUltimaChaveContaAReceber.Close;
      qryUltimaChaveContaAReceber.Open;
      tb_contaAReceber.Insert;
      tb_contaAReceberCHAVE.Value := qryUltimaChaveContaAReceberADD.Value;
      tb_contaAReceberCHAVE_CLIENTE.Value := DataModule1.tb_vendaCHAVE_CLIENTE.Value;
      tb_contaAReceberCHAVE_VENDA.Value := DataModule1.tb_vendaCHAVE.Value;
      tb_contaAReceberDATA_PAGAMEMTO.Value := DataModule1.tb_vendaDATA.Value;
      tb_contaAReceberDATA_VENCIMENTO.Value := DataModule1.tb_vendaDATA.Value;
      tb_contaAReceberSTATUS.Value := 'PAGO';
      tb_contaAReceberVALOR.Value := DataModule1.tb_vendaVALOR_PAGO_ENTRADA.Value;
      tb_contaAReceber.Post;
      tb_contaAReceber.ApplyUpdates;
    end;
  end;

  mes := StrToInt(FormatDateTime('MM', DataModule1.tb_vendaDATA.Value));
  ano := StrToInt(FormatDateTime('YYYY', DataModule1.tb_vendaDATA.Value));

  parcelas_lancadas := 0;
  ;
  while (parcelas_lancadas < DataModule1.tb_vendaQUANTIDADE_PARCELAS.Value) do
  begin
    if (mes = 12) then
    begin
      mes := 1;
      ano := ano + 1;
    end
    else
    begin
      mes := mes + 1;
    end;

    data_vencimento := DataModule1.tb_vendaDIA_DO_MES_PRA_VENCER.AsString +
      '/' + IntToStr(mes) + '/' + IntToStr(ano);
    with DataModule1 do
    begin
      qryUltimaChaveContaAReceber.Close;
      qryUltimaChaveContaAReceber.Open;
      tb_contaAReceber.Insert;
      tb_contaAReceberCHAVE.Value := qryUltimaChaveContaAReceberADD.Value;
      tb_contaAReceberCHAVE_CLIENTE.Value := DataModule1.tb_vendaCHAVE_CLIENTE.Value;
      tb_contaAReceberCHAVE_VENDA.Value := DataModule1.tb_vendaCHAVE.Value;
      tb_contaAReceberDATA_VENCIMENTO.Value := StrToDateTime(data_vencimento);
      tb_contaAReceberSTATUS.Value := 'PENDENTE';
      tb_contaAReceberVALOR.Value := valor_parcela;
      tb_contaAReceber.Post;
      tb_contaAReceber.ApplyUpdates;

      parcelas_lancadas := parcelas_lancadas + 1;
    end;
  end;
end;

procedure TfrmPdv.btnInserirItemClick(Sender: TObject);
begin
  inserindo_novo_item := True;
  qryUltimaChaveItemVenda.Close;
  qryUltimaChaveItemVenda.Open;
  DataModule1.tb_itemVenda.Insert;
  DataModule1.tb_itemVendaCHAVE.Value := qryUltimaChaveItemVendaADD.Value;
  DataModule1.tb_itemVendaCHAVE_VENDA.Value := DataModule1.tb_vendaCHAVE.Value;

  frmEdicaoItemVenda := TfrmEdicaoItemVenda.Create(Self);
  frmEdicaoItemVenda.BorderIcons := BorderIcons - [biSystemMenu, biMinimize, biMaximize];
  frmEdicaoItemVenda.ShowModal;

  qrySomaItens.Close;
  qrySomaItens.ParamByName('chavevenda').Value := DataModule1.tb_vendaCHAVE.Value;
  qrySomaItens.Open;
  DataModule1.tb_vendaVALOR_TOTAL.Value := qrySomaItensSUM.Value;

end;

procedure TfrmPdv.btnEditarItemClick(Sender: TObject);
begin

  DataModule1.tb_itemVenda.Close;
  DataModule1.tb_itemVenda.Open;
  DataModule1.tb_itemVenda.Edit;

  if DataModule1.tb_itemVenda.IsEmpty then
  begin
  end
  else
  begin

    inserindo_novo_item := False;
    try
      frmEdicaoItemVenda := TfrmEdicaoItemVenda.Create(Self);
      frmEdicaoItemVenda.BorderIcons :=
        BorderIcons - [biSystemMenu, biMinimize, biMaximize];
      frmEdicaoItemVenda.ShowModal;
    finally
      DataModule1.tb_itemVenda.Close;
      DataModule1.tb_itemVenda.Open;
      DataModule1.tb_itemVenda.Edit;

      qrySomaItens.Close;
      qrySomaItens.ParamByName('chavevenda').Value := DataModule1.tb_vendaCHAVE.Value;
      qrySomaItens.Open;
      DataModule1.tb_vendaVALOR_TOTAL.Value := qrySomaItensSUM.Value;
    end;

    DataModule1.tb_itemVenda.ApplyUpdates;

  end;

end;

procedure TfrmPdv.btnCancelarClick(Sender: TObject);
begin
  if not DataModule1.tb_itemVenda.IsEmpty then
  begin
    if Application.MessageBox('Deseja excluir essa venda?',
      '***Atenção***', 36) = 6 then
    begin
      DataModule1.tb_itemVenda.Edit;
      DataModule1.tb_itemVenda.First;
      DataModule1.tb_venda.Cancel;
      DataModule1.tb_venda.ApplyUpdates;

      while not DataModule1.tb_itemVenda.IsEmpty do
      begin
        DataModule1.tb_itemVenda.Delete;
        DataModule1.tb_itemVenda.ApplyUpdates;
      end;
      frmPdv.Close;
    end;
  end;
  DataModule1.tb_Venda.Cancel;
  DataModule1.tb_Venda.ApplyUpdates;
  frmPdv.Close;

end;

procedure TfrmPdv.btnBuscarClick(Sender: TObject);
begin
  DataModule1.tb_itemVenda.Close;
  DataModule1.tb_itemVenda.Open;
  DataModule1.tb_itemVenda.Refresh;
end;

procedure TfrmPdv.btnConcluirClick(Sender: TObject);
begin

  DataModule1.tb_itemVenda.Edit;
  //DataModule1.tb_itemVenda.First;
  with DataModule1 do
  begin
    tb_Venda.Insert;
    tb_venda.Post;
    tb_venda.ApplyUpdates;
  end;
  while not DataModule1.tb_itemVenda.IsEmpty do
  begin
    DataModule1.tb_itemVenda.Delete;
    DataModule1.tb_itemVenda.ApplyUpdates;
  end;

  frmPdv.Close;
end;

procedure TfrmPdv.btnExcluirItemClick(Sender: TObject);
begin

  qrySomaItens.Close;
  qrySomaItens.ParamByName('chavevenda').Value := DataModule1.tb_vendaCHAVE.Value;
  qrySomaItens.Open;
  DataModule1.tb_vendaVALOR_TOTAL.Value := qrySomaItensSUM.Value;

  if not DataModule1.tb_itemVenda.IsEmpty then
  begin
    if application.messagebox('Deseja excluir este Registro?',
      '***Atenção***', 36) = 6 then
    begin
      DataModule1.tb_itemVenda.Delete;
      DataModule1.tb_itemVenda.ApplyUpdates;
      DataModule1.tb_itemVenda.Close;
      DataModule1.tb_itemVenda.Open;
      DataModule1.tb_itemVenda.First;

    end;
  end;

end;

procedure TfrmPdv.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DataModule1.tb_itemVenda.EmptyDataSet;
  DataModule1.tb_itemVenda.LinkedFields := '';
  DataModule1.tb_itemVenda.ApplyUpdates;
  frmPdv.Close;
end;

procedure TfrmPdv.FormCreate(Sender: TObject);
begin
  //DataModule1.tb_itemVenda.Edit;
  DataModule1.tb_itemVenda.Close;
  DataModule1.tb_itemVenda.Open;

  qrySomaItens.Close;
  qrySomaItens.ParamByName('chavevenda').Value := DataModule1.tb_vendaCHAVE.Value;
  qrySomaItens.Open;
  DataModule1.tb_vendaVALOR_TOTAL.Value := qrySomaItensSUM.Value;

end;

end.
