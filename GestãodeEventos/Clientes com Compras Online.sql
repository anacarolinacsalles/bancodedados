-- Consulta 1
-- Descrição:
-- Listar os clientes que realizaram compras, mostrando o nome do cliente,
-- o ID da compra, a data da compra e o valor total, filtrando apenas compras
-- realizadas pelo canal Online e ordenando do maior para o menor valor.
--
-- Relevância:
-- Essa consulta é importante para identificar compras realizadas por um
-- canal específico de venda, permitindo analisar o comportamento dos clientes
-- e priorizar os registros de maior valor.
select
  p.nome as nome_cliente,
  c.id_compra,
  c.data_compra,
  c.valor_compra,
  c.canal_vendas
from
  Compra c
  join Cliente cl on c.id_pessoa = cl.id_pessoa
  join Pessoa p on cl.id_pessoa = p.id_pessoa
where
  c.canal_vendas = 'Online'
order by
  c.valor_compra desc,
  p.nome asc;