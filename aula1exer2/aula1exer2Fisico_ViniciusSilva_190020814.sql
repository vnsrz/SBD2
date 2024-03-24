-- -------- aula1exer2 --------
--
--          SCRIPT DE CRIACAO
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

CREATE DATABASE IF NOT EXISTS aula1exer2;
USE aula1exer2;

CREATE TABLE PESSOA (
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
);

CREATE TABLE EMPREGADO (
    matriculaEmpregado DECIMAL(10) NOT NULL,
    cep DECIMAL(8) NOT NULL,
    complemento VARCHAR(50) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matriculaEmpregado),
    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpf) 
        REFERENCES PESSOA (cpf) 
        ON DELETE CASCADE
);

CREATE TABLE GERENTE (
    emailGerente VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    formacao VARCHAR(50) NOT NULL,
    CONSTRAINT GERENTE_PK PRIMARY KEY (emailGerente),
    CONSTRAINT GERENTE_PESSOA_FK FOREIGN KEY (cpf) 
        REFERENCES PESSOA (cpf) 
        ON DELETE CASCADE
);

CREATE TABLE SETOR (
    idSetor DECIMAL(10) NOT NULL,
    emailGerente VARCHAR(50) NOT NULL,
    CONSTRAINT SETOR_PK PRIMARY KEY (idSetor),
    CONSTRAINT SETOR_GERENTE_FK FOREIGN KEY (emailGerente) 
        REFERENCES GERENTE (emailGerente)
);

CREATE TABLE trabalha (
    idSetor DECIMAL(10) NOT NULL,
    matriculaEmpregado DECIMAL(10) NOT NULL,
    CONSTRAINT TRABALHA_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) 
        REFERENCES EMPREGADO (matriculaEmpregado),
    CONSTRAINT TRABALHA_SETOR_FK FOREIGN KEY (idSetor) 
        REFERENCES SETOR (idSetor),
    CONSTRAINT trabalha_UK UNIQUE KEY (idSetor, matriculaEmpregado)
);

CREATE TABLE PRODUTO (
    codigoProduto DECIMAL(10) NOT NULL,
    precoProduto DECIMAL(10,2) NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (codigoProduto)
);

CREATE TABLE VENDA (
    idVenda DECIMAL(10) NOT NULL,
    matriculaEmpregado DECIMAL(10) NOT NULL,
    precoTotal DECIMAL(10,2) NOT NULL,
    dataVenda DATE NOT NULL,
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) 
        REFERENCES EMPREGADO (matriculaEmpregado)
);

CREATE TABLE contem (
    codigoProduto DECIMAL(10) NOT NULL,
    idVenda DECIMAL(10) NOT NULL,
    qtdProduto DECIMAL(10) NOT NULL,
    CONSTRAINT contem_PRODUTO_FK FOREIGN KEY (codigoProduto) 
        REFERENCES PRODUTO (codigoProduto) 
        ON DELETE CASCADE,
    CONSTRAINT contem_VENDA_FK FOREIGN KEY (idVenda) 
        REFERENCES VENDA (idVenda) 
        ON DELETE CASCADE,
    CONSTRAINT contem_UK UNIQUE KEY(idVenda, codigoProduto)
);

