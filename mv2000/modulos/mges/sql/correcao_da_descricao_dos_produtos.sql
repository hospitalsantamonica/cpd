-- Corre��o da descri��o das unidades dos produtos do banco de produ��o
-- ====================================================================
-- Estes scripts serve para a corre��o da descri��o dos produtos do banco de simula��o.
-- N�s trocamos a descri��o para a string 'ZZINATIVO' || ds_produto mas, por quest�es de
-- faturamento, foi necess�rio reativar esses produtos antigos e retornar com a descri��o
-- anterior.
-- Para isso utilizamos um backup do banco de produ��o de antes da troca das descri��es e
-- atualizamos a descri��o para voltar ao que era originalmente.
-- Por: Abrantes Ara�jo Silva Filho
--      abrantesasf@gmail.com
-- Em: 11/02/2015

-- ATEN��O!
-- Este script s� deve ser rodado se voc� souber EXATAMENTE o que est� fazendo, n�o deve ser
-- rodado por quem n�o entende o que este script faz. Em outras palavras:

-- ============================================================ --
-- PELO AMOR DE DEUS, n�o rode este script no banco de dados!!! --
-- ============================================================ --


-- Cria��o do link entre o banco de dados de produ��o e o banco de dados de simula��o.
-- Esse link deve ser criado no banco de produ��o, e o TNSNAMES do banco de produ��o
-- deve ter uma entrada que aponte para o servi�o 'simulacao'.
CREATE DATABASE LINK SIMULACAO.HOSPITALSANTAMONICA.ORG 
USING 'simulacao';


-- Confer�ncias b�sicas para saber se o link est� funcionando corretamente:
-- Verifica a data e a hora do maior atendimento no banco de produ��o e no banco
-- de simula��o (atrav�s do dblink):
SELECT MAX(dt_atendimento) data
     , TO_CHAR(MAX(hr_atendimento), 'DD-MM-YYYY HH24:MI:SS') hora
FROM atendime;

SELECT MAX(dt_atendimento) data
     , TO_CHAR(MAX(hr_atendimento), 'DD-MM-YYYY HH24:MI:SS') hora
FROM atendime@simulacao;


-- Confer�ncias b�sicas para saber se o link est� funcionando corretamente:
-- Verifica se o n�mero de produtos cadastrados no banco de produ��o e no banco
-- de simula��o � o mesmo (atrav�s do dblink):
SELECT COUNT(*)
FROM produto
WHERE cd_produto < 20000;

SELECT COUNT(*)
FROM produto@simulacao
WHERE cd_produto < 20000;


-- Lista os c�digos dos produtos e as descri��es, comparando o que est� no banco
-- de produ��o, com o que est� no banco de simula��o, usando o dblink:
SELECT p.cd_produto cd_producao
     , p.ds_produto ds_producao
     , s.cd_produto cd_simulacao
     , s.ds_produto ds_simulacao
FROM   produto p
INNER JOIN produto@simulacao s ON(s.cd_produto = p.cd_produto)
WHERE  p.cd_produto < 20000
ORDER BY p.cd_produto;


-- Cria uma tabela extra para armazenar os dados dos produtos conforme estavam no
-- backup do banco de produ��o para o banco de simula��o (data do backup: 11/02/2015, 00:00:00).
-- Se algum produto foi cadastrado depois da zero hora do dia 11/02/2015, n�o estar� no
-- banco de simula��o, mas como estamos interessados nos produtos com cd_produto < 20000,
-- n�o teremos problemas.
CREATE TABLE aasf_produtos AS
SELECT * FROM produto@simulacao;


-- Agora o trabalho principal: atualizaremos a descri��o dos produtos no banco de produ��o
-- conforme a descri��o que estava no banco de simula��o, antes de alterarmos a descri��o
-- dos produtos do banco de produ��o para o 'ZZINATIVO'. A descri��o s� � alterada para os c�digos
-- de produtos < 20000.
MERGE INTO produto destino
USING (SELECT cd_produto, ds_produto
       FROM aasf_produtos
       WHERE cd_produto < 20000) origem
ON (destino.cd_produto = origem.cd_produto)
WHEN MATCHED THEN UPDATE
SET destino.ds_produto = origem.ds_produto;


-- Confer�ncia geral da tabela de produtos do banco de produ��o, para ver se o merge surtiu
-- o efeito desejado:
SELECT *
FROM produto
ORDER BY cd_produto;


-- Se tudo correu bem, faz o commit ou, se deu xab�, faz o roolback:
ROLLBACK;
COMMIT;


-- Agora dropamos o dblink entre o banco de produ��o e o de simula��o:
DROP DATABASE LINK simulacao.hospitalsantamonica.org;


-- Tamb�m poderia dropar a tabela aasf_produtos, mas resolvi deixar como refer�ncia futura caso
-- necess�rio.