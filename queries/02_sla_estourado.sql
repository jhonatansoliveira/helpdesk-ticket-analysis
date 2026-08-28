-- ============================================================
-- Projeto: Help Desk Ticket Analysis
-- Consulta: Chamados com SLA estourado
-- Autor: Jhonatan Silva Oliveira
--
-- Objetivo:
-- Identificar chamados que ultrapassaram o prazo de SLA,
-- tanto os que ainda estão em aberto quanto os que foram
-- resolvidos após o prazo definido.
-- ============================================================

USE helpdesk_db;

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
    c.prazo_sla,
    c.data_resolucao,

    CASE
        WHEN c.data_resolucao IS NULL
             AND NOW() > c.prazo_sla
            THEN 'SLA estourado - chamado em aberto'

        WHEN c.data_resolucao IS NOT NULL
             AND c.data_resolucao > c.prazo_sla
            THEN 'SLA estourado - resolvido com atraso'

        ELSE 'Dentro do SLA'
    END AS situacao_sla

FROM chamados c

INNER JOIN usuarios u
    ON c.id_usuario = u.id_usuario

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

LEFT JOIN tecnicos t
    ON c.id_tecnico = t.id_tecnico

WHERE
    (
        c.data_resolucao IS NULL
        AND NOW() > c.prazo_sla
    )
    OR
    (
        c.data_resolucao IS NOT NULL
        AND c.data_resolucao > c.prazo_sla
    )

ORDER BY
    c.prazo_sla ASC;
