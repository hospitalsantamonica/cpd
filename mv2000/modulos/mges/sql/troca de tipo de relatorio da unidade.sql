select u.cd_produto, count (u.cd_uni_pro)
  from uni_pro u
 where u.cd_produto < 20000
   and u.tp_relatorios = 'E'
   and u.cd_produto not in
       (SELECT up.cd_produto
          FROM uni_pro up
         WHERE up.cd_produto < 20000
           AND up.tp_relatorios = 'C')
group by u.cd_produto
having count (u.cd_uni_pro) > 1
           

update uni_pro u set u.tp_relatorios = 'C'
 where u.cd_produto < 20000
   and u.tp_relatorios = 'E'
   and u.cd_produto not in
       (SELECT up.cd_produto
          FROM uni_pro up
         WHERE up.cd_produto < 20000
           AND up.tp_relatorios = 'C')
