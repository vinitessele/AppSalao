unit UDashboard;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.Db, DateUtils,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.Ani,
  FMX.DateTimeCtrls, FMX.TabControl, System.Math.Vectors, FMX.Controls3D,
  FMX.Layers3D, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, MultiDetailAppearanceU, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, FMX.ListView, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.DBScope;

type
  TFDashboard = class(TFModelo)
    VertScrollBoxDashboard: TVertScrollBox;
    RectAnimation1: TRectAnimation;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    LayoutDate: TLayout;
    DateEditIni: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    DateEditfim: TDateEdit;
    SpeedButton1: TSpeedButton;
    LabelTotalPeriodo: TLabel;
    LabelCusto: TLabel;
    Label2total: TLabel;
    LayoutProduto: TLayout;
    LayoutVendaDinheiro: TLayout;
    CalloutRectangle3: TCalloutRectangle;
    LabelProdutoDinheiro: TLabel;
    Label7: TLabel;
    LayoutVendaCartao: TLayout;
    CalloutRectangle4: TCalloutRectangle;
    LabelProdutoCartao: TLabel;
    LabelProdutoCredito: TLabel;
    LabelProdutoDebito: TLabel;
    Label8: TLabel;
    LayoutServicos: TLayout;
    LayoutServicoDinheiro: TLayout;
    CalloutRectangle5: TCalloutRectangle;
    LabelServicoDinheiro: TLabel;
    Label18: TLabel;
    LayoutServicoCartao: TLayout;
    CalloutRectangle6: TCalloutRectangle;
    LabelServicoCartao: TLabel;
    LabelServicoCredito: TLabel;
    LabelServicoDebito: TLabel;
    Label20: TLabel;
    LayoutTotal: TLayout;
    LayoutRecebidoDinheiro: TLayout;
    CalloutRectangle1: TCalloutRectangle;
    LabelDinheiro: TLabel;
    Label4: TLabel;
    LayoutRecebidoCartao: TLayout;
    CalloutRectangle2: TCalloutRectangle;
    LabelCartao: TLabel;
    LabelDebito: TLabel;
    LabelCredito: TLabel;
    Label5: TLabel;
    VertScrollBox2: TVertScrollBox;
    Layout2: TLayout;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    Label9: TLabel;
    DateEdit2: TDateEdit;
    SpeedButton2: TSpeedButton;
    Layout3D1: TLayout3D;
    Layout3: TLayout;
    TabItem3: TTabItem;
    ListViewAgruDia: TListView;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDashboard: TFDashboard;

implementation

{$R *.fmx}

uses UDM;

procedure TFDashboard.FormShow(Sender: TObject);
begin
  inherited;
  DateEditIni.Date := Date - 30;
  DateEditfim.Date := Date;
  TabControl1.TabIndex := 0;
  dm.FDQSomaAtendimentoDia.Active := True;
  dm.FDQSomaAtendimentoDia.Close;
  dm.FDQSomaAtendimentoDia.Open();
end;

procedure TFDashboard.SpeedButton1Click(Sender: TObject);
var
  SomaTotal: real;
  SomaDinheiro: real;
  SomaCartao: real;
  SomaDebito: real;
  SomaCredito, custoporcentagem, totalporcentagem, vlrtotalporcentagem: real;
  custoprodutos, totalmensal, custosmensais, rateio, totalcustos,
    vlrliquido: real;
  dias: Integer;
