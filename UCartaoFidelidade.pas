unit UCartaoFidelidade;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.Db,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UModelo, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.Edit,
  FMX.TabControl, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, MultiDetailAppearanceU;

type
  TFFidelidade = class(TFModelo)
    StyleBook1: TStyleBook;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    VertScrollBox3: TVertScrollBox;
    LayoutDadosCliente: TLayout;
    CircleFotoCliente: TCircle;
    LabelNomeCliente: TLabel;
    LabelTelefoneCliente: TLabel;
    LayoutLogoEmpresa: TLayout;
    LabelNomeEmpresa: TLabel;
    RectangleLogoEmpresa: TRectangle;
    LayoutCampo: TLayout;
    EditCPF: TEdit;
    Label2: TLabel;
    RoundRect1: TRoundRect;
    BtnConfirmar: TButton;
    Layout17: TLayout;
    VertScrollBox2: TVertScrollBox;
    LayoutTopo: TLayout;
    CircleFotoCliente2: TCircle;
    LabelCliente2: TLabel;
    Labelcelular2: TLabel;
    LayoutEntrada: TLayout;
    EditCpf2: TEdit;
    Label6: TLabel;
    RoundRect2: TRoundRect;
    BtnCartao: TButton;
    Layout3D1: TLayout3D;
    LayoutCartao: TLayout;
    RectangleCartao: TRectangle;
    LayoutCartaoDentro: TLayout;
    imgEstrela1: TImage;
    imgEstrela2: TImage;
    imgEstrela3: TImage;
    imgEstrela4: TImage;
    imgEstrela5: TImage;
    imgEstrela6: TImage;
    imgEstrela7: TImage;
    imgEstrela8: TImage;
    imgEstrela9: TImage;
    imgEstrela10: TImage;
    imgtrofeu1: TImage;
    TabItem3: TTabItem;
    ListViewListProc: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    TabItem4: TTabItem;
    ListViewCliente: TListView;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    procedure EditCPFExit(Sender: TObject);
    procedure EditCpf2Exit(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnCartaoClick(Sender: TObject);
    procedure ListViewClienteDeleteItem(Sender: TObject; AIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure ListViewListProcItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
    cadastroClienteFidelidade: string;
    procedure VarificaPontos;
  end;

var
  FFidelidade: TFFidelidade;

implementation

{$R *.fmx}

uses UDM, UCadClientes
{$IFDEF ANDROID}
    , Androidapi.Helpers,
  FMX.Helpers.Android, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Net, Androidapi.JNI.JavaTypes
{$ENDIF ANDROID}
    ;

function ValidarCpf(num: string): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  d1, d2: Integer;
  digitado, calculado: string;
begin
{$IFDEF ANDROID}
  n1 := StrToInt(num[0]);
  n2 := StrToInt(num[1]);
  n3 := StrToInt(num[2]);
  n4 := StrToInt(num[3]);
  n5 := StrToInt(num[4]);
  n6 := StrToInt(num[5]);
  n7 := StrToInt(num[6]);
  n8 := StrToInt(num[7]);
  n9 := StrToInt(num[8]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9
    + n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 +
    n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[9] + num[10];
{$ENDIF}
{$IFDEF MSWINDOWS}
  n1 := StrToInt(num[1]);
  n2 := StrToInt(num[2]);
  n3 := StrToInt(num[3]);
  n4 := StrToInt(num[4]);
  n5 := StrToInt(num[5]);
  n6 := StrToInt(num[6]);
  n7 := StrToInt(num[7]);
  n8 := StrToInt(num[8]);
  n9 := StrToInt(num[9]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9
    + n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 +
    n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := num[10] + num[11];
{$ENDIF}
  if calculado = digitado then
    result := true
  else
    result := false;
end;

procedure TFFidelidade.VarificaPontos;
var
  vFoto: TStream;
  sql: string;
begin
  LabelNomeCliente.Text := dm.FDQClientecliente_nome.AsString;
  LabelTelefoneCliente.Text := dm.FDQClientecliente_celular.AsString;
  LabelCliente2.Text := dm.FDQClientecliente_nome.AsString;
  Labelcelular2.Text := dm.FDQClientecliente_celular.AsString;
  vFoto := dm.FDQCliente.CreateBlobStream
    (dm.FDQCliente.FieldByName('cliente_img'), bmRead);
  if not dm.FDQClientecliente_img.IsNull then
  begin
    CircleFotoCliente.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
    CircleFotoCliente2.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
  end;
  if dm.FDQClientecliente_id.AsString <> EmptyStr then
  begin
    dm.FDQSomaPontos.Close;
    dm.FDQSomaPontos.ParamByName('idCliente').AsString :=
      dm.FDQClientecliente_id.AsString;
    dm.FDQSomaPontos.Open;

    if dm.FDQSomaPontospontuacao.AsString <> EmptyStr then
    begin

      if dm.FDQParametroparametro_totalpontos.AsInteger <=
        dm.FDQSomaPontospontuacao.AsInteger then
      begin
        ShowMessage('Parabéns você acaba de ' +
          dm.FDQParametroparametro_premio.AsString);

        MessageDlg('Deseja excluir a pontuação?',
          System.UITypes.TMsgDlgType.mtInformation,
          [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
          procedure(const BotaoPressionado: TModalResult)
          begin
            case BotaoPressionado of
              mrYes:
                begin
                  sql := 'update pontuacao set pontuacao_pontos =0 where pontuacao_id_cliente =  '
                    + dm.FDQClientecliente_id.AsString;
                  dm.FDConnection1.ExecSQL(sql);
                  dm.FDConnection1.CommitRetaining;
                  ShowMessage('Pontuação zerada com sucesso!');
                end;

              mrNo:
                begin
                  ShowMessage('Você respondeu não');
                end;
            end;
          end);
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 100 then
      begin
        imgEstrela1.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 200 then
      begin
        imgEstrela2.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 300 then
      begin
        imgEstrela3.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 400 then
      begin
        imgEstrela4.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 500 then
      begin
        imgEstrela5.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 600 then
      begin
        imgEstrela6.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 700 then
      begin
        imgEstrela7.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 800 then
      begin
        imgEstrela8.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 900 then
      begin
        imgEstrela9.Visible := true;
      end;
      if dm.FDQSomaPontospontuacao.AsInteger >= 1000 then
      begin
        imgEstrela10.Visible := true;
        imgtrofeu1.Visible := true;
      end;
    end;
  end;
end;

procedure TFFidelidade.BtnCartaoClick(Sender: TObject);
var
  sql: string;
begin
  inherited;
  dm.FDQCliente.Close;
  dm.FDQCliente.ParamByName('cpf').AsString := EditCpf2.Text;
  dm.FDQCliente.Open();
  if dm.FDQCliente.RecordCount = 0 then
  begin
    dm.FDQClienteAll.Append;
    if not Assigned(FCadCliente) then
      FCadCliente := TFCadCliente.Create(nil);
    FCadCliente.ShowModal(
      procedure(ModalResult: TModalResult)
      begin

      end);
  end
  else
  begin
    dm.FDQPontuacao.Active := true;
    dm.FDQPontuacao.Append;
    dm.FDQPontuacaopontuacao_id_cliente.AsString :=
      dm.FDQClientecliente_id.AsString;
    dm.FDQPontuacaopontuacao_pontos.AsString := '100';
    dm.FDQPontuacaopontuacao_data.AsDateTime := Date;
    dm.FDQPontuacao.Post;
    dm.FDConnection1.CommitRetaining;
    ShowMessage('Parabéns você acaba de receber +100');
    VarificaPontos;
    if dm.FDQParametroparametro_totalpontos.AsInteger <=
      dm.FDQSomaPontospontuacao.AsInteger then
    begin
      ShowMessage('Parabéns você acaba de ' +
        dm.FDQParametroparametro_premio.AsString);

      MessageDlg('Deseja excluir a pontuação?',
        System.UITypes.TMsgDlgType.mtInformation,
        [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
        procedure(const BotaoPressionado: TModalResult)
        begin
          case BotaoPressionado of
            mrYes:
              begin
                sql := 'update pontuacao set pontuacao_pontos =0 where pontuacao_id_cliente =  '
                  + dm.FDQClientecliente_id.AsString;
                dm.FDConnection1.ExecSQL(sql);
                dm.FDConnection1.CommitRetaining;
                ShowMessage('Pontuação zerada com sucesso!');
              end;

            mrNo:
              begin
                ShowMessage('Você respondeu não');
              end;
          end;
        end);
    end;
  end;
end;

procedure TFFidelidade.BtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dm.FDQCliente.Close;
  dm.FDQCliente.ParamByName('cpf').AsString := EditCPF.Text;
  dm.FDQCliente.Open();
  if dm.FDQCliente.RecordCount = 0 then
  begin
    dm.FDQClienteAll.Active := true;
    dm.FDQClienteAll.Append;
    cadastroClienteFidelidade := EditCPF.Text;

    if not Assigned(FCadCliente) then
      FCadCliente := TFCadCliente.Create(nil);
    FCadCliente.ShowModal(
      procedure(ModalResult: TModalResult)
      begin

      end);
  end
  else
  begin
    cadastroClienteFidelidade := EmptyStr;
    dm.FDQProcedimentos.Active := true;
    dm.FDQProcedimentos.Close;
    dm.FDQProcedimentos.Open();
    TabControl1.TabIndex := 2;
    VarificaPontos;
  end;

end;

procedure TFFidelidade.EditCpf2Exit(Sender: TObject);
begin
  inherited;
  if not ValidarCpf(EditCpf2.Text) then
  begin
    ShowMessage('CPF é inválido!');
    EditCpf2.SetFocus;
    Exit;
  end;
  dm.FDQCliente.Close;
  dm.FDQCliente.ParamByName('cpf').AsString := EditCpf2.Text;
  dm.FDQCliente.Open();
  VarificaPontos;
end;

procedure TFFidelidade.EditCPFExit(Sender: TObject);
begin
  inherited;
  if not ValidarCpf(EditCPF.Text) then
  begin
    ShowMessage('CPF é inválido!');
    EditCPF.SetFocus;
    Exit;
  end;
  dm.FDQCliente.Close;
  dm.FDQCliente.ParamByName('cpf').AsString := EditCPF.Text;
  dm.FDQCliente.Open();
  VarificaPontos;
end;

procedure TFFidelidade.FormShow(Sender: TObject);
var
  vFoto: TStream;
begin
  inherited;
  dm.FDQListaPontos.Active := true;
  dm.FDQListaPontos.Close;
  dm.FDQListaPontos.Open();

  dm.FDQParametro.Close;
  dm.FDQParametro.Open();
  // Lendo a imagem do campo BLOB para a Memória
  vFoto := dm.FDQParametro.CreateBlobStream
    (dm.FDQParametro.FieldByName('parametro_logo'), bmRead);
  if vFoto.Size > 0 then
  begin
    RectangleLogoEmpresa.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
  end;
  LabelNomeEmpresa.Text := dm.FDQParametroparametro_nome.AsString;

  TabControl1.TabIndex := 0;
  dm.FDQListaPontos.Close;
  dm.FDQListaPontos.Open();

end;

procedure TFFidelidade.ListViewClienteDeleteItem(Sender: TObject;
AIndex: Integer);
var
  sql: string;
begin
  inherited;
  dm.FDQPontuacaoZera.Active := true;
  dm.FDQPontuacaoZera.Close;
  dm.FDQPontuacaoZera.ParamByName('idcliente').AsString :=
    dm.FDQListaPontoscliente_id.AsString;
  dm.FDQPontuacaoZera.Open();
  while not dm.FDQPontuacaoZera.Eof do
  begin
    sql := 'update pontuacao set pontuacao_pontos =0 where pontuacao_id_cliente =  '
      + dm.FDQListaPontoscliente_id.AsString;
    dm.FDConnection1.ExecSQL(sql);
    dm.FDQPontuacaoZera.Next;
  end;
end;

procedure TFFidelidade.ListViewListProcItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  inherited;
  dm.FDQPontuacao.Active := true;
  dm.FDQPontuacao.Append;
  dm.FDQPontuacaopontuacao_id_cliente.AsString :=
    dm.FDQClienteallcliente_id.AsString;
  dm.FDQPontuacaopontuacao_id_procedimento.AsString :=
    dm.FDQProcedimentosprocedimento_id.AsString;
  dm.FDQPontuacaopontuacao_pontos.AsString :=
    dm.FDQProcedimentosprocedimento_pontos.AsString;
  dm.FDQPontuacaopontuacao_data.AsDateTime := Date;
  dm.FDQPontuacaopontuacao_valor.AsString :=
    dm.FDQProcedimentosprocedimento_valor.AsString;
  dm.FDQPontuacao.Post;
  dm.FDConnection1.CommitRetaining;
  ShowMessage('Parabéns você acaba de receber +' +
    dm.FDQProcedimentosprocedimento_pontos.AsString + ' pontos');
  dm.FDQSomaPontos.Close;
  dm.FDQSomaPontos.ParamByName('idCliente').AsString :=
    dm.FDQClienteallcliente_id.AsString;
  dm.FDQSomaPontos.Open();
  if dm.FDQParametroparametro_totalpontos.AsInteger <=
    dm.FDQSomaPontospontuacao.AsInteger then
  begin
    ShowMessage('Parabéns você acaba de ' +
      dm.FDQParametroparametro_premio.AsString);
  end;
  TabControl1.TabIndex := 0;
  EditCPF.Text := EmptyStr;
end;

end.
