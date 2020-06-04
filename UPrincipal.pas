unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.JSON, IOUtils, DateUtils, Data.Db,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.MultiView, FMX.Ani,
  FMX.TabControl, FMX.Layouts, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Client, REST.Types, REST.Authenticator.Basic, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.SQLite;

type
  TFPrincipal = class(TForm)
    ToolBar1: TToolBar;
    bntMenu: TSpeedButton;
    RectBarra: TRectangle;
    Image1: TImage;
    MultiView1: TMultiView;
    LabelMenu: TLabel;
    btnInf: TSpeedButton;
    RectangleMenu: TRectangle;
    Label28: TLabel;
    GradientAnimation1: TGradientAnimation;
    StyleBook1: TStyleBook;
    VertScrollBox1: TVertScrollBox;
    RectFidelidade: TRectangle;
    Circle1: TCircle;
    btnCartao: TButton;
    RectHistorico: TRectangle;
    Circle6: TCircle;
    BtnHistorico: TButton;
    RectLancProcedimento: TRectangle;
    Circle7: TCircle;
    BtnLancProcedimento: TButton;
    RectVenda: TRectangle;
    Circle8: TCircle;
    btnLancVenda: TButton;
    RectProcedimento: TRectangle;
    Circle5: TCircle;
    BtnCadProcedimento: TButton;
    RectCadProduto: TRectangle;
    Circle4: TCircle;
    BtnCadProd: TButton;
    RectCadCliente: TRectangle;
    Circle3: TCircle;
    BtnCadCli: TButton;
    RectDashBoard: TRectangle;
    Circle9: TCircle;
    BtnDasborad: TButton;
    RectConfiguracao: TRectangle;
    Circle10: TCircle;
    bntConfiguracao: TButton;
    RectCustos: TRectangle;
    Circle2: TCircle;
    BtnCustos: TButton;
    RectAlteracao: TRectangle;
    Circle11: TCircle;
    btnAlteracao: TButton;
    LabelEmpresa: TLabel;
    LabelVersao: TLabel;
    LayoutUpdate: TLayout;
    rect_botao: TRectangle;
    btnAtualizar: TSpeedButton;
    RectUpadate: TRectangle;
    Layout2: TLayout;
    lbl_titulo: TLabel;
    lbl_texto: TLabel;
    ImageCirclo: TImage;
    img_seta: TImage;
    ImageBase: TImage;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    RectBkp: TRectangle;
    Circle12: TCircle;
    BtnBkp: TButton;
    RectRestaurar: TRectangle;
    Circle13: TCircle;
    btnRestaurar: TButton;
    LayoutLogo: TLayout;
    RectangleLogoEmpresa: TRectangle;
    procedure BtnCadCliClick(Sender: TObject);
    procedure btnCartaoClick(Sender: TObject);
    procedure BtnCadProcedimentoClick(Sender: TObject);
    procedure BtnDasboradClick(Sender: TObject);
    procedure btnLancVendaClick(Sender: TObject);
    procedure BtnLancProcedimentoClick(Sender: TObject);
    procedure bntConfiguracaoClick(Sender: TObject);
    procedure BtnHistoricoClick(Sender: TObject);
    procedure BtnCadProdClick(Sender: TObject);
    procedure BtnCustosClick(Sender: TObject);
    procedure btnAlteracaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnAtualizarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnAtualizarClick(Sender: TObject);
    procedure BtnBkpClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure btnInfClick(Sender: TObject);
    procedure BtnCadCliMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnCadCliMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnBkpMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnBkpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnCadProcedimentoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnCadProdMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCartaoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnLancProcedimentoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure btnLancVendaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnDasboradMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnHistoricoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure bntConfiguracaoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnAlteracaoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnRestaurarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnRestaurarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnAlteracaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure bntConfiguracaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnCustosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnCustosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnHistoricoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnDasboradMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnLancVendaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnLancProcedimentoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCartaoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnCadProdMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure BtnCadProcedimentoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
    versao_app, versao_server: string;
  public
    { Public declarations }
    procedure OnFinishUpdate(Sender: TObject);
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.fmx}

