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

-- Exercício 01: Calcule o total de vendas realizadas por cada funcionário.
SELECT IDFuncionario, count (*) AS QuantidadeVendas, SUM (ValorVenda) AS TotalVendas
FROM Vendas
Group By IDFuncionario; 

-- Exercício 02: Encontre o número de funcionários em cada departamento
SELECT Departamento, count (*) AS QuantidadeFuncionarios
FROM Funcionarios
Group By Departamento;

-- Exercício 03: Liste os funcionários que realizaram o maior número de vendas
SELECT IDFuncionario, count (*) AS QuantidadeVendas
FROM Vendas
Group By IDFuncionario
Order By QuantidadeVendas DESC LIMIT 1;

-- Exercício 04: Determine os departamentos com mais de 5 funcionários e liste o total de salários pagos
SELECT Departamento, SUM (Salario) AS SalarioTotalDepartamento
FROM Funcionarios
Group By Departamento
HAVING count(*) > 1;

-- Exercício 05: Encontre o total de vendas realizadas em 2023, utilizando uma transação
DO $$
DECLARE
	TotalVendas2023 NUMERIC;
BEGIN

SELECT SUM (ValorVenda) INTO TotalVendas2023
FROM Vendas
WHERE extract (year from DataVenda) = 2023;

IF TotalVendas2023 > 100000 THEN
	COMMIT;
ELSE
	ROLLBACK;
END IF;
END;
$$;