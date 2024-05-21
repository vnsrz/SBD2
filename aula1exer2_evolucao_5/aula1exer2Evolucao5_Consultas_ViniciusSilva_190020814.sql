-- -------- < aula1exer2evolucao5 > --------
--
--                    SCRIPT DE CONSULTAS (DML)
--
-- Data Criacao ...........: 15/04/2024
-- Autor(es) ..............: Lucas Pimentel Quintão                          
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
-- 		15/04/2024 => Adiciona 5 consultas
-- 		22/04/2024 => Corrige as consultas
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula1exer2evolucao5;


-- CONSULTAS
-- A) Consultar todas as vendas feitas por um empregado específico
--    que será definido pelo usuário através da chave primária do 
--    empregado nessa pesquisa (usuário definirá um empregado
--    específico na consulta);
SELECT * 
FROM VENDA V 
JOIN EMPREGADO ON VENDA.matriculaEmpregado = EMPREGADO.matricula
WHERE EMPREGADO.matricula = 100000;


-- ==================================================
-- B) Relacionar todos os dados de uma venda específica com todas
--    as informações dos produtos comercializados por esta venda e
--    mostrar o preço total por item da venda (usuário definirá uma
--    venda específica na consulta);
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
    
    
-- ==================================================
-- C) Mostrar todos os empregados da empresa que NÃO sejam gerentes
--    em ordem alfabética crescente do nome do empregado;
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


-- =========== QUE COMANDO DML EH ESTE ABAIXO? ==============
-- D) Consultar e mostrar a quantidade de CADA produto que foi
--    vendido por esta empresa (lembrar que só o código do produto
--    NÃO identifica qual produto é para vários funcionários ou 
--    usuários finais da empresa, então reflita de quais atributos
--    deverão ser apresentados e em qual sequência (ordenação) para
--    atender o interesse do usuário final em suas atividades diárias
--    com melhor qualidade e eficiência). Esta consulta deverá ser
--    implementada como uma VIEW (visão em SQL);
CREATE VIEW VendasPorProduto AS
SELECT 
    PRODUTO.idProduto,
    PRODUTO.nomeProduto,
    SUM(CONTEM.quantidadeProduto) AS quantidade_vendida
FROM PRODUTO
JOIN CONTEM ON PRODUTO.idProduto = CONTEM.idProduto
JOIN VENDA ON CONTEM.idVenda = VENDA.idVenda
GROUP BY PRODUTO.idProduto, PRODUTO.nomeProduto;
    
-- Acionando a VIEW
SELECT *
  FROM vendasporproduto;


-- ==================================================
-- E) Solicitar ao usuário qualquer parte do nome de um produto
--    e apresentar seu código, nome e quantidade de vendas em 
--    ordem alfabética do nome do produto de forma decrescente.
SELECT 
    PRODUTO.idProduto,
    PRODUTO.nomeProduto,
    COUNT(CONTEM.idVenda) AS quantidade_vendas
FROM PRODUTO
LEFT JOIN CONTEM ON PRODUTO.idProduto = CONTEM.idProduto
WHERE PRODUTO.nomeProduto LIKE '%la%'
GROUP BY PRODUTO.idProduto, PRODUTO.nomeProduto
ORDER BY PRODUTO.nomeProduto DESC;
