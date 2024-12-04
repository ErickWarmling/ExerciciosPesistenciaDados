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

CREATE TABLE HistoricoProdutos (
	id SERIAL PRIMARY KEY,
	id_produto INT,
	nomeProduto VARCHAR (100), 
	descricao VARCHAR (200),
	preco DECIMAL (10, 2), 
	quantidade int,
	id_fornecedor INT,
	FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores (id_fornecedor)
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
('Magazine Luiza', 'contato@magalu.com', '(11)3333-4444', 'Avenida Paulista, 45, São Paulo'),
('Dell', 'contato@dell.com', '(21)5555-6666', 'Copacabana, 12, Rio de Janeiro'),
('Amazon', 'contato@amazon.com', '(48)7777-8888', 'Beira Mar Continental, 789, Florianópolis');

-- Exercício 1 - Log para Inserção de Produtos
CREATE OR REPLACE FUNCTION log_produto()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO HistoricoProdutos (id_produto, nomeProduto, descricao, preco, quantidade, id_fornecedor) VALUES
(NEW.id_produto, NEW.nomeProduto, NEW. descricao, NEW.Preco, NEW.quantidade, NEW.id_fornecedor); RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER produtos_trigger
AFTER INSERT ON Produtos
FOR EACH ROW EXECUTE FUNCTION log_produto();

INSERT INTO Produtos (nomeProduto, descricao, preco, quantidade, id_fornecedor) VALUES
('Smartphone Motorola', 'Smartphone com tela de 6.7" e câmera de 48MP', 2999.99, 50, 1),
('Laptop Inspiron', 'Laptop versátil para trabalho e lazer', 4999.90, 30, 2),
('Echo Dot', 'Assistente virtual com som de alta qualidade', 349.90, 100, 3),
('Smartwatch Pro', 'Relógio inteligente com monitoramento de saúde', 1299.90, 75, 1),
('Kindle Paperwhite', 'Leitor digital com iluminação embutida', 899.00, 40, 3);

SELECT * FROM HistoricoProdutos
SELECT * FROM Produtos

-- Exercício 2 - Atualizar saldo de estoque de Produtos
CREATE OR REPLACE FUNCTION atualizar_estoque_produto()
RETURNS TRIGGER AS $$
BEGIN
	UPDATE Produtos SET quantidade = quantidade - NEW.quantidadeProduto
	WHERE id_produto = NEW.id_produto;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualizar_estoque_produto_trigger
AFTER INSERT ON Vendas_Produtos
FOR EACH ROW EXECUTE FUNCTION atualizar_estoque_produto();

INSERT INTO Vendas (dataVenda, valorTotal, metodoPagamento, dataPagamento) VALUES
('2024-10-01', 3898.90, 'Cartão de Crédito', '2024-11-02'),
('2024-10-05', 9999.80, 'Boleto', '2024-11-06'),
('2024-10-10', 1399.60, 'Transferência', '2024-10-10'),
('2024-10-15', 3899.70, 'Cartão de Débito', '2024-10-15');

INSERT INTO Vendas_Produtos (id_produto, id_venda, quantidadeProduto) VALUES
(1, 1, 1), 
(5, 1, 1), 
(2, 2, 2), 
(3, 3, 4), 
(4, 4, 3);  

SELECT * FROM Produtos