unit UHistorico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView, FMX.TabControl, FMX.Edit,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope;

type
  TFHistorico = class(TFModelo)
    VertScrollBox5: TVertScrollBox;
    Layout50: TLayout;
    btnBuscahistorico: TSpeedButton;
    EditBuscaCliente: TEdit;
    TabControl2: TTabControl;
    TabItem1: TTabItem;
    ListViewListhistorico: TListView;
    TabItem2: TTabItem;
    ListView1: TListView;
    ListViewListServicos: TListView;
    TabItem3: TTabItem;
    ListViewListProdutos: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    BindSourceDB4: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    procedure btnBuscahistoricoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListViewListhistoricoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewListServicosDeleteItem(Sender: TObject; AIndex: Integer);
    procedure ListViewListProdutosDeleteItem(Sender: TObject; AIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistorico: TFHistorico;

implementation

{$R *.fmx}

uses UDM;

procedure TFHistorico.btnBuscahistoricoClick(Sender: TObject);
begin
  inherited;
  dm.FDQBuscaClienteNome.Active := True;
  dm.FDQBuscaClienteNome.Close;
  dm.FDQBuscaClienteNome.ParamByName('nome').AsString :=
    '%' + EditBuscaCliente.Text + '%';
  dm.FDQBuscaClienteNome.Open();
end;

procedure TFHistorico.FormShow(Sender: TObject);
begin
  inherited;
  TabControl2.TabIndex := 0;
end;

procedure TFHistorico.ListViewListhistoricoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  dm.FDQListServicosCliente.Active := True;
  dm.FDQListProdutosCliente.Active := True;

  dm.FDQListServicosCliente.Close;
  dm.FDQListServicosCliente.ParamByName('idCliente').AsString :=
    dm.FDQBuscaClienteNomecliente_id.AsString;
  dm.FDQListServicosCliente.Open();
  dm.FDQListProdutosCliente.Close;
  dm.FDQListProdutosCliente.ParamByName('idCliente').AsString :=
    dm.FDQBuscaClienteNomecliente_id.AsString;
  dm.FDQListProdutosCliente.Open();
  TabControl2.TabIndex := 1;
end;

procedure TFHistorico.ListViewListProdutosDeleteItem(Sender: TObject;
  AIndex: Integer);
var
  sql: string;
begin
  inherited;
  sql := 'delete from vendaitem where vendaitem_id=' //
    + dm.FDQListProdutosClientevendaItem_id.AsString; //
  dm.FDConnection1.ExecSQL(sql);
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Excluido com sucesso!');
  TabControl2.TabIndex := 0;
  dm.FDQListProdutosCliente.Close;
  dm.FDQListProdutosCliente.Open();
end;

procedure TFHistorico.ListViewListServicosDeleteItem(Sender: TObject;
  AIndex: Integer);
var
  sql: string;
begin
  inherited;
  sql := 'delete from pontuacao where pontuacao_id=' +
    dm.FDQListServicosClientepontuacao_id.AsString;
  dm.FDConnection1.ExecSQL(sql);
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Excluido com sucesso!');
  TabControl2.TabIndex := 0;
  dm.FDQListServicosCliente.Close;
  dm.FDQListServicosCliente.Open();
end;

end.
