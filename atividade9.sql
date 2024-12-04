CREATE TABLE Funcionarios (
	id_funcionario SERIAL PRIMARY KEY,
	nome VARCHAR (100),
	departamento VARCHAR (50),
	salario NUMERIC (10, 5)
);

INSERT INTO Funcionarios (id_Funcionario, nome, departamento, salario) VALUES 
(1, 'João Silva', 'TI', 5000),
(2, 'Maria Oliveira', 'RH', 4500),
(3, 'Carlos Santos', 'TI', 5500),
(4, 'Ana Costa', 'Financeiro', 4000);

-- Exercício 1
CREATE FUNCTION calcula_salario_medio(dept VARCHAR) RETURNS NUMERIC (10, 2)
AS $$
BEGIN
	RETURN (SELECT AVG(Funcionarios.salario) FROM Funcionarios
	WHERE Funcionarios.departamento = dept);
END;
$$ LANGUAGE plpgsql;

SELECT calcula_salario_medio('TI');

-- Exercício 2
CREATE PROCEDURE add_funcionario_com_validacao (nomeFun VARCHAR, deptFun VARCHAR, salarioFun NUMERIC)
AS $$ 
BEGIN
	IF salarioFun > 3000 THEN
		INSERT INTO Funcionarios(nome, departamento, salario) VALUES (nomeFun, deptFun, salarioFun);
	ELSE 
		RAISE NOTICE 'Não foi possível adicionar o Funcionário. O salário dever ser maior que R$ 3000';
	END IF;
END;
$$ LANGUAGE plpgsql;

CALL add_funcionario_com_validacao('Pedro Lima', 'Marketing', 3500);
CALL add_funcionario_com_validacao('Lucas Souza', 'Financeiro', 2500);
SELECT * FROM Funcionarios