unit uedicaoProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  Buttons;

type

  { TfrmEdicaoProduto }

  TfrmEdicaoProduto = class(TForm)
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmEdicaoProduto: TfrmEdicaoProduto;

implementation

uses uDataModule;

{$R *.lfm}

{ TfrmEdicaoProduto }

procedure TfrmEdicaoProduto.btnCancelarClick(Sender: TObject);
begin
  //DataModule1.tb_produtos.Cancel;
  //Close;
end;

procedure TfrmEdicaoProduto.btnSalvarClick(Sender: TObject);
begin
  with DataModule1.tb_produtos do
  begin
    Post;
    ApplyUpdates;
  end;
  frmEdicaoProduto.Close;
end;

procedure TfrmEdicaoProduto.FormClose(Sender: TObject);
begin
  DataModule1.tb_produtos.LinkedFields := '';
  DataModule1.tb_produtos.ApplyUpdates;
end;

procedure TfrmEdicaoProduto.FormCreate(Sender: TObject);
begin

end;

end.
