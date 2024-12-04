CREATE TABLE Clientes (
	cliente_id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	email VARCHAR (100),
	data_nascimento DATE
);

CREATE ROLE user_maria WITH LOGIN PASSWORD 'senha123';
CREATE ROLE user_joao WITH LOGIN PASSWORD 'senha123';
CREATE ROLE user_clara WITH LOGIN PASSWORD 'senha123';

CREATE ROLE leitura;
CREATE ROLE escrita;
CREATE ROLE administrador;

GRANT SELECT ON clientes TO leitura;
GRANT INSERT, UPDATE ON clientes TO escrita;
GRANT ALL PRIVILEGES ON clientes TO administrador;
ALTER ROLE administrador WITH CREATEDB;

GRANT leitura TO user_maria;
GRANT escrita TO user_joao;
GRANT administrador TO user_clara;

REVOKE leitura FROM user_maria;
DROP ROLE user_maria;
DROP ROLE leitura;


