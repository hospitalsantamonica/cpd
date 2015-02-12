-- Correção da descrição das unidades dos produtos do banco de produção
-- ====================================================================
-- Estes scripts serve para a correção da descrição dos produtos do banco de simulação.
-- Nós trocamos a descrição para a string 'ZZINATIVO' || ds_produto mas, por questões de
-- faturamento, foi necessário reativar esses produtos antigos e retornar com a descrição
-- anterior.
-- Para isso utilizamos um backup do banco de produção de antes da troca das descrições e
-- atualizamos a descrição para voltar ao que era originalmente.
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 11/02/2015

-- ATENÇÃO!
-- Este script só deve ser rodado se você souber EXATAMENTE o que está fazendo, não deve ser
-- rodado por quem não entende o que este script faz. Em outras palavras:

-- ============================================================ --
-- PELO AMOR DE DEUS, não rode este script no banco de dados!!! --
-- ============================================================ --


-- Criação do link entre o banco de dados de produção e o banco de dados de simulação.
-- Esse link deve ser criado no banco de produção, e o TNSNAMES do banco de produção
-- deve ter uma entrada que aponte para o serviço 'simulacao'.
CREATE DATABASE LINK SIMULACAO.HOSPITALSANTAMONICA.ORG 
USING 'simulacao';


-- Conferências básicas para saber se o link está funcionando corretamente:
-- Verifica a data e a hora do maior atendimento no banco de produção e no banco
-- de simulação (através do dblink):
SELECT MAX(dt_atendimento) data
     , TO_CHAR(MAX(hr_atendimento), 'DD-MM-YYYY HH24:MI:SS') hora
FROM atendime;

SELECT MAX(dt_atendimento) data
     , TO_CHAR(MAX(hr_atendimento), 'DD-MM-YYYY HH24:MI:SS') hora
FROM atendime@simulacao;


-- Conferências básicas para saber se o link está funcionando corretamente:
-- Verifica se o número de produtos cadastrados no banco de produção e no banco
-- de simulação é o mesmo (através do dblink):
SELECT COUNT(*)
FROM produto
WHERE cd_produto < 20000;

SELECT COUNT(*)
FROM produto@simulacao
WHERE cd_produto < 20000;


-- Lista os códigos dos produtos e as descrições, comparando o que está no banco
-- de produção, com o que está no banco de simulação, usando o dblink:
SELECT p.cd_produto cd_producao
     , p.ds_produto ds_producao
     , s.cd_produto cd_simulacao
     , s.ds_produto ds_simulacao
FROM   produto p
INNER JOIN produto@simulacao s ON(s.cd_produto = p.cd_produto)
WHERE  p.cd_produto < 20000
ORDER BY p.cd_produto;


-- Cria uma tabela extra para armazenar os dados dos produtos conforme estavam no
-- backup do banco de produção para o banco de simulação (data do backup: 11/02/2015, 00:00:00).
-- Se algum produto foi cadastrado depois da zero hora do dia 11/02/2015, não estará no
-- banco de simulação, mas como estamos interessados nos produtos com cd_produto < 20000,
-- não teremos problemas.
CREATE TABLE aasf_produtos AS
SELECT * FROM produto@simulacao;


-- Agora o trabalho principal: atualizaremos a descrição dos produtos no banco de produção
-- conforme a descrição que estava no banco de simulação, antes de alterarmos a descrição
-- dos produtos do banco de produção para o 'ZZINATIVO'. A descrição só é alterada para os códigos
-- de produtos < 20000.
MERGE INTO produto destino
USING (SELECT cd_produto, ds_produto
       FROM aasf_produtos
       WHERE cd_produto < 20000) origem
ON (destino.cd_produto = origem.cd_produto)
WHEN MATCHED THEN UPDATE
SET destino.ds_produto = origem.ds_produto;


-- Conferência geral da tabela de produtos do banco de produção, para ver se o merge surtiu
-- o efeito desejado:
SELECT *
FROM produto
ORDER BY cd_produto;


-- Se tudo correu bem, faz o commit ou, se deu xabú, faz o roolback:
ROLLBACK;
COMMIT;


-- Agora dropamos o dblink entre o banco de produção e o de simulação:
DROP DATABASE LINK simulacao.hospitalsantamonica.org;


-- Também poderia dropar a tabela aasf_produtos, mas resolvi deixar como referência futura caso
-- necessário.