-- ============================================================
-- Projeto: Help Desk Ticket Analysis
-- Arquivo: sample_data.sql
-- Autor: Jhonatan Silva Oliveira
-- Descrição: Dados fictícios utilizados para simular
-- uma operação de suporte técnico.
-- ============================================================

USE helpdesk_db;

-- ============================================================
-- USUÁRIOS
-- ============================================================

INSERT INTO usuarios (nome, departamento, email) VALUES
('Ana Souza', 'Financeiro', 'ana.souza@empresa.local'),
('Carlos Lima', 'Comercial', 'carlos.lima@empresa.local'),
('Mariana Costa', 'Recursos Humanos', 'mariana.costa@empresa.local'),
('Rafael Santos', 'Logistica', 'rafael.santos@empresa.local'),
('Juliana Alves', 'Financeiro', 'juliana.alves@empresa.local'),
('Fernando Rocha', 'Producao', 'fernando.rocha@empresa.local'),
('Patricia Gomes', 'Comercial', 'patricia.gomes@empresa.local'),
('Lucas Martins', 'Producao', 'lucas.martins@empresa.local');

-- ============================================================
-- TÉCNICOS
-- ============================================================

INSERT INTO tecnicos (nome, nivel) VALUES
('Bruno Ferreira', 'N1'),
('Camila Ribeiro', 'N1'),
('Diego Martins', 'N2'),
('Renata Oliveira', 'N2');

-- ============================================================
-- CATEGORIAS
-- ============================================================

INSERT INTO categorias (nome, descricao) VALUES
('Acesso', 'Problemas relacionados a login, senha e permissao'),
('Software', 'Falhas em sistemas e aplicativos'),
('Hardware', 'Problemas em computadores e perifericos'),
('Rede', 'Problemas de conectividade e acesso a rede'),
('Email', 'Problemas relacionados ao correio eletrônico'),
('Impressora', 'Falhas de impressao e equipamentos');

-- ============================================================
-- CHAMADOS
-- ============================================================

INSERT INTO chamados (
    id_usuario,
    id_tecnico,
    id_categoria,
    titulo,
    descricao,
    prioridade,
    status_chamado,
    data_abertura,
    prazo_sla,
    data_resolucao
)
VALUES

-- Resolvido dentro do SLA
(
    1, 1, 1,
    'Usuario sem acesso ao sistema financeiro',
    'Usuario informa erro de autenticacao ao acessar o sistema.',
    'Alta',
    'Resolvido',
    '2026-08-20 08:10:00',
    '2026-08-20 12:10:00',
    '2026-08-20 10:35:00'
),

-- Problema recorrente de software
(
    2, 3, 2,
    'Sistema comercial fecha durante consulta',
    'Aplicacao encerra inesperadamente ao consultar pedidos.',
    'Media',
    'Resolvido',
    '2026-08-20 09:20:00',
    '2026-08-20 17:20:00',
    '2026-08-20 15:40:00'
),

-- SLA ultrapassado
(
    3, 2, 5,
    'Email nao sincroniza',
    'Cliente de email deixou de receber novas mensagens.',
    'Media',
    'Em atendimento',
    '2026-08-21 07:50:00',
    '2026-08-21 15:50:00',
    NULL
),

-- Incidente crítico
(
    4, 4, 4,
    'Sem acesso a rede no setor de logistica',
    'Diversas estacoes perderam conectividade com a rede corporativa.',
    'Critica',
    'Resolvido',
    '2026-08-21 10:05:00',
    '2026-08-21 12:05:00',
    '2026-08-21 11:30:00'
),

-- Chamado sem técnico atribuído
(
    5, NULL, 3,
    'Notebook nao liga',
    'Equipamento nao apresenta sinal de energia.',
    'Alta',
    'Aberto',
    '2026-08-22 08:30:00',
    '2026-08-22 12:30:00',
    NULL
),

-- Impressora
(
    6, 1, 6,
    'Impressora nao imprime etiquetas',
    'Fila de impressao permanece parada.',
    'Alta',
    'Resolvido',
    '2026-08-22 09:15:00',
    '2026-08-22 13:15:00',
    '2026-08-22 14:10:00'
),

-- Segundo incidente semelhante de software
(
    7, 3, 2,
    'Erro ao consultar pedidos',
    'Sistema comercial apresenta erro durante consulta.',
    'Media',
    'Resolvido',
    '2026-08-23 10:00:00',
    '2026-08-23 18:00:00',
    '2026-08-23 16:25:00'
),

-- Problema de acesso
(
    8, 2, 1,
    'Senha bloqueada',
    'Usuario excedeu tentativas de login.',
    'Baixa',
    'Fechado',
    '2026-08-24 07:30:00',
    '2026-08-24 15:30:00',
    '2026-08-24 07:55:00'
),

-- Problema recorrente de rede
(
    6, 4, 4,
    'Conexao instavel na producao',
    'Estacao perde conexao com servidores em intervalos aleatorios.',
    'Alta',
    'Em atendimento',
    '2026-08-25 08:40:00',
    '2026-08-25 12:40:00',
    NULL
),

-- Segundo problema de email
(
    1, 1, 5,
    'Falha no envio de email',
    'Mensagens permanecem na caixa de saida.',
    'Media',
    'Aguardando usuario',
    '2026-08-25 11:20:00',
    '2026-08-25 19:20:00',
    NULL
),

-- Outro problema de hardware
(
    4, 3, 3,
    'Monitor sem imagem',
    'Monitor liga, mas nao apresenta imagem.',
    'Media',
    'Resolvido',
    '2026-08-26 08:00:00',
    '2026-08-26 16:00:00',
    '2026-08-26 09:45:00'
),

-- Terceiro incidente de software para análise de recorrência
(
    2, NULL, 2,
    'Sistema comercial apresenta lentidao',
    'Usuario relata lentidao durante consultas de pedidos.',
    'Alta',
    'Aberto',
    '2026-08-27 09:10:00',
    '2026-08-27 13:10:00',
    NULL
);
