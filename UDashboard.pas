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
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.DBScope, FMX.Edit;

type
  TFDashboard = class(TFModelo)
    TabControl1: TTabControl;
    TabItem2: TTabItem;
    VertScrollBox2: TVertScrollBox;
    TabItem3: TTabItem;
    ListViewAgruDia: TListView;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    Layout2: TLayout;
    DateEditIni: TDateEdit;
    Label6: TLabel;
    Label9: TLabel;
    DateEditfim: TDateEdit;
    btnPesquisa: TSpeedButton;
    rect_valor: TRectangle;
    Label10: TLabel;
    EditTBruto: TEdit;
    Line1: TLine;
    Label11: TLabel;
    EditCusto: TEdit;
    EditTLiquido: TEdit;
    Label12: TLabel;
    StyleBook1: TStyleBook;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    procedure SelecionaItem(Sender: TObject);
    procedure SelecionaItemTap(Sender: TObject; const Point: TPointF);
    procedure AddItem(cod_item, descricao: string;
      vl_total, vl_credito, vl_debito, vl_dinheiro: double);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDashboard: TFDashboard;

implementation

{$R *.fmx}

uses UDM;

procedure TFDashboard.SelecionaItem(Sender: TObject);
begin
  showmessage('Item selecionado: ' + TRectangle(Sender).TagString);
end;

procedure TFDashboard.SelecionaItemTap(Sender: TObject; const Point: TPointF);
begin
  showmessage('Item selecionado: ' + TRectangle(Sender).TagString);
end;

procedure TFDashboard.AddItem(cod_item, descricao: string;
  vl_total, vl_credito, vl_debito, vl_dinheiro: double);
var
  rect, rect_barra, rect_icone: TRectangle;
  lbl: TLabel;
begin
  // Fundo...
  rect := TRectangle.Create(VertScrollBox2);
  with rect do
  begin
    Align := TAlignLayout.Top;
    Height := 110;
    Fill.Color := $FFFFFFFF;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Margins.Top := 10;
    Margins.Left := 10;
    Margins.Right := 10;
    XRadius := 8;
    YRadius := 8;
    TagString := cod_item;

