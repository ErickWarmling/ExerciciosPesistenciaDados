CREATE TABLE Clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_nascimento DATE
);

INSERT INTO Clientes (nome, email, data_nascimento) VALUES
('João Silva', 'joao.silva@email.com', '1985-03-10'),
('Maria Oliveira', 'maria.oliveira@email.com', '1990-07-25'),
('Carlos Souza', 'carlos.souza@email.com', '1978-12-02'),
('Ana Santos', 'ana.santos@email.com', '2000-01-15');

CREATE TABLE Livros (
    livro_id SERIAL PRIMARY KEY,
    titulo VARCHAR(200),
    autor VARCHAR(100),
    ano_publicacao INTEGER,
    genero VARCHAR(50),
    quantidade_total INTEGER
);

INSERT INTO Livros (titulo, autor, ano_publicacao, genero, quantidade_total) VALUES
('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 'Fantasia', 5),
('1984', 'George Orwell', 1949, 'Distopia', 3),
('Dom Casmurro', 'Machado de Assis', 1899, 'Romance', 4),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 'Ficção', 2);

CREATE TABLE Emprestimos (
    emprestimo_id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES Clientes(cliente_id),
    livro_id INTEGER REFERENCES Livros(livro_id),
    data_emprestimo DATE,
    data_devolucao DATE
);

INSERT INTO Emprestimos (cliente_id, livro_id, data_emprestimo, data_devolucao) VALUES
(1, 1, '2024-08-01', '2024-08-15'),
(2, 2, '2024-08-05', '2024-08-12'),
(1, 3, '2024-08-10', NULL),
(3, 1, '2024-08-11', NULL),
(4, 4, '2024-08-15', '2024-08-25');

-- Acadêmico: Erick Augusto Warmling

-- Exercícios - Prova Persistência de Dados
-- Liste o nome dos clientes e os títulos dos livros que eles pegaram emprestado
SELECT Clientes.nome, Livros.titulo 
FROM Emprestimos
INNER JOIN Clientes ON Emprestimos.cliente_id = Clientes.cliente_id
INNER JOIN Livros ON Emprestimos.livro_id = Livros.livro_id
ORDER BY Clientes.nome;

-- Exibe os primeiros 3 caracteres do nome de cada cliente
SELECT Clientes.nome, SUBSTRING(Clientes.nome FROM 1 FOR 3) AS primeiras_letras
FROM Clientes;

-- Calcule a média de quantidade total de livros por gênero
SELECT Livros.genero, TRUNC(AVG(Livros.quantidade_total), 2) AS Media
FROM Livros
GROUP BY Livros.genero
ORDER BY Livros.genero;

-- Liste o nome dos clientes que pegaram emprestado livros com o livro_id maior que 2
SELECT Clientes.nome, Livros.livro_id, Livros.titulo
FROM Emprestimos
INNER JOIN Clientes ON Emprestimos.cliente_id = Clientes.cliente_id
INNER JOIN Livros ON Emprestimos.livro_id = Livros.livro_id
WHERE Livros.livro_id IN (SELECT livro_id FROM Livros WHERE livro_id > 2); 

-- Liste a quantidade de livros emprestados por título de livro
SELECT Livros.titulo, COUNT(Emprestimos.livro_id) AS quantidade_emprestimos
FROM Livros
INNER JOIN Emprestimos ON Livros.livro_id = Emprestimos.livro_id
GROUP BY Livros.titulo
ORDER BY Livros.titulo;
