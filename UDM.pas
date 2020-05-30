unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, IOUtils;

type
  TDM = class(TDataModule)
    FDQCliente: TFDQuery;
    FDQClientecliente_id: TFDAutoIncField;
    FDQClientecliente_cpf: TStringField;
    FDQClientecliente_nome: TStringField;
    FDQClientecliente_celular: TStringField;
    FDQClientecliente_email: TStringField;
    FDQClientecliente_img: TBlobField;
    FDQPontuacao: TFDQuery;
    FDQPontuacaopontuacao_id: TFDAutoIncField;
    FDQPontuacaopontuacao_id_cliente: TIntegerField;
    FDQPontuacaopontuacao_id_procedimento: TIntegerField;
    FDQPontuacaopontuacao_pontos: TIntegerField;
    FDQPontuacaopontuacao_valor: TFMTBCDField;
    FDQPontuacaopontuacao_data: TDateField;
    FDQSomaPontos: TFDQuery;
    FDQProcedimentos: TFDQuery;
    FDQProcedimentosprocedimento_id: TFDAutoIncField;
    FDQProcedimentosprocedimento_descricao: TStringField;
    FDQProcedimentosprocedimento_valor: TFMTBCDField;
    FDQProcedimentosprocedimento_pontos: TIntegerField;
    FDQProcedimentosprocedimentos_status: TStringField;
    FDQProcedimentosprocedimentos_img: TBlobField;
    FDQParametro: TFDQuery;
    FDQParametroparametro_nome: TStringField;
    FDQParametroparametro_logo: TBlobField;
    FDQParametroparametro_login: TStringField;
    FDQParametroparametro_totalpontos: TIntegerField;
    FDQParametroparametro_premio: TStringField;
    FDQParametroparametro_senha: TStringField;
    FDQListaPontos: TFDQuery;
    FDQPontuacaoZera: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FMTBCDField1: TFMTBCDField;
    DateField1: TDateField;
    WideStringField1: TWideStringField;
    FDConnection1: TFDConnection;
    FDQSomaAtendimentoDia: TFDQuery;
    FDQSomaAtendimentoDiapontuacao_data: TDateField;
    FDQSomaAtendimentoDiavalor: TLargeintField;
    FDQListAtendimentoDia: TFDQuery;
    FDQListAtendimentoDiapontuacao_id: TFDAutoIncField;
    FDQListAtendimentoDiapontuacao_id_cliente: TIntegerField;
    FDQListAtendimentoDiapontuacao_id_procedimento: TIntegerField;
    FDQListAtendimentoDiapontuacao_pontos: TIntegerField;
    FDQListAtendimentoDiapontuacao_valor: TFMTBCDField;
    FDQListAtendimentoDiapontuacao_data: TDateField;
    FDQListAtendimentoDiacliente_id: TIntegerField;
    FDQListAtendimentoDiacliente_cpf: TStringField;
    FDQListAtendimentoDiacliente_nome: TStringField;
    FDQListAtendimentoDiacliente_celular: TStringField;
    FDQListAtendimentoDiacliente_email: TStringField;
    FDQListAtendimentoDiacliente_img: TBlobField;
    FDQListAtendimentoDiaprocedimento_id: TIntegerField;
    FDQListAtendimentoDiaprocedimento_descricao: TStringField;
    FDQListAtendimentoDiaprocedimento_valor: TFMTBCDField;
    FDQListAtendimentoDiaprocedimento_pontos: TIntegerField;
    FDQListAtendimentoDiaprocedimentos_status: TStringField;
    FDQListAtendimentoDiaprocedimentos_img: TBlobField;
    FDQConsultaFaturamento: TFDQuery;
    FDQProdutos: TFDQuery;
    FDQProdutosproduto_id: TFDAutoIncField;
    FDQProdutosproduto_nome: TStringField;
    FDQProdutosproduto_valor: TFMTBCDField;
    FDQProdutosproduto_valorCusto: TFMTBCDField;
    FDQVenda: TFDQuery;
    FDQVendavenda_id: TFDAutoIncField;
    FDQVendavenda_cliente_id: TIntegerField;
    FDQVendavenda_data: TDateField;
    FDQVendavenda_tp_pagamento: TStringField;
    FDQVendavenda_valor: TFMTBCDField;
    FDQVendaItem: TFDQuery;
    FDQVendaItemvendaItem_id: TFDAutoIncField;
    FDQVendaItemvendaitem_venda_id: TIntegerField;
    FDQVendaItemvendaitem_produto_id: TIntegerField;
    FDQVendaItemvendaitem_qte: TFMTBCDField;
    FDQVendaItemvendaitem_valor: TFMTBCDField;
    FDQClienteAll: TFDQuery;
    FDQClienteAllcliente_id: TFDAutoIncField;
    FDQClienteAllcliente_cpf: TStringField;
    FDQClienteAllcliente_nome: TStringField;
    FDQClienteAllcliente_celular: TStringField;
    FDQClienteAllcliente_email: TStringField;
    FDQClienteAllcliente_img: TBlobField;
    FDQSomaVendasPeriodo: TFDQuery;
    FDQSomaVendasPeriodovalor: TLargeintField;
    FDQBuscaClienteNome: TFDQuery;
    FDQBuscaClienteNomecliente_id: TFDAutoIncField;
    FDQBuscaClienteNomecliente_cpf: TStringField;
    FDQBuscaClienteNomecliente_nome: TStringField;
    FDQBuscaClienteNomecliente_celular: TStringField;
    FDQBuscaClienteNomecliente_email: TStringField;
    FDQBuscaClienteNomecliente_img: TBlobField;
    FDQCustoFixo: TFDQuery;
    FDQItemVendasPeriodo: TFDQuery;
    FDQItemVendasPeriodovenda_id: TFDAutoIncField;
    FDQItemVendasPeriodovenda_cliente_id: TIntegerField;
    FDQItemVendasPeriodovenda_data: TDateField;
    FDQItemVendasPeriodovenda_tp_pagamento: TStringField;
    FDQItemVendasPeriodovenda_valor: TFMTBCDField;
    FDQItemVendasPeriodovendaItem_id: TIntegerField;
    FDQItemVendasPeriodovendaitem_venda_id: TIntegerField;
    FDQItemVendasPeriodovendaitem_produto_id: TIntegerField;
    FDQItemVendasPeriodovendaitem_qte: TFMTBCDField;
    FDQItemVendasPeriodovendaitem_valor: TFMTBCDField;
    FDQItemVendasPeriodoproduto_id: TIntegerField;
    FDQItemVendasPeriodoproduto_nome: TStringField;
    FDQItemVendasPeriodoproduto_valor: TFMTBCDField;
    FDQItemVendasPeriodoproduto_valorCusto: TFMTBCDField;
    FDQListServicosCliente: TFDQuery;
    FDQListProdutosCliente: TFDQuery;
    FDQListProdutosClientevenda_id: TFDAutoIncField;
    FDQListProdutosClientevenda_cliente_id: TIntegerField;
    FDQListProdutosClientevenda_data: TDateField;
    FDQListProdutosClientevenda_tp_pagamento: TStringField;
    FDQListProdutosClientevenda_valor: TFMTBCDField;
    FDQListProdutosClientevendaItem_id: TIntegerField;
    FDQListProdutosClientevendaitem_venda_id: TIntegerField;
    FDQListProdutosClientevendaitem_produto_id: TIntegerField;
    FDQListProdutosClientevendaitem_qte: TFMTBCDField;
    FDQListProdutosClientevendaitem_valor: TFMTBCDField;
    FDQListProdutosClienteproduto_id: TIntegerField;
    FDQListProdutosClienteproduto_nome: TStringField;
    FDQListProdutosClienteproduto_valor: TFMTBCDField;
    FDQListProdutosClienteproduto_valorCusto: TFMTBCDField;
    FDQSelecionaProduto: TFDQuery;
    FDQSelecionaProdutoproduto_id: TFDAutoIncField;
    FDQSelecionaProdutoproduto_nome: TStringField;
    FDQSelecionaProdutoproduto_valor: TFMTBCDField;
    FDQSelecionaProdutoproduto_valorCusto: TFMTBCDField;
    FDQConsultaFaturamentovalor: TLargeintField;
    FDQSomaPontospontuacao: TLargeintField;
    FDQPontuacaopontuacao_tp_pagamento: TStringField;
    FDQListaPontossoma: TLargeintField;
    FDQListaPontoscliente_nome: TStringField;
    FDQListaPontoscliente_celular: TStringField;
    FDQListaPontoscliente_img: TBlobField;
    FDQListaPontoscliente_id: TFDAutoIncField;
    FDQListAtendimentoDiapontuacao_tp_pagamento: TStringField;
    FDQCustoFixocustofixo_id: TFDAutoIncField;
    FDQCustoFixocustofixo_descricao: TStringField;
    FDQCustoFixocustofixo_valor: TFMTBCDField;
    FDQCustoFixocustofixo_rateio: TStringField;
    FDQCustoFixocustofixo_tipo: TStringField;
    FDQListServicosClientepontuacao_id: TFDAutoIncField;
    FDQListServicosClientepontuacao_id_cliente: TIntegerField;
    FDQListServicosClientepontuacao_id_procedimento: TIntegerField;
    FDQListServicosClientepontuacao_pontos: TIntegerField;
    FDQListServicosClientepontuacao_valor: TFMTBCDField;
    FDQListServicosClientepontuacao_data: TDateField;
    FDQListServicosClientepontuacao_tp_pagamento: TStringField;
    FDQListServicosClienteprocedimento_id: TIntegerField;
    FDQListServicosClienteprocedimento_descricao: TStringField;
    FDQListServicosClienteprocedimento_valor: TFMTBCDField;
    FDQListServicosClienteprocedimento_pontos: TIntegerField;
    FDQListServicosClienteprocedimentos_status: TStringField;
    FDQListServicosClienteprocedimentos_img: TBlobField;
    FDQListaCarrinho: TFDQuery;
    FDQListaCarrinhovendaitem_venda_id: TIntegerField;
    FDQListaCarrinhovendaitem_produto_id: TIntegerField;
    FDQListaCarrinhovendaitem_qte: TFMTBCDField;
    FDQListaCarrinhodescricao: TWideStringField;
    FDQListaCarrinhovendaItem_id: TFDAutoIncField;
    FDQListaCarrinhovendaitem_valor: TFMTBCDField;
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TDM.FDConnection1AfterConnect(Sender: TObject);
var
  strSQL: string;
