create table alunos (
	codigo_aluno serial primary key,
	nome varchar (100) not null,
	data_nascimento date not null,
	cpf varchar (11) not null,
	endereco varchar (100),
	telefone varchar (13)
);

create table professores (
	codigo_professor serial primary key,
	nome varchar (100) not null,
	especialidade varchar (50),
	cpf varchar (11) not null,
	endereco varchar (100),
	telefone varchar (13)
);

create table disciplinas (
	codigo_disciplina serial primary key,
	nome_disciplina varchar (100),
	carga_horaria int check (carga_horaria >= 1)
);

create table classes (
	codigo_classe serial primary key,
	codigo_disciplina int,
	foreign key (codigo_disciplina) references disciplinas (codigo_disciplina),
	codigo_professor int,
	foreign key (codigo_professor) references professores (codigo_professor),
	semestre int
);

create table matriculas (
	codigo_matricula serial primary key,
	codigo_aluno int,
	foreign key (codigo_aluno) references alunos (codigo_aluno),
	codigo_classe int,
	foreign key (codigo_classe) references classes (codigo_classe)
);

/* Inserção dos Dados */
insert into alunos (codigo_aluno, nome, data_nascimento, cpf, endereco, telefone) values (1, 'Erick', '2005-03-03', '09644564944', 'Urubici - SC', '5549998210331');
insert into alunos (codigo_aluno, nome, data_nascimento, cpf, endereco, telefone) values (2, 'Isabela', '2004-08-15', '12345678966', 'Florianópolis - SC', '5548991257863');
insert into alunos (codigo_aluno, nome, data_nascimento, cpf, endereco, telefone) values (3, 'Henrique', '2004-11-18', '78925643122', 'Ibirama - SC', '5547998246312');
insert into alunos (codigo_aluno, nome, data_nascimento, cpf, endereco, telefone) values (4, 'Fernanda', '2006-01-28', '45628730199', 'Lages - SC', '554999367201');
insert into alunos (codigo_aluno, nome, data_nascimento, cpf, endereco, telefone) values (5, 'João', '2003-09-11', '87510236488', 'Lages - SC', '5549991487523');

insert into professores (codigo_professor, nome, especialidade, cpf, endereco, telefone) values (1, 'Fernando', 'Doutorado', '56498231021', 'Joinville - SC', '5547991036587');

insert into disciplinas (codigo_disciplina, nome_disciplina, carga_horaria) values (100, 'Química', 72);

insert into classes (codigo_classe, codigo_disciplina, codigo_professor, semestre) values (1, 100, 1, 3);

insert into matriculas (codigo_matricula, codigo_aluno, codigo_classe) values (001, 1, 1);


select * from alunos
select * from professores
select * from disciplinas
select * from classes
select * from matriculas
