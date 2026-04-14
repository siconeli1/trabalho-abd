-- 1. VIEW SIMPLES
-- listar dados básicos dos clientes
CREATE OR REPLACE VIEW vw_clientes AS
SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customer;



-- 2. VIEW COM RELACIONAMENTO 1:N
-- relacionar cidades com seus países
-- city (N) -> country (1)

CREATE OR REPLACE VIEW vw_cidade_pais AS
SELECT
    c.city_id,
    c.city,
    p.country
FROM city c
JOIN country p
    ON c.country_id = p.country_id;



-- 3. VIEW COM UNION
-- unir nomes de clientes e funcionários

CREATE OR REPLACE VIEW vw_nomes_customer_staff AS
SELECT
    first_name || ' ' || last_name AS nome
FROM customer
UNION
SELECT
    first_name || ' ' || last_name AS nome
FROM staff;



-- 4. VIEW COM AGRUPAMENTO
-- mostrar a quantidade de filmes alugados por cada cliente

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


-- 5. VIEW COM MÚLTIPLOS JOINs
-- listar clientes e títulos dos filmes alugados
--customer -> rental -> inventory -> film

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


--\c dvdrental
--SELECT * FROM vw_clientes LIMIT 5;
--SELECT * FROM vw_cidade_pais LIMIT 5;
--SELECT * FROM vw_nomes_customer_staff LIMIT 5;
--SELECT * FROM vw_qtd_filmes_por_cliente ORDER BY quantidade_filmes DESC LIMIT 5;
--SELECT * FROM vw_cliente_filmes_alugados LIMIT 5;

--INSERT TESTE

INSERT INTO customer
    (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, active)
VALUES
    (600, 1, 'Joao', 'Sem Aluguel', 'joao@teste.com', 1, TRUE, CURRENT_DATE, 1);

INSERT INTO customer
    (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, active)
VALUES
    (601, 1, 'Maria', 'Sem Aluguel', 'maria@teste.com', 1, TRUE, CURRENT_DATE, 1);

--SELECT NULOS 
--TESTE VIEW 4
SELECT * FROM vw_qtd_filmes_por_cliente
WHERE customer_id IN (600, 601);

--TESTA VIEW 5
SELECT * FROM vw_cliente_filmes_alugados
WHERE customer_id IN (600, 601);
