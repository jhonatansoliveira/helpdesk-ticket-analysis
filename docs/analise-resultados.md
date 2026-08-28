# 📊 Análise dos Resultados — Help Desk Ticket Analysis

## 📌 Visão geral

Este projeto simula a análise operacional de uma central de suporte técnico utilizando SQL.

O objetivo não é apenas consultar registros, mas transformar dados de chamados em informações úteis para acompanhamento da operação, identificação de riscos e apoio à tomada de decisão.

As consultas foram executadas e validadas em ambiente **MySQL**, utilizando o **MySQL Workbench**.

> 📌 Todos os dados utilizados neste projeto são fictícios e foram criados exclusivamente para fins de estudo e demonstração profissional.

---

## 🔎 1. Monitoramento de chamados em aberto

A consulta `01_chamados_abertos.sql` identifica os chamados que ainda necessitam de atuação da equipe de suporte.

A análise considera informações como:

- prioridade;
- status;
- usuário solicitante;
- departamento;
- categoria;
- técnico responsável;
- data de abertura;
- prazo de SLA.

### Resultado obtido

A execução da consulta identificou **5 chamados ainda não concluídos** no cenário analisado.

Entre eles estão incidentes relacionados a:

- notebook sem funcionamento;
- instabilidade de conexão na produção;
- lentidão em sistema comercial;
- falha de sincronização de e-mail;
- falha no envio de e-mail.

### Interpretação operacional

O resultado representa o **backlog atual da operação**, permitindo visualizar quais chamados ainda dependem de atuação da equipe.

Esse tipo de consulta pode ser utilizado diariamente por uma equipe de suporte para acompanhar demandas pendentes e auxiliar na definição da ordem de atendimento.

---

## ⏱️ 2. Controle de SLA

A consulta `02_sla_estourado.sql` identifica chamados que ultrapassaram o prazo definido de SLA.

São consideradas duas situações:

- chamados ainda pendentes cujo prazo já expirou;
- chamados concluídos após o prazo estabelecido.

### Resultado obtido

A consulta identificou **6 chamados com violação de SLA**.

O resultado inclui tanto incidentes ainda pendentes quanto chamados que já foram solucionados, porém somente após o prazo previsto.

### Interpretação operacional

A análise demonstra que verificar apenas os chamados atualmente abertos não é suficiente para avaliar o desempenho da operação.

Um chamado pode estar finalizado e, mesmo assim, representar uma violação de SLA.

Esse indicador pode auxiliar na identificação de atrasos recorrentes, categorias problemáticas e oportunidades de melhoria no processo de atendimento.

---

## ⏳ 3. Tempo médio de resolução

A consulta `03_tempo_medio_resolucao.sql` analisa o tempo necessário para resolução dos chamados.

A análise contempla:

- tempo de resolução por chamado;
- tempo médio geral;
- tempo médio por categoria.

### Resultado por categoria

| Categoria | Chamados resolvidos | Tempo médio de resolução |
|---|---:|---:|
| Software | 2 | 6,38 h |
| Impressora | 1 | 4,92 h |
| Hardware | 1 | 1,75 h |
| Acesso | 2 | 1,42 h |
| Rede | 1 | 1,42 h |

### Interpretação operacional

No cenário analisado, a categoria **Software apresentou o maior tempo médio de resolução**, com aproximadamente **6,38 horas**.

Esse resultado pode indicar maior complexidade nos incidentes dessa categoria ou necessidade de investigação sobre processos, conhecimento técnico, documentação ou escalonamento.

Já as categorias **Acesso** e **Rede** apresentaram tempos médios menores entre os chamados resolvidos analisados.

Esse tipo de indicador pode auxiliar na identificação de áreas que demandam maior esforço da equipe de suporte.

---

## 🔁 4. Identificação de incidentes recorrentes

A consulta `04_incidentes_recorrentes.sql` busca padrões de repetição nos chamados registrados.

São analisados:

- volume de chamados por categoria;
- repetição de incidentes;
- primeira e última ocorrência;
- recorrência por prioridade;
- concentração de chamados de alta criticidade.

### Resultado observado

Na distribuição por categoria foram identificados:

| Categoria | Total de chamados | Alta criticidade | Percentual |
|---|---:|---:|---:|
| Rede | 2 | 2 | 100,00% |
| Software | 3 | 1 | 33,33% |
| Acesso | 2 | 1 | 50,00% |
| Hardware | 2 | 1 | 50,00% |
| Impressora | 1 | 1 | 100,00% |
| Email | 2 | 0 | 0,00% |

### Interpretação operacional

A categoria **Software possui o maior volume de chamados**, enquanto **Rede apresenta 100% dos seus registros classificados como alta criticidade**.

Embora o conjunto de dados seja pequeno e fictício, esse tipo de análise demonstra como SQL pode ser utilizado para identificar padrões que merecem investigação.

Em um ambiente real, uma concentração de incidentes críticos em determinada categoria poderia justificar análise de causa raiz, revisão de infraestrutura ou criação de ações preventivas.

