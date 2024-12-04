CREATE TABLE Categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preço DECIMAL(10, 2) NOT NULL,
    id_categoria INTEGER REFERENCES Categorias(id_categoria)
);


CREATE TABLE Vendas (
    id_venda SERIAL PRIMARY KEY,
    data_venda DATE NOT NULL,
    id_produto INTEGER REFERENCES Produtos(id_produto),
    quantidade INTEGER NOT NULL
);

INSERT INTO Categorias (nome) VALUES
('Eletrônicos'),
('Roupas'),
('Alimentos');

INSERT INTO Produtos (nome, preço, id_categoria) VALUES
('Smartphone', 1999.99, 1),
('Camisa', 49.90, 2),
('Arroz', 4.50, 3),
('Notebook', 2999.99, 1),
('Calça', 79.90, 2);

INSERT INTO Vendas (data_venda, id_produto, quantidade) VALUES
('2024-08-01', 1, 2),
('2024-08-02', 3, 5),
('2024-08-03', 2, 3),
('2024-08-04', 4, 1),
('2024-08-05', 5, 2);

-- Exercício 1: Somas ou Multiplicações
-- Calcule o valor total das vendas para cada produto (quantidade vendida * preço)
SELECT Produtos.id_produto, Produtos.nome, SUM(Vendas.quantidade * Produtos.preço) AS valor_Total
FROM Produtos
INNER JOIN Vendas ON Produtos.id_produto = Vendas.id_produto
GROUP BY Produtos.id_produto;

-- Divisões ou Média
-- Calcule o preço médio dos produtos em cada categoria
SELECT Categorias.id_categoria, Categorias.nome, trunc(AVG(Produtos.preço), 2) AS preco_medio
FROM Produtos
INNER JOIN Categorias ON Produtos.id_categoria = Categorias.id_categoria
GROUP BY Categorias.id_categoria;

-- SUBSTRING
-- Extraia os primeiros 3 caracteres do nome dos produtos
SELECT nome, substring(nome FROM 1 for 3) AS Primeiras_Letras 
FROM Produtos;

-- GROUP BY
-- Conte o número de produtos em cada categoria
SELECT Categorias.nome, COUNT(Produtos.id_produto) AS total_produtos
FROM Produtos
INNER JOIN Categorias ON Produtos.id_categoria = Categorias.id_Categoria
GROUP BY Categorias.id_categoria;

-- UNION
-- Liste todos os produtos e categorias disponíveis
SELECT nome FROM Produtos
UNION
Select nome FROM Categorias;

-- TRIM e LTRIM
-- Remova espaços em branco dos nomes dos produtos e categorias
SELECT TRIM(nome) FROM Produtos;
SELECT TRIM(nome) FROM Categorias;

-- LIKE e ILIKE
-- Encontre produtos cujo nome comece com "C"
SELECT * FROM Produtos WHERE Nome LIKE 'C%';

-- Encontre produtos cujo nome contenha "Smart" (insensível a maiúsculas e minúsculas)
SELECT * FROM Produtos WHERE Nome ILIKE '%Smart%';

-- Adicionar Coluna
--Adicione uma coluna desconto (DECIMAL) à tabela Produtos e defina um valor padrão de 0
ALTER Table Produtos
ADD COLUMN Desconto decimal(5,2) default 0;