uses UCadClientes, UCartaoFidelidade, UListaProcedimentos, UDashboard,
  UVendaProduto, UVendaProcedimento, UConfiguracao, UHistorico, UProdutos,
  UCusto, UAlteracao, uOpenViewUrl, UDM, USobre;

procedure TFPrincipal.OnFinishUpdate(Sender: TObject);
begin
  // Ocorreu algum erro na Thread...
  if Assigned(TThread(Sender).FatalException) then
  begin
    showmessage(Exception(TThread(Sender).FatalException).Message);
    exit;
  end;

  if versao_app < versao_server then
  begin
    // Exibe o painel de update...
    LayoutLogo.Visible := False;
    LayoutUpdate.Visible := true;
    img_seta.Position.Y := 0;
    img_seta.Opacity := 0.5;
    lbl_titulo.Opacity := 0;
    lbl_texto.Opacity := 0;
    rect_botao.Opacity := 0;

    LayoutUpdate.BringToFront;
    LayoutUpdate.AnimateFloat('Margins.Top', 0, 0.8, TAnimationType.InOut,
      TInterpolationType.Circular);

    img_seta.AnimateFloatDelay('Position.Y', 50, 0.5, 1, TAnimationType.Out,
      TInterpolationType.Back);
    img_seta.AnimateFloatDelay('Opacity', 1, 0.4, 0.9);

    lbl_titulo.AnimateFloatDelay('Opacity', 1, 0.7, 1.3);
    lbl_texto.AnimateFloatDelay('Opacity', 1, 0.7, 1.6);
    rect_botao.AnimateFloatDelay('Opacity', 1, 0.7, 1.9);
  end;

end;

procedure TFPrincipal.bntConfiguracaoClick(Sender: TObject);
begin
  if not Assigned(FConfiguracao) then
    FConfiguracao := TFConfiguracao.Create(nil);
  FConfiguracao.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.bntConfiguracaoMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectConfiguracao.Opacity := 0.5;
end;

procedure TFPrincipal.bntConfiguracaoMouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectConfiguracao.Opacity := 1;
end;

procedure TFPrincipal.btnAlteracaoClick(Sender: TObject);
begin
  if not Assigned(FAlteracao) then
    FAlteracao := TFAlteracao.Create(nil);
  FAlteracao.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.btnAlteracaoMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectAlteracao.Opacity := 0.5;
end;

procedure TFPrincipal.btnAlteracaoMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectAlteracao.Opacity := 1;
end;

procedure TFPrincipal.btnAtualizarClick(Sender: TObject);
var
  url: string;
begin
{$IFDEF ANDROID}
  url := 'https://drive.google.com/drive/folders/1lXLfF-gRGKGtSkbrDO24c-iQSMeQKgiF?usp=sharing';
{$ELSE}
  url := 'https://drive.google.com/drive/folders/1lXLfF-gRGKGtSkbrDO24c-iQSMeQKgiF?usp=sharing';
{$ENDIF}
  OpenURL(url, False);
  Application.Terminate;
end;

procedure TFPrincipal.btnAtualizarMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  rect_botao.Opacity := 0.5;
end;

procedure TFPrincipal.btnAtualizarMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  rect_botao.Opacity := 1;
end;

procedure TFPrincipal.BtnBkpClick(Sender: TObject);
var
  strPath: string;
  strDestino: string;
  AppPath: string;
  I: integer;
