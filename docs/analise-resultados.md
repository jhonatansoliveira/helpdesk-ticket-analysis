# 📊 Análise dos Resultados — Help Desk Ticket Analysis

## 📌 Visão geral

Este projeto simula a análise operacional de uma central de suporte técnico utilizando SQL.

O objetivo não é apenas consultar registros, mas transformar dados de chamados em informações úteis para acompanhamento da operação, identificação de riscos e apoio à tomada de decisão.

> 📌 Todos os dados utilizados neste projeto são fictícios e foram criados exclusivamente para fins de estudo e demonstração profissional.

---

## 🔎 1. Monitoramento de chamados em aberto

A consulta `01_chamados_abertos.sql` permite identificar os chamados que ainda necessitam de atuação da equipe de suporte.

A análise considera informações como:

- prioridade;
- status;
- usuário solicitante;
- departamento;
- categoria;
- técnico responsável;
- data de abertura;
- prazo de SLA.

### Aplicação operacional

Essa consulta pode ser utilizada para acompanhar o backlog da equipe e identificar chamados que ainda aguardam atendimento ou resolução.

---

## ⏱️ 2. Controle de SLA

A consulta `02_sla_estourado.sql` identifica chamados que ultrapassaram o prazo definido para atendimento.

São analisadas duas situações:

- chamados ainda pendentes cujo prazo já expirou;
- chamados resolvidos depois do prazo estabelecido.

### Aplicação operacional

O acompanhamento de SLA permite identificar atrasos e direcionar ações para evitar impacto na qualidade do atendimento.

---

## ⏳ 3. Tempo médio de resolução

A consulta `03_tempo_medio_resolucao.sql` calcula o tempo utilizado para resolução dos incidentes.

A análise contempla:

- tempo de resolução por chamado;
- tempo médio geral;
- tempo médio por categoria.

### Aplicação operacional

Esse indicador pode ajudar a identificar categorias de incidentes que demandam maior esforço da equipe e possíveis oportunidades de melhoria.

---

## 🔁 4. Identificação de incidentes recorrentes

A consulta `04_incidentes_recorrentes.sql` busca padrões de repetição nos chamados registrados.

São analisados:

- volume de chamados por categoria;
- repetição de incidentes;
- primeira e última ocorrência;
- recorrência por prioridade;
- concentração de chamados de alta criticidade.

### Aplicação operacional

A identificação de recorrências pode auxiliar na investigação de problemas estruturais e na busca por soluções definitivas, reduzindo novos chamados relacionados à mesma causa.

---

## 🚨 5. Priorização operacional

A consulta `05_analise_prioridade.sql` analisa os chamados considerando prioridade, backlog e situação do SLA.

Os chamados podem ser classificados como:

- `SLA ESTOURADO`
- `RISCO DE SLA`
- `DENTRO DO SLA`

### Aplicação operacional

Essa classificação auxilia o Analista de Suporte a identificar rapidamente quais incidentes precisam receber atenção primeiro.

---

## 📈 6. Indicadores de suporte

A consulta `06_indicadores_suporte.sql` consolida indicadores importantes da operação.

Entre eles:

- total de chamados;
- chamados pendentes;
- chamados finalizados;
- chamados de alta criticidade;
- quantidade de SLA estourado;
- percentual de chamados finalizados;
- percentual de cumprimento de SLA;
- desempenho por técnico;
- volume por categoria;
- backlog por categoria;
- tempo médio de resolução.

---

# 🧠 Conhecimentos demonstrados

Durante o desenvolvimento deste projeto foram utilizados conceitos de SQL como:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `INNER JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `HAVING`
- `COUNT`
- `AVG`
- `SUM`
- `MIN`
- `MAX`
- `CASE`
- `COALESCE`
- `NULLIF`
- `TIMESTAMPDIFF`
- subqueries
- cálculos percentuais
- análise de datas

Além da construção das consultas, o projeto demonstra raciocínio aplicado à rotina de suporte técnico, incluindo:

- análise de incidentes;
- troubleshooting orientado por dados;
- acompanhamento de SLA;
- gestão de backlog;
- análise de prioridades;
- identificação de recorrências;
- acompanhamento de indicadores;
- apoio à melhoria contínua.

---

# 🎯 Conclusão

O projeto demonstra como consultas SQL podem ser utilizadas como ferramenta de apoio ao trabalho de um Analista de Suporte.

A partir dos registros de chamados, é possível transformar dados operacionais em informações que auxiliam na identificação de incidentes críticos, acompanhamento de SLA, análise de recorrências e priorização das atividades da equipe.

O cenário apresentado é fictício, porém foi estruturado para representar situações encontradas em ambientes corporativos de suporte e atendimento de TI.
