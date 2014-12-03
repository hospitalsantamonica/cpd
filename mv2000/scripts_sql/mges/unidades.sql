-- Unidades Básicas e Auxiliares
-- =============================
-- Estes scripts servem para a identificação do cadastro das unidades básicas
-- e unidades auxiliares do MV2000.
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 26/11/2014


-- UNIDADES BÁSICAS:
--------------------
DESC unidade;

SELECT cd_unidade "Cód.",
       ds_unidade "SELECT u.cd_unidade AS "Cód. Unid. Básicas",
       u.ds_unidade AS "Unid. Básicas",
       u.vl_fator AS "Fator Un. Básicas",
       it.cd_itunidade as "Cód Unid. Auxiliares",
       it.ds_itunidade AS "Unid. Auxiliares",
       it.vl_fator AS "Fator Unid. Auxiliares"
FROM unidade u
INNER JOIN itunidade it ON (it.cd_unidade = u.cd_unidade)
WHERE it.ds_itunidade NOT LIKE '%INATIVO%'
ORDER BY u.ds_unidade, it.ds_itunidade;
Descrição",
       vl_fator "Fator"
FROM unidade
ORDER BY cd_unidade;




-- UNIDADES AUXILIARES:
-----------------------
DESC itunidade;

SELECT u.cd_unidade AS "Cód. Unid. Básicas",
       u.ds_unidade AS "Unid. Básicas",
       u.vl_fator AS "Fator Un. Básicas",
       it.cd_itunidade as "Cód Unid. Auxiliares",
       it.ds_itunidade AS "Unid. Auxiliares",
       it.vl_fator AS "Fator Unid. Auxiliares"
FROM unidade u
INNER JOIN itunidade it ON (it.cd_unidade = u.cd_unidade)
--WHERE it.ds_itunidade NOT LIKE '%INATIVO%'
ORDER BY u.ds_unidade, it.ds_itunidade;