begin
  MultiView1.Visible := False;
{$IFDEF MSWINDOWS}
  strPath := System.IOUtils.TPath.Combine
    ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AppSalao\Bd\',
    'Bd.db3');
  AppPath := IOUtils.TPath.GetDownloadsPath;
  strDestino := IOUtils.TPath.Combine(AppPath, 'DADOS1.db3');

  If not FileExists(strDestino) Then
  Begin
    TFile.Copy(strPath, strDestino);
  End
  else
  begin

    DM.FDConnection1.Connected := False;
    TFile.Delete(strDestino);

    TFile.Copy(strPath, strDestino);
  end;
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.GetDocumentsPath + PathDelim + 'Bd.db3';
  // AppPath := System.IOUtils.TPath.GetDownloadsPath;
  // strDestino := IOUtils.TPath.Combine(AppPath, 'smyFile.db3');

  strDestino := System.IOUtils.TPath.GetDownloadsPath + PathDelim +
    'DADOS1.db3';
  If not FileExists(strDestino) Then
  Begin
    TFile.Copy(strPath, strDestino);
  End
  else
  begin

    DM.FDConnection1.Connected := False;
    TFile.Delete(strDestino);
    TFile.Copy(strPath, strDestino);
  end;

{$ENDIF}

end;

procedure TFPrincipal.BtnBkpMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectBkp.Opacity := 0.5;
  MultiView1.Visible := true;
end;

procedure TFPrincipal.BtnBkpMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectBkp.Opacity := 1;
end;

procedure TFPrincipal.BtnCadCliClick(Sender: TObject);
begin
  if not Assigned(FCadCliente) then
    FCadCliente := TFCadCliente.Create(nil);
  FCadCliente.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.BtnCadCliMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectCadCliente.Opacity := 0.5;
end;

procedure TFPrincipal.BtnCadCliMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectCadCliente.Opacity := 1;
end;

procedure TFPrincipal.BtnCadProcedimentoClick(Sender: TObject);
begin
  if not Assigned(FListaProcedimentos) then
    FListaProcedimentos := TFListaProcedimentos.Create(nil);
  FListaProcedimentos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.BtnCadProcedimentoMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectProcedimento.Opacity := 0.5;
end;

procedure TFPrincipal.BtnCadProcedimentoMouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectProcedimento.Opacity := 1;
end;

procedure TFPrincipal.BtnCadProdClick(Sender: TObject);
begin
  if not Assigned(FProdutos) then
    FProdutos := TFProdutos.Create(nil);
  FProdutos.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.BtnCadProdMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectCadProduto.Opacity := 0.5;
end;

procedure TFPrincipal.BtnCadProdMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectCadProduto.Opacity := 1;
end;

procedure TFPrincipal.btnCartaoClick(Sender: TObject);
begin
  if not Assigned(FFidelidade) then
    FFidelidade := TFFidelidade.Create(nil);
  FFidelidade.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.btnCartaoMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectFidelidade.Opacity := 0.5;
end;

procedure TFPrincipal.btnCartaoMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectFidelidade.Opacity := 1;
end;

procedure TFPrincipal.BtnCustosClick(Sender: TObject);
begin
  if not Assigned(Fcusto) then
    Fcusto := TFcusto.Create(nil);
  Fcusto.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.BtnCustosMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectCustos.Opacity := 0.5;
end;

procedure TFPrincipal.BtnCustosMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectCustos.Opacity := 1;
end;

procedure TFPrincipal.BtnDasboradClick(Sender: TObject);
begin
  if not Assigned(FDashboard) then
    FDashboard := TFDashboard.Create(nil);
  FDashboard.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.BtnDasboradMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectDashBoard.Opacity := 0.5;
end;

procedure TFPrincipal.BtnDasboradMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectDashBoard.Opacity := 1;
end;

procedure TFPrincipal.BtnHistoricoClick(Sender: TObject);
begin
  if not Assigned(FHistorico) then
    FHistorico := TFHistorico.Create(nil);
  FHistorico.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.BtnHistoricoMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectHistorico.Opacity := 0.5;
end;

procedure TFPrincipal.BtnHistoricoMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectHistorico.Opacity := 1;
end;

procedure TFPrincipal.btnInfClick(Sender: TObject);
begin
  if not Assigned(FSobre) then
    FSobre := TFSobre.Create(nil);
  FSobre.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.BtnLancProcedimentoClick(Sender: TObject);
