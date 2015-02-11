update dbamv.produto p2 

SET p2.ds_produto = substr('ZZINATIVO ' || REPLACE(p2.ds_produto, 'INATIVO', ''), 0, 30)

where p2.cd_produto in (

SELECT p.CD_PRODUTO
  FROM DBAMV.PRODUTO p
 WHERE p.cd_produto < 20000
   and p.cd_produto in (  SELECT ep.CD_PRODUTO
                            FROM DBAMV.EST_PRO ep
                           where ep.qt_estoque_atual = 0
                             and ep.qt_estoque_reservado = 0
                             and ep.qt_estoque_doado = 0
                             and ep.cd_produto <20000
                        )
)
