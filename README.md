# Trabalho - Administração de Banco de Dados

## Integrantes
- Lucas Siconeli VP3027171
- Vinicius Leandro Bruno VP3028321

## Descrição
Trabalho desenvolvido com o banco de dados de exemplo dvdrental do PostgreSQL, conforme orientações da disciplina.

## Arquivos
- `views.sql`: criação das views solicitadas
- `sequences.sql`: criação das sequences e inserts em tabelas do banco
- `testes.sql`: consultas para validação das views, sequences e dados inseridos

## Atividades realizadas
- Criação de uma view simples
- Criação de uma view com junção 1:N
- Criação de uma view com UNION
- Criação de uma view com quantidade de filmes alugados por cliente
- Criação de uma view com cliente e títulos dos filmes alugados
- Criação de duas sequences
- Utilização das sequences nas tabelas `category` e `language`
- Realização de dois inserts em cada tabela

## Observação
As views com LEFT JOIN foram desenvolvidas para contemplar clientes sem registros de aluguel. Entretanto, na base utilizada, todos os clientes possuem aluguéis registrados. Por esse motivo, os testes com quantidade igual a 0 e título nulo não retornaram linhas.
