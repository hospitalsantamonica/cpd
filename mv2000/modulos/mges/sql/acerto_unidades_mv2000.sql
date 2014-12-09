-- Correção das unidades do sistema MV
-- ===================================
-- Estes scripts servem para a correção dos cadastros das unidades básicas
-- e unidades auxiliares do MV2000.
-- Por: Abrantes Araújo Silva Filho
--      abrantesasf@gmail.com
-- Em: 26/11/2014

-- ATENÇÃO!
-- Este script só deve ser rodado UMA ÚNICA VEZ para a correção das unidades, e não deve ser
-- rodado por quem não entende o que este script faz. Em outras palavras:

-- ============================================================ --
-- PELO AMOR DE DEUS, não rode este script no banco de dados!!! --
-- ============================================================ --


-- Correção do cadastro das unidades no sistema:
ROLLBACK;

UPDATE unidade
--SET ds_unidade = substr('ZZINATIVO ' || REPLACE(ds_unidade, 'NAO_UTIIZAR_', ''), 0, 30)
SET ds_unidade = substr('* ' || REPLACE(ds_unidade, 'NAO_UTIIZAR_', ''), 0, 30)
WHERE cd_unidade IN (
'1/4',
'AMP',
'BALDE',
'BARRA',
'BL',
'BOB',
'BOLSA',
'BOMB',
'CX',
'CAP',
'CAR',
'CH',
'COMP',
'13451',
'CONJ',
'DOSE',
'DRG',
'DZ',
'ENV',
'FD',
'FLAC',
'FL',
'FR',
'FR.AMP',
'GL',
'GRF',
'13335',
'IT',
'JOGO',
'LATA',
'L',
'MC',
'MLI',
'CLIPES',
'FR.GOT',
'PT',
'NP',
'PCT',
'PAR',
'PECA',
'KG',
'REFIL',
'RESMA',
'RL',
'SACHE',
'SC',
'657',
'SER',
'SUP',
'TEB',
'TEP',
'TP',
'TN',
'TBT',
'TB',
--'M',
--'M3',
--'M2',
--'MG',
--'ML',
--'GT',
--'G',
--'CM',
--'UND',
--'UI',
--'UTR',
--'MCG'
'UNP'
);

UPDATE itunidade
--SET ds_itunidade = substr('ZZINATIVO ' || ds_itunidade, 0, 30)
SET ds_itunidade = substr('* ' || ds_itunidade, 0, 30)
where cd_unidade in (
'1/4',
'AMP',
'BALDE',
'BARRA',
'BL',
'BOB',
'BOLSA',
'BOMB',
'CX',
'CAP',
'CAR',
'CH',
'COMP',
'13451',
'CONJ',
'DOSE',
'DRG',
'DZ',
'ENV',
'FD',
'FLAC',
'FL',
'FR',
'FR.AMP',
'GL',
'GRF',
'13335',
'IT',
'JOGO',
'LATA',
'L',
'MC',
'MLI',
'CLIPES',
'FR.GOT',
'PT',
'NP',
'PCT',
'PAR',
'PECA',
'KG',
'REFIL',
'RESMA',
'RL',
'SACHE',
'SC',
'657',
'SER',
'SUP',
'TEB',
'TEP',
'TP',
'TN',
'TBT',
'TB',
--'M',
--'M3',
--'M2',
--'MG',
--'ML',
--'GT',
--'G',
--'CM',
--'UND',
--'UI',
--'UTR',
--'MCG'
'UNP'
);



-- Resolvi não rodar estes comandos para deixar tudo inativado mesmo,
-- descrito como ZZINATIVO.

UPDATE itunidade
SET ds_itunidade = 'ROLO 1000 CM'
WHERE cd_itunidade = 943;

UPDATE itunidade
SET ds_itunidade = 'ROLO 6 CM'
WHERE cd_itunidade = 932;

