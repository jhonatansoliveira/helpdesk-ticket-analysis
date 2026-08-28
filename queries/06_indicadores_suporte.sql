-- ============================================================
-- Projeto: Help Desk Ticket Analysis
-- Consulta: Indicadores operacionais de suporte
-- Autor: Jhonatan Silva Oliveira
--
-- Objetivo:
-- Consolidar indicadores importantes para acompanhamento
-- da operacao de suporte, permitindo visualizar volume,
-- backlog, SLA e desempenho de atendimento.
-- ============================================================

USE helpdesk_db;


-- ============================================================
-- 1. Visao geral da operacao
-- ============================================================

SELECT
    COUNT(*) AS total_chamados,

    SUM(
        CASE
            WHEN status_chamado NOT IN ('Resolvido', 'Fechado')
            THEN 1 ELSE 0
        END
    ) AS chamados_pendentes,

    SUM(
        CASE
            WHEN status_chamado IN ('Resolvido', 'Fechado')
            THEN 1 ELSE 0
        END
    ) AS chamados_finalizados,

    SUM(
        CASE
            WHEN prioridade IN ('Alta', 'Critica')
            THEN 1 ELSE 0
        END
    ) AS chamados_alta_criticidade,

    SUM(
        CASE
            WHEN status_chamado NOT IN ('Resolvido', 'Fechado')
                 AND NOW() > prazo_sla
            THEN 1 ELSE 0
        END
    ) AS sla_estourado

FROM chamados;


-- ============================================================
-- 2. Percentual de chamados finalizados
-- ============================================================

SELECT
    COUNT(*) AS total_chamados,

    SUM(
        CASE
            WHEN status_chamado IN ('Resolvido', 'Fechado')
            THEN 1 ELSE 0
        END
    ) AS chamados_finalizados,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN status_chamado IN ('Resolvido', 'Fechado')
                THEN 1 ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS percentual_finalizados

FROM chamados;


-- ============================================================
-- 3. Cumprimento de SLA dos chamados resolvidos
-- ============================================================

SELECT
    COUNT(*) AS chamados_resolvidos,

    SUM(
        CASE
            WHEN data_resolucao <= prazo_sla
            THEN 1 ELSE 0
        END
    ) AS resolvidos_dentro_sla,

    SUM(
        CASE
            WHEN data_resolucao > prazo_sla
            THEN 1 ELSE 0
        END
    ) AS resolvidos_fora_sla,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN data_resolucao <= prazo_sla
                THEN 1 ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS percentual_cumprimento_sla

FROM chamados

WHERE data_resolucao IS NOT NULL;


-- ============================================================
-- 4. Indicadores por tecnico
-- ============================================================

SELECT
    COALESCE(t.nome, 'Nao atribuido') AS tecnico,

    COUNT(c.id_chamado) AS total_chamados,

    SUM(
        CASE
            WHEN c.status_chamado IN ('Resolvido', 'Fechado')
            THEN 1 ELSE 0
        END
    ) AS chamados_finalizados,

    SUM(
        CASE
            WHEN c.status_chamado NOT IN ('Resolvido', 'Fechado')
            THEN 1 ELSE 0
        END
    ) AS chamados_pendentes,

    ROUND(
        AVG(
            CASE
                WHEN c.data_resolucao IS NOT NULL
                THEN TIMESTAMPDIFF(
                    MINUTE,
                    c.data_abertura,
                    c.data_resolucao
                )
            END
        ) / 60,
        2
    ) AS tempo_medio_resolucao_horas

FROM chamados c

LEFT JOIN tecnicos t
    ON c.id_tecnico = t.id_tecnico

GROUP BY
    t.id_tecnico,
    t.nome

ORDER BY
    total_chamados DESC;


-- ============================================================
-- 5. Indicadores por categoria
-- ============================================================

SELECT
    cat.nome AS categoria,

    COUNT(c.id_chamado) AS total_chamados,

    SUM(
        CASE
            WHEN c.status_chamado NOT IN ('Resolvido', 'Fechado')
            THEN 1 ELSE 0
        END
    ) AS backlog,

    SUM(
        CASE
            WHEN c.prioridade IN ('Alta', 'Critica')
            THEN 1 ELSE 0
        END
    ) AS alta_criticidade

FROM chamados c

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

GROUP BY
    cat.id_categoria,
    cat.nome

ORDER BY
    total_chamados DESC;
