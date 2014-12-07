-- CONTAGENS DIVERSAS DE PRODUTOS DO ESTOQUE
-- =========================================
-- Este arquivo contém vários scripts para realizar diversos tipos de
-- contagens de produtos do estoque
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 2014-12-07



-- CONTAGEM DE PRODUTOS POR ESPÉCIE:
------------------------------------
SELECT e.ds_especie AS especie,
       COUNT(*) AS produtos
FROM especie e
INNER JOIN produto p ON (p.cd_especie = e.cd_especie)
WHERE p.sn_movimentacao = 'S'
  AND p.sn_bloqueio_de_compra = 'N'
GROUP BY e.ds_especie
ORDER BY e.ds_especie
;



-- CONTAGEM DE PRODUTOS POR ESPÉCIE E CLASSE:
--------------------------------------------
SELECT e.ds_especie AS especie,
       c.ds_classe AS classe,
       count(*) AS produtos
FROM especie e
INNER JOIN classe c ON (e.CD_ESPECIE = c.CD_ESPECIE)
INNER JOIN produto p ON (p.cd_especie = e.CD_ESPECIE
                        AND
                        p.cd_classe = c.CD_CLASSE)
WHERE p.sn_movimentacao = 'S'
  AND p.sn_bloqueio_de_compra = 'N'
GROUP BY e.DS_ESPECIE, c.DS_CLASSE
ORDER BY e.ds_especie, c.ds_classe
;



-- CONTAGEM DE PRODUTOS POR ESPÉCIE, CLASSE E SUBCLASSE:
--------------------------------------------------------
SELECT e.ds_especie AS especie,
       c.ds_classe AS classe,
       sc.ds_sub_cla AS sub_classe,
       count(*) AS produtos
FROM especie e
INNER JOIN classe c ON (e.CD_ESPECIE = c.CD_ESPECIE)
INNER JOIN sub_clas sc ON (sc.CD_ESPECIE = e.CD_ESPECIE
                           AND
                           sc.cd_classe = c.CD_CLASSE)
INNER JOIN produto p ON (p.cd_especie = e.CD_ESPECIE
                        AND
                        p.cd_classe = c.CD_CLASSE
                        AND
                        p.cd_sub_cla = sc.CD_SUB_CLA)
WHERE p.sn_movimentacao = 'S'
  AND p.sn_bloqueio_de_compra = 'N'
GROUP BY e.DS_ESPECIE, c.DS_CLASSE, sc.DS_SUB_CLA
ORDER BY e.ds_especie, c.ds_classe, sc.ds_sub_cla
;