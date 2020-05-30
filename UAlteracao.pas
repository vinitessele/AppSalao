unit UAlteracao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView, FMX.ListBox, FMX.Edit,
  FMX.DateTimeCtrls, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFAlteracao = class(TFModelo)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListViewListaAlteracao: TListView;
    VertScrollBox2: TVertScrollBox;
    Layout24: TLayout;
    LabelNome: TLabel;
    Layout25: TLayout;
    EditValorProcedimento: TEdit;
    Layout26: TLayout;
    LabelData: TLabel;
    DateEditVenda: TDateEdit;
    LayoutServico: TLayout;
    ListViewServicos: TListView;
    LayoutTpPagamento: TLayout;
    ComboBoxTpPagamento: TComboBox;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    Button1: TButton;
    StyleBook1: TStyleBook;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    procedure FormShow(Sender: TObject);
    procedure ListViewListaAlteracaoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAlteracao: TFAlteracao;

implementation

{$R *.fmx}

uses UDM;

procedure TFAlteracao.Button1Click(Sender: TObject);
var
  sql: string;
  tp_pagamento: string;
begin
  inherited;
  tp_pagamento := ComboBoxTpPagamento.Items.Strings
    [ComboBoxTpPagamento.ItemIndex];
  dm.FDQListAtendimentoDia.Edit;
  dm.FDQListAtendimentoDiapontuacao_tp_pagamento.AsString := tp_pagamento;
  dm.FDQListAtendimentoDiapontuacao_data.AsDateTime := DateEditVenda.Date;
  dm.FDQListAtendimentoDiapontuacao_id_procedimento.AsInteger :=
    dm.FDQProcedimentosprocedimento_id.AsInteger;
  dm.FDQListAtendimentoDiapontuacao_valor.AsFloat :=
    StrToFloat(EditValorProcedimento.Text);
  dm.FDQListAtendimentoDia.Post;

  { sql := 'update pontuacao set pontuacao_valor =' + EditValorProcedimento.Text
    //
    + ', pontuacao_tp_pagamento=' + QuotedStr(tp_pagamento) //
    + ', pontuacao_id_procedimento=' + QuotedStr(procedimento.ToString()) //
    + ', pontuacao_data= ' + datatela //
    + ' where pontuacao_id=' + dm.FDQListAtendimentoDiapontuacao_id.AsString;
    dm.FDConnection1.ExecSQL(sql); }
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Salvo com sucesso!');
  TabControl1.TabIndex := 0;
end;

procedure TFAlteracao.FormShow(Sender: TObject);
begin
  inherited;
  TabControl1.TabIndex := 0;
  dm.FDQListAtendimentoDia.Active := True;
  dm.FDQListAtendimentoDia.Close;
  dm.FDQListAtendimentoDia.Open();
end;

procedure TFAlteracao.ListViewListaAlteracaoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  TabControl1.TabIndex := 1;
  dm.FDQProcedimentos.Active := True;
  dm.FDQProcedimentos.Close;
  dm.FDQProcedimentos.Open();
  LabelNome.Text := dm.FDQListAtendimentoDiacliente_nome.AsString;
  DateEditVenda.Date := dm.FDQListAtendimentoDiapontuacao_data.AsDateTime;
  EditValorProcedimento.Text :=
    dm.FDQListAtendimentoDiapontuacao_valor.AsString;
end;

end.
