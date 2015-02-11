update dbamv.produto p2 

SET p2.ds_produto = substr('ZZINATIVO ' || p2.ds_produto, 0, 30)

where p2.cd_produto in (

SELECT p.CD_PRODUTO
  FROM DBAMV.PRODUTO p
 WHERE p.cd_produto < 20000
   and p.cd_produto in (  SELECT ep.CD_PRODUTO
                            FROM DBAMV.EST_PRO ep
                           where ep.cd_produto <20000 
                           group by ep.CD_PRODUTO 
                          having sum(ep.qt_estoque_atual)= 0
                             and sum(ep.qt_estoque_reservado)= 0
                             and sum(ep.qt_estoque_doado)= 0
                        )
)
