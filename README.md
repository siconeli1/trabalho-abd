# Trabalho – Administração de Banco de Dados

## Integrantes
- Lucas Siconeli VP3027171
- Vinicius Leandro Bruno VP3028321

## Descrição
Trabalho desenvolvido utilizando o banco de dados de exemplo dvdrental do PostgreSQL, conforme orientações do professor.

## Estrutura
- views.sql: criação das views solicitadas
- sequences.sql: criação das sequences, tabelas auxiliares e inserts
- testes.sql: consultas para validação dos resultados

## Atividades realizadas
- Criação de view simples
- Criação de view com junção 1:N
- Criação de view com UNION
- Criação de view com contagem de filmes por cliente
- Criação de view com cliente e títulos dos filmes alugados
- Criação de duas sequences
- Criação de duas tabelas auxiliares
- Inserção de dados nas tabelas criadas

## Observação
As consultas foram desenvolvidas utilizando LEFT JOIN para contemplar clientes sem registros de aluguel. No entanto, na base dvdrental utilizada, todos os clientes possuem registros de aluguel, não sendo retornados valores 0 ou NULL nos testes.
