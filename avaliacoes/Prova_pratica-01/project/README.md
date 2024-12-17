#  Prova-Pratica-01 AB em 17-12-2024

### A atividade consiste em criar uma aplicação em Dart que utiliza um banco de dados SQLite de forma assíncrona. 
### A evidencia da realização da atividade será: Criação de uma pasta no repositório GitHub e registro de link do GitHub no Google Classroom.

### Especificação: 

1. Requisitos Funcionais

a) Criação do Banco de Dados: O sistema deve ser capaz de criar um banco de dados SQLite se ele não existir.

b) Criação de Tabela: Deve haver uma tabela TB_ALUNOS para persistir objetos de uma classe Alunos, com pelo menos os seguintes campos:
   - `id`: Identificador único (INTEGER, PRIMARY KEY).
   - `nome`: Nome do objeto (TEXT).
   - `idade`: Idade do objeto (INTEGER).

c) Inserção de Dados: O sistema deve permitir a inserção assíncrona de novos registros na tabela.

d) Consulta de Dados: Deve ser possível consultar todos os registros da tabela de forma assíncrona.

e) Atualização de Dados: O sistema deve permitir a atualização assíncrona dos registros existentes.

f) Exclusão de Dados: Deve ser possível excluir registros da tabela de forma assíncrona.