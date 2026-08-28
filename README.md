# 🎫 Help Desk Ticket Analysis

Projeto prático de **análise de chamados de suporte utilizando SQL**, desenvolvido para simular situações encontradas na rotina de um Analista de Suporte.

O objetivo é demonstrar, através de um cenário fictício, como consultas em banco de dados podem auxiliar na **investigação de incidentes, acompanhamento de SLA, identificação de problemas recorrentes e análise de indicadores de suporte**.

> 📌 Todos os dados utilizados neste projeto são fictícios e foram criados exclusivamente para fins de estudo e demonstração profissional.

---

## 🎯 Objetivos do projeto

Este laboratório foi desenvolvido para praticar e demonstrar conhecimentos relacionados a:

- Consultas SQL
- Análise de chamados
- Investigação de incidentes
- Controle e acompanhamento de SLA
- Identificação de problemas recorrentes
- Análise de prioridades
- Tempo médio de resolução
- Backlog de atendimento
- Indicadores de suporte
- Troubleshooting orientado por dados

---

## 🏢 Cenário simulado

Uma empresa fictícia utiliza um sistema de Help Desk para registrar solicitações e incidentes reportados pelos usuários.

Cada chamado possui informações como:

- Número do chamado
- Usuário
- Departamento
- Categoria
- Prioridade
- Status
- Técnico responsável
- Data de abertura
- Data de resolução
- Prazo de SLA
- Descrição do incidente

A partir dessas informações, o Analista de Suporte precisa consultar o banco de dados para identificar situações que necessitam de atenção.

---

## 🗄️ Estrutura do projeto

```text
helpdesk-ticket-analysis/
│
├── database/
│   ├── create_database.sql
│   └── sample_data.sql
│
├── queries/
│   ├── 01_chamados_abertos.sql
│   ├── 02_sla_estourado.sql
│   ├── 03_tempo_medio_resolucao.sql
│   ├── 04_incidentes_recorrentes.sql
│   ├── 05_analise_prioridade.sql
│   └── 06_indicadores_suporte.sql
│
├── docs/
│   └── analise-resultados.md
│
└── README.md
```

---

## 🔎 Consultas desenvolvidas

O projeto contém consultas SQL voltadas para situações comuns na rotina de suporte técnico e análise operacional.

| Consulta | Objetivo |
|---|---|
| [01_chamados_abertos.sql](queries/01_chamados_abertos.sql) | Identificar chamados que ainda estão em atendimento |
| [02_sla_estourado.sql](queries/02_sla_estourado.sql) | Identificar chamados que ultrapassaram o prazo de SLA |
| [03_tempo_medio_resolucao.sql](queries/03_tempo_medio_resolucao.sql) | Calcular e analisar o tempo médio de resolução |
| [04_incidentes_recorrentes.sql](queries/04_incidentes_recorrentes.sql) | Identificar categorias e incidentes recorrentes |
| [05_analise_prioridade.sql](queries/05_analise_prioridade.sql) | Analisar prioridades e chamados com maior risco operacional |
| [06_indicadores_suporte.sql](queries/06_indicadores_suporte.sql) | Consolidar indicadores operacionais do atendimento |

Essas consultas simulam atividades presentes na rotina de um Analista de Suporte, transformando registros de chamados em informações úteis para investigação de incidentes, acompanhamento operacional e tomada de decisão.

---

## 📊 Análise dos resultados

Além das consultas SQL, o projeto possui uma documentação dedicada à interpretação dos indicadores e à análise das informações obtidas no cenário simulado.

➡️ [Visualizar análise dos resultados](docs/analise-resultados.md)

---

## 🛠️ Tecnologias e conceitos aplicados

- SQL
- MySQL
- Modelagem de banco de dados
- JOIN
- GROUP BY
- Funções de agregação
- CASE
- Manipulação de datas
- Análise de SLA
- Indicadores de suporte
- Troubleshooting orientado por dados

---

## 💡 Competências demonstradas

Este projeto demonstra a aplicação de SQL em situações próximas às encontradas em ambientes de suporte e operações de TI, incluindo:

- Investigação de incidentes
- Análise de chamados
- Acompanhamento de SLA
- Identificação de problemas recorrentes
- Análise de prioridades
- Acompanhamento de backlog
- Análise de tempo de resolução
- Construção de indicadores operacionais
- Interpretação de dados para apoio à tomada de decisão

---

## 📌 Sobre o projeto

Este projeto foi desenvolvido como parte do meu portfólio profissional, com o objetivo de demonstrar conhecimentos práticos em **SQL, Banco de Dados, análise de dados e troubleshooting aplicado ao suporte técnico**.

> Todos os dados utilizados são fictícios e foram criados exclusivamente para fins de estudo e demonstração profissional.
