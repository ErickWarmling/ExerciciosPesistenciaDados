CREATE TABLE Clientes (
	id_cliente serial primary key,
	nome varchar (250) NOT NULL,
	email varchar (150),
	endereco varchar (200),
	data_nascimento date
);

CREATE TABLE Produtos (
	id_produto serial primary key,
	nome varchar (250) NOT NULL,
	descricao text,
	preco decimal (10,2) CHECK (preco >= 0),
	tamanho decimal (5, 2),
	quantidade int
);

CREATE TABLE Pedidos (
	id_pedido serial primary key,
	data_pedido date,
	valorTotal decimal (10, 2),
	metodo_pagamento varchar (50),
	data_pagamento date,
	id_cliente int,
	foreign key (id_cliente) references Clientes (id_cliente)
);

CREATE TABLE Pedido_Produto (
	id_pedido int,
	foreign key (id_pedido) references Pedidos (id_pedido),
	id_produto int,
	foreign key (id_produto) references Produtos (id_produto),
	quantidade_produto int
);

-- Inserção dos Dados Clientes
INSERT INTO Clientes (id_cliente, nome, email, endereco, data_nascimento) values (1, 'Erick', 'warmling.erick@gmail.com', 'Urubici', '03/03/2005');
INSERT INTO Clientes (id_cliente, nome, email, endereco, data_nascimento) values (2, 'Edina', 'edina@gmail.com', 'Florianópolis', '03/11/1972');
INSERT INTO Clientes (id_cliente, nome, email, endereco, data_nascimento) values (3, 'Edilcio', 'edilcio@gmail.com', 'Lages', '18/04/1968');
INSERT INTO Clientes (id_cliente, nome, email, endereco, data_nascimento) values (4, 'Natália', 'natalia@gmail.com', 'Blumenau', '14/08/1996');

-- Inserção dos Dados Produtos
INSERT INTO Produtos (id_produto, nome, descricao, preco, tamanho, quantidade) values (1, 'iPhone 15 Pro Max', 'iPhone 15 Pro Max. Forjado em titânio e com o incomparável chip A17 Pro, botão de Ação configurável e o sistema de câmera mais poderoso em um iPhone.', '9899', '6.7', 5);
INSERT INTO Produtos (id_produto, nome, descricao, preco, tamanho, quantidade) values (2, 'Geladeira Brastemp', 'A Geladeira Brastemp Frost Free Duplex BRM44 375 litros conta com design sofisticado e grande capacidade para armazenar os alimentos. Vem com Painel Eletrônico, compartimento Latas e Long Necks e compartimento Extrafrio.', '2959', '375', 5);
INSERT INTO Produtos (id_produto, nome, descricao, preco, tamanho, quantidade) values (3, 'Smart TV Samsung', 'Smart TV Samsunng, 55 Polegadas, 4K, Streaming gratuito com mais de 95 canais, Controle sem pilhas com comando de voz', '2259', '55', 1);
INSERT INTO Produtos (id_produto, nome, descricao, preco, tamanho, quantidade) values (4, 'Air Fryer Mondial', 'A Air Fryer Mondial pode levar praticidade e alimentação saudável para a sua rotina diária. E, com o cesto com capacidade de 5 litros, você pode compartilhar esses benefícios com toda a sua família! A Tecnologia de Circulação de Ar Quente cozinha, frita (a ar), assa ou tosta os alimentos sem precisar adicionar óleo ou manteiga. Aliada à alta potência, a tecnologia da Fritadeira a Ar também possibilita rapidez nos preparos.', '395.90', '5', 10);
INSERT INTO Produtos (id_produto, nome, descricao, preco, tamanho, quantidade) values (5, 'Secador de Cabelo Cadence', 'Secador Cadence Rouge Style 220V - SEC560', '99.90', '220', 0);

-- Inserção dos Dados Pedidos
INSERT INTO Pedidos (id_pedido, data_pedido, valorTotal, metodo_pagamento, data_pagamento, id_cliente) values (1, '05/09/2024', '9899', 'Cartão de Crédito', '18/10/2024', 1);
INSERT INTO Pedidos (id_pedido, data_pedido, valorTotal, metodo_pagamento, data_pagamento, id_cliente) values (2, '25/04/2024', '2654.90', 'Débito', '03/05/2024', 2);
INSERT INTO Pedidos (id_pedido, data_pedido, valorTotal, metodo_pagamento, data_pagamento, id_cliente) values (3, '16/09/2024', '2959', 'Cartão de Crédito', '26/10/2024', 3);

-- Vincular Pedidos a Produtos
INSERT INTO Pedido_Produto (id_pedido, id_produto, quantidade_produto) values (1, 1, 1);
INSERT INTO Pedido_Produto (id_pedido, id_produto, quantidade_produto) values (2, 3, 1);
INSERT INTO Pedido_Produto (id_pedido, id_produto, quantidade_produto) values (2, 4, 1);
INSERT INTO Pedido_Produto (id_pedido, id_produto, quantidade_produto) values (3, 2, 1);

-- Exercícios
-- Quais produtos estão fora do estoque?
SELECT nome
FROM Produtos
WHERE quantidade = 0;

-- Qual o valor total de vendas em um determinado mês?
SELECT SUM(valorTotal) AS totalVendas
FROM Pedidos
WHERE data_pedido >= '2024-09-01' AND data_pedido <= '2024-09-30';

-- Quais clientes ainda não fizeram pedidos?
SELECT Nome 
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id_cliente = Pedidos.id_cliente
WHERE Pedidos.id_cliente IS NULL;

-- Identificar os clientes que gastaram mais de R$ 500 no total, no qual os pedidos têm valores superiores à média dos valores totais dos pedidos.
SELECT Clientes.id_cliente, Clientes.nome AS nome_Cliente, COUNT (Pedidos.id_pedido) AS total_Pedidos, SUM(Pedidos.valorTotal) AS valor_Total
FROM Clientes
JOIN Pedidos ON Clientes.id_cliente = Pedidos.id_cliente
WHERE Pedidos.valorTotal > (SELECT AVG(valorTotal) FROM Pedidos)
GROUP BY Clientes.id_cliente, Clientes.nome
HAVING SUM(Pedidos.valorTotal) > 500;