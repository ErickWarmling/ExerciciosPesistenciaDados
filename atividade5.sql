CREATE TABLE Estudantes (
    estudante_id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    turma_id INT
);

CREATE TABLE Turmas (
    turma_id SERIAL PRIMARY KEY,
    nome_turma VARCHAR(50),
    professor_id INT
);

CREATE TABLE Professores (
    professor_id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);
CREATE TABLE Notas (
    nota_id SERIAL PRIMARY KEY,
    estudante_id INT,
    disciplina VARCHAR(50),
    nota NUMERIC(5,2)
);

INSERT INTO Professores (nome)
VALUES 
('Carlos Silva'),
('Ana Souza'),
('Mariana Oliveira'),
('João Pereira');

INSERT INTO Turmas (nome_turma, professor_id)
VALUES 
('Turma A', 1),  -- Carlos Silva
('Turma B', 2),  -- Ana Souza
('Turma C', 3),  -- Mariana Oliveira
('Turma D', 4);  -- João Pereira

INSERT INTO Estudantes (nome, idade, turma_id)
VALUES 
('Maria José', 16, 1),  -- Turma A
('Pedro Costa', 17, 1),  -- Turma A
('Lucas Lima', 16, 2),  -- Turma B
('Julia Nunes', 17, 2),  -- Turma B
('Carla Dias', 16, 3),  -- Turma C
('Rafael Rocha', 17, 3),  -- Turma C
('Fernanda Alves', 16, 4),  -- Turma D
('Gabriel Gomes', 17, 4);  -- Turma D


INSERT INTO Notas (estudante_id, disciplina, nota)
VALUES 
-- Notas de Maria José
(1, 'Matemática', 85.00),
(1, 'Português', 78.00),
(1, 'História', 90.00),

-- Notas de Pedro Costa
(2, 'Matemática', 92.00),
(2, 'Português', 81.00),
(2, 'História', 70.00),

-- Notas de Lucas Lima
(3, 'Matemática', 60.00),
(3, 'Português', 55.00),
(3, 'História', 72.00),

-- Notas de Julia Nunes
(4, 'Matemática', 75.00),
(4, 'Português', 68.00),
(4, 'História', 80.00),

-- Notas de Carla Dias
(5, 'Matemática', 90.00),
(5, 'Português', 88.00),
(5, 'História', 85.00),

-- Notas de Rafael Rocha
(6, 'Matemática', 55.00),
(6, 'Português', 60.00),
(6, 'História', 62.00),

-- Notas de Fernanda Alves
(7, 'Matemática', 70.00),
(7, 'Português', 73.00),
(7, 'História', 78.00),

-- Notas de Gabriel Gomes
(8, 'Matemática', 85.00),
(8, 'Português', 80.00),
(8, 'História', 88.00);

-- 1. Criar um novo schema chamado "aula05"
CREATE SCHEMA "aula05";

-- 2. Listar Professores que ensinaram estudantes com notas abaixo de 60
SELECT p.nome FROM Professores p
JOIN Turmas t ON p.professor_id = t.professor_id
JOIN Estudantes ON t.turma_id = Estudantes.turma_id
WHERE Estudantes.estudante_id IN (SELECT estudante_id FROM Notas WHERE nota < 60);

-- 3. Contar o número de estudantes de cada turma
SELECT Turmas.nome_turma, COUNT(estudante_id) AS quantidade_Estudantes FROM Turmas
JOIN Estudantes ON Turmas.turma_id = Estudantes.turma_id
GROUP BY Turmas.nome_turma
ORDER BY Turmas.nome_turma;

-- 4. Listar estudantes com nota máxima em cada disciplina
SELECT Estudantes.nome, n.disciplina, n.nota FROM Notas n
JOIN Estudantes ON n.estudante_id = Estudantes.estudante_id
WHERE n.nota IN (SELECT MAX(nota) FROM Notas WHERE disciplina = n.disciplina);

-- 5. Encontrar a média de idade dos estudantes em cada turma com mais de 1 estudante
SELECT Turmas.nome_turma, trunc(AVG(Estudantes.idade), 2) AS media_Idade FROM Turmas
JOIN Estudantes ON Turmas.turma_id = Estudantes.turma_id
WHERE Turmas.turma_id IN (SELECT turma_id FROM Estudantes GROUP BY turma_id HAVING COUNT(estudante_id) > 1)
GROUP BY Turmas.nome_turma
ORDER BY Turmas.nome_turma;

-- 6. Encontrar professores que ensinaram estudantes com notas abaixo da média geral da escola
SELECT DISTINCT Professores.nome FROM Professores
JOIN Turmas ON professores.professor_id = Turmas.professor_id
JOIN Estudantes ON Turmas.turma_id = Estudantes.turma_id
JOIN Notas ON Estudantes.estudante_id = Notas.estudante_id
WHERE Notas.nota < (SELECT AVG(nota) FROM Notas);