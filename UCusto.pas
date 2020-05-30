unit UCusto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.Edit,
  FMX.ListBox, FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TFCusto = class(TFModelo)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    StyleBook1: TStyleBook;
    VertScrollBox2: TVertScrollBox;
    GroupBoxRateio: TGroupBox;
    ComboBoxtpRateio: TComboBox;
    GroupBoxTipo: TGroupBox;
    ComboBoxTipo: TComboBox;
    Layout23: TLayout;
    EditDescricaoCustos: TEdit;
    Layout30: TLayout;
    EditVlrCustos: TEdit;
    Layout47: TLayout;
    RoundRect10: TRoundRect;
    btncustofixo: TButton;
    ListViewCustos: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    CircleAddCustos: TCircle;
    procedure btncustofixoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CircleAddCustosClick(Sender: TObject);
    procedure ListViewCustosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewCustosDeleteItem(Sender: TObject; AIndex: Integer);
    procedure TabItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCusto: TFCusto;

implementation

{$R *.fmx}

uses UDM;

procedure TFCusto.btncustofixoClick(Sender: TObject);
var
  tipo, rateio: string;
begin
  inherited;
  dm.FDQCustoFixocustofixo_descricao.AsString := EditDescricaoCustos.Text;
  dm.FDQCustoFixocustofixo_valor.Text := EditVlrCustos.Text;
  tipo := ComboBoxTipo.Items.Strings[ComboBoxTipo.ItemIndex];
  dm.FDQCustoFixocustofixo_tipo.Text := tipo;
  rateio := ComboBoxtpRateio.Items.Strings[ComboBoxtpRateio.ItemIndex];
  dm.FDQCustoFixocustofixo_rateio.Text := rateio;
  dm.FDQCustoFixo.Post;
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Salvo com sucesso!');
  TabControl1.TabIndex := 0;
  TabItem2.Enabled := False;
  EditVlrCustos.Text := EmptyStr;
  EditDescricaoCustos.Text := EmptyStr;
end;

procedure TFCusto.CircleAddCustosClick(Sender: TObject);
begin
  inherited;
  TabItem2.Enabled := True;
  dm.FDQCustoFixo.Append;
  TabControl1.TabIndex := 1;
  EditDescricaoCustos.Text := EmptyStr;
  EditVlrCustos.Text := EmptyStr;
end;

procedure TFCusto.FormShow(Sender: TObject);
begin
  inherited;
  dm.FDQCustoFixo.Active := True;
  dm.FDQCustoFixo.Close;
  dm.FDQCustoFixo.Open();
  TabControl1.TabIndex := 0;
end;

procedure TFCusto.ListViewCustosDeleteItem(Sender: TObject; AIndex: Integer);
var
  sql: string;
begin
  inherited;
  sql := 'delete from custofixo where custofixo_id=' +
    dm.FDQCustoFixocustofixo_id.AsString;
  dm.FDConnection1.ExecSQL(sql);
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Excluido com sucesso!');
  dm.FDQCustoFixo.Close;
  dm.FDQCustoFixo.Open();
end;

procedure TFCusto.ListViewCustosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  TabItem2.Enabled := True;
  dm.FDQCustoFixo.Edit;
  EditDescricaoCustos.Text := dm.FDQCustoFixocustofixo_descricao.AsString;
  EditVlrCustos.Text := dm.FDQCustoFixocustofixo_valor.Text;
  TabControl1.TabIndex := 1;
end;

procedure TFCusto.TabItem1Click(Sender: TObject);
begin
  inherited;
  TabItem2.Enabled := False;
end;

end.
