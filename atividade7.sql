--1. Exercício 1: Relatório de Produtos com Estoque Baixo
CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10, 2),
    estoque INTEGER
);

INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook', 2500.00, 5),
('Mouse', 50.00, 50),
('Teclado', 100.00, 10),
('Monitor', 800.00, 2),
('Cadeira Gamer', 700.00, 8);

--Exercício 2: Relatório de Vendas com Informações dos Clientes

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE vendas (
    id_venda SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES clientes(id_cliente),
    data_venda DATE,
    total_venda NUMERIC(10, 2)
);

INSERT INTO clientes (nome_cliente, email) VALUES
('Ana Silva', 'ana.silva@email.com'),
('João Sousa', 'joao.sousa@email.com'),
('Maria Lima', 'maria.lima@email.com');

INSERT INTO vendas (id_cliente, data_venda, total_venda) VALUES
(1, '2024-09-10', 1500.00),
(2, '2024-09-11', 250.00),
(3, '2024-09-12', 450.00);

--Exercício 3: Relatório de Funcionários e seus Departamentos

CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

CREATE TABLE funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario NUMERIC(10, 2),
    id_departamento INTEGER REFERENCES departamentos(id_departamento)
);

INSERT INTO departamentos (nome_departamento) VALUES
('TI'),
('Recursos Humanos'),
('Financeiro');

INSERT INTO funcionarios (nome_funcionario, salario, id_departamento) VALUES
('Carlos Silva', 5000.00, 1),
('Fernanda Souza', 3500.00, 2),
('Roberto Lima', 6000.00, 3);

--Exercício 4: Produtos com Preços Acima da Média

CREATE TABLE produtos_preco (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10, 2)
);

INSERT INTO produtos_preco (nome, preco) VALUES
('Smartphone', 1200.00),
('Tablet', 800.00),
('Smartwatch', 600.00),
('Fone de Ouvido', 150.00),
('Carregador', 100.00);

--Exercício 5: Relatório de Clientes e Valor Total das Compras

CREATE TABLE clientes_compras (
    id_cliente SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100)
);

CREATE TABLE compras (
    id_compra SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES clientes_compras(id_cliente),
    valor_compra NUMERIC(10, 2)
);

INSERT INTO clientes_compras (nome_cliente) VALUES
('Bruno Costa'),
('Sara Mendes'),
('Luiz Oliveira');

INSERT INTO compras (id_cliente, valor_compra) VALUES
(1, 300.00),
(1, 450.00),
(2, 600.00),
(3, 250.00);

-- 1. Crie um novo schema para aula07
CREATE SCHEMA aula07;

-- 3. Relatório de Produtos com Estoque Baixo: Criar uma view que mostre apenas os produtos cujo estoque está abaixo de 10 unidades
CREATE VIEW view_produtos AS
SELECT id_produto, nome, preco, estoque
FROM produtos
WHERE estoque < 10;

SELECT * FROM view_produtos

-- 4. Relatório de Vendas com Informações dos Clientes: Criar uma view que exiba os nomes dos clientes, a data da venda e o valor de suas compras.
CREATE VIEW view_vendas AS
SELECT clientes.nome_cliente, vendas.data_venda, vendas.total_venda
FROM clientes
JOIN vendas ON clientes.id_cliente = vendas.id_cliente;

SELECT * FROM view_vendas

-- 5. Relatório de Funcionários e seus Departamentos: Criar uma view que mostre o nome do funcionário, seu salário e o nome do departamento ao qual pertence.
CREATE VIEW view_empresa AS
SELECT funcionarios.nome_funcionario, funcionarios.salario, departamentos.nome_departamento
FROM departamentos
JOIN funcionarios ON departamentos.id_departamento = funcionarios.id_departamento;

SELECT * FROM view_empresa

-- 6. Produtos com Preços Acima da Média: Criar uma view que mostre os produtos cujo preço está acima da média de todos os produtos.
CREATE VIEW view_precos AS
SELECT produtos_preco.id_produto, produtos_preco.nome, produtos_preco.preco
FROM produtos_preco
WHERE preco >(SELECT AVG(preco) FROM produtos_preco);

SELECT * FROM view_precos

-- 7. Relatório de Clientes e Valor Total das Compras: Criar uma view que exiba o nome do cliente e o valor total de suas compras (somando todas as compras).
CREATE VIEW view_clientes AS
SELECT clientes_compras.id_cliente, clientes_compras.nome_cliente, SUM(compras.valor_compra) AS valor_total
FROM clientes_compras
JOIN compras ON clientes_compras.id_cliente = compras.id_cliente
GROUP BY clientes_compras.id_cliente

SELECT * FROM view_clientes