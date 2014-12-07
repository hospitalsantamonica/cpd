-- ERROS NO CADASTRO DE PRODUTOS
-- =============================
-- Este script identifica erros no cadastro de produtos
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 2014-12-07



-- MESTRES COM MOVIMENTAÇÃO
---------------------------
SELECT cd_produto,
       ds_produto
FROM produto
WHERE cd_especie = 1                -- medicamentos
  AND cd_produto_tem IS NULL        -- identifica o mestre
  AND (sn_movimentacao = 'S'
       OR
       sn_bloqueio_de_compra = 'N'
      )
ORDER BY ds_produto
;



-- PRODUTOS INATIVOS COM MOVIMENTAÇÃO
-------------------------------------
SELECT cd_produto,
       ds_produto
FROM produto
WHERE 1 = 1
  AND ds_produto like '%INATIVO%'
  AND (sn_movimentacao = 'S'
       OR
       sn_bloqueio_de_compra = 'N'
      )
ORDER BY ds_produto
;



-- PRODUTOS DO CADASTRO ANTIGO COM MOVIMENTACAO:
------------------------------------------------
SELECT cd_produto,
       ds_produto
FROM produto
WHERE 1 = 1
  AND cd_produto < 20000             -- produtos do novo cadastro começam com 20000
  AND (sn_movimentacao = 'S'
       OR
       sn_bloqueio_de_compra = 'N'
      )
ORDER BY ds_produto
;