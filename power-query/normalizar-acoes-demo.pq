// Exemplo didático independente. Dados fictícios; não extraído do projeto original.
let
    Fonte = #table(type table [AcaoOriginal = text, Quantidade = Int64.Type], {
        {"PESQUISA ATENDIMENTO V1", 10},
        {"pesquisa atendimento v2", 20},
        {"PESQUISA PRODUTO V1", 5},
        {"ACAO SEM MAPA", 2}
    }),
    Chave = Table.AddColumn(Fonte, "AcaoChave", each Text.Upper(Text.Trim(Text.Clean([AcaoOriginal]))), type text),
    Mapa = #table(type table [AcaoChave = text, AcaoPadrao = text], {
        {"PESQUISA ATENDIMENTO V1", "PESQUISA ATENDIMENTO"},
        {"PESQUISA ATENDIMENTO V2", "PESQUISA ATENDIMENTO"},
        {"PESQUISA PRODUTO V1", "PESQUISA PRODUTO"}
    }),
    ValidarMapa = if Table.RowCount(Mapa) <> Table.RowCount(Table.Distinct(Mapa, {"AcaoChave"}))
        then error "O mapa contém chaves duplicadas." else Mapa,
    Juncao = Table.NestedJoin(Chave, {"AcaoChave"}, ValidarMapa, {"AcaoChave"}, "Mapa", JoinKind.LeftOuter),
    Expandir = Table.ExpandTableColumn(Juncao, "Mapa", {"AcaoPadrao"}),
    Status = Table.AddColumn(Expandir, "StatusMapeamento", each if [AcaoPadrao] = null then "Revisar" else "Mapeada", type text),
    Resultado = Table.AddColumn(Status, "AcaoAnalitica", each if [AcaoPadrao] = null then [AcaoChave] else [AcaoPadrao], type text)
in
    Resultado
