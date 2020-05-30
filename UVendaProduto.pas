unit UVendaProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Edit, FMX.ListBox, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.DateTimeCtrls, FMX.Ani;

type
  TFVendaProduto = class(TFModelo)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    LayoutConsulta: TLayout;
    btnBusca: TSpeedButton;
    EditNomeConsulta: TEdit;
    LayoutListClientes: TLayout;
    ListViewClienteProdutos: TListView;
    TabItem3: TTabItem;
    Layout46: TLayout;
    RoundRect7: TRoundRect;
    BtnVenda: TButton;
    LayoutTpPagamentoVenda: TLayout;
    ComboBoxTpPagamentoVenda: TComboBox;
    Layout44: TLayout;
    LabelClientevenda: TLabel;
    Layout45: TLayout;
    LabelValorItem: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    StyleBook1: TStyleBook;
    Layout2: TLayout;
    DateEditVenda: TDateEdit;
    Label2: TLabel;
    VertScrollBox2: TVertScrollBox;
    LayoutProdutos: TLayout;
    ListViewProdutosCliente: TListView;
    LayoutCarrinho: TLayout;
    ImageCarrinhoh: TImage;
    LabelItem: TLabel;
    ImageValor: TImage;
    LabelValor: TLabel;
    RoundRect1: TRoundRect;
    btnVendaProd: TButton;
    Layout3: TLayout;
    btnBuscaProduto: TSpeedButton;
    EditProdConsulta: TEdit;
    LinkListControlToField2: TLinkListControlToField;
    ColorAnimation1: TColorAnimation;
    PanelCarrinho: TPanel;
    CircleCarrinhovazio: TCircle;
    Layout4: TLayout;
    Label3: TLabel;
    btnLimparCarrinho: TSpeedButton;
    btnSairCarrinho: TSpeedButton;
    ListViewCarrinho: TListView;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    procedure btnBuscaClick(Sender: TObject);
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVendaProdClick(Sender: TObject);
    procedure BtnVendaClick(Sender: TObject);
    procedure ListViewClienteProdutosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewProdutosClienteItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ImageCarrinhohClick(Sender: TObject);
    procedure btnSairCarrinhoClick(Sender: TObject);
    procedure btnLimparCarrinhoClick(Sender: TObject);
    procedure ListViewCarrinhoDeleteItem(Sender: TObject; AIndex: Integer);
  private
    { Private declarations }
    somavenda: real;
    somaitem: Integer;
  public
    { Public declarations }
  end;

var
  FVendaProduto: TFVendaProduto;

implementation

{$R *.fmx}

uses UDM;

procedure TFVendaProduto.btnBuscaClick(Sender: TObject);
begin
  inherited;
  dm.FDQBuscaClienteNome.Close;
  dm.FDQBuscaClienteNome.ParamByName('nome').AsString :=
    '%' + EditNomeConsulta.Text + '%';
  dm.FDQBuscaClienteNome.Open();
end;

procedure TFVendaProduto.btnBuscaProdutoClick(Sender: TObject);
begin
  inherited;
  dm.FDQSelecionaProduto.Close;
  dm.FDQSelecionaProduto.ParamByName('nomeProduto').AsString :=
    '%' + EditProdConsulta.Text + '%';
  dm.FDQSelecionaProduto.Open();
end;

procedure TFVendaProduto.btnLimparCarrinhoClick(Sender: TObject);
var
  sql: string;
begin
  inherited;
  sql := 'delete from vendaitem where  vendaitem_venda_id=' +
    dm.FDQVendavenda_id.AsString;
  dm.FDConnection1.ExecSQL(sql);
  dm.FDConnection1.CommitRetaining;

  somavenda := 0;
  somaitem := 0;
  LabelValorItem.Text := 'R$.:' + FormatFloat('#,##0.00', somavenda);
  LabelValor.Text := 'R$.:' + FormatFloat('#,##0.00', somavenda);
  LabelItem.Text := IntToStr(somaitem);
  dm.FDQListaCarrinho.Close;
  dm.FDQListaCarrinho.ParamByName('venda').AsString :=
    dm.FDQVendavenda_id.AsString;
  dm.FDQListaCarrinho.Open();
  ShowMessage('Seu carrinho esta vazio!');
end;

procedure TFVendaProduto.btnSairCarrinhoClick(Sender: TObject);
begin
  inherited;
  PanelCarrinho.Visible := False;
end;

procedure TFVendaProduto.BtnVendaClick(Sender: TObject);
var
  tp_pagamento: string;
begin
  inherited;
  dm.FDQVenda.Edit;
  dm.FDQVendavenda_valor.AsFloat := somavenda;
  tp_pagamento := ComboBoxTpPagamentoVenda.Items.Strings
    [ComboBoxTpPagamentoVenda.ItemIndex];
  dm.FDQVendavenda_tp_pagamento.AsString := tp_pagamento;
  dm.FDQVendavenda_data.AsDateTime := DateEditVenda.Date;
  dm.FDQVenda.Post;
  dm.FDConnection1.CommitRetaining;
  somavenda := 0;
  LabelValorItem.Text := 'R$.:';
  ShowMessage('Salvo com sucesso!');
  TabControl1.TabIndex := 0;
