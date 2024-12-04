CREATE TABLE Fornecedores (
	id_fornecedor SERIAL PRIMARY KEY,
	nomeFornecedor VARCHAR (100) NOT NULL,
	email VARCHAR (100),
	telefone VARCHAR (14),
	endereco VARCHAR (200)
);

CREATE TABLE Produtos (
	id_produto SERIAL PRIMARY KEY,
	nomeProduto VARCHAR (100) NOT NULL,
	descricao VARCHAR (200),
	preco DECIMAL (10, 2) CHECK (preco > 0),
	quantidade int,
	id_fornecedor INT,
	FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

CREATE TABLE Vendas (
	id_venda SERIAL PRIMARY KEY,
	dataVenda date,
	valorTotal DECIMAL (10, 2),
	metodoPagamento VARCHAR (50),
	dataPagamento date
);

CREATE TABLE Vendas_Produtos (
	id_produto INT,
	FOREIGN KEY (id_produto) REFERENCES Produtos (id_produto),
	id_venda INT,
	FOREIGN KEY (id_venda) REFERENCES Vendas (id_venda),
	quantidadeProduto INT
);

INSERT INTO Fornecedores (nomeFornecedor, email, telefone, endereco) VALUES
('Distribuidora de Alimentos ABC', 'contato@distribuidoraabc.com', '(11)98765-4321', 'Av. das Indústrias, 1000, São Paulo, SP'),
('TecnoEquipamentos Ltda', 'vendas@tecnoequipamentos.com', '(21)91234-5678', 'Rua dos Maquinários, 200, Rio de Janeiro, RJ'),
('Fabrica de Bebidas XYZ', 'sac@fabricaXYZ.com', '(31)99876-5432', 'Praça Central, 50, Belo Horizonte, MG'),
('Produtos de Limpeza Ltda', 'atendimento@limpezaltda.com', '(41)99888-7777', 'Rua das Flores, 300, Curitiba, PR'),
('Mercearia do Bairro', 'contato@mercearia.com', '(51)99999-1111', 'Av. do Comércio, 45, Porto Alegre, RS');

INSERT INTO Produtos (nomeProduto, descricao, preco, quantidade, id_fornecedor) VALUES
('Arroz Tipo 1', 'Pacote de 5kg de arroz', 20.00, 150, 1),
('Feijão Carioca', 'Pacote de 1kg de feijão', 7.50, 80, 1),
('Óleo de Soja', 'Garrafa de 900ml', 5.90, 200, 2),
('Açúcar Cristal', 'Pacote de 5kg', 15.00, 60, 2),
('Cerveja Pilsen', 'Lata de 350ml', 3.00, 300, 3),
('Macarrão Espaguete', 'Pacote de 500g', 4.50, 120, 3),
('Sal Refinado', 'Pacote de 1kg', 2.00, 90, 4),
('Molho de Tomate', 'Garrafa de 340g', 6.00, 75, 4),
('Detergente Líquido', 'Frasco de 500ml', 2.50, 40, 5),
('Sabão em Pó', 'Pacote de 1kg', 10.00, 50, 5);

INSERT INTO Vendas (dataVenda, valorTotal, metodoPagamento, dataPagamento) VALUES
('01/09/2024', 130.00, 'Cartão de Crédito', '01/10/2024'),
('02/10/2024', 59.00, 'Dinheiro', '02/10/2024'),
('03/10/2024', 30.00, 'Transferência', '03/10/2024'),
('04/10/2024', 45.00, 'Cartão de Débito', '04/10/2024'),
('05/10/2024', 36.00, 'Pix', '05/10/2024'),
('05/10/2024', 50.00, 'Dinheiro', '05/10/2024');

INSERT INTO Vendas_Produtos (id_produto, id_venda, quantidadeProduto) VALUES
(1, 1, 5),  
(2, 1, 4),  
(3, 2, 10), 
(4, 3, 2), 
(5, 4, 15), 
(6, 5, 8),  
(7, 6, 10), 
(8, 6, 5);

-- Acadêmicos: Erick Augusto Warmling e Jéssica Aline Schulze

-- Exercício 1: Calcular a média do valor unitário de todos os produtos (AVG)
SELECT TRUNC(AVG(Produtos.preco), 2) AS media_valores
FROM Produtos;

-- Exercício 2: Exibir os três primeiros caracteres do nome de cada Fornecedor (SUBSTRING)
SELECT nomeFornecedor, SUBSTRING(nomeFornecedor FROM 1 FOR 3) AS primeiras_letras
FROM Fornecedores;

-- Exercício 3: Retornar o valor mínimo unitário dos Produtos (MIN)
SELECT MIN(Produtos.preco) AS preco_minimo
FROM Produtos;

-- Exercício 4: Retornar o valor máximo das Vendas (MAX)
SELECT MAX(valorTotal) AS valor_maximo 
FROM Vendas;

-- Exercício 5: Contar o número de vendas realizadas para cada produto (JOIN, COUNT, GROUP BY, ORDER BY)
SELECT Produtos.nomeProduto, COUNT (Vendas_Produtos.id_venda) AS quantidade_vendas
FROM Vendas_Produtos
INNER JOIN Produtos ON Vendas_Produtos.id_produto = Produtos.id_produto
GROUP BY (Produtos.nomeProduto)
ORDER BY Produtos.nomeProduto;

-- Exercício 6: Retorna todos os fornecedores, cujo o endereço possui "Rio de Janeiro" (SUBQUERY, LIKE)
SELECT nomeFornecedor
FROM Fornecedores
WHERE id_Fornecedor IN (SELECT id_Fornecedor FROM Fornecedores WHERE endereco ILIKE '%Rio de Janeiro%');

-- Exercício 7: Combinar nome dos Produtos com os nomes dos Fornecedores (UNION)
SELECT nomeProduto FROM Produtos
UNION 
SELECT nomeFornecedor FROM Fornecedores;

-- Exercício 8: Adicionar novo Produto (STORED PROCEDURES)
CREATE PROCEDURE add_Produto (nome VARCHAR, descricaoProduto VARCHAR, precoProduto DECIMAL, quant INT, idFornecedor INT)
AS $$
BEGIN
	IF quant > 0 THEN
		INSERT INTO Produtos(nomeProduto, descricao, preco, quantidade, id_fornecedor) VALUES (nome, DescricaoProduto, precoProduto, quant,idFornecedor);
	ELSE
		RAISE NOTICE 'Não foi possível adicionar o Produto. A quantidade deve ser maior que 0';
	END IF;
END;
$$ LANGUAGE plpgsql;

CALL add_Produto('Doritos', 'Salgadinho Doritos', 8.50, 15, 4);
SELECT * FROM Produtos;