begin
  inherited;
  SomaTotal := 0;
  SomaDinheiro := 0;
  SomaCartao := 0;
  SomaDebito := 0;
  SomaCredito := 0;
  custoprodutos := 0;
  custosmensais := 0;
  rateio := 0;
  dm.FDQConsultaFaturamento.Active := True;
  dm.FDQSomaVendasPeriodo.Active := True;
  // serviço Dinheiro
  dm.FDQConsultaFaturamento.Close;
  dm.FDQConsultaFaturamento.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQConsultaFaturamento.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQConsultaFaturamento.ParamByName('tp_pagamento').AsString := 'Dinheiro';
  dm.FDQConsultaFaturamento.Open();
  if dm.FDQConsultaFaturamento.RecordCount > 0 then
  begin
    SomaDinheiro := dm.FDQConsultaFaturamentoValor.AsFloat;
    LabelServicoDinheiro.Text := 'R$.:' + FormatFloat('#,##0.00',
      (dm.FDQConsultaFaturamentoValor.AsFloat));
  end;

  // serviço Débito
  dm.FDQConsultaFaturamento.Close;
  dm.FDQConsultaFaturamento.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQConsultaFaturamento.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQConsultaFaturamento.ParamByName('tp_pagamento').AsString := 'Débito';
  dm.FDQConsultaFaturamento.Open();
  SomaCartao := dm.FDQConsultaFaturamentoValor.AsFloat;
  SomaDebito := dm.FDQConsultaFaturamentoValor.AsFloat;
  LabelServicoDebito.Text := 'D R$.:' + FormatFloat('#,##0.00',
    dm.FDQConsultaFaturamentoValor.AsFloat);

  // serviço Crédito
  dm.FDQConsultaFaturamento.Close;
  dm.FDQConsultaFaturamento.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQConsultaFaturamento.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQConsultaFaturamento.ParamByName('tp_pagamento').AsString := 'Crédito';
  dm.FDQConsultaFaturamento.Open();
  SomaCartao := dm.FDQConsultaFaturamentoValor.AsFloat + SomaCartao;
  SomaCredito := dm.FDQConsultaFaturamentoValor.AsFloat;
  LabelServicoCredito.Text := 'C R$.:' + FormatFloat('#,##0.00',
    dm.FDQConsultaFaturamentoValor.AsFloat);

  LabelServicoCartao.Text := 'R$.:' + FormatFloat('#,##0.00',
    (SomaDebito + SomaCredito));

  LabelDebito.Text := FloatToStr(SomaDebito);
  LabelCredito.Text := FloatToStr(SomaCredito);

  SomaDebito := 0;
  SomaCredito := 0;
  // produto venda  cartão
  dm.FDQSomaVendasPeriodo.Close;
  dm.FDQSomaVendasPeriodo.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('tp_pagamento').AsString := 'Crédito';
  dm.FDQSomaVendasPeriodo.Open();
  SomaCartao := dm.FDQSomaVendasPeriodoValor.AsFloat + SomaCartao;
  SomaCredito := dm.FDQSomaVendasPeriodoValor.AsFloat;
  LabelProdutoCredito.Text := 'C R$.:' + FormatFloat('#,##0.00',
    dm.FDQSomaVendasPeriodoValor.AsFloat);

  dm.FDQSomaVendasPeriodo.Close;
  dm.FDQSomaVendasPeriodo.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('tp_pagamento').AsString := 'Débito';
  dm.FDQSomaVendasPeriodo.Open();
  SomaCartao := dm.FDQSomaVendasPeriodoValor.AsFloat + SomaCartao;
  SomaDebito := dm.FDQSomaVendasPeriodoValor.AsFloat;
  LabelProdutoDebito.Text := 'D R$.:' + FormatFloat('#,##0.00',
    dm.FDQSomaVendasPeriodoValor.AsFloat);

  LabelProdutoCartao.Text := 'R$.:' + FormatFloat('#,##0.00',
    (SomaDebito + SomaCredito));

  LabelDebito.Text := 'D R$.:' + FormatFloat('#,##0.00',
    SomaDebito + StrToFloat(LabelDebito.Text));
  LabelCredito.Text := 'C R$.:' + FormatFloat('#,##0.00',
    SomaCredito + StrToFloat(LabelCredito.Text));

  // produto venda Dinheiro
  dm.FDQSomaVendasPeriodo.Close;
  dm.FDQSomaVendasPeriodo.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('tp_pagamento').AsString := 'Dinheiro';
  dm.FDQSomaVendasPeriodo.Open();
  SomaDinheiro := dm.FDQSomaVendasPeriodoValor.AsFloat + SomaDinheiro;
  LabelProdutoDinheiro.Text := 'R$.:' + FormatFloat('#,##0.00',
    dm.FDQSomaVendasPeriodoValor.AsFloat);

  LabelDinheiro.Text := 'R$.:' + FormatFloat('#,##0.00', SomaDinheiro);
  LabelCartao.Text := 'R$.:' + FormatFloat('#,##0.00', SomaCartao);
  SomaTotal := SomaDinheiro + SomaCartao;

  LabelTotalPeriodo.Text := 'Total Bruto.: ' + FormatFloat('#,##0.00',
    SomaTotal);
  // custos  item venda
  dm.FDQItemVendasPeriodo.Active := True;
  dm.FDQItemVendasPeriodo.Close;
  dm.FDQItemVendasPeriodo.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQItemVendasPeriodo.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQItemVendasPeriodo.Open();

  while not dm.FDQItemVendasPeriodo.Eof do
  begin
    custoprodutos := custoprodutos +
      dm.FDQItemVendasPeriodoproduto_valorCusto.AsFloat;
    dm.FDQItemVendasPeriodo.Next;
  end;

  // custo mensal fixo
  dm.FDQCustoFixo.Active := True;
  dm.FDQCustoFixo.Close;
  dm.FDQCustoFixo.sql.Clear;
  dm.FDQCustoFixo.sql.Add
    ('select * from custofixo where custofixo_rateio=''Mensal'' and custofixo_tipo =''Dinheiro''');
  dm.FDQCustoFixo.Open();
  dm.FDQCustoFixo.First;
  while not dm.FDQCustoFixo.Eof do
  begin
    custosmensais := dm.FDQCustoFixocustofixo_valor.AsFloat + custosmensais;
    dm.FDQCustoFixo.Next;
  end;
  rateio := custosmensais / 30;
  dias := daysbetween(DateEditIni.Date, DateEditfim.Date);
  totalmensal := rateio * dias;

  // custo cartao

  dm.FDQCustoFixo.Close;
  dm.FDQCustoFixo.sql.Clear;
  dm.FDQCustoFixo.sql.Add
    ('select * from custofixo where custofixo_rateio=''PorItem'' and custofixo_tipo =''Porcentagem''');
  dm.FDQCustoFixo.Open();
  dm.FDQCustoFixo.First;
  while not dm.FDQCustoFixo.Eof do
  begin
    custoporcentagem := dm.FDQCustoFixocustofixo_valor.AsFloat +
      custoporcentagem;
    dm.FDQCustoFixo.Next;
  end;

  totalporcentagem := (custoporcentagem / 100);
  vlrtotalporcentagem := SomaCartao * totalporcentagem;
  totalcustos := totalmensal + vlrtotalporcentagem + custoprodutos;
  LabelCusto.Text := 'Custo do perído: ' + FormatFloat('#,##0.00', totalcustos);
  vlrliquido := SomaTotal - totalcustos;
  Label2total.Text := 'Lucro Liquído: ' + FormatFloat('#,##0.00', vlrliquido);

  SomaTotal := 0;
  SomaDinheiro := 0;
  SomaCartao := 0;
  SomaDebito := 0;
  SomaCredito := 0;
  custoprodutos := 0;
  custosmensais := 0;
  rateio := 0;
end;

end.