UPDATE itunidade
SET ds_itunidade = 'ROLO 10 CM'
WHERE cd_itunidade = 929;

UPDATE itunidade
SET ds_itunidade = 'ROLO 18300 CM'
WHERE cd_itunidade = 723;

UPDATE itunidade
SET ds_itunidade = 'ROLO 200 CM'
WHERE cd_itunidade = 934;

UPDATE itunidade
SET ds_itunidade = 'ROLO 20 CM'
WHERE cd_itunidade = 931;

UPDATE itunidade
SET ds_itunidade = 'ROLO 2500 CM'
WHERE cd_itunidade = 603;

UPDATE itunidade
SET ds_itunidade = 'ROLO 3000 CM'
WHERE cd_itunidade = 938;

UPDATE itunidade
SET ds_itunidade = 'ROLO 300 CM'
WHERE cd_itunidade = 935;

UPDATE itunidade
SET ds_itunidade = 'ROLO 400 CM'
WHERE cd_itunidade = 936;

UPDATE itunidade
SET ds_itunidade = 'ROLO 450 CM'
WHERE cd_itunidade = 598;

UPDATE itunidade
SET ds_itunidade = 'ROLO 5000 CM'
WHERE cd_itunidade = 604;

UPDATE itunidade
SET ds_itunidade = 'ROLO 50 CM'
WHERE cd_itunidade = 942;

UPDATE itunidade
SET ds_itunidade = 'ROLO 9,14 CM'
WHERE cd_itunidade = 954;

UPDATE itunidade
SET ds_itunidade = 'ROLO 9100 CM'
WHERE cd_itunidade = 602;

UPDATE itunidade
SET ds_itunidade = 'BISNAGA 3,5 G'
WHERE cd_itunidade = 728;

UPDATE itunidade
SET ds_itunidade = 'BISNAGA 80 G'
WHERE cd_itunidade = 1000;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 1 G'
WHERE cd_itunidade = 1069;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 1000 MG'
WHERE cd_itunidade = 1001;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 500 MG'
WHERE cd_itunidade = 742;

UPDATE itunidade
SET ds_itunidade = 'LATA 200 G'
WHERE cd_itunidade = 635;

UPDATE itunidade
SET ds_itunidade = 'LATA 225 G'
WHERE cd_itunidade = 626;

UPDATE itunidade
SET ds_itunidade = 'LATA 240 G'
WHERE cd_itunidade = 589;

UPDATE itunidade
SET ds_itunidade = 'LATA 250 G'
WHERE cd_itunidade = 627;

UPDATE itunidade
SET ds_itunidade = 'LATA 260 G'
WHERE cd_itunidade = 694;

UPDATE itunidade
SET ds_itunidade = 'LATA 400 G'
WHERE cd_itunidade = 588;

UPDATE itunidade
SET ds_itunidade = 'LATA 450 G'
WHERE cd_itunidade = 625;

UPDATE itunidade
SET ds_itunidade = 'LATA 800 G'
WHERE cd_itunidade = 623;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 10 G'
WHERE cd_itunidade = 701;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 500 G'
WHERE cd_itunidade = 590;

UPDATE itunidade
SET ds_itunidade = 'POTE 100 G'
WHERE cd_itunidade = 606;

UPDATE itunidade
SET ds_itunidade = 'POTE 150 G'
WHERE cd_itunidade = 610;

UPDATE itunidade
SET ds_itunidade = 'POTE 25 G'
WHERE cd_itunidade = 957;

UPDATE itunidade
SET ds_itunidade = 'POTE 80 G'
WHERE cd_itunidade = 585;

UPDATE itunidade
SET ds_itunidade = 'POTE 10 G'
WHERE cd_itunidade = 1024;

UPDATE itunidade
SET ds_itunidade = 'SUPOSITORIO 0,831 G'
WHERE cd_itunidade = 897;

UPDATE itunidade
SET ds_itunidade = 'SUPOSITORIO 2,254 G'
WHERE cd_itunidade = 896;

