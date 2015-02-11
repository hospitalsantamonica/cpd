update dbamv.produto p2 set p2.sn_bloqueio_de_compra = 'S', p2.sn_movimentacao = 'N'
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
