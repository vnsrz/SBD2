-- -------- < aula1exer2Evolucao4 > --------
--
--                    SCRIPT DE POPULAR (DML)
--
-- Data Criacao ...........: 12/04/2024
-- Autor(es) ..............: Izabella Alves Pereira
--                           Vinicius Roriz Meireles Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 01 View
-- 
-- Ultimas Alteracoes
--
-- ---------------------------------------------------------

USE aula1exer2Evolucao4;

SELECT 
    VENDA.idVenda, 
    VENDA.data, 
    VENDA.totalVenda, 
    VENDA.matriculaEmpregado
FROM VENDA
JOIN EMPREGADO ON VENDA.matriculaEmpregado = EMPREGADO.matricula
WHERE EMPREGADO.matricula = 100000;

SELECT 
    VENDA.idVenda,
    VENDA.data, 
    VENDA.totalVenda, 
    VENDA.matriculaEmpregado,
    PRODUTO.idProduto,
    PRODUTO.nomeProduto,
    PRODUTO.preco AS preco_unidade,
    CONTEM.quantidadeProduto,
    (PRODUTO.preco * CONTEM.quantidadeProduto) AS preco_total_item
FROM VENDA
JOIN CONTEM ON VENDA.idVenda = CONTEM.idVenda
JOIN PRODUTO ON CONTEM.idProduto = PRODUTO.idProduto
WHERE VENDA.idVenda = 7;

SELECT 
    PESSOA.cpf,
    PESSOA.nome,
    EMPREGADO.matricula,
    EMPREGADO.cep,
    EMPREGADO.cidade,
    EMPREGADO.uf,
    EMPREGADO.numero,
    EMPREGADO.complemento
FROM PESSOA
JOIN EMPREGADO ON PESSOA.cpf = EMPREGADO.cpf
LEFT JOIN GERENTE ON PESSOA.cpf = GERENTE.cpf
WHERE GERENTE.cpf IS NULL
ORDER BY PESSOA.nome ASC;

CREATE VIEW QuantidadeProdutoVendido AS
SELECT 
    PRODUTO.idProduto,
    PRODUTO.nomeProduto,
    SUM(CONTEM.quantidadeProduto) AS quantidade_vendida
FROM PRODUTO
JOIN CONTEM ON PRODUTO.idProduto = CONTEM.idProduto
JOIN VENDA ON CONTEM.idVenda = VENDA.idVenda
GROUP BY PRODUTO.idProduto, PRODUTO.nomeProduto;

SELECT 
    PRODUTO.idProduto,
    PRODUTO.nomeProduto,
    COUNT(CONTEM.idVenda) AS quantidade_vendas
FROM PRODUTO
LEFT JOIN CONTEM ON PRODUTO.idProduto = CONTEM.idProduto
WHERE PRODUTO.nomeProduto LIKE '%la%'
GROUP BY PRODUTO.idProduto, PRODUTO.nomeProduto
ORDER BY PRODUTO.nomeProduto DESC;