UPDATE itunidade
SET ds_itunidade = 'TUBO 20 G'
WHERE cd_itunidade = 580;

UPDATE itunidade
SET ds_itunidade = 'TUBO 3,5 G'
WHERE cd_itunidade = 594;

UPDATE itunidade
SET ds_itunidade = 'TUBO 30 G'
WHERE cd_itunidade = 581;

UPDATE itunidade
SET ds_itunidade = 'TUBO 45 G'
WHERE cd_itunidade = 586;

UPDATE itunidade
SET ds_itunidade = 'TUBO 50 G'
WHERE cd_itunidade = 582;

UPDATE itunidade
SET ds_itunidade = 'TUBO 60 G'
WHERE cd_itunidade = 574;

UPDATE itunidade
SET ds_itunidade = 'TUBO 92 G'
WHERE cd_itunidade = 1040;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 70 MG'
WHERE cd_itunidade = 1008;

UPDATE itunidade
SET ds_itunidade = 'AMPOLA 6 MG'
WHERE cd_itunidade = 965;

UPDATE itunidade
SET ds_itunidade = 'AMPOLA 0,1 MG'
WHERE cd_itunidade = 1027;

UPDATE itunidade
SET ds_itunidade = 'BOLSA 250 MG'
WHERE cd_itunidade = 1039;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 10 MG'
WHERE cd_itunidade = 877;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 25 MG'
WHERE cd_itunidade = 882;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 412 MCG'
WHERE cd_itunidade = 981;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 412 MG'
WHERE cd_itunidade = 1051;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 50 MG'
WHERE cd_itunidade = 886;

UPDATE itunidade
SET ds_itunidade = 'CAPSULA 900 MG'
WHERE cd_itunidade = 918;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 0,15 MG'
WHERE cd_itunidade = 862;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 0,25 MG'
WHERE cd_itunidade = 879;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 0,1 MG'
WHERE cd_itunidade = 979;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 0,2 MG'
WHERE cd_itunidade = 970;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 0,4 MG'
WHERE cd_itunidade = 982;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 0,5 MG'
WHERE cd_itunidade = 746;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 1,5 MG'
WHERE cd_itunidade = 1064;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 1000 MG'
WHERE cd_itunidade = 978;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 112 MCG'
WHERE cd_itunidade = 984;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 115 MG'
WHERE cd_itunidade = 1052;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 12,5 MG'
WHERE cd_itunidade = 876;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 2,5 MG'
WHERE cd_itunidade = 967;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 260 MG'
WHERE cd_itunidade = 963;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 35 MG'
WHERE cd_itunidade = 863;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 362,5 MG'
WHERE cd_itunidade = 1066;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 412 MCG'
WHERE cd_itunidade = 980;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 450 MG'
WHERE cd_itunidade = 852;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 45 MG'
WHERE cd_itunidade = 1053;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 530 MG'
WHERE cd_itunidade = 962;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 550 MG'
WHERE cd_itunidade = 975;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 55 MG'
WHERE cd_itunidade = 853;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 60 MG'
WHERE cd_itunidade = 989;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 65 MG'
WHERE cd_itunidade = 923;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 6 MG'
WHERE cd_itunidade = 972;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 800 MG'
WHERE cd_itunidade = 987;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 80 MG'
WHERE cd_itunidade = 983;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 8 MG'
WHERE cd_itunidade = 969;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO 900 MG'
WHERE cd_itunidade = 1054;

UPDATE itunidade
SET ds_itunidade = 'COMPRIMIDO SUBLINGUAL 10 MG'
WHERE cd_itunidade = 1020;

UPDATE itunidade
SET ds_itunidade = 'ENVELOPE 4000 MG'
WHERE cd_itunidade = 971;

