-- CONTAGENS DE PRODUTOS DO ESTOQUE




-- Contagem de produtos ativos por especie:
-------------------------------------------
SELECT e.ds_especie AS especie,
       COUNT(*) AS produtos
FROM especie e
INNER JOIN produto p ON (p.cd_especie = e.cd_especie)
WHERE p.sn_movimentacao = 'S'
  AND p.sn_bloqueio_de_compra = 'N'
GROUP BY e.ds_especie
ORDER BY e.ds_especie
;