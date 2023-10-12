DROP DATABASE IF EXISTS aula3;
CREATE DATABASE aula3;
USE aula3;

#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

#QUESTAO 1
# Identificar o elemento 


#QUESTAO 2
CREATE TABLE IF NOT EXISTS pessoa(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    cargo VARCHAR(45)
);

#RESPOSNDA A QUESTÂO 2 AQUI
update pessoa set nome = 'Dimitri' where id = 1; 

select nome, endereco from pessoa;

delete from pessoa where id = (select max(id) from pessoa);

insert pessoa(nome, endereco, cargo) values ('Pedrinho', 'Rua V. Agosto', 'Mecanico');
insert pessoa(nome, endereco, cargo) values ('Jonas', 'Av. Brasil', 'CEO');
insert pessoa(nome, endereco, cargo) values ('Maria', 'Barra da Tijuca', 'Confeiteira');

#QUESTAO 3
CREATE TABLE IF NOT EXISTS empresa(
	matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45),
    cargo VARCHAR(45),
    nProjetos INT
);

#RESPOSNDA A QUESTÂO 3 AQUI
insert empresa(nome, cpf, cargo, nProjetos) values ('Junior', '000.000.000-00', 'GP', 2);
insert empresa(nome, cpf, cargo, nProjetos) values ('Maria', '111.111.111-11', 'Desenvolvedor', 3);
insert empresa(nome, cpf, cargo, nProjetos) values ('Carlos', '222.222.222-22', 'Tester', 4);
insert empresa(nome, cpf, cargo, nProjetos) values ('Julia', '333.333.333-33', 'Desenvolvedor', 5);

select count(nProjetos) from empresa where nProjetos >= 4;
select avg(nProjetos) from empresa where cargo != 'GP';
select distinct cargo from empresa;
select nome, cpf, nProjetos from empresa where cargo = 'Desenvolvedor';

#QUESTAO 4
CREATE TABLE IF NOT EXISTS aluno(
	matricula INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    ano_nasc INT,
    curso VARCHAR(45)
);

#RESPOSNDA A QUESTÂO 4 AQUI
insert into aluno(nome, matricula, endereco, ano_nasc, curso) values (‘Janaina’, ‘123’, ‘Rua1’, ‘1998’, ‘GEB’);
insert into aluno(nome, matricula, endereco, ano_nasc, curso) values (‘Pedro’, default, ‘Rua2’, ‘2000’, ‘GES’);
insert into aluno(nome, endereco, ano_nasc, curso) values (‘Jander’, ‘Rua3’, ‘1999’, ‘GEC’);
insert into aluno(nome, matricula, endereco, ano_nasc, curso) values (‘Lucca’, ‘123’, ‘Rua4’, ‘1998’, ‘GEB’);
insert into aluno(nome, matricula, endereco, ano_nasc) values (‘Laura’, ‘456’, ‘Rua5’, ‘1998’);

select nome, matricula, curso from aluno where nome like 'Jan____%';
select nome, curso from aluno where nome like 'L%a';
select ano_nasc, curso from aluno;
select nome, ano_nasc, curso from aluno where ano_nasc <= 1998;
select * from aluno limit 3;

update aluno set endereco = 'Av Comendador';

delete from aluno where curso = 'GEB';
