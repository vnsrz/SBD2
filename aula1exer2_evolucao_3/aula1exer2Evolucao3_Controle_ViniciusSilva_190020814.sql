-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Vinicius Roriz Meireles Silva                          
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

USE aula1exer2Evolucao3;

CREATE ROLE empregado, gerente, superior;

GRANT SELECT ON aula1exer2Evolucao3.* TO empregado;
GRANT INSERT ON aula1exer2Evolucao3.VENDA TO empregado;
GRANT INSERT ON aula1exer2Evolucao3.CONTEM TO empregado;
GRANT INSERT ON aula1exer2Evolucao3.PRODUTO TO empregado;

GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.AREA TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.VENDA TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.PRODUTO TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.CONTEM TO gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.TELEFONE TO gerente;

GRANT INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.PESSOA TO gerente;
GRANT INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.EMPREGADO TO gerente;
GRANT INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.GERENTE TO gerente;

GRANT ALL ON aula1exer2Evolucao3.* TO superior;

CREATE USER 'admins'@'localhost' IDENTIFIED BY '1admin';

CREATE USER 'anamaria'@'localhost' IDENTIFIED BY '2anam';
CREATE USER 'ruicarlos'@'localhost' IDENTIFIED BY '3ruic';

CREATE USER 'maria'@'localhost' IDENTIFIED BY '4maria';
CREATE USER 'paulo'@'localhost' IDENTIFIED BY '5paulo';
CREATE USER 'jose'@'localhost' IDENTIFIED BY '6jose';
CREATE USER 'giovana'@'localhost' IDENTIFIED BY '7giovana';
CREATE USER 'pedro'@'localhost' IDENTIFIED BY '8pedro';
