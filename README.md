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
