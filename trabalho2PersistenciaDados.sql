CREATE TABLE Funcionario (
	id_funcionario SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	cpf VARCHAR (11) NOT NULL,
	email VARCHAR (100),
	telefone VARCHAR (14),
	endereco VARCHAR (200),
	dataNascimento DATE,
	dataAdmissao DATE,
	departamento VARCHAR (50)
);

CREATE TABLE Salario (
	id_salario SERIAL PRIMARY KEY,
	id_funcionario INT,
	salarioTotal DECIMAL (10, 2),
	bonus DECIMAL (10, 2),
	descontos DECIMAL (10, 2),
	FOREIGN KEY (id_funcionario) REFERENCES Funcionario (id_funcionario)
);

CREATE TABLE ControlePonto (
	id_ponto SERIAL PRIMARY KEY,
	id_funcionario INT,
	dataDia DATE,
	horaEntrada TIME,
	horaSaida TIME,
	horasTrabalhadas TIME,
	FOREIGN KEY (id_Funcionario) REFERENCES Funcionario (id_Funcionario)
);

-- Inserção Funcionários
INSERT INTO Funcionario (nome, cpf, email, telefone, endereco, dataNascimento, dataAdmissao, departamento) VALUES
('Ana Souza', '12345678901', 'ana.souza@email.com', '(49)99821-0331', 'Rua A, 100, São Paulo, SP', '1985-06-12', '2020-01-15', 'Financeiro'),
('Carlos Pereira', '23456789012', 'carlos.pereira@email.com', '(49)99821-0442', 'Rua B, 150, Curitiba, PR', '1990-11-22', '2021-03-10', 'TI'),
('Mariana Costa', '34567890123', 'mariana.costa@email.com', '(49)99821-0553', 'Rua C, 200, Belo Horizonte, MG', '1992-07-30', '2019-04-25', 'Marketing'),
('Paulo Silva', '45678901234', 'paulo.silva@email.com', '(49)99821-0664', 'Rua D, 250, Porto Alegre, RS', '1983-02-15', '2018-06-18', 'Vendas'),
('Juliana Almeida', '56789012345', 'juliana.almeida@email.com', '(49)99821-0775', 'Rua E, 300, Salvador, BA', '1994-09-04', '2020-11-09', 'Recursos Humanos'),
('Roberto Santos', '67890123456', 'roberto.santos@email.com', '(49)99821-0886', 'Rua F, 350, Recife, PE', '1987-05-22', '2021-05-20', 'TI'),
('Fernanda Lima', '78901234567', 'fernanda.lima@email.com', '(49)99821-0997', 'Rua G, 400, Fortaleza, CE', '1991-03-19', '2019-08-13', 'Financeiro'),
('Luciano Oliveira', '89012345678', 'luciano.oliveira@email.com', '(49)99821-1108', 'Rua H, 450, Campinas, SP', '1989-12-10', '2021-07-30', 'Vendas'),
('Camila Rocha', '90123456789', 'camila.rocha@email.com', '(49)99821-1219', 'Rua I, 500, Goiânia, GO', '1993-01-08', '2020-02-25', 'Recursos Humanos'),
('Felipe Martins', '01234567890', 'felipe.martins@email.com', '(49)99821-1330', 'Rua J, 550, Manaus, AM', '1986-04-17', '2022-04-01', 'Marketing'),
('Bruna Souza', '21345678901', 'bruna.souza@email.com', '(49)99821-1441', 'Rua K, 600, Belém, PA', '1995-06-14', '2021-01-05', 'TI'),
('Ricardo Silva', '32456789012', 'ricardo.silva@email.com', '(49)99821-1552', 'Rua L, 650, Vitória, ES', '1982-11-03', '2017-02-10', 'Financeiro'),
('Luciana Rocha', '43567890123', 'luciana.rocha@email.com', '(49)99821-1663', 'Rua M, 700, Florianópolis, SC', '1990-12-22', '2022-07-12', 'Vendas'),
('José Santos', '54678901234', 'jose.santos@email.com', '(49)99821-1774', 'Rua N, 750, Campo Grande, MS', '1984-01-27', '2020-09-16', 'Recursos Humanos'),
('Marcio Almeida', '65789012345', 'marcio.almeida@email.com', '(49)99821-1885', 'Rua O, 800, Curitiba, PR', '1988-08-10', '2021-11-01', 'TI'),
('Claudia Costa', '76890123456', 'claudia.costa@email.com', '(49)99821-1996', 'Rua P, 850, Natal, RN', '1992-05-18', '2019-02-13', 'Marketing'),
('Sergio Lima', '87901234567', 'sergio.lima@email.com', '(49)99821-2007', 'Rua Q, 900, João Pessoa, PB', '1993-04-04', '2020-06-11', 'Financeiro'),
('Tatiane Pereira', '98012345678', 'tatiane.pereira@email.com', '(49)99821-2118', 'Rua R, 950, São Luís, MA', '1987-12-30', '2021-10-25', 'Vendas'),
('Rodrigo Rocha', '09123456789', 'rodrigo.rocha@email.com', '(49)99821-2229', 'Rua S, 1000, Teresina, PI', '1985-10-12', '2022-03-05', 'Recursos Humanos'),
('Eduardo Martins', '67890123456', 'eduardo.martins@email.com', '(49)99821-2330', 'Rua T, 1050, São Paulo, SP', '1990-05-14', '2022-10-20', 'Vendas');

