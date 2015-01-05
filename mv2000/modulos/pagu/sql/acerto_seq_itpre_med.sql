-- ACERTO DA SEQUENCE PARA NOVOS ITENS DE PRESCRI��O
-- =================================================
-- Este script aumenta o contador da sequence de itens
-- de prescri��o do MV para permitir que os novos cadastros
-- se iniciem a partir do n�mero 5.000
-- Por: Abrantes Ara�jo Silva Filho
--      abrantesasf@gmail.com
-- Em: 2014-12-16

-- ============================================================ --
-- PELO AMOR DE DEUS, N�O RODE ESTE SCRIPT NO BANCO DE DADOS!!! --
-- ============================================================ --


DECLARE
  v_contador NUMBER := NULL;

BEGIN
  -- Pega pr�ximo n�mero da sequence atual
  SELECT seq_tip_presc.nextval INTO v_contador
  FROM dual;
  
  -- Loop para aumentar a sequence. A l�gica � a seguinte: por exemplo, se voc� quiser
  -- que os novos cadastros comecem com o c�digo 25000, voc� dever� colocar a condi�ao
  -- no contador para "< 24999". Isso porque quando o contador chegar a 24998, o loop
  -- ser� executado mais uma vez e o valor da sequence ser� aumentado para 24999. A�
  -- o pr�ximo cadastro ja come�ar� com o c�digo 25000.
  -- Se a condi��o do while fosse "< 25000", quando o contador chegasse em 24999
  -- o loop seria executado mais uma vez e a sequence seria aumentada para 25000 (e
  -- o pr�ximo cadastro teria o c�digo 25001, e n�o 25000 como desejado).
  --
  -- RESUMINDO: o valor que voc� deve colocar na condi��o do while �:
  --            "sequence desejada" - 1
  WHILE v_contador < 4999 LOOP
    SELECT seq_tip_presc.nextval INTO v_contador
    FROM dual;
  END LOOP;

END;

SELECT seq_tip_presc.currval 
    FROM dual;
