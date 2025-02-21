-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Vinicius Roriz Meireles Silva
--                           Lucas Pimentel
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
--   04/04/2024 => Remove IF NOT EXISTS, adiciona ENGINE = InnoDB, remove underline dos nomes de atributo, inclui constraints
--   15/04/2024 => Adiciona constraints on delete e on update nas chaves estrangeiras
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2evolucao5;
USE aula1exer2evolucao5;

CREATE TABLE PESSOA (
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    senha INT NOT NULL,
    
    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;


CREATE TABLE GERENTE (
    cpf VARCHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL,
    formacao ENUM('analfabeto', 'primario', 'medio', 'superior', 'mestrado', 'doutorado') NOT NULL,
    
    CONSTRAINT GERENTE_PK PRIMARY KEY (cpf),
    CONSTRAINT GERENTE_PESSOA_FK FOREIGN KEY (cpf) 
        REFERENCES PESSOA (cpf)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE EMPREGADO (
    cpf VARCHAR(11) NOT NULL,
    matricula DECIMAL(10,0) NOT NULL,
    cep DECIMAL(8,0) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    uf VARCHAR(4) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(50),

    CONSTRAINT cpf_UK UNIQUE (cpf),
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula),
    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpf) 
        REFERENCES PESSOA (cpf)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT
) ENGINE = InnoDB;


CREATE TABLE TELEFONE (
    telefone BIGINT NOT NULL,
    matriculaEmpregado DECIMAL(10,0) NOT NULL,
    CONSTRAINT TELEFONE_PK PRIMARY KEY (matriculaEmpregado, telefone),
    CONSTRAINT TELEFONE_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) 
        REFERENCES EMPREGADO(matricula)
			ON DELETE CASCADE
			ON UPDATE CASCADE 
) ENGINE = InnoDB;


CREATE TABLE AREA (
    idArea INT AUTO_INCREMENT NOT NULL,
    nomeArea VARCHAR(20) NOT NULL,
    cpfGerente VARCHAR(11) NOT NULL,

    CONSTRAINT AREA_PK PRIMARY KEY (idArea),
    CONSTRAINT AREA_GERENTE_FK FOREIGN KEY (cpfGerente)
        REFERENCES GERENTE (cpf)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT,
    FOREIGN KEY (cpfGerente) 
		REFERENCES GERENTE(cpf)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PRODUTO (
    idProduto INT AUTO_INCREMENT NOT NULL,
    nomeProduto VARCHAR(15) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    idArea INT NOT NULL,

    CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto),
    CONSTRAINT PRODUTO_AREA_FK FOREIGN KEY (idArea)
        REFERENCES AREA (idArea)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE VENDA (
    idVenda INT AUTO_INCREMENT NOT NULL,
    data DATE NOT NULL,
    totalVenda DECIMAL(10,2) NOT NULL,
    matriculaEmpregado DECIMAL(10,0) NOT NULL,

    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) 
        REFERENCES EMPREGADO(matricula)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE CONTEM (
    quantidadeProduto INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    idVenda  INT NOT NULL,
    idProduto INT NOT NULL,

    CONSTRAINT CONTEM_PK PRIMARY KEY (idVenda , idproduto),
    CONSTRAINT CONTEM_VENDA_FK FOREIGN KEY (idVenda) 
        REFERENCES VENDA(idVenda)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT,
    CONSTRAINT CONTEM_PRODUTO_FK FOREIGN KEY (idProduto) 
        REFERENCES PRODUTO(idProduto)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT
) ENGINE = InnoDB;