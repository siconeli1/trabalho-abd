-- TESTES DO TRABALHO

-- -------------------------------------------
-- 1. VERIFICAÇÃO DA BASE
-- -------------------------------------------
SELECT COUNT(*) FROM customer;


-- -------------------------------------------
-- 2. TESTE DAS VIEWS
-- -------------------------------------------
SELECT * FROM vw_clientes LIMIT 5;
SELECT * FROM vw_cidade_pais LIMIT 5;
SELECT * FROM vw_nomes_customer_staff LIMIT 5;

SELECT * 
FROM vw_qtd_filmes_por_cliente
ORDER BY quantidade_filmes DESC
LIMIT 5;

SELECT * 
FROM vw_cliente_filmes_alugados
LIMIT 5;


-- -------------------------------------------
-- 3. TESTE DAS SEQUENCES EM TABELAS DO BANCO
-- -------------------------------------------
SELECT *
FROM category
WHERE category_id >= 1000
ORDER BY category_id;

SELECT *
FROM language
WHERE language_id >= 1000
ORDER BY language_id;


-- -------------------------------------------
-- 4. TESTES ADICIONAIS
-- Objetivo: verificar se existem clientes sem aluguel
-- ou títulos nulos na base utilizada
-- -------------------------------------------
SELECT *
FROM vw_qtd_filmes_por_cliente
WHERE quantidade_filmes = 0;

SELECT *
FROM vw_cliente_filmes_alugados
WHERE title IS NULL;

SELECT MIN(quantidade_filmes)
FROM vw_qtd_filmes_por_cliente;
