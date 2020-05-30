object DM: TDM
  OldCreateOrder = False
  Height = 524
  Width = 703
  object FDQCliente: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cliente'
      'where cliente_cpf = :cpf')
    Left = 424
    Top = 16
    ParamData = <
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
    object FDQClientecliente_id: TFDAutoIncField
      FieldName = 'cliente_id'
      Origin = 'cliente_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQClientecliente_cpf: TStringField
      FieldName = 'cliente_cpf'
      Origin = 'cliente_cpf'
      Size = 11
    end
    object FDQClientecliente_nome: TStringField
      FieldName = 'cliente_nome'
      Origin = 'cliente_nome'
      Size = 60
    end
    object FDQClientecliente_celular: TStringField
      FieldName = 'cliente_celular'
      Origin = 'cliente_celular'
      Size = 12
    end
    object FDQClientecliente_email: TStringField
      FieldName = 'cliente_email'
      Origin = 'cliente_email'
      Size = 100
    end
    object FDQClientecliente_img: TBlobField
      FieldName = 'cliente_img'
      Origin = 'cliente_img'
    end
  end
  object FDQPontuacao: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pontuacao')
    Left = 359
    Top = 192
    object FDQPontuacaopontuacao_id: TFDAutoIncField
      FieldName = 'pontuacao_id'
      Origin = 'pontuacao_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQPontuacaopontuacao_id_cliente: TIntegerField
      FieldName = 'pontuacao_id_cliente'
      Origin = 'pontuacao_id_cliente'
    end
    object FDQPontuacaopontuacao_id_procedimento: TIntegerField
      FieldName = 'pontuacao_id_procedimento'
      Origin = 'pontuacao_id_procedimento'
    end
    object FDQPontuacaopontuacao_pontos: TIntegerField
      FieldName = 'pontuacao_pontos'
      Origin = 'pontuacao_pontos'
    end
    object FDQPontuacaopontuacao_valor: TFMTBCDField
      FieldName = 'pontuacao_valor'
      Origin = 'pontuacao_valor'
      Precision = 4
    end
    object FDQPontuacaopontuacao_data: TDateField
      FieldName = 'pontuacao_data'
      Origin = 'pontuacao_data'
    end
    object FDQPontuacaopontuacao_tp_pagamento: TStringField
      FieldName = 'pontuacao_tp_pagamento'
      Origin = 'pontuacao_tp_pagamento'
      Size = 10
    end
  end
  object FDQSomaPontos: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'select coalesce(sum(pontuacao_pontos),0) as pontuacao from pontu' +
        'acao'
      'where pontuacao_id_cliente = :idCliente')
    Left = 55
    Top = 352
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
    object FDQSomaPontospontuacao: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'pontuacao'
      Origin = 'pontuacao'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQProcedimentos: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from procedimento')
    Left = 191
    Top = 192
    object FDQProcedimentosprocedimento_id: TFDAutoIncField
      FieldName = 'procedimento_id'
      Origin = 'procedimento_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQProcedimentosprocedimento_descricao: TStringField
      FieldName = 'procedimento_descricao'
      Origin = 'procedimento_descricao'
      Size = 70
    end
    object FDQProcedimentosprocedimento_valor: TFMTBCDField
      FieldName = 'procedimento_valor'
      Origin = 'procedimento_valor'
      Precision = 4
    end
    object FDQProcedimentosprocedimento_pontos: TIntegerField
      FieldName = 'procedimento_pontos'
      Origin = 'procedimento_pontos'
    end
    object FDQProcedimentosprocedimentos_status: TStringField
      FieldName = 'procedimentos_status'
      Origin = 'procedimentos_status'
      FixedChar = True
      Size = 1
    end
    object FDQProcedimentosprocedimentos_img: TBlobField
      FieldName = 'procedimentos_img'
      Origin = 'procedimentos_img'
    end
  end
  object FDQParametro: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from parametro')
    Left = 112
    Top = 192
    object FDQParametroparametro_nome: TStringField
      FieldName = 'parametro_nome'
      Origin = 'parametro_nome'
      Size = 60
    end
    object FDQParametroparametro_logo: TBlobField
      FieldName = 'parametro_logo'
      Origin = 'parametro_logo'
    end
    object FDQParametroparametro_login: TStringField
      FieldName = 'parametro_login'
      Origin = 'parametro_login'
      Size = 100
    end
    object FDQParametroparametro_totalpontos: TIntegerField
      FieldName = 'parametro_totalpontos'
      Origin = 'parametro_totalpontos'
    end
    object FDQParametroparametro_premio: TStringField
      FieldName = 'parametro_premio'
      Origin = 'parametro_premio'
      Size = 100
    end
    object FDQParametroparametro_senha: TStringField
      FieldName = 'parametro_senha'
      Origin = 'parametro_senha'
      Size = 10
    end
  end
  object FDQListaPontos: TFDQuery
    Active = True
    Connection = FDConnection1
    FormatOptions.AssignedValues = [fvCheckPrecision]
    FormatOptions.CheckPrecision = True
    SQL.Strings = (
      'select COALESCE(SUM(p.pontuacao_pontos),0) soma,'
      '       c.cliente_nome,'
      '       c.cliente_celular,'
      '       c.cliente_img,'
      '       c.cliente_id'
      'from cliente c'
      'inner join pontuacao p on c.cliente_id = p.pontuacao_id_cliente'
      'group by c.cliente_nome')
    Left = 151
    Top = 136
    object FDQListaPontossoma: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'soma'
      Origin = 'soma'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListaPontoscliente_nome: TStringField
      FieldName = 'cliente_nome'
      Origin = 'cliente_nome'
      Size = 60
    end
    object FDQListaPontoscliente_celular: TStringField
      FieldName = 'cliente_celular'
      Origin = 'cliente_celular'
      Size = 12
    end
    object FDQListaPontoscliente_img: TBlobField
      FieldName = 'cliente_img'
      Origin = 'cliente_img'
    end
    object FDQListaPontoscliente_id: TFDAutoIncField
      FieldName = 'cliente_id'
      Origin = 'cliente_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object FDQPontuacaoZera: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pontuacao where pontuacao_id_cliente =:idcliente')
    Left = 63
    Top = 464
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'pontuacao_id'
      Origin = 'pontuacao_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'pontuacao_id_cliente'
      Origin = 'pontuacao_id_cliente'
    end
    object IntegerField2: TIntegerField
      FieldName = 'pontuacao_id_procedimento'
      Origin = 'pontuacao_id_procedimento'
    end
    object IntegerField3: TIntegerField
      FieldName = 'pontuacao_pontos'
      Origin = 'pontuacao_pontos'
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'pontuacao_valor'
      Origin = 'pontuacao_valor'
      Precision = 4
    end
    object DateField1: TDateField
      FieldName = 'pontuacao_data'
      Origin = 'pontuacao_data'
    end
    object WideStringField1: TWideStringField
      FieldName = 'pontuacao_tp_pagamento'
      Origin = 'pontuacao_tp_pagamento'
      Size = 32767
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\vinic\Documents\Embarcadero\Studio\Projects\Ap' +
        'pSalao\Bd\Bd.db3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 40
    Top = 16
  end
  object FDQSomaAtendimentoDia: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select pontuacao_data, coalesce(sum(pontuacao_valor),0) as valor'
      'from pontuacao'
      'group by pontuacao_data'
      'order by pontuacao_data  asc')
    Left = 176
    Top = 286
    object FDQSomaAtendimentoDiapontuacao_data: TDateField
      FieldName = 'pontuacao_data'
      Origin = 'pontuacao_data'
    end
    object FDQSomaAtendimentoDiavalor: TLargeintField
      FieldName = 'valor'
      ReadOnly = True
    end
  end
  object FDQListAtendimentoDia: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pontuacao p'
      'inner join cliente c on '
      'p.pontuacao_id_cliente = c.cliente_id'
      'left join procedimento pro on'
      'p.pontuacao_id_procedimento = pro.procedimento_id'
      'order by p.pontuacao_valor asc')
    Left = 56
    Top = 94
    object FDQListAtendimentoDiapontuacao_id: TFDAutoIncField
      FieldName = 'pontuacao_id'
      Origin = 'pontuacao_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListAtendimentoDiapontuacao_id_cliente: TIntegerField
      FieldName = 'pontuacao_id_cliente'
      Origin = 'pontuacao_id_cliente'
    end
    object FDQListAtendimentoDiapontuacao_id_procedimento: TIntegerField
      FieldName = 'pontuacao_id_procedimento'
      Origin = 'pontuacao_id_procedimento'
    end
    object FDQListAtendimentoDiapontuacao_pontos: TIntegerField
      FieldName = 'pontuacao_pontos'
      Origin = 'pontuacao_pontos'
    end
    object FDQListAtendimentoDiapontuacao_valor: TFMTBCDField
      FieldName = 'pontuacao_valor'
      Origin = 'pontuacao_valor'
      Precision = 4
    end
    object FDQListAtendimentoDiapontuacao_data: TDateField
      FieldName = 'pontuacao_data'
      Origin = 'pontuacao_data'
    end
    object FDQListAtendimentoDiacliente_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_id'
      Origin = 'cliente_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListAtendimentoDiacliente_cpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_cpf'
      Origin = 'cliente_cpf'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object FDQListAtendimentoDiacliente_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_nome'
      Origin = 'cliente_nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object FDQListAtendimentoDiacliente_celular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_celular'
      Origin = 'cliente_celular'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object FDQListAtendimentoDiacliente_email: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_email'
      Origin = 'cliente_email'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQListAtendimentoDiacliente_img: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'cliente_img'
      Origin = 'cliente_img'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListAtendimentoDiaprocedimento_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'procedimento_id'
      Origin = 'procedimento_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListAtendimentoDiaprocedimento_descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'procedimento_descricao'
      Origin = 'procedimento_descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object FDQListAtendimentoDiaprocedimento_valor: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'procedimento_valor'
      Origin = 'procedimento_valor'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
    object FDQListAtendimentoDiaprocedimento_pontos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'procedimento_pontos'
      Origin = 'procedimento_pontos'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListAtendimentoDiaprocedimentos_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'procedimentos_status'
      Origin = 'procedimentos_status'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object FDQListAtendimentoDiaprocedimentos_img: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'procedimentos_img'
      Origin = 'procedimentos_img'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListAtendimentoDiapontuacao_tp_pagamento: TStringField
      FieldName = 'pontuacao_tp_pagamento'
      Origin = 'pontuacao_tp_pagamento'
      Size = 10
    end
  end
  object FDQConsultaFaturamento: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select COALESCE(sum(pontuacao_valor),0)as valor from pontuacao'
      'where pontuacao_data between :dataIni and :dataFim '
      'and pontuacao_tp_pagamento=:tp_pagamento')
    Left = 511
    Top = 22
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
        Value = 43800d
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = 43860d
      end
      item
        Name = 'TP_PAGAMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = 'D'#233'bito'
      end>
    object FDQConsultaFaturamentovalor: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQProdutos: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produto')
    Left = 280
    Top = 190
    object FDQProdutosproduto_id: TFDAutoIncField
      FieldName = 'produto_id'
      Origin = 'produto_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQProdutosproduto_nome: TStringField
      FieldName = 'produto_nome'
      Origin = 'produto_nome'
      Size = 60
    end
    object FDQProdutosproduto_valor: TFMTBCDField
      FieldName = 'produto_valor'
      Origin = 'produto_valor'
      Precision = 4
    end
    object FDQProdutosproduto_valorCusto: TFMTBCDField
      FieldName = 'produto_valorCusto'
      Origin = 'produto_valorCusto'
      Precision = 4
    end
  end
  object FDQVenda: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from venda')
    Left = 367
    Top = 350
    object FDQVendavenda_id: TFDAutoIncField
      FieldName = 'venda_id'
      Origin = 'venda_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQVendavenda_cliente_id: TIntegerField
      FieldName = 'venda_cliente_id'
      Origin = 'venda_cliente_id'
    end
    object FDQVendavenda_data: TDateField
      FieldName = 'venda_data'
      Origin = 'venda_data'
    end
    object FDQVendavenda_tp_pagamento: TStringField
      FieldName = 'venda_tp_pagamento'
      Origin = 'venda_tp_pagamento'
      Size = 10
    end
    object FDQVendavenda_valor: TFMTBCDField
      FieldName = 'venda_valor'
      Origin = 'venda_valor'
      Precision = 4
    end
  end
  object FDQVendaItem: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from VendaItem')
    Left = 287
    Top = 350
    object FDQVendaItemvendaItem_id: TFDAutoIncField
      FieldName = 'vendaItem_id'
      Origin = 'vendaItem_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQVendaItemvendaitem_venda_id: TIntegerField
      FieldName = 'vendaitem_venda_id'
      Origin = 'vendaitem_venda_id'
    end
    object FDQVendaItemvendaitem_produto_id: TIntegerField
      FieldName = 'vendaitem_produto_id'
      Origin = 'vendaitem_produto_id'
    end
    object FDQVendaItemvendaitem_qte: TFMTBCDField
      FieldName = 'vendaitem_qte'
      Origin = 'vendaitem_qte'
      Precision = 4
    end
    object FDQVendaItemvendaitem_valor: TFMTBCDField
      FieldName = 'vendaitem_valor'
      Origin = 'vendaitem_valor'
      Precision = 4
    end
  end
  object FDQClienteAll: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cliente'
      'order by cliente_nome asc')
    Left = 351
    Top = 16
    object FDQClienteAllcliente_id: TFDAutoIncField
      FieldName = 'cliente_id'
      Origin = 'cliente_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQClienteAllcliente_cpf: TStringField
      FieldName = 'cliente_cpf'
      Origin = 'cliente_cpf'
      Size = 11
    end
    object FDQClienteAllcliente_nome: TStringField
      FieldName = 'cliente_nome'
      Origin = 'cliente_nome'
      Size = 60
    end
    object FDQClienteAllcliente_celular: TStringField
      FieldName = 'cliente_celular'
      Origin = 'cliente_celular'
      Size = 12
    end
    object FDQClienteAllcliente_email: TStringField
      FieldName = 'cliente_email'
      Origin = 'cliente_email'
      Size = 100
    end
    object FDQClienteAllcliente_img: TBlobField
      FieldName = 'cliente_img'
      Origin = 'cliente_img'
    end
  end
  object FDQSomaVendasPeriodo: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select COALESCE(sum(venda_valor),0)as valor from venda'
      'where venda_data between :dataIni and :dataFim '
      'and venda_tp_pagamento=:tp_pagamento')
    Left = 175
    Top = 350
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
        Value = 43831d
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = 43861d
      end
      item
        Name = 'TP_PAGAMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = 'D'#233'bito'
      end>
    object FDQSomaVendasPeriodovalor: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'valor'
      Origin = 'valor'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQBuscaClienteNome: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cliente where cliente_nome like :nome')
    Left = 223
    Top = 14
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Value = 'este'
      end>
    object FDQBuscaClienteNomecliente_id: TFDAutoIncField
      FieldName = 'cliente_id'
      Origin = 'cliente_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQBuscaClienteNomecliente_cpf: TStringField
      FieldName = 'cliente_cpf'
      Origin = 'cliente_cpf'
      Size = 11
    end
    object FDQBuscaClienteNomecliente_nome: TStringField
      FieldName = 'cliente_nome'
      Origin = 'cliente_nome'
      Size = 60
    end
    object FDQBuscaClienteNomecliente_celular: TStringField
      FieldName = 'cliente_celular'
      Origin = 'cliente_celular'
      Size = 12
    end
    object FDQBuscaClienteNomecliente_email: TStringField
      FieldName = 'cliente_email'
      Origin = 'cliente_email'
      Size = 100
    end
    object FDQBuscaClienteNomecliente_img: TBlobField
      FieldName = 'cliente_img'
      Origin = 'cliente_img'
    end
  end
  object FDQCustoFixo: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from custofixo')
    Left = 591
    Top = 22
    object FDQCustoFixocustofixo_id: TFDAutoIncField
      FieldName = 'custofixo_id'
      Origin = 'custofixo_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQCustoFixocustofixo_descricao: TStringField
      FieldName = 'custofixo_descricao'
      Origin = 'custofixo_descricao'
      Size = 50
    end
    object FDQCustoFixocustofixo_valor: TFMTBCDField
      FieldName = 'custofixo_valor'
      Origin = 'custofixo_valor'
      Precision = 4
    end
    object FDQCustoFixocustofixo_rateio: TStringField
      FieldName = 'custofixo_rateio'
      Origin = 'custofixo_rateio'
      Size = 10
    end
    object FDQCustoFixocustofixo_tipo: TStringField
      FieldName = 'custofixo_tipo'
      Origin = 'custofixo_tipo'
      Size = 10
    end
  end
  object FDQItemVendasPeriodo: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from venda v'
      'inner join vendaitem vi on vi.vendaitem_venda_id = v.venda_id'
      'inner join produto p on vi.vendaitem_produto_id = p.produto_id'
      'where venda_data between :dataIni and :dataFim ')
    Left = 351
    Top = 94
    ParamData = <
      item
        Name = 'DATAINI'
        DataType = ftDate
        ParamType = ptInput
        Value = 43800d
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
        Value = 43861d
      end>
    object FDQItemVendasPeriodovenda_id: TFDAutoIncField
      FieldName = 'venda_id'
      Origin = 'venda_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQItemVendasPeriodovenda_cliente_id: TIntegerField
      FieldName = 'venda_cliente_id'
      Origin = 'venda_cliente_id'
    end
    object FDQItemVendasPeriodovenda_data: TDateField
      FieldName = 'venda_data'
      Origin = 'venda_data'
    end
    object FDQItemVendasPeriodovenda_tp_pagamento: TStringField
      FieldName = 'venda_tp_pagamento'
      Origin = 'venda_tp_pagamento'
      Size = 10
    end
    object FDQItemVendasPeriodovenda_valor: TFMTBCDField
      FieldName = 'venda_valor'
      Origin = 'venda_valor'
      Precision = 4
    end
    object FDQItemVendasPeriodovendaItem_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vendaItem_id'
      Origin = 'vendaItem_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQItemVendasPeriodovendaitem_venda_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vendaitem_venda_id'
      Origin = 'vendaitem_venda_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQItemVendasPeriodovendaitem_produto_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vendaitem_produto_id'
      Origin = 'vendaitem_produto_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQItemVendasPeriodovendaitem_qte: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vendaitem_qte'
      Origin = 'vendaitem_qte'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
    object FDQItemVendasPeriodovendaitem_valor: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vendaitem_valor'
      Origin = 'vendaitem_valor'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
    object FDQItemVendasPeriodoproduto_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'produto_id'
      Origin = 'produto_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQItemVendasPeriodoproduto_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto_nome'
      Origin = 'produto_nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object FDQItemVendasPeriodoproduto_valor: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'produto_valor'
      Origin = 'produto_valor'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
    object FDQItemVendasPeriodoproduto_valorCusto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'produto_valorCusto'
      Origin = 'produto_valorCusto'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
  end
  object FDQListServicosCliente: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pontuacao p'
      
        'inner join procedimento pr on p.pontuacao_id_procedimento = pr.p' +
        'rocedimento_id'
      'where pontuacao_id_cliente = :idCliente')
    Left = 231
    Top = 86
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftString
        ParamType = ptInput
        Value = '11'
      end>
    object FDQListServicosClientepontuacao_id: TFDAutoIncField
      FieldName = 'pontuacao_id'
      Origin = 'pontuacao_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListServicosClientepontuacao_id_cliente: TIntegerField
      FieldName = 'pontuacao_id_cliente'
      Origin = 'pontuacao_id_cliente'
    end
    object FDQListServicosClientepontuacao_id_procedimento: TIntegerField
      FieldName = 'pontuacao_id_procedimento'
      Origin = 'pontuacao_id_procedimento'
    end
    object FDQListServicosClientepontuacao_pontos: TIntegerField
      FieldName = 'pontuacao_pontos'
      Origin = 'pontuacao_pontos'
    end
    object FDQListServicosClientepontuacao_valor: TFMTBCDField
      FieldName = 'pontuacao_valor'
      Origin = 'pontuacao_valor'
      Precision = 4
    end
    object FDQListServicosClientepontuacao_data: TDateField
      FieldName = 'pontuacao_data'
      Origin = 'pontuacao_data'
    end
    object FDQListServicosClientepontuacao_tp_pagamento: TStringField
      FieldName = 'pontuacao_tp_pagamento'
      Origin = 'pontuacao_tp_pagamento'
      Size = 10
    end
    object FDQListServicosClienteprocedimento_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'procedimento_id'
      Origin = 'procedimento_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListServicosClienteprocedimento_descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'procedimento_descricao'
      Origin = 'procedimento_descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object FDQListServicosClienteprocedimento_valor: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'procedimento_valor'
      Origin = 'procedimento_valor'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
    object FDQListServicosClienteprocedimento_pontos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'procedimento_pontos'
      Origin = 'procedimento_pontos'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListServicosClienteprocedimentos_status: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'procedimentos_status'
      Origin = 'procedimentos_status'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object FDQListServicosClienteprocedimentos_img: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'procedimentos_img'
      Origin = 'procedimentos_img'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQListProdutosCliente: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from venda v'
      'inner join vendaitem vi on vi.vendaitem_venda_id = v.venda_id'
      'inner join produto p on vi.vendaitem_produto_id = p.produto_id'
      'where venda_cliente_id =:idcliente')
    Left = 463
    Top = 94
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
    object FDQListProdutosClientevenda_id: TFDAutoIncField
      FieldName = 'venda_id'
      Origin = 'venda_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListProdutosClientevenda_cliente_id: TIntegerField
      FieldName = 'venda_cliente_id'
      Origin = 'venda_cliente_id'
    end
    object FDQListProdutosClientevenda_data: TDateField
      FieldName = 'venda_data'
      Origin = 'venda_data'
    end
    object FDQListProdutosClientevenda_tp_pagamento: TStringField
      FieldName = 'venda_tp_pagamento'
      Origin = 'venda_tp_pagamento'
      Size = 10
    end
    object FDQListProdutosClientevenda_valor: TFMTBCDField
      FieldName = 'venda_valor'
      Origin = 'venda_valor'
      Precision = 4
    end
    object FDQListProdutosClientevendaItem_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vendaItem_id'
      Origin = 'vendaItem_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListProdutosClientevendaitem_venda_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vendaitem_venda_id'
      Origin = 'vendaitem_venda_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListProdutosClientevendaitem_produto_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'vendaitem_produto_id'
      Origin = 'vendaitem_produto_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListProdutosClientevendaitem_qte: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vendaitem_qte'
      Origin = 'vendaitem_qte'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
    object FDQListProdutosClientevendaitem_valor: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'vendaitem_valor'
      Origin = 'vendaitem_valor'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
    object FDQListProdutosClienteproduto_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'produto_id'
      Origin = 'produto_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQListProdutosClienteproduto_nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto_nome'
      Origin = 'produto_nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object FDQListProdutosClienteproduto_valor: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'produto_valor'
      Origin = 'produto_valor'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
    object FDQListProdutosClienteproduto_valorCusto: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'produto_valorCusto'
      Origin = 'produto_valorCusto'
      ProviderFlags = []
      ReadOnly = True
      Precision = 4
    end
  end
  object FDQSelecionaProduto: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produto'
      'where produto_nome like :nomeProduto')
    Left = 56
    Top = 286
    ParamData = <
      item
        Name = 'NOMEPRODUTO'
        DataType = ftString
        ParamType = ptInput
        Value = 'A'
      end>
    object FDQSelecionaProdutoproduto_id: TFDAutoIncField
      FieldName = 'produto_id'
      Origin = 'produto_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQSelecionaProdutoproduto_nome: TStringField
      FieldName = 'produto_nome'
      Origin = 'produto_nome'
      Size = 60
    end
    object FDQSelecionaProdutoproduto_valor: TFMTBCDField
      FieldName = 'produto_valor'
      Origin = 'produto_valor'
      Precision = 4
    end
    object FDQSelecionaProdutoproduto_valorCusto: TFMTBCDField
      FieldName = 'produto_valorCusto'
      Origin = 'produto_valorCusto'
      Precision = 4
    end
  end
  object FDQListaCarrinho: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      
        'select vendaItem_id, vendaitem_venda_id, vendaitem_produto_id, v' +
        'endaitem_qte,vendaitem_valor,'
      
        '(produto_nome||'#39'- R$ '#39'||printf("%.2f",vendaitem_valor)) as descr' +
        'icao'
      
        ' from VendaItem vi inner join produto p on vi.vendaitem_produto_' +
        'id = p.produto_id '
      'where vendaitem_venda_id=:venda')
    Left = 464
    Top = 192
    ParamData = <
      item
        Name = 'VENDA'
        DataType = ftString
        ParamType = ptInput
        Value = '4'
      end>
    object FDQListaCarrinhovendaitem_venda_id: TIntegerField
      FieldName = 'vendaitem_venda_id'
      Origin = 'vendaitem_venda_id'
    end
    object FDQListaCarrinhovendaitem_produto_id: TIntegerField
      FieldName = 'vendaitem_produto_id'
      Origin = 'vendaitem_produto_id'
    end
    object FDQListaCarrinhovendaitem_qte: TFMTBCDField
      FieldName = 'vendaitem_qte'
      Origin = 'vendaitem_qte'
      Precision = 4
    end
    object FDQListaCarrinhodescricao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object FDQListaCarrinhovendaItem_id: TFDAutoIncField
      FieldName = 'vendaItem_id'
      Origin = 'vendaItem_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQListaCarrinhovendaitem_valor: TFMTBCDField
      FieldName = 'vendaitem_valor'
      Origin = 'vendaitem_valor'
      Precision = 4
    end
  end
end
