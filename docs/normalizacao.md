# Normalização das ações

Identifiquei ações com versões e variações de nomenclatura que precisavam ser agrupadas. O relatório referencia os campos **BD_Filtros[ACAO]**, **BD_Filtros[ACAO_CORRIGIDA]** e **BD_Interações[ACAO]**, coerentes com esse contexto. As expressões responsáveis pelo tratamento não estão incluídas nesta exportação pública.

## Exemplo didático

| Ação original fictícia | Ação normalizada fictícia |
| --- | --- |
| PESQUISA ATENDIMENTO V1 | PESQUISA ATENDIMENTO |
| pesquisa atendimento v2 | PESQUISA ATENDIMENTO |
| PESQUISA PRODUTO V1 | PESQUISA PRODUTO |

O [exemplo em Power Query](../power-query/normalizar-acoes-demo.pq) usa uma tabela explícita de correspondência. Ele demonstra o conceito, sem reproduzir o código original. Remover indiscriminadamente sufixos V1/V2 pode agrupar pesquisas diferentes; por isso o exemplo mantém o valor original e sinaliza ações não mapeadas.

## Pontos de controle

- Validar que versões agrupadas representam a mesma ação e escala de pesquisa.
- Manter uma chave única por ação original na tabela de correspondência para não multiplicar linhas na junção.
- Separar ações pendentes de mapeamento e preservar a rastreabilidade.
- Aplicar a regra de agrupamento de forma consistente às fontes que precisam ser comparadas.

Esses controles são orientações de adaptação; não comprovam como cada etapa foi implementada no ambiente original.