begin
  if not Assigned(FVendaProcedimento) then
    FVendaProcedimento := TFVendaProcedimento.Create(nil);
  FVendaProcedimento.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.BtnLancProcedimentoMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectLancProcedimento.Opacity := 0.5;
end;

procedure TFPrincipal.BtnLancProcedimentoMouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectLancProcedimento.Opacity := 1;
end;

procedure TFPrincipal.btnLancVendaClick(Sender: TObject);
begin
  if not Assigned(FVendaProduto) then
    FVendaProduto := TFVendaProduto.Create(nil);
  FVendaProduto.ShowModal(
    procedure(ModalResult: TModalResult)
    begin

    end);
end;

procedure TFPrincipal.btnLancVendaMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectVenda.Opacity := 0.5;
end;

procedure TFPrincipal.btnLancVendaMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectVenda.Opacity := 1;
end;

procedure TFPrincipal.btnRestaurarClick(Sender: TObject);
var
  strPath: string;
  strOrigem: string;
  AppPath: string;
  I: integer;
begin
{$IFDEF MSWINDOWS}
  AppPath := IOUtils.TPath.GetDownloadsPath;
  strOrigem := IOUtils.TPath.Combine(AppPath, 'smyFile.db3');
  strPath := System.IOUtils.TPath.Combine
    ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AppSalao\Bd\',
    'Bd.db3');
  If not FileExists(strPath) Then
  Begin
    TFile.Copy(strOrigem, strPath);
  End
  else
  begin
    Sleep(1000);
    DM.FDConnection1.Connected := False;
    TFile.Delete(strPath);

    TFile.Copy(strOrigem, strPath);
  end;

{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  AppPath := IOUtils.TPath.GetDownloadsPath;
  strOrigem := IOUtils.TPath.Combine(AppPath, 'smyFile.db3');
  strPath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
    'Bd.db3');
  If not FileExists(strPath) Then
  Begin
    TFile.Copy(strOrigem, strPath);
    ProgressBar1.Visible := true;

  End
  else
  begin
    Sleep(1000);
    DM.FDConnection1.Connected := False;
    TFile.Delete(strPath);
    ProgressBar1.Visible := true;

    TFile.Copy(strOrigem, strPath);
  end;
{$ENDIF}
  Application.Terminate;
end;

procedure TFPrincipal.btnRestaurarMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  RectRestaurar.Opacity := 0.5;
end;

procedure TFPrincipal.btnRestaurarMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  RectRestaurar.Opacity := 1;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
var
  vFoto: TStream;
begin
  versao_app := '1,97';
  versao_server := '0.0';
  LabelVersao.Text := 'Versão ' + versao_app;
  LayoutUpdate.Margins.Top := FPrincipal.Height + 50;
  DM.FDQParametro.Close;
  DM.FDQParametro.Open();
  // Lendo a imagem do campo BLOB para a Memória
  vFoto := DM.FDQParametro.CreateBlobStream
    (DM.FDQParametro.FieldByName('parametro_logo'), bmRead);
  if vFoto.Size > 0 then
  begin
    RectangleLogoEmpresa.Fill.Bitmap.Bitmap.LoadFromStream(vFoto);
  end;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
var
  t: TThread;
begin
  t := TThread.CreateAnonymousThread(
    procedure
    var
      JsonObj: TJSONObject;
    begin
      Sleep(2000);
      try
        RESTRequest1.Execute;
      except
        on ex: Exception do
        begin
          raise Exception.Create
            ('Erro ao acessar o servidor sem conexão com a internet ' +
            ex.Message);
          exit
        end;
      end;
      try
        JsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes
          (RESTRequest1.Response.JSONValue.ToString), 0) as TJSONObject;

        versao_server := TJSONObject(JsonObj).GetValue('Versao').Value;
      finally
        JsonObj.DisposeOf;
      end;
    end);
  t.OnTerminate := OnFinishUpdate;
  t.Start;
end;

end.
