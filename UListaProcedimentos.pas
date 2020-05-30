unit UListaProcedimentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.Db,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FMX.ListView, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.TabControl, FMX.Edit;

type
  TFListaProcedimentos = class(TFModelo)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    TabControl1: TTabControl;
    Lista: TTabItem;
    Cadastro: TTabItem;
    ListViewListaProcedimentos: TListView;
    CircleAddProcedimentos: TCircle;
    VertScrollBox2: TVertScrollBox;
    Layout13: TLayout;
    Layout15: TLayout;
    RoundRect5: TRoundRect;
    BtnConfirmarProcedimento: TButton;
    Layout16: TLayout;
    EditDescricao: TEdit;
    Layout18: TLayout;
    Editvalor: TEdit;
    Layout19: TLayout;
    ChckProcedimento: TCheckBox;
    Layout20: TLayout;
    EditPontos: TEdit;
    LinkListControlToField1: TLinkListControlToField;
    procedure ListViewListaProcedimentosDeleteItem(Sender: TObject;
      AIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure CircleAddProcedimentosClick(Sender: TObject);
    procedure BtnConfirmarProcedimentoClick(Sender: TObject);
    procedure ListViewListaProcedimentosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ChckProcedimentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaProcedimentos: TFListaProcedimentos;

implementation

{$R *.fmx}

uses UCartaoFidelidade, UDM, UPrincipal;

procedure TFListaProcedimentos.BtnConfirmarProcedimentoClick(Sender: TObject);
begin
  inherited;
  If not(dm.FDQProcedimentos.State in [dsEdit, dsInsert]) then
  begin
    dm.FDQProcedimentos.Append;
  end;
  dm.FDQProcedimentosprocedimento_descricao.AsString := EditDescricao.Text;
  dm.FDQProcedimentosprocedimento_valor.AsString := Editvalor.Text;
  dm.FDQProcedimentosprocedimento_pontos.AsString := EditPontos.Text;
  if ChckProcedimento.IsChecked then
  begin
    dm.FDQProcedimentosprocedimentos_status.AsString := 'I';
  end
  else
  begin
    dm.FDQProcedimentosprocedimentos_status.AsString := 'A';
  end;
  // CircleFotoCliente.Fill.Bitmap.Bitmap.SaveToStream(StreamImg);
  // dm.FDQProcedimentosprocedimentos_img.LoadFromStream(StreamImg);
  dm.FDQProcedimentos.Post;
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Salvo com sucesso!');
  EditDescricao.Text := EmptyStr;
  Editvalor.Text := EmptyStr;
  EditPontos.Text := EmptyStr;
  Cadastro.Enabled := false;
  TabControl1.TabIndex := 0;
end;

procedure TFListaProcedimentos.ChckProcedimentoClick(Sender: TObject);
begin
  inherited;
  if ChckProcedimento.IsChecked then
  begin
    ChckProcedimento.Text := 'Inativo';
  end
  else
  begin
     ChckProcedimento.Text := 'Ativo';
  end;

end;

procedure TFListaProcedimentos.CircleAddProcedimentosClick(Sender: TObject);
begin
  inherited;
  dm.FDQProcedimentos.Append;
  Cadastro.Enabled := True;
  TabControl1.TabIndex := 1;
end;

procedure TFListaProcedimentos.FormShow(Sender: TObject);
begin
  inherited;
  dm.FDQProcedimentos.Active := True;
  dm.FDQProcedimentos.Close;
  dm.FDQProcedimentos.Open();
  TabControl1.TabIndex := 0;
end;

procedure TFListaProcedimentos.ListViewListaProcedimentosDeleteItem
  (Sender: TObject; AIndex: Integer);
var
  sql: string;
begin
  inherited;
  sql := 'delete from procedimento where procedimento_id=' +
    dm.FDQProcedimentosprocedimento_id.AsString;
  dm.FDConnection1.ExecSQL(sql);
  dm.FDConnection1.CommitRetaining;
  dm.FDQProcedimentos.Close;
  dm.FDQProcedimentos.Open();
end;

procedure TFListaProcedimentos.ListViewListaProcedimentosItemClick
  (const Sender: TObject; const AItem: TListViewItem);
begin
  inherited;
  dm.FDQProcedimentos.Edit;
  EditDescricao.Text := dm.FDQProcedimentosprocedimento_descricao.AsString;
  Editvalor.Text := dm.FDQProcedimentosprocedimento_valor.AsString;
  EditPontos.Text := dm.FDQProcedimentosprocedimento_pontos.AsString;
  if dm.FDQProcedimentosprocedimentos_status.AsString = 'I' then
  begin
    ChckProcedimento.IsChecked := True;
  end
  else
  begin
    ChckProcedimento.IsChecked := false;
  end;
  Cadastro.Enabled := True;
  TabControl1.TabIndex := 1;
end;

end.