{$IFDEF MSWINDOWS}
    OnClick := SelecionaItem;
{$ELSE}
    OnTap := SelecionaItemTap;
{$ENDIF}
  end;
  // Barra inferior...
  rect_barra := TRectangle.Create(rect);
  with rect_barra do
  begin
    Align := TAlignLayout.Bottom;
    Height := 55;
    Fill.Color := $FFF4F4F4;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Sides := [TSide.Left, TSide.Bottom, TSide.Right];
    XRadius := 8;
    YRadius := 8;
    Corners := [TCorner.BottomLeft, TCorner.BottomRight];
    HitTest := false;
    rect.AddObject(rect_barra);
  end;

  // Caixa de Icone...
  {
    rect_icone := TRectangle.Create(rect);
    with rect_icone do
    begin
    Height := 30;
    Width := 30;
    Fill.Color := $FF08DABD;
    Stroke.Kind := TBrushKind.None;
    XRadius := 4;
    YRadius := 4;
    Position.X := 10;
    Position.Y := 12;
    HitTest := false;
    rect.AddObject(rect_icone);
    end;
  }

  // Label do icone...
  {
    lbl := TLabel.Create(rect);
    with lbl do
    begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
    TStyledSetting.FontColor, TStyledSetting.Style];
    Align := TAlignLayout.Client;
    Height := 20;
    TextSettings.FontColor := $FFFFFFFF;
    TextSettings.VertAlign := TTextAlign.Center;
    TextSettings.HorzAlign := TTextAlign.Center;
    Text := icone;
    font.Size := 9;
    font.Style := [TFontStyle.fsBold];
    rect_icone.AddObject(lbl);
    end;
  }

  // Descricao...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := descricao;
    font.Size := 12;
    font.Style := [TFontStyle.fsBold];
    Position.X := 50;
    Position.Y := 20;
    rect.AddObject(lbl);
  end;
  // Resultado Total...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akRight];
    TextSettings.FontColor := $FFCCCCCC;
    TextSettings.HorzAlign := TTextAlign.Trailing;
    Text := 'Resultado Total';
    font.Size := 10;
    Width := 150;
    Position.X := -160;
    Position.Y := 7;
    rect.AddObject(lbl);
  end;

  // Valor resultado Total...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    Anchors := [TAnchorKind.akTop, TAnchorKind.akRight];
    TextSettings.FontColor := $FF685FEE;
    TextSettings.HorzAlign := TTextAlign.Trailing;
    Text := 'R$ ' + FormatFloat('#,##0.00', vl_total);
    font.Size := 13;
    Width := 150;
    Position.X := -160; // VertScrollBox1.Width - 180;
    Position.Y := 23;
    font.Style := [TFontStyle.fsBold];
    rect.AddObject(lbl);
  end;

  // Texto Valor Crédito...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF666666;
    Text := 'Valor Crédito';
    font.Size := 9;
    Width := 150;
    Position.X := 10;
    Position.Y := 7;
    rect_barra.AddObject(lbl);
  end;

  // Valor Crédito...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := 'R$ ' + FormatFloat('#,##0.00', vl_credito);
    font.Size := 11;
    Width := 150;
    Position.X := 10;
    Position.Y := 23;
    font.Style := [TFontStyle.fsBold];
    rect_barra.AddObject(lbl);
  end;

  // Texto Valor Débito...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF666666;
    Text := 'Valor Débito';
    font.Size := 9;
    Width := 150;
    Position.X := 90;
    Position.Y := 7;
    rect_barra.AddObject(lbl);
  end;

  // Valor Débito...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := 'R$ ' + FormatFloat('#,##0.00', vl_debito);
    font.Size := 11;
    Width := 150;
    Position.X := 90;
    Position.Y := 23;
    font.Style := [TFontStyle.fsBold];
    rect_barra.AddObject(lbl);
  end;

  // Texto Dinheiro...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF666666;
    Text := 'Dinheiro';
    font.Size := 9;
    Width := 150;
    Position.X := 170;
    Position.Y := 7;
    rect_barra.AddObject(lbl);
  end;

  // Valor prazo...
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := 'R$ ' + FormatFloat('#,##0.00', vl_dinheiro);
    font.Size := 11;
    Width := 150;
    Position.X := 170;
    Position.Y := 23;
    font.Style := [TFontStyle.fsBold];
    rect_barra.AddObject(lbl);

  end;

  VertScrollBox2.AddObject(rect);
end;

procedure TFDashboard.btnPesquisaClick(Sender: TObject);
var
  ServicoTotal: real;
  ProdutoTotal: real;
  ProdutoSomaDebito, ProdutoSomaCredito, ProdutoSomaDinheiro: real;
  ServicoSomaDebito, ServicoSomaCredito, ServicoSomaDinheiro: real;
  custoporcentagem, totalporcentagem, vlrtotalporcentagem: real;
  custoprodutos, totalmensal, custosmensais, rateio, totalcustos,
    vlrliquido: real;
  dias: integer;