-- Inserção Salários
INSERT INTO Salario (id_funcionario, salarioTotal, bonus, descontos) VALUES
(1, 4000.00, 500.00, 450.00),
(2, 3500.00, 300.00, 400.00),
(3, 3800.00, 350.00, 420.00),
(4, 4200.00, 450.00, 470.00),
(5, 3900.00, 400.00, 460.00),
(6, 4500.00, 500.00, 480.00),
(7, 3700.00, 350.00, 420.00),
(8, 4000.00, 400.00, 430.00),
(9, 3800.00, 375.00, 450.00),
(10, 4300.00, 450.00, 490.00),
(11, 4100.00, 400.00, 460.00),
(12, 4200.00, 475.00, 480.00),
(13, 3700.00, 300.00, 400.00),
(14, 4000.00, 350.00, 440.00),
(15, 4200.00, 460.00, 470.00),
(16, 4300.00, 500.00, 490.00),
(17, 4600.00, 550.00, 500.00),
(18, 3800.00, 350.00, 420.00),
(19, 3500.00, 300.00, 400.00),
(20, 4000.00, 450.00, 470.00);

-- Inserção Controle Ponto
INSERT INTO ControlePonto (id_funcionario, dataDia, horaEntrada, horaSaida, horasTrabalhadas) VALUES
(1, '2024-11-01', '09:00', '18:00', '08:00'),
(2, '2024-11-02', '09:15', '18:30', '08:15'),
(3, '2024-11-03', '08:45', '17:45', '08:00'),
(4, '2024-11-04', '09:00', '17:30', '07:30'),
(5, '2024-11-05', '09:30', '18:00', '07:30'),
(6, '2024-11-06', '08:00', '17:30', '08:30'),
(7, '2024-11-07', '09:00', '18:15', '08:15'),
(8, '2024-11-08', '08:45', '17:30', '08:15'),
(9, '2024-11-09', '09:15', '18:00', '07:45'),
(10, '2024-11-10', '09:00', '18:00', '08:00'),
(11, '2024-11-11', '08:30', '17:30', '08:00'),
(12, '2024-11-12', '09:00', '18:00', '08:00'),
(13, '2024-11-13', '08:45', '17:30', '08:00'),
(14, '2024-11-14', '09:00', '17:45', '08:45'),
(15, '2024-11-15', '09:15', '18:30', '08:15'),
(16, '2024-11-16', '08:30', '17:45', '08:15'),
(17, '2024-11-17', '09:00', '18:30', '08:30'),
(18, '2024-11-18', '09:00', '17:30', '07:30'),
(19, '2024-11-19', '09:00', '18:00', '08:00'),
(20, '2024-11-20', '09:00', '18:15', '08:15');

