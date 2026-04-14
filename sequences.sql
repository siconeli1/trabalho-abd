-- SEQUENCES UTILIZADAS EM TABELAS DO BANCO

-- 1. CRIAÇÃO DAS SEQUENCES
-- gerar IDs manualmente para inserts em tabelas existentes do banco dvdrental

CREATE SEQUENCE seq_category_nova
START WITH 1000
INCREMENT BY 1;

CREATE SEQUENCE seq_language_nova
START WITH 1000
INCREMENT BY 1;



-- 2. INSERTS NA TABELA CATEGORY
-- utilizar a sequence criada em tabela existente do banco

INSERT INTO category (category_id, name)
VALUES (nextval('seq_category_nova'), 'Categoria Teste 1');

INSERT INTO category (category_id, name)
VALUES (nextval('seq_category_nova'), 'Categoria Teste 2');



-- 3. INSERTS NA TABELA LANGUAGE
-- utilizar a sequence criada em outra tabela existente do banco

INSERT INTO language (language_id, name)
VALUES (nextval('seq_language_nova'), 'L1');

INSERT INTO language (language_id, name)
VALUES (nextval('seq_language_nova'), 'L2');

--SELECT * FROM category WHERE category_id >= 1000;
--SELECT * FROM language  WHERE language_id >= 1000;
