program AppSalao;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDM in 'UDM.pas' {DM: TDataModule},
  UModelo in 'UModelo.pas' {FModelo},
  UCadClientes in 'UCadClientes.pas' {FCadCliente},
  UCartaoFidelidade in 'UCartaoFidelidade.pas' {FFidelidade},
  UListaProcedimentos in 'UListaProcedimentos.pas' {FListaProcedimentos},
  UProdutos in 'UProdutos.pas' {FProdutos},
  UDashboard in 'UDashboard.pas' {FDashboard},
  UVendaProduto in 'UVendaProduto.pas' {FVendaProduto},
  UVendaProcedimento in 'UVendaProcedimento.pas' {FVendaProcedimento},
  UHistorico in 'UHistorico.pas' {FHistorico},
  UConfiguracao in 'UConfiguracao.pas' {FConfiguracao},
  UCusto in 'UCusto.pas' {FCusto},
  UAlteracao in 'UAlteracao.pas' {FAlteracao},
  uOpenViewUrl in 'uOpenViewUrl.pas',
  USobre in 'USobre.pas' {FSobre};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFSobre, FSobre);
  Application.Run;
end.