end;

procedure TFVendaProduto.btnVendaProdClick(Sender: TObject);
begin
  inherited;
  if somaitem > 0 then
  begin
    TabItem3.Enabled := True;
    TabControl1.TabIndex := 2;
  end
  else
  begin
    MessageDlg('Deseja excluir a venda?',
      System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
      procedure(const BotaoPressionado: TModalResult)
      begin
        case BotaoPressionado of
          mrYes:
            begin
              dm.FDQVenda.Delete;
              dm.FDConnection1.CommitRetaining;
              ShowMessage('Venda excluida com sucesso!');
              TabItem3.Enabled := False;
              TabItem2.Enabled := False;
              TabControl1.TabIndex := 0;
            end;

          mrNo:
            begin
              ShowMessage('Insira os Itens!');
            end;
        end;
      end);
  end;

end;

procedure TFVendaProduto.FormShow(Sender: TObject);
begin
  inherited;
  TabControl1.TabIndex := 0;
  DateEditVenda.Date := Date;
  // PanelCarrinho.Margins.Top := FVendaProduto.Height + 50;
  PanelCarrinho.Visible := False;

  CircleCarrinhovazio.Visible := False;
  ListViewCarrinho.Visible := False;
  dm.FDQListaCarrinho.Active := True;
end;

procedure TFVendaProduto.ImageCarrinhohClick(Sender: TObject);
begin
  inherited;

  PanelCarrinho.Visible := True;
  PanelCarrinho.BringToFront;
  PanelCarrinho.AnimateFloat('Margins.Top', 0, 0.8, TAnimationType.InOut,
    TInterpolationType.Circular);
  dm.FDQListaCarrinho.Close;
  dm.FDQListaCarrinho.ParamByName('venda').AsString :=
    dm.FDQVendavenda_id.AsString;
  dm.FDQListaCarrinho.Open();

  if dm.FDQListaCarrinho.RecordCount > 0 then
  begin
    CircleCarrinhovazio.Visible := False;
    ListViewCarrinho.Visible := True;
  end
  else
  begin
    CircleCarrinhovazio.Visible := True;
    ListViewCarrinho.Visible := False;
  end;
end;

procedure TFVendaProduto.ListViewCarrinhoDeleteItem(Sender: TObject;
AIndex: Integer);
begin
  inherited;
  somavenda := somavenda - dm.FDQListaCarrinhovendaItem_valor.AsFloat;
  somaitem := somaitem - 1;
  LabelValorItem.Text := 'R$.:' + FormatFloat('#,##0.00', somavenda);
  LabelValor.Text := 'R$.:' + FormatFloat('#,##0.00', somavenda);
  LabelItem.Text := IntToStr(somaitem);
  dm.FDQListaCarrinho.Delete;
  dm.FDConnection1.CommitRetaining;
  dm.FDQListaCarrinho.Close;
  ImageCarrinhohClick(Sender);
end;

procedure TFVendaProduto.ListViewClienteProdutosItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  inherited;
  dm.FDQVenda.Active := True;
  dm.FDQVenda.Append;
  LabelClientevenda.Text := dm.FDQBuscaClienteNomecliente_nome.AsString;
  dm.FDQVendavenda_cliente_id.AsString :=
    dm.FDQBuscaClienteNomecliente_id.AsString;
  dm.FDQVenda.Post;
  dm.FDConnection1.CommitRetaining;
  TabItem2.Enabled := True;
  TabControl1.TabIndex := 1;
end;

procedure TFVendaProduto.ListViewProdutosClienteItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  inherited;
  dm.FDQVendaItem.Active := True;
  dm.FDQVendaItem.Append;
  dm.FDQVendaItemvendaitem_venda_id.AsString := dm.FDQVendavenda_id.AsString;
  dm.FDQVendaItemvendaitem_produto_id.AsString :=
    dm.FDQSelecionaProdutoproduto_id.AsString;
  dm.FDQVendaItemvendaitem_qte.AsInteger := 1;
  dm.FDQVendaItemvendaitem_valor.AsString :=
    dm.FDQSelecionaProdutoproduto_valor.AsString;
  somavenda := dm.FDQSelecionaProdutoproduto_valor.AsFloat + somavenda;
  somaitem := 1 + somaitem;
  LabelValorItem.Text := 'R$.:' + FormatFloat('#,##0.00', somavenda);
  LabelValor.Text := 'R$.:' + FormatFloat('#,##0.00', somavenda);
  LabelItem.Text := IntToStr(somaitem);
  dm.FDQVendaItem.Post;
  dm.FDConnection1.CommitRetaining;
end;

end.