SELECT * FROM Funcionario
SELECT * FROM Salario
SELECT * FROM ControlePonto

-- Acadêmicos: Erick Augusto Warmling e Jéssica Aline Schulze

-- Exercício 1: Calcula a média dos salários e o salário máximo dos funcionários, agrupados por departamento (AVG, MAX, JOIN, GROUP BY)
SELECT Funcionario.departamento, TRUNC(AVG(Salario.salarioTotal), 2) AS salario_medio, MAX(Salario.salarioTotal) AS salario_maximo
FROM Funcionario
JOIN Salario ON Funcionario.id_funcionario = Salario.id_funcionario
GROUP BY Funcionario.departamento;

-- Exercício 2: Verifica os funcionários com os menores valores de bônus (MIN, JOIN, SUBQUERY)
SELECT Funcionario.id_funcionario, Funcionario.nome, Salario.bonus
FROM Funcionario
JOIN Salario ON Funcionario.id_funcionario = Salario.id_Funcionario
WHERE Salario.bonus = (SELECT MIN(bonus) FROM Salario);

-- Exercício 3: Combinar a data de admissão dos Funcionários com a dataDia da tabela ControlePonto (UNION)
SELECT dataAdmissao FROM Funcionario
UNION
SELECT dataDia FROM ControlePonto;

-- Exercício 4: Retorna todos os Funcionários cujo o endereço possui a cidade 'Curitiba' (SUBQUERY, ILIKE)
SELECT nome 
FROM Funcionario
WHERE id_funcionario IN (SELECT id_funcionario FROM Funcionario WHERE endereco ILIKE '%Curitiba%');

-- Exercício 5: Exibir os 5 primeiros caracteres do e-mail de cada Funcionário (SUBSTRING, ORDER BY)
SELECT email, SUBSTRING(email FROM 1 FOR 5) AS primeiros_caracteres
FROM Funcionario
ORDER BY email;

-- Exercício 6: Quantidade de Funcionários em cada Departamento (COUNT, GROUP BY)
SELECT departamento, COUNT(*) AS totalFuncionario
FROM Funcionario
GROUP BY departamento;

-- Exercício 7: Adicionar novo Funcionário (STORED PROCEDURES)
CREATE PROCEDURE add_funcionario (nomeFuncionario VARCHAR, cpfFunc VARCHAR, emailFunc VARCHAR, telefoneFunc VARCHAR, enderecoFunc VARCHAR, nascimentoFunc DATE, admissaoFunc DATE, departamentoFunc VARCHAR)
AS $$
BEGIN
	INSERT INTO Funcionario (nome, cpf, email, telefone, endereco, dataNascimento, dataAdmissao, departamento) VALUES (nomeFuncionario, cpfFunc, emailFunc, telefoneFunc, enderecoFunc, nascimentoFunc, admissaoFunc, departamentoFunc);
	RAISE NOTICE 'Funcionário adicionado com sucesso';
END;
$$ LANGUAGE plpgsql;

CALL add_funcionario('Jéssica Aline Schulze', '12345678966', 'jessica.schulze@hotmail.com', '(49)99135-6985', 'RUA J, 30, Ibirama, SC', '1998-07-24', '2024-05-03', 'TI');

-- Exercício 8: Criação de novo usuário 
CREATE ROLE user_erick WITH LOGIN PASSWORD 'warmling';

-- Exercício 9: Criação de Index para Salários
CREATE INDEX idx_salario_total ON Salario(salarioTotal);

SELECT * FROM Salario
WHERE salarioTotal > 1000;