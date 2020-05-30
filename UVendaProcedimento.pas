unit UVendaProcedimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListBox, FMX.ListView, FMX.Edit, FMX.TabControl, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.DateTimeCtrls;

type
  TFVendaProcedimento = class(TFModelo)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    LayoutConsulta: TLayout;
    btnBusca: TSpeedButton;
    EditNomeConsulta: TEdit;
    LayoutListClientes: TLayout;
    ListViewClienteProcedimentos: TListView;
    TabItem2: TTabItem;
    LayoutProdutos: TLayout;
    LayoutCarrinho: TLayout;
    ImageValor: TImage;
    LabelValor: TLabel;
    RoundRect1: TRoundRect;
    Button1: TButton;
    TabItem3: TTabItem;
    Layout44: TLayout;
    LabelClienteProcedimento: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LayoutProcedimento: TLayout;
    ListViewProcedimentosCliente: TListView;
    LayoutValor: TLayout;
    EditvlrProcedimento: TEdit;
    LayoutTpPagamentoProcedimento: TLayout;
    ComboBoxTpPagamento: TComboBox;
    Layoutbtn: TLayout;
    RoundRect9: TRoundRect;
    btnFinalizaProcedimento: TButton;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    StyleBook1: TStyleBook;
    Layout2: TLayout;
    Label2: TLabel;
    DateEditVenda: TDateEdit;
    procedure btnBuscaClick(Sender: TObject);
    procedure btnFinalizaProcedimentoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListViewClienteProcedimentosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewProcedimentosClienteItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendaProcedimento: TFVendaProcedimento;

implementation

{$R *.fmx}

uses UDM;

procedure TFVendaProcedimento.btnBuscaClick(Sender: TObject);
begin
  inherited;
  dm.FDQBuscaClienteNome.Close;
  dm.FDQBuscaClienteNome.ParamByName('nome').AsString :=
    '%' + EditNomeConsulta.Text + '%';
  dm.FDQBuscaClienteNome.Open();
end;

procedure TFVendaProcedimento.btnFinalizaProcedimentoClick(Sender: TObject);
var
  tp_pagamento: string;
begin
  inherited;
  dm.FDQPontuacao.Active := True;
  dm.FDQPontuacao.Append;
  dm.FDQPontuacaopontuacao_id_cliente.AsInteger :=
    dm.FDQBuscaClienteNomecliente_id.AsInteger;
  dm.FDQPontuacaopontuacao_id_procedimento.AsInteger :=
    dm.FDQProcedimentosprocedimento_id.AsInteger;
  dm.FDQPontuacaopontuacao_valor.AsFloat :=
    StrToFloat(EditvlrProcedimento.Text);
  dm.FDQPontuacaopontuacao_data.AsDateTime := DateEditVenda.Date;
  tp_pagamento := ComboBoxTpPagamento.Items.Strings
    [ComboBoxTpPagamento.ItemIndex];
  dm.FDQPontuacaopontuacao_tp_pagamento.AsString := tp_pagamento;
  dm.FDQPontuacao.Post;
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Salvo com sucesso!');
  TabControl1.TabIndex := 0;
end;

procedure TFVendaProcedimento.Button1Click(Sender: TObject);
begin
  inherited;
  TabItem3.Enabled := True;
  TabControl1.TabIndex := 2;
end;

procedure TFVendaProcedimento.FormShow(Sender: TObject);
begin
  inherited;
  TabControl1.TabIndex := 0;
  dm.FDQProcedimentos.Active := True;
  DateEditVenda.Date := Date;
  dm.FDQProcedimentos.Close;
  dm.FDQProcedimentos.Open();
end;

procedure TFVendaProcedimento.ListViewClienteProcedimentosItemClick
  (const Sender: TObject; const AItem: TListViewItem);
begin
  inherited;
  TabItem2.Enabled := True;
  TabControl1.TabIndex := 1;
  LabelClienteProcedimento.Text := dm.FDQBuscaClienteNomecliente_nome.Text;
end;

procedure TFVendaProcedimento.ListViewProcedimentosClienteItemClick
  (const Sender: TObject; const AItem: TListViewItem);
begin
  inherited;
  LabelValor.Text := 'R$.:' + FormatFloat('###0.00 ',
    dm.FDQProcedimentosprocedimento_valor.AsFloat);
  EditvlrProcedimento.Text := FormatFloat('###0.00 ',
    dm.FDQProcedimentosprocedimento_valor.AsFloat);
end;

end.
