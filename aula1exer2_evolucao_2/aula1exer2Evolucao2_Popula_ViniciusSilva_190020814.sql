-- -------- < aula1exer2Evolucao2 > --------
--
--                    SCRIPT DE POPULAR (DML)
--
-- Data Criacao ...........: 24/03/2024
-- Autor(es) ..............: Raquel Temóteo Eucaria Pereira da Costa, Vinicius Roriz Meireles Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas

-- 
-- Ultimas Alteracoes
--   24/03/2024 => Criação dos scripts
--   31/03/2024 => Adição de mais tuplas           
--
-- ---------------------------------------------------------

USE aula1exer2Evolucao2;

INSERT INTO GERENTE (cpf, nome, senha, email, formacao) 
VALUES 
(12345678900, 'João Silva', 'senha123', 'joao@email.com', 'Superior'),
(23456789012, 'Maria Oliveira', 'senha456', 'maria@email.com', 'Médio'),
(34567890123, 'Julia Costa', 'senha789', 'julia@email.com', 'Superior'),
(45678910111, 'Murilo', 'senha111', 'murilo@email.com', 'Superior'),
(56789101112, 'Fernando', 'senha222', 'fernando@email.com', 'Superior'),
(67891011121, 'Geovana', 'senha333', 'geovana@email.com', 'Superior');

-- Inserções para a tabela AREA
INSERT INTO AREA (dsArea, gerente) 
VALUES 
('Saúde', 34567890123),
('Eletrônicos', 12345678900),
('Móveis', 23456789012),
('Roupas', 45678910111),
('Alimentos', 56789101112),
('Papelaria', 67891011121);

-- Inserções para a tabela EMPREGADO
INSERT INTO EMPREGADO (cpf, nome, senha, cep, estado, cidade, numero, complemento) 
VALUES 
(98765432100, 'Ana Santos', 'senha111', 1234567, 'SP', 'São Paulo', 123, NULL),
(65432100987, 'Maria', 'senha000', 0123456, 'SP', 'Guarulhos', 956, NULL),
(32100987654, 'Deoclecio', 'senha444', 9203810, 'GO', 'Anápolis', 574, NULL),
(43219876500, 'Wesley', 'senha555', 7583675, 'SC', 'Curitiba', 672, NULL),
(87654321098, 'Carlos Ferreira', 'senha222', 2345678, 'RJ', 'Rio de Janeiro', 456, 'Ap 101'),
(76543210987, 'Pedro', 'senha333', 3456789, 'MG', 'Belo Horizonte', 789, 'Casa 2');

-- Inserções para a tabela PRODUTO
INSERT INTO PRODUTO (dsProduto, preco, area) 
VALUES 
('Monitor', 1400.00, 2),
('Cadeira Gamer', 700.90, 3),
('Suplemento x', 20.00, 1),
('Camiseta', 70.00, 4),
('Arroz', 17.99, 5),
('Grampo', 10.90, 6);

-- Inserções para a tabela VENDA
INSERT INTO VENDA (data, vendedor) 
VALUES 
('2024-03-24 10:00:00', 98765432100),
('2024-03-25 11:00:00', 87654321098),
('2024-03-26 12:00:00', 76543210987),
('2024-03-26 13:00:00', 32100987654),
('2024-03-26 14:00:00', 43219876500),
('2024-03-26 15:00:00', 65432100987);

-- Inserções para a tabela telefone
INSERT INTO telefone (cpfEmpregado, telefone) 
VALUES 
(98765432100, 5576943210022),
(87654321098, 5565932109822),
(32100987654, 5565998223210),
(43219876500, 5569822593210),
(32100987654, 5509822659321),
(76543210987, 5554921098722);

-- Inserções para a tabela contem
INSERT INTO contem (idVenda, idProduto, quantidade) 
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1);

-- Inserções para a tabela habilitado
INSERT INTO habilitado (cpfEmpregado, idArea) 
VALUES 
(98765432100, 1),
(87654321098, 2),
(32100987654, 4),
(43219876500, 5),
(65432100987, 6),
(76543210987, 3);
