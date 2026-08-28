-- ============================================================
-- Projeto: Help Desk Ticket Analysis
-- Consulta: Analise de incidentes recorrentes
-- Autor: Jhonatan Silva Oliveira
--
-- Objetivo:
-- Identificar categorias e incidentes que apresentam maior
-- recorrencia, auxiliando na identificacao de problemas,
-- priorizacao de analises e melhoria continua do suporte.
-- ============================================================

USE helpdesk_db;


-- ============================================================
-- 1. Quantidade de chamados por categoria
-- ============================================================

SELECT
    cat.nome AS categoria,
    COUNT(c.id_chamado) AS quantidade_chamados

FROM chamados c

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

GROUP BY
    cat.id_categoria,
    cat.nome

ORDER BY
    quantidade_chamados DESC;


-- ============================================================
-- 2. Incidentes recorrentes por titulo
-- ============================================================

SELECT
    c.titulo,
    cat.nome AS categoria,
    COUNT(*) AS quantidade_ocorrencias,

    MIN(c.data_abertura) AS primeira_ocorrencia,
    MAX(c.data_abertura) AS ultima_ocorrencia

FROM chamados c

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

GROUP BY
    c.titulo,
    cat.nome

HAVING COUNT(*) > 1

ORDER BY
    quantidade_ocorrencias DESC,
    ultima_ocorrencia DESC;


-- ============================================================
-- 3. Recorrencia por categoria e prioridade
-- ============================================================

SELECT
    cat.nome AS categoria,
    c.prioridade,
    COUNT(*) AS quantidade_chamados

FROM chamados c

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

GROUP BY
    cat.nome,
    c.prioridade

ORDER BY
    quantidade_chamados DESC;


-- ============================================================
-- 4. Categorias com maior impacto
-- ============================================================

SELECT
    cat.nome AS categoria,

    COUNT(*) AS total_chamados,

    SUM(
        CASE
            WHEN c.prioridade IN ('Alta', 'Critica')
            THEN 1
            ELSE 0
        END
    ) AS chamados_alta_criticidade,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN c.prioridade IN ('Alta', 'Critica')
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS percentual_alta_criticidade

FROM chamados c

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

GROUP BY
    cat.id_categoria,
    cat.nome

ORDER BY
    chamados_alta_criticidade DESC,
    total_chamados DESC;
