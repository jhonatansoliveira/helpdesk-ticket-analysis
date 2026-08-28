-- ============================================================
-- Projeto: Help Desk Ticket Analysis
-- Consulta: Tempo medio de resolucao
-- Autor: Jhonatan Silva Oliveira
--
-- Objetivo:
-- Calcular o tempo medio de resolucao dos chamados,
-- permitindo avaliar a eficiencia do atendimento de suporte.
-- ============================================================

USE helpdesk_db;

-- ============================================================
-- 1. Tempo de resolucao de cada chamado
-- ============================================================

SELECT
    c.id_chamado,
    c.titulo,
    cat.nome AS categoria,
    c.prioridade,
    COALESCE(t.nome, 'Nao atribuido') AS tecnico,
    c.data_abertura,
    c.data_resolucao,

    TIMESTAMPDIFF(
        MINUTE,
        c.data_abertura,
        c.data_resolucao
    ) AS tempo_resolucao_minutos,

    ROUND(
        TIMESTAMPDIFF(
            MINUTE,
            c.data_abertura,
            c.data_resolucao
        ) / 60,
        2
    ) AS tempo_resolucao_horas

FROM chamados c

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

LEFT JOIN tecnicos t
    ON c.id_tecnico = t.id_tecnico

WHERE c.data_resolucao IS NOT NULL

ORDER BY tempo_resolucao_minutos DESC;


-- ============================================================
-- 2. Tempo medio geral de resolucao
-- ============================================================

SELECT
    COUNT(*) AS chamados_resolvidos,

    ROUND(
        AVG(
            TIMESTAMPDIFF(
                MINUTE,
                data_abertura,
                data_resolucao
            )
        ),
        2
    ) AS tempo_medio_minutos,

    ROUND(
        AVG(
            TIMESTAMPDIFF(
                MINUTE,
                data_abertura,
                data_resolucao
            )
        ) / 60,
        2
    ) AS tempo_medio_horas

FROM chamados

WHERE data_resolucao IS NOT NULL;


-- ============================================================
-- 3. Tempo medio de resolucao por categoria
-- ============================================================

SELECT
    cat.nome AS categoria,

    COUNT(c.id_chamado) AS chamados_resolvidos,

    ROUND(
        AVG(
            TIMESTAMPDIFF(
                MINUTE,
                c.data_abertura,
                c.data_resolucao
            )
        ) / 60,
        2
    ) AS tempo_medio_horas

FROM chamados c

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

WHERE c.data_resolucao IS NOT NULL

GROUP BY
    cat.id_categoria,
    cat.nome

ORDER BY tempo_medio_horas DESC;
