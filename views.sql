-- -------------------------------------------
-- 1. VIEW SIMPLES
-- Objetivo: listar dados básicos dos clientes
-- -------------------------------------------
CREATE OR REPLACE VIEW vw_clientes AS
SELECT 
    customer_id,
    first_name,
    last_name,
    email
FROM customer;



-- -------------------------------------------
-- 2. VIEW COM RELACIONAMENTO 1:N
-- Objetivo: relacionar cidades com seus países
-- Tabelas: city (N) -> country (1)
-- -------------------------------------------
CREATE OR REPLACE VIEW vw_cidade_pais AS
SELECT 
    c.city_id,
    c.city,
    p.country
FROM city c
JOIN country p 
    ON c.country_id = p.country_id;



-- -------------------------------------------
-- 3. VIEW COM UNION
-- Objetivo: unir nomes de clientes e funcionários
-- -------------------------------------------
CREATE OR REPLACE VIEW vw_nomes_customer_staff AS
SELECT 
    first_name,
    last_name
FROM customer

UNION

SELECT 
    first_name,
    last_name
FROM staff;



-- -------------------------------------------
-- 4. VIEW COM AGRUPAMENTO (GROUP BY)
-- Objetivo: quantidade de filmes alugados por cliente
-- Observação: uso de LEFT JOIN para incluir clientes sem aluguel
-- -------------------------------------------
CREATE OR REPLACE VIEW vw_qtd_filmes_por_cliente AS
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nome_cliente,
    COUNT(r.rental_id) AS quantidade_filmes
FROM customer c
LEFT JOIN rental r 
    ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name;



-- -------------------------------------------
-- 5. VIEW COM MÚLTIPLOS JOINs
-- Objetivo: listar clientes e títulos dos filmes alugados
-- Cadeia: customer -> rental -> inventory -> film
-- Observação: LEFT JOIN permite retornar NULL caso não haja aluguel
-- -------------------------------------------
CREATE OR REPLACE VIEW vw_cliente_filmes_alugados AS
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nome_cliente,
    f.title
FROM customer c
LEFT JOIN rental r 
    ON c.customer_id = r.customer_id
LEFT JOIN inventory i 
    ON r.inventory_id = i.inventory_id
LEFT JOIN film f 
    ON i.film_id = f.film_id;
