CREATE TABLE Funcionarios (
    IDFuncionario INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Departamento VARCHAR(50),
    Salario DECIMAL(10, 2)
);

CREATE TABLE Vendas (
    IDVenda INT PRIMARY KEY,
    IDFuncionario INT,
    ValorVenda DECIMAL(10, 2),
    DataVenda DATE,
    FOREIGN KEY (IDFuncionario) REFERENCES Funcionarios(IDFuncionario)
);

INSERT INTO Funcionarios (IDFuncionario, Nome, Sobrenome, Departamento, Salario) VALUES
(1, 'Carlos', 'Silva', 'Vendas', 3500.00),
(2, 'Ana', 'Souza', 'Marketing', 4200.00),
(3, 'Pedro', 'Almeida', 'TI', 5000.00),
(4, 'Mariana', 'Oliveira', 'Financeiro', 4600.00),
(5, 'João', 'Pereira', 'RH', 3800.00),
(6, 'Fernanda', 'Santos', 'Vendas', 3700.00),
(7, 'Roberto', 'Mendes', 'Marketing', 4000.00),
(8, 'Julia', 'Gomes', 'TI', 4800.00),
(9, 'Ricardo', 'Fernandes', 'Financeiro', 4400.00),
(10, 'Beatriz', 'Ramos', 'RH', 3900.00);

INSERT INTO Vendas (IDVenda, IDFuncionario, ValorVenda, DataVenda) VALUES
(1, 1, 1500.00, '2023-01-15'),
(2, 1, 2000.00, '2023-02-20'),
(3, 2, 1800.00, '2023-01-25'),
(4, 2, 2200.00, '2023-03-10'),
(5, 6, 2500.00, '2023-02-05'),
(6, 6, 1900.00, '2023-03-15'),
(7, 3, 3000.00, '2023-01-18'),
(8, 3, 3100.00, '2023-02-22'),
(9, 4, 1200.00, '2023-01-10'),
(10, 4, 1300.00, '2023-03-20'),
(11, 4, 2300.00, '2023-03-19');

-- Exercício 1: Encontrando o Salário Máximo, Mínimo e Média por Departamento

-- Encontre o salário máximo, mínimo e a média salarial em cada departamento
SELECT Departamento, MAX(Salario) AS SalarioMaximo, MIN(Salario) AS SalarioMinimo, trunc(AVG(Salario), 2) AS MediaSalarial
FROM Funcionarios
GROUP BY Departamento;

-- Encontre o salário máximo, mínimo e médio de toda a empresa
SELECT MAX(Salario) AS SalarioMaximo, MIN(Salario) AS SalarioMinimo, trunc(AVG(Salario), 2) AS MediaSalarial
FROM Funcionarios;

-- Exercício 2: União de Consultas com UNION

-- Liste todos os nomes e sobrenomes dos funcionários dos departamentos de 'Vendas' e 'Marketing'.
SELECT Departamento,Nome, Sobrenome FROM Funcionarios WHERE departamento='Vendas'
UNION
SELECT Departamento, Nome, Sobrenome FROM Funcionarios WHERE departamento='Marketing';

-- Liste todos os nomes e sobrenomes dos funcionários que trabalham em 'TI' ou 'Financeiro'
SELECT Departamento, Nome, Sobrenome FROM Funcionarios WHERE departamento='TI'
UNION 
SELECT Departamento, Nome, Sobrenome FROM Funcionarios WHERE departamento='Financeiro';

-- Exercício 3: Trabalhando com SUBSTRING

-- Extraia as três primeiras letras do nome de cada funcionário
SELECT Nome, substring(Nome FROM 1 for 3) AS PrimeirasLetras FROM Funcionarios;

-- Exercício 4: Pesquisa de Padrões com LIKE e ILIKE

-- Encontre todos os funcionários cujo sobrenome começa com a letra 'S'
SELECT * FROM funcionarios WHERE Sobrenome LIKE 'S%';

-- Encontre todos os funcionários cujo sobrenome termina com 'a' (insensível a maiúsculas)
SELECT * FROM Funcionarios WHERE Sobrenome ILIKE '%a';

-- Exercício 5: Substituição de Texto com REPLACE

-- Faça um SELECT e substitua todas as ocorrências de 'a' por 'x' nos nomes dos funcionários
SELECT Nome, REPLACE (Nome,'a','x') AS NomeAlterado FROM Funcionarios;

-- Faça um SELECT e substitua o termo 'Vendas' por 'Comercial' em todos os registros da coluna Departamento
SELECT Departamento, REPLACE (Departamento,'Vendas','Comercial') AS DepartamentoAlterado FROM Funcionarios;