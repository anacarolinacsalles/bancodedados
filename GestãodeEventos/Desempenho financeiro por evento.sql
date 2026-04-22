-- Consulta 2
-- Descrição:
-- Exibir, para cada evento, a quantidade de ingressos vendidos e o faturamento
-- total obtido com esses ingressos, usando junção entre Evento, Setor,
-- Ingresso e Compra.
--
-- Relevância:
-- Essa consulta permite analisar o desempenho financeiro de cada evento,
-- mostrando quantos ingressos foram vendidos e quanto foi arrecadado.
-- Essas informações são úteis para avaliar a atratividade e a rentabilidade
-- dos eventos organizados.
SELECT
    e.id_evento,
    e.nome AS nome_evento,
    COUNT(i.id_ingresso) AS quantidade_ingressos,
    SUM(i.valor_final) AS faturamento_total
FROM Evento e
JOIN Setor s
    ON e.id_evento = s.id_evento
JOIN Ingresso i
    ON s.id_setor = i.id_setor
JOIN Compra c
    ON i.id_compra = c.id_compra
WHERE i.status = 'Valido'
GROUP BY e.id_evento, e.nome
ORDER BY faturamento_total DESC, quantidade_ingressos DESC;