UPDATE itunidade
SET ds_itunidade = 'ENVELOPE 9600 MG'
WHERE cd_itunidade = 964;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 0,5 MG'
WHERE cd_itunidade = 773;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 11,25 MG'
WHERE cd_itunidade = 1038;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 2500 MG (2,5 G)'
WHERE cd_itunidade = 795;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 2000 MG (2 G)'
WHERE cd_itunidade = 794;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 1000 MG (1 G)'
WHERE cd_itunidade = 793;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 3,5 MG'
WHERE cd_itunidade = 775;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 3000 MG (3 G)'
WHERE cd_itunidade = 997;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 4500 MG (4,5 G)'
WHERE cd_itunidade = 796;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 5 MG'
WHERE cd_itunidade = 960;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 600 MG'
WHERE cd_itunidade = 844;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 625 MG'
WHERE cd_itunidade = 845;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 747 MCG'
WHERE cd_itunidade = 1037;

UPDATE itunidade
SET ds_itunidade = 'SACHE 50 MG'
WHERE cd_itunidade = 953;

UPDATE itunidade
SET ds_itunidade = 'SACHE 5 MG'
WHERE cd_itunidade = 1058;

UPDATE itunidade
SET ds_itunidade = 'SACHE 6 MG'
WHERE cd_itunidade = 1057;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 10,8 MG'
WHERE cd_itunidade = 799;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 3,6 MG'
WHERE cd_itunidade = 797;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 3,75 MG'
WHERE cd_itunidade = 798;

UPDATE itunidade
SET ds_itunidade = 'SUPOSITORIO 250 MG'
WHERE cd_itunidade = 986;

UPDATE itunidade
SET ds_itunidade = 'SUPOSITORIO 50 MG'
WHERE cd_itunidade = 990;

UPDATE itunidade
SET ds_itunidade = 'AMPOLA 0,25 ML'
WHERE cd_itunidade = 812;

UPDATE itunidade
SET ds_itunidade = 'AMPOLA 1,5 ML'
WHERE cd_itunidade = 814;

UPDATE itunidade
SET ds_itunidade = 'BOLSA 1000 ML (1 L)'
WHERE cd_itunidade = 824;

UPDATE itunidade
SET ds_itunidade = 'BOLSA 1500 ML (1,5 L)'
WHERE cd_itunidade = 1061;

UPDATE itunidade
SET ds_itunidade = 'BOLSA 2000 ML (2 L)'
WHERE cd_itunidade = 825;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 1000 ML (1 L)'
WHERE cd_itunidade = 809;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 105 ML'
WHERE cd_itunidade = 724;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 120 ML'
WHERE cd_itunidade = 564;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 125 ML'
WHERE cd_itunidade = 1045;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 130 ML'
WHERE cd_itunidade = 894;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 150 ML'
WHERE cd_itunidade = 567;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 15 ML'
WHERE cd_itunidade = 672;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 2000 ML (2 L)'
WHERE cd_itunidade = 810;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 20 ML'
WHERE cd_itunidade = 655;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 240 ML'
WHERE cd_itunidade = 609;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 24 ML'
WHERE cd_itunidade = 1049;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 25 ML'
WHERE cd_itunidade = 910;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 300 ML'
WHERE cd_itunidade = 622;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 350 ML'
WHERE cd_itunidade = 673;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 40 ML'
WHERE cd_itunidade = 571;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 75 ML'
WHERE cd_itunidade = 568;

UPDATE itunidade
SET ds_itunidade = 'FRASCO 80 ML'
WHERE cd_itunidade = 642;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 10 ML'
WHERE cd_itunidade = 612;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 2,5 ML'
WHERE cd_itunidade = 828;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 20 ML'
WHERE cd_itunidade = 608;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 3 ML'
WHERE cd_itunidade = 908;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 40 ML'
WHERE cd_itunidade = 878;

UPDATE itunidade
SET ds_itunidade = 'FRASCO GOTA 10 ML'
WHERE cd_itunidade = 637;

