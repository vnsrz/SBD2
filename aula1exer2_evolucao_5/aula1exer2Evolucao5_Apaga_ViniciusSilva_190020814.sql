-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE APAGAR (DDL)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Vinicius Roriz Meireles Silva
--                           Lucas Pimentel Quintão
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2evolucao5
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 03 Roles
--         => 08 Usuários
--         => 04 Consultas
--         => 01 View
-- 
-- Ultimas Alteracoes
--   04/04/2024 => Muda o nome da base de dados
--   15/04/2024 => Altera o nome da base de dados para aula1exer2evolucao4  
--   22/04/2024 => Apaga usuários, roles, e view
-- ---------------------------------------------------------

USE aula1exer2evolucao5;

DROP TABLE contem;
DROP TABLE telefone;
DROP TABLE VENDA;
DROP TABLE PRODUTO;
DROP TABLE AREA;
DROP TABLE EMPREGADO;
DROP TABLE GERENTE;
DROP TABLE PESSOA;

DROP ROLE empregado;
DROP ROLE gerente;
DROP ROLE superior;

DROP USER 'admins';
DROP USER 'anamaria';
DROP USER 'ruicarlos';
DROP USER 'maria';
DROP USER 'paulo';
DROP USER 'jose';
DROP USER 'giovana';
DROP USER 'pedro';

DROP VIEW VendasPorProduto;