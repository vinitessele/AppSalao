unit UProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.Db,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView, FMX.Edit, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFProdutos = class(TFModelo)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListViewProdutos: TListView;
    CircleAddProduto: TCircle;
    Layout36: TLayout;
    Layout37: TLayout;
    RoundRect8: TRoundRect;
    BtnConfirmaProduto: TButton;
    Layout40: TLayout;
    EditNomeProduto: TEdit;
    Layout42: TLayout;
    EditValorCusto: TEdit;
    Layout43: TLayout;
    EditValorVenda: TEdit;
    StyleBook1: TStyleBook;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure BtnConfirmaProdutoClick(Sender: TObject);
    procedure ListViewProdutosDeleteItem(Sender: TObject; AIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure CircleAddProdutoClick(Sender: TObject);
    procedure ListViewProdutosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutos: TFProdutos;

implementation

{$R *.fmx}

uses UDM;

procedure TFProdutos.BtnConfirmaProdutoClick(Sender: TObject);
begin
  inherited;
  if EditNomeProduto.Text <> EmptyStr then
  begin
    If not(dm.FDQProdutos.State in [dsEdit, dsInsert]) then
    begin
      dm.FDQProdutos.Append;
    end;
    dm.FDQProdutosproduto_nome.AsString := EditNomeProduto.Text;
    dm.FDQProdutosproduto_valor.AsString := EditValorVenda.Text;
    dm.FDQProdutosproduto_valorCusto.AsString := EditValorCusto.Text;
    dm.FDQProdutos.Post;
    dm.FDConnection1.CommitRetaining;
    ShowMessage('Salvo com sucesso!');
    EditNomeProduto.Text := EmptyStr;
    EditValorVenda.Text := EmptyStr;
    EditValorCusto.Text := EmptyStr;
    TabControl1.TabIndex := 0;
    TabItem2.Enabled := false;
    dm.FDQProdutos.Close;
    dm.FDQProdutos.Open();
  end;
end;

procedure TFProdutos.CircleAddProdutoClick(Sender: TObject);
begin
  inherited;
  TabControl1.TabIndex := 1;
  TabItem2.Enabled := True;
  dm.FDQProdutos.Append;
end;

procedure TFProdutos.FormShow(Sender: TObject);
begin
  inherited;
  dm.FDQProdutos.Active := True;
  dm.FDQProdutos.Close;
  dm.FDQProdutos.Open();
end;

procedure TFProdutos.ListViewProdutosDeleteItem(Sender: TObject;
  AIndex: Integer);
var
  sql: string;
begin
  inherited;
  sql := 'delete from produto  where produto_id=' +
    dm.FDQProdutosproduto_id.AsString;
  dm.FDConnection1.ExecSQL(sql);
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Excluido com sucesso!');
  dm.FDQProdutos.Close;
  dm.FDQProdutos.Open();
end;

procedure TFProdutos.ListViewProdutosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  TabItem2.Enabled := True;
  TabControl1.TabIndex:=1;
  dm.FDQProdutos.Edit;
  EditNomeProduto.Text := dm.FDQProdutosproduto_nome.Text;
  EditValorVenda.Text := dm.FDQProdutosproduto_valor.Text;
  EditValorCusto.Text := dm.FDQProdutosproduto_valorCusto.Text;
end;

end.