UPDATE itunidade
SET ds_itunidade = 'FRASCO GOTA 15 ML'
WHERE cd_itunidade = 640;

UPDATE itunidade
SET ds_itunidade = 'FRASCO GOTA 20 ML'
WHERE cd_itunidade = 631;

UPDATE itunidade
SET ds_itunidade = 'FRASCO GOTA 30 ML'
WHERE cd_itunidade = 634;

UPDATE itunidade
SET ds_itunidade = 'FRASCO GOTA 3 ML'
WHERE cd_itunidade = 638;

UPDATE itunidade
SET ds_itunidade = 'FRASCO GOTA 5 ML'
WHERE cd_itunidade = 636;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 0,2 ML'
WHERE cd_itunidade = 977;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 0,4 ML'
WHERE cd_itunidade = 866;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 0,5 ML'
WHERE cd_itunidade = 1002;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 0,6 ML'
WHERE cd_itunidade = 867;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 0,8 ML'
WHERE cd_itunidade = 868;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 1 ML'
WHERE cd_itunidade = 1055;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 2 ML'
WHERE cd_itunidade = 857;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 5 ML'
WHERE cd_itunidade = 838;

UPDATE itunidade
SET ds_itunidade = 'SERINGA 50 ML'
WHERE cd_itunidade = 892;

UPDATE itunidade
SET ds_itunidade = 'CAIXA 100 UNIDADES'
WHERE cd_itunidade = 621;

UPDATE itunidade
SET ds_itunidade = 'CAIXA 240 UNIDADES'
WHERE cd_itunidade = 696;

UPDATE itunidade
SET ds_itunidade = 'CAIXA 100 UNIDADES'
WHERE cd_itunidade = 621;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 4 UNIDADES'
WHERE cd_itunidade = 939;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 5 UNIDADES'
WHERE cd_itunidade = 937;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 100 UNIDADES'
WHERE cd_itunidade = 620;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 10 UNIDADES'
WHERE cd_itunidade = 721;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 500 UNIDADES'
WHERE cd_itunidade = 599;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 50 UNIDADES'
WHERE cd_itunidade = 600;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 8 UNIDADES'
WHERE cd_itunidade = 722;

UPDATE itunidade
SET ds_itunidade = 'PACOTE 500 UNIDADES'
WHERE cd_itunidade = 599;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 1.200.000 UI'
WHERE cd_itunidade = 869;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 400.000 UI'
WHERE cd_itunidade = 872;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 600.000 UI'
WHERE cd_itunidade = 870;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 600 UI'
WHERE cd_itunidade = 920;

UPDATE itunidade
SET ds_itunidade = 'FRASCO AMPOLA 2000 UTR'
WHERE cd_itunidade = 865;

UPDATE itunidade
--SET ds_itunidade = substr('ZZINATIVO ' || REPLACE(ds_itunidade, 'NAO_UTILIZAR_', ''), 0, 30)
SET ds_itunidade = substr('* ' || REPLACE(ds_itunidade, 'NAO_UTILIZAR_', ''), 0, 30)
WHERE cd_itunidade IN (
704, 708, 709, 710, 711, 712, 565, 592, 573, 572, 593, 587, 591, 605, 1047, 1062, 615, 913, 1005,
914, 911, 915, 726, 597, 907, 909, 855, 875, 768, 1068, 1043, 946, 976, 727, 1006, 966, 583, 569,
576, 584, 611, 663, 702, 656, 566, 1060, 595, 927, 950, 948, 949, 921, 1044, 1050, 1063, 619, 705,
706, 607, 613, 839, 1048, 995, 988, 641, 717, 901, 981, 984, 745, 743, 980, 744, 772, 902, 1037, 910);



-- Torna as modificações permanentes no banco de dados. Só faça isso se souber exatamente
-- o que está fazendo. Ou melhor, não faça isso de jeito nenhum!!
--COMMIT;