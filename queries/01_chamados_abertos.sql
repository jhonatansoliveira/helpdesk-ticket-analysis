-- ============================================================
-- Projeto: Help Desk Ticket Analysis
-- Consulta: Chamados em aberto
-- Autor: Jhonatan Silva Oliveira
--
-- Objetivo:
-- Identificar chamados que ainda não foram concluídos,
-- apresentando usuário, departamento, categoria, técnico,
-- prioridade, status e prazo de SLA.
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
    c.prazo_sla

FROM chamados c

INNER JOIN usuarios u
    ON c.id_usuario = u.id_usuario

INNER JOIN categorias cat
    ON c.id_categoria = cat.id_categoria

LEFT JOIN tecnicos t
    ON c.id_tecnico = t.id_tecnico

WHERE c.status_chamado NOT IN ('Resolvido', 'Fechado')

ORDER BY
    CASE c.prioridade
        WHEN 'Critica' THEN 1
        WHEN 'Alta' THEN 2
        WHEN 'Media' THEN 3
        WHEN 'Baixa' THEN 4
    END,
    c.data_abertura ASC;
