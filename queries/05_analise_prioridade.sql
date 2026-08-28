-- ============================================================
-- Projeto: Help Desk Ticket Analysis
-- Consulta: Analise de prioridade dos chamados
-- Autor: Jhonatan Silva Oliveira
--
-- Objetivo:
-- Analisar a distribuicao dos chamados por prioridade,
-- identificar chamados criticos em aberto e apoiar a
-- priorizacao operacional da equipe de suporte.
-- ============================================================

USE helpdesk_db;


-- ============================================================
-- 1. Distribuicao geral dos chamados por prioridade
-- ============================================================

SELECT
    prioridade,
    COUNT(*) AS total_chamados,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM chamados),
        2
    ) AS percentual_total

FROM chamados

GROUP BY prioridade

ORDER BY
    FIELD(
        prioridade,
        'Critica',
        'Alta',
        'Media',
        'Baixa'
    );


-- ============================================================
-- 2. Chamados criticos e de alta prioridade ainda pendentes
-- ============================================================

SELECT
    c.id_chamado,
    c.titulo,
    u.nome AS usuario,
    u.departamento,
    cat.nome AS categoria,
    COALESCE(t.nome, 'Nao atribuido') AS tecnico,
    c.prioridade,
    c.status_chamado,
    c.data_abertura,
    c.prazo_sla

FROM chamados c

INNER JOIN usuarios u
    ON c.id_usuario = u.id_usuario

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

LEFT JOIN tecnicos t
    ON c.id_tecnico = t.id_tecnico

WHERE
    c.prioridade IN ('Critica', 'Alta')
    AND c.status_chamado NOT IN ('Resolvido', 'Fechado')

ORDER BY
    FIELD(c.prioridade, 'Critica', 'Alta'),
    c.data_abertura ASC;


-- ============================================================
-- 3. Backlog por prioridade
-- ============================================================

SELECT
    prioridade,
    COUNT(*) AS chamados_pendentes

FROM chamados

WHERE status_chamado NOT IN ('Resolvido', 'Fechado')

GROUP BY prioridade

ORDER BY
    FIELD(
        prioridade,
        'Critica',
        'Alta',
        'Media',
        'Baixa'
    );


-- ============================================================
-- 4. Chamados pendentes com risco ou estouro de SLA
-- ============================================================

SELECT
    c.id_chamado,
    c.titulo,
    c.prioridade,
    c.status_chamado,
    cat.nome AS categoria,
    COALESCE(t.nome, 'Nao atribuido') AS tecnico,
    c.data_abertura,
    c.prazo_sla,

    TIMESTAMPDIFF(
        MINUTE,
        NOW(),
        c.prazo_sla
    ) AS minutos_para_sla,

    CASE
        WHEN NOW() > c.prazo_sla
            THEN 'SLA ESTOURADO'

        WHEN TIMESTAMPDIFF(
            MINUTE,
            NOW(),
            c.prazo_sla
        ) <= 60
            THEN 'RISCO DE SLA'

        ELSE 'DENTRO DO SLA'
    END AS situacao_sla

FROM chamados c

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

LEFT JOIN tecnicos t
    ON c.id_tecnico = t.id_tecnico

WHERE
    c.status_chamado NOT IN ('Resolvido', 'Fechado')

ORDER BY
    CASE
        WHEN NOW() > c.prazo_sla THEN 1
        WHEN TIMESTAMPDIFF(MINUTE, NOW(), c.prazo_sla) <= 60 THEN 2
        ELSE 3
    END,
    c.prazo_sla ASC;
