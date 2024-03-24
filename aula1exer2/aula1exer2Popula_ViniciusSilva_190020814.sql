-- -------- aula1exer2 --------
--
--          SCRIPT POPULA
--
-- Data Criacao ...........: 23/03/2024
-- Autor(es) ..............: Vinicius Roriz Meireles Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- Ultimas Alteracoes
--   23/03/2024 => Criacao do script
--
-- ---------------------------------------------------------

INSERT INTO PESSOA VALUES
    (00000000000, 'Ana', 'senha1'),
    (11111111111, 'Jorge', 'senha2'),
    (22222222222, 'Gustavo', 'senha3'),
    (33333333333, 'Claudio', 'senha4'),
    (44444444444, 'Felipe', 'senha5'),
    (55555555555, 'Mariana', 'senha6');

INSERT INTO EMPREGADO VALUES
    (1901111111, 11111111, 'Casa 1', 61932164675, 00000000000),
    (2001111111, 11111112, 'Casa 2', 61965785838, 11111111111),
    (2101111111, 11111113, 'Casa 3', 61935846892, 22222222222);

INSERT INTO GERENTE VALUES
    ('claudio@mail.com', 33333333333, 'Ensino medio'),
    ('felipe@mail.com', 44444444444, 'Ensino superior'),
    ('mariana@mail.com', 55555555555, 'Ensino superior');

INSERT INTO SETOR VALUES
    (1, 'claudio@mail.com'),
    (2, 'felipe@mail.com'),
    (3, 'mariana@mail.com');

INSERT INTO trabalha VALUES
    (3, 1901111111),
    (2, 2001111111),
    (1, 2101111111);

INSERT INTO PRODUTO VALUES
    (10, 150.00),
    (11, 80.50),
    (12, 55.05);

INSERT INTO VENDA VALUES
    (20, 1901111111, 150.00, '2020-06-10'),
    (21, 2001111111, 161.00, '2021-05-11'),
    (22, 2101111111, 55.05, '2022-03-12');

INSERT INTO contem VALUES
    (10, 20, 1),
    (11, 21, 2),
    (12, 22, 1);