begin
  strSQL := //
    ' CREATE TABLE IF NOT EXISTS parametro( ' + //
    ' parametro_nome varchar(60),   ' + //
    ' parametro_logo blob,          ' + //
    ' parametro_login varchar(100), ' + //
    ' parametro_totalpontos integer,' + //
    ' parametro_premio varchar(100),' + //
    ' parametro_senha varchar(10))  ';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' CREATE TABLE IF NOT EXISTS cliente(   ' + //
    ' cliente_id integer not null primary key AUTOINCREMENT, ' + //
    ' cliente_cpf varchar(11),   ' + //
    ' cliente_nome varchar(60),   ' + //
    ' cliente_celular varchar(12), ' + //
    ' cliente_img blob , ' + //
    ' cliente_email varchar(100)) ';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' CREATE TABLE IF NOT EXISTS procedimento(  ' + //
    ' procedimento_id integer not null primary key AUTOINCREMENT,  ' + //
    ' procedimento_descricao varchar(70),    ' + //
    ' procedimento_valor numeric(4,8),   ' + //
    ' procedimento_pontos integer,     ' + //
    ' procedimentos_status char(1),   ' + //
    ' procedimentos_img blob)  ';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' CREATE TABLE IF NOT EXISTS pontuacao(   ' + //
    ' pontuacao_id integer not null primary key AUTOINCREMENT,      ' + //
    ' pontuacao_id_cliente integer,    ' + //
    ' pontuacao_id_procedimento integer, ' + //
    ' pontuacao_pontos integer,    ' + //
    ' pontuacao_valor numeric(4,8),  ' + //
    ' pontuacao_data date,  ' + //
    ' pontuacao_tp_pagamento varchar(10),  ' + //
    ' foreign key (pontuacao_id_cliente)references cliente(cliente_id), ' + //
    ' foreign key (pontuacao_id_procedimento)references procedimento(procedimento_id)) ';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS produto(   ' + //
    ' produto_id integer not null primary key autoincrement, ' + //
    ' produto_nome varchar(60),  ' + //
    ' produto_valor numeric(4,8),  ' + //
    ' produto_valorCusto numeric(4,8))  ';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS venda (  ' + //
    ' venda_id integer not null primary key autoincrement, ' + //
    ' venda_cliente_id integer,   ' + //
    ' venda_data date,     ' + //
    ' venda_tp_pagamento varchar(10),  ' + //
    ' venda_valor numeric(4,8))   ';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS vendaItem (  ' + //
    ' vendaItem_id integer not null primary key autoincrement, ' + //
    ' vendaitem_venda_id integer,    ' + //
    ' vendaitem_produto_id integer,    ' + //
    ' vendaitem_qte numeric(4,8),     ' + //
    ' vendaitem_valor numeric(4,8)) ';
  FDConnection1.ExecSQL(strSQL);

  strSQL := EmptyStr;
  strSQL := //
    ' create table IF NOT EXISTS custofixo(    ' + //
    ' custofixo_id integer not null primary key autoincrement,   ' + //
    ' custofixo_descricao varchar(50),    ' + //
    ' custofixo_valor numeric(4,8),   ' + //
    ' custofixo_rateio varchar(10),   ' + //
    ' custofixo_tipo varchar(10))  ';
  FDConnection1.ExecSQL(strSQL);
end;

procedure TDM.FDConnection1BeforeConnect(Sender: TObject);
var
  strPath: string;
begin
{$IFDEF MSWINDOWS}
  strPath := System.IOUtils.TPath.Combine
    ('C:\Users\vinic\Documents\Embarcadero\Studio\Projects\AppSalao\Bd\',
    'Bd.db3');
{$ENDIF}
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
    'Bd.db3');
{$ENDIF}
  FDConnection1.Params.Values['DATABASE'] := strPath;
end;

end.
