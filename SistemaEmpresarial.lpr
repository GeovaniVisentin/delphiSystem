program SistemaEmpresarial;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, tachartlazaruspkg, zcomponent, uMenu, uDataModule, uCadClientes,
  ufrmEdicaoCliente, ucadproduto, uedicaoProduto, updv, uEdicaoItemVenda, 
uContasaReceber, uProcuraClientes
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmContasaReceber, frmContasaReceber);
  Application.CreateForm(TfrmProcuraClientes, frmProcuraClientes);
  Application.Run;
end.

