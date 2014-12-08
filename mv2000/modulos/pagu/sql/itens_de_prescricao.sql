-- ITENS DE PRECRIÇÃO, COMPONENTES E VIAS DE APLICAÇÃO
-- ===================================================
-- Este arquivo contém os scripts necessários à criação de um relatório de conferência
-- dos itens de prescrição cadastrados no MV, incluindo a criação de 3 views para facilitar
-- as queries.
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 2014-12-05



-- VIEW DE ITENS DE PRESCRIÇÃO:
-------------------------------
--DROP VIEW aasf_vw_itens_prescricao;
CREATE OR REPLACE VIEW aasf_vw_itens_prescricao AS
SELECT tp.cd_tip_presc AS cd_tip_presc,
       tp.ds_tip_presc AS ds_tip_presc,
       decode (tp.sn_ativo,
         'S', 'Sim',
         'N', 'Não',
         '?') AS ativo,
       decode (tp.sn_padronizado,
         'S', 'Sim',
         'N', 'Não',
         '?') AS padronizado,
       decode (tp.sn_justificativa,
         'S', 'Sim',
         'N', 'Não',
         '?') AS justificativa,
       esq.ds_tip_esq AS esquema,
       decode (tp.sn_alerta_duplicidade,
         'S', 'Sim',
         'N', 'Não',
         '?') AS alerta_duplicidade,
       -- controle
       decode (tp.tp_pre_med,
         'M', 'Médica',
         'E', 'Enfermagem',
         'A', 'Ambos',
         '?') AS tp_pred_med,
       prod.ds_produto AS produto,
       tp.cd_uni_pro AS cd_uni_pro,
       up.ds_unidade AS ds_unidade_presc,
       tp.cd_uni_pro_cons AS cd_uni_pro_cons,
       up2.ds_unidade AS ds_unidades_solic,
       tp.cd_tipo_dieta AS dieta,
       tp.cd_exa_rx AS diag_imagem,
       tp.cd_exa_lab AS sadt,
       tp.cd_sangue_derivados AS sangue,
       tp.cd_item_agendamento AS agendamento,
       tp.cd_pro_fat || ' - ' || pf.ds_pro_fat AS proced_faturamento,
       tp.qt_padrao AS qtd_padrao,
       tp.cd_for_apl AS via_padrao,
       tp.ds_observacao AS obs_padrao
FROM tip_presc tp
LEFT JOIN tip_presc tp2 ON (tp.cd_tip_presc = tp2.cd_tip_presc)
LEFT JOIN tip_presc tp3 ON (tp.cd_tip_presc = tp3.cd_tip_presc)
LEFT JOIN tip_esq esq ON (esq.cd_tip_esq = tp.cd_tip_esq)
LEFT JOIN produto prod ON (prod.cd_produto = tp.cd_produto)
LEFT JOIN uni_pro up ON (tp2.cd_uni_pro = up.cd_uni_pro)
LEFT JOIN uni_pro up2 ON (tp3.cd_uni_pro = up2.cd_uni_pro
                          AND
                          tp3.cd_uni_pro_cons = up2.cd_uni_pro)
LEFT JOIN pro_fat pf ON (pf.cd_pro_fat = tp.cd_pro_fat)
;



-- VIEW DOS COMPONENTES DO ITEM DE PRESCRIÇÃO:
----------------------------------------------
--DROP VIEW aasf_vw_componentes_presc;
CREATE OR REPLACE VIEW aasf_vw_componentes_presc AS
SELECT c.cd_tip_presc_componente AS cd_tip_presc_componente,
       tp.ds_tip_presc AS componente,
       c.qt_compon AS qtd,
       c.cd_for_apl AS via,
       decode(c.tp_componente,
          'E', 'Não',
          'M', 'Sim',
          '?') AS exibe,
       decode(c.tp_kit,
          'F', 'Sim',
          'A', 'Não',
          '?') AS multiplica,
       c.cd_tip_presc AS cd_tiaasf_vw_vias_aplicp_presc
FROM compon c
INNER JOIN tip_presc tp ON (tp.cd_tip_presc = c.cd_tip_presc_componente)
;



-- VIEW DAS VIAS DE APLICAÇÃO DO ITEM DE PRESCRIÇÃO:
----------------------------------------------------
--DROP VIEW aasf_vw_vias_aplic;
CREATE OR REPLACE VIEW aasf_vw_vias_aplic AS
SELECT f.cd_for_apl || ' - ' || f.ds_for_apl via,
       v.cd_tip_presc cd_tip_presc
FROM tip_presc_for_apl v
INNER JOIN for_apl f ON (v.cd_for_apl = f.cd_for_apl)
;



-- ITENS DE PRESCRIÇÃO:
-----------------------
SELECT cd_tip_presc,
       ds_tip_presc,
       ativo,
       padronizado,
       justificativa,
       esquema,
       alerta_duplicidade,
       tp_pred_med,
       produto,
       cd_uni_pro,
       ds_unidade_presc,
       cd_uni_pro_cons,
       ds_unidades_solic,
       dieta,
       diag_imagem,
       sadt,
       sangue,
       agendamento,
       proced_faturamento,
       qtd_padrao,
       via_padrao,
       obs_padrao
FROM aasf_vw_itens_prescricao
ORDER BY ds_tip_presc
;



-- COMPONENTES DO ITEM DE PRESCRIÇÃO:
-------------------------------------
SELECT cd_tip_presc_componente,
       componente,
       qtd,
       via,
       exibe,
       multiplica,
       cd_tip_presc
FROM aasf_vw_componentes_presc
ORDER BY componente
;



-- VIAS DE APLICAÇÃO DOS ITENS DE PRESCRIÇÃO:
---------------------------------------------
SELECT via,
       cd_tip_presc
from aasf_vw_vias_aplic
;



-- ITENS DE PRESCRIÇÃO E SEUS COMPONENTES:
------------------------------------------
SELECT i.ds_tip_presc,
       c.componente,
       c.qtd,
       c.via,
       c.exibe,
       c.multiplica
FROM AASF_VW_ITENS_PRESCRICAO i
INNER JOIN AASF_VW_COMPONENTES_PRESC c ON (i.CD_tip_PRESC = c.cd_tip_presc)
--WHERE i.CD_tip_PRESC = 2036
;