begin
  inherited;
  ServicoTotal := 0;
  ProdutoTotal := 0;
  custoprodutos := 0;
  custosmensais := 0;
  ProdutoSomaDebito := 0;
  ProdutoSomaCredito := 0;
  ServicoSomaDebito := 0;
  ProdutoSomaCredito := 0;
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
    ServicoSomaDinheiro := dm.FDQConsultaFaturamentoValor.AsFloat;
  end;

  // serviço Débito
  dm.FDQConsultaFaturamento.Close;
  dm.FDQConsultaFaturamento.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQConsultaFaturamento.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQConsultaFaturamento.ParamByName('tp_pagamento').AsString := 'Débito';
  dm.FDQConsultaFaturamento.Open();
  ServicoSomaDebito := dm.FDQConsultaFaturamentoValor.AsFloat;

  // serviço Crédito
  dm.FDQConsultaFaturamento.Close;
  dm.FDQConsultaFaturamento.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQConsultaFaturamento.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQConsultaFaturamento.ParamByName('tp_pagamento').AsString := 'Crédito';
  dm.FDQConsultaFaturamento.Open();
  ServicoSomaCredito := dm.FDQConsultaFaturamentoValor.AsFloat;

  ServicoTotal := ServicoSomaDinheiro + ServicoSomaDebito + ServicoSomaCredito;

  // produto venda  cartão credito
  dm.FDQSomaVendasPeriodo.Close;
  dm.FDQSomaVendasPeriodo.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('tp_pagamento').AsString := 'Crédito';
  dm.FDQSomaVendasPeriodo.Open();
  ProdutoSomaCredito := dm.FDQSomaVendasPeriodoValor.AsFloat;

  // produto venda cartao debito
  dm.FDQSomaVendasPeriodo.Close;
  dm.FDQSomaVendasPeriodo.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('tp_pagamento').AsString := 'Débito';
  dm.FDQSomaVendasPeriodo.Open();
  ProdutoSomaDebito := dm.FDQSomaVendasPeriodoValor.AsFloat;

  // produto venda Dinheiro
  dm.FDQSomaVendasPeriodo.Close;
  dm.FDQSomaVendasPeriodo.ParamByName('DataIni').AsDate := DateEditIni.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('DataFim').AsDate := DateEditfim.Date;
  dm.FDQSomaVendasPeriodo.ParamByName('tp_pagamento').AsString := 'Dinheiro';
  dm.FDQSomaVendasPeriodo.Open();
  ProdutoSomaDinheiro := dm.FDQSomaVendasPeriodoValor.AsFloat;

  ProdutoTotal := ProdutoSomaDinheiro + ProdutoSomaDebito + ProdutoSomaCredito;

  EditTBruto.Text := 'R$' + FormatFloat('#,##0.00',
    ProdutoTotal + ServicoTotal);

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
    ('select * from custofixo where custofixo_rateio=''PorItem'' and custofixo_tipo =''Porcentage''');
  dm.FDQCustoFixo.Open();
  dm.FDQCustoFixo.First;
  while not dm.FDQCustoFixo.Eof do
  begin
    custoporcentagem := dm.FDQCustoFixocustofixo_valor.AsFloat +
      custoporcentagem;
    dm.FDQCustoFixo.Next;
  end;

  totalporcentagem := (custoporcentagem / 100);
  vlrtotalporcentagem := (ServicoSomaDebito + ServicoSomaCredito +
    ProdutoSomaDebito + ProdutoSomaCredito) * totalporcentagem;
  totalcustos := totalmensal + vlrtotalporcentagem + custoprodutos;
  EditCusto.Text := 'R$' + FormatFloat('#,##0.00', totalcustos);
  vlrliquido := ServicoTotal + ProdutoTotal - totalcustos;
  EditTLiquido.Text := 'R$' + FormatFloat('#,##0.00', vlrliquido);

  AddItem('004', 'Custos de Produtos', custoprodutos, 0, 0, 0);
  AddItem('005', 'Custos Fixo', totalmensal, 0, 0, 0);
  AddItem('006', 'Custos Cartão', vlrtotalporcentagem, 0, 0, 0);
  AddItem('001', 'Serviços', ServicoTotal, ServicoSomaCredito,
    ServicoSomaDebito, ServicoSomaDinheiro);
  AddItem('002', 'Produtos', ProdutoTotal, ProdutoSomaCredito,
    ProdutoSomaDebito, ProdutoSomaDinheiro);
  AddItem('003', 'Produtos+Serviços', ServicoTotal + ProdutoTotal,
    ServicoSomaCredito + ProdutoSomaCredito, ServicoSomaDebito +
    ProdutoSomaDebito, ServicoSomaDinheiro + ProdutoSomaDinheiro);

end;

procedure TFDashboard.FormCreate(Sender: TObject);
begin
  inherited;
  {
    AddItem('002', 'Omni', 'LC', 4771.36, 5221.36, 122, 1800);
    AddItem('003', 'ABC', 'CDB', 971.36, 5410.40, 100, 1800);
  }
end;

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

end.
