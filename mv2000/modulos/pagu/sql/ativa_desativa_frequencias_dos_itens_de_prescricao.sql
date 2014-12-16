-- DESATIVA FREQÜÊNCIAS DE ITENS DE PRESCRIÇÃO ANTIGOS E ATIVA NOVOS
-- =================================================================
-- Este script desativa as freqüências antigas dos itens de prescrição
-- (com código < 100) e ativa as freqüências novas (com código >= 100).
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 2014-12-16

-- ============================================================ --
-- PELO AMOR DE DEUS, NÃO RODE ESTE SCRIPT NO BANCO DE DADOS    --
-- SE NÃO SOUBER EXATAMENTE O QUE ESTÁ FAZENDO!                 --
-- ============================================================ --

UPDATE tip_fre SET tp_escopo = 'D'
WHERE cd_tip_fre < 100
;

UPDATE tip_fre SET tp_escopo = 'A'
WHERE cd_tip_fre >= 100
;

ROLLBACK;
--COMMIT;