-- ACERTO DA SEQUENCE PARA OS NOVOS PRODUTOS
-- =========================================
-- Este script recria a sequence de produtos do MV para permitir que
-- os novos cadastros se iniciem a partir do número 20.000
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 2014-12-07

-- ============================================================ --
-- PELO AMOR DE DEUS, NÃO RODE ESTE SCRIPT NO BANCO DE DADOS!!! --
-- ============================================================ --


DECLARE
  v_contador NUMBER := NULL;

BEGIN
  -- Pega próximo número da sequence atual
  SELECT seq_produto.nextval INTO v_contador
  FROM dual;
  
  -- Loop para aumentar a sequence. A lógica é a seguinte: por exemplo, se você quiser
  -- que os novos produtos comecem com o código 25000, você deverá colocar a condiçao
  -- no contador para "< 24999". Isso porque quando o contador chegar a 24998, o loop
  -- será executado mais uma vez e o valor da sequence será aumentado para 24999. Aí
  -- o próximo produto cadastrado ja começará com o código 25000.
  -- Se a condição do while fosse "< 25000", quando o contador chegasse em 24999
  -- o loop seria executado mais uma vez e a sequence seria aumentada para 25000 (e
  -- o próximo produto cadastrado teria o código 25001, e não 25000 como desejado).
  --
  -- RESUMINDO: o valor que você deve colocar na condição do while é:
  --            "sequence desejada" - 1
  WHILE v_contador < 19999 LOOP
    SELECT seq_produto.nextval INTO v_contador
    FROM dual;
  END LOOP;

END;