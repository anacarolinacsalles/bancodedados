-- Consulta 3
-- Descrição:
-- Listar os eventos, seus artistas e o faturamento total de cada evento,
-- considerando apenas eventos cujo faturamento com ingressos válidos seja
-- superior à média de faturamento de todos os eventos.
-- A consulta utiliza junções entre Evento, Apresentacao, Apresenta,
-- Artista, Pessoa, Setor e Ingresso, além de uma subconsulta para calcular
-- a média de faturamento dos eventos.
--
-- Relevância:
-- Essa consulta combina agregação com filtragem complexa e permite identificar
-- quais eventos têm desempenho acima da média, bem como os artistas associados
-- a esses eventos. Isso é útil para análises gerenciais e estratégicas.

SELECT
    e.id_evento,
    e.nome AS nome_evento,
    p.nome AS nome_artista,
    a.nome_artistico,
    ft.faturamento_total
FROM Evento e
JOIN Apresentacao ap
    ON e.id_evento = ap.id_evento
JOIN Apresenta apr
    ON ap.id_apresentacao = apr.id_apresentacao
JOIN Artista a
    ON apr.id_pessoa = a.id_pessoa
JOIN Pessoa p
    ON a.id_pessoa = p.id_pessoa
JOIN (
    SELECT
        e2.id_evento,
        SUM(i2.valor_final) AS faturamento_total
    FROM Evento e2
    JOIN Setor s2
        ON e2.id_evento = s2.id_evento
    JOIN Ingresso i2
        ON s2.id_setor = i2.id_setor
    WHERE i2.status = 'Valido'
    GROUP BY e2.id_evento
) ft
    ON e.id_evento = ft.id_evento
WHERE ft.faturamento_total > (
    SELECT AVG(faturamento_evento)
    FROM (
        SELECT
            SUM(i3.valor_final) AS faturamento_evento
        FROM Evento e3
        JOIN Setor s3
            ON e3.id_evento = s3.id_evento
        JOIN Ingresso i3
            ON s3.id_setor = i3.id_setor
        WHERE i3.status = 'Valido'
        GROUP BY e3.id_evento
    ) AS media_eventos
)
ORDER BY ft.faturamento_total DESC, e.nome ASC, p.nome ASC;