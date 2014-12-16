-- DESATIVA ITENS DE PRESCRIÇÃO ANTIGOS E ATIVA OS NOVOS
-- =====================================================
-- Este script desativa os itens de prescrição antigos do MV
-- (com código < 5000) e ativa os itens novos (com código >= 5000).
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 2014-12-16

-- ============================================================ --
-- PELO AMOR DE DEUS, NÃO RODE ESTE SCRIPT NO BANCO DE DADOS    --
-- SE NÃO SOUBER EXATAMENTE O QUE ESTÁ FAZENDO!                 --
-- ============================================================ --

UPDATE tip_presc SET sn_ativo = 'N'
WHERE cd_tip_presc < 5000
;

UPDATE tip_presc SET sn_ativo = 'S'
WHERE cd_tip_presc >= 5000
;

ROLLBACK;
--COMMIT;