---

## 🚨 5. Priorização operacional

A consulta `05_analise_prioridade.sql` analisa chamados considerando prioridade, backlog e situação do SLA.

Os chamados podem ser classificados em situações como:

- `SLA ESTOURADO`;
- `RISCO DE SLA`;
- `DENTRO DO SLA`.

### Resultado obtido

A análise retornou **5 chamados pendentes**, permitindo relacionar prioridade, status e risco operacional.

Entre os registros analisados existem chamados classificados com prioridades **Alta** e **Média**, incluindo incidentes relacionados a hardware, rede, software e e-mail.

### Interpretação operacional

Essa visão permite que o analista não utilize apenas a ordem de abertura dos chamados como critério de atendimento.

Um incidente de alta prioridade ou próximo do vencimento do SLA pode exigir atuação antes de outro chamado mais antigo, porém de menor impacto.

A combinação de **prioridade + status + SLA** fornece uma visão mais adequada para organização operacional da fila.

---

## 📈 6. Indicadores de suporte

A consulta `06_indicadores_suporte.sql` consolida diferentes indicadores importantes para acompanhamento da operação.

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

### Distribuição por categoria

Um dos resultados obtidos apresenta a seguinte distribuição:

| Categoria | Total de chamados | Backlog | Alta criticidade |
|---|---:|---:|---:|
| Software | 3 | 1 | 1 |
| Acesso | 2 | 0 | 1 |
| Hardware | 2 | 1 | 1 |
| Rede | 2 | 1 | 2 |
| Email | 2 | 2 | 0 |
| Impressora | 1 | 0 | 1 |

### Interpretação operacional

Os indicadores permitem observar diferentes características da operação.

A categoria **Software apresenta o maior volume total de chamados**, enquanto **Email possui 2 chamados e ambos permanecem no backlog**.

A categoria **Rede**, por sua vez, apresenta 2 chamados classificados como alta criticidade.

Analisados em conjunto, esses indicadores ajudam a responder perguntas como:

- Onde está concentrado o backlog?
- Quais categorias possuem maior criticidade?
- Quais tipos de incidente demandam mais tempo para resolução?
- Onde existem possíveis problemas recorrentes?
- Quais chamados apresentam maior risco operacional?

---

## 🧠 Análise consolidada

A execução das consultas permite construir uma visão mais ampla da operação simulada.

Alguns pontos observados no conjunto de dados são:

- existem **5 chamados pendentes** no backlog;
- foram identificados **6 chamados com violação de SLA**;
- **Software** apresenta o maior volume de chamados;
- **Software** também apresentou o maior tempo médio de resolução entre as categorias analisadas;
- **Rede** possui concentração de chamados de alta criticidade;
- **Email** apresenta 2 chamados no backlog;
- prioridade e SLA podem ser combinados para orientar a ordem de atendimento.

Esses resultados demonstram como consultas SQL podem transformar registros operacionais em informações úteis para acompanhamento e tomada de decisão.

> Como o conjunto de dados é fictício e reduzido, os resultados têm finalidade demonstrativa e não devem ser interpretados como indicadores estatísticos de uma operação real.

---

## 🛠️ Conhecimentos demonstrados

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
- análise e manipulação de datas

Além da construção das consultas, o projeto demonstra raciocínio aplicado à rotina de suporte técnico, incluindo:

- análise de incidentes;
- troubleshooting orientado por dados;
- acompanhamento de SLA;
- gestão de backlog;
- análise de prioridades;
- identificação de recorrências;
- acompanhamento de indicadores;
- interpretação de dados;
- apoio à melhoria contínua.

---

## 🧪 Validação do projeto

O banco de dados e as consultas foram executados em ambiente local utilizando:

- MySQL Server;
- MySQL Workbench;
- banco `helpdesk_db`;
- dados fictícios disponibilizados em `database/sample_data.sql`.

O processo de validação contemplou:

1. criação do banco de dados;
2. criação das tabelas;
3. carga dos dados fictícios;
4. execução individual das consultas;
5. validação dos resultados retornados;
6. interpretação dos indicadores obtidos.

As seis consultas disponibilizadas no projeto foram executadas com sucesso no ambiente utilizado para validação.

---

# 🎯 Conclusão

O projeto demonstra como SQL pode ser utilizado como ferramenta de apoio ao trabalho de um Analista de Suporte.

A partir dos registros de chamados, foi possível construir consultas capazes de identificar backlog, violações de SLA, prioridades, incidentes recorrentes, tempo de resolução e indicadores operacionais.

Mais do que realizar consultas isoladas, o projeto busca demonstrar a utilização dos dados como suporte à **investigação de incidentes, priorização operacional e tomada de decisão**.

O cenário é fictício, porém foi estruturado para representar situações encontradas em ambientes corporativos de suporte e operações de TI.

Todos os dados utilizados foram criados exclusivamente para fins de estudo e demonstração profissional.
