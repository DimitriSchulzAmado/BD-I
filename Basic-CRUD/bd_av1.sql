# Questão 1 - Chave primaria é o identificador do elemento

drop database if exists av1;
create database av1;
use av1;

#COMANDO PARA DESATIVAR O SAFE MODE
set SQL_SAFE_UPDATES = 0;

# Creating element
create table if not exists aluno(
	matricula varchar(15) not null primary key,
	nome varchar(45),
	idade int,
	curso varchar(45),
	periodo int
);

# Insert elements in table
insert into aluno (matricula, nome, idade, curso, periodo) values (1234, 'Camila', 22, 'GEC', 2);
insert into aluno (matricula, nome, idade, curso, periodo) values (4567, 'Marcelo', 25, 'GEB', 3);
insert into aluno (matricula, nome, idade, curso, periodo) values (9876, 'Felipe', 19, 'GES', 2);
insert into aluno (matricula, nome, idade, curso, periodo) values (1594, 'Mariana', 20, 'GEC', 4);
insert into aluno (matricula, nome, idade, curso, periodo) values (8462, 'Flavio', 26, 'GEA', 6);
insert into aluno (matricula, nome, idade, curso, periodo) values (4866, 'Maria', 18, 'GEC', 3);

# Update Marcelo's name
update aluno set periodo = 4 where nome = 'Marcelo';

# Search all GEC curse from students
select curso from aluno where curso = 'GEC';

# Deleting Mariana
delete from aluno where nome = 'Mariana';

# Search all curse from the students of 2nd period
select curso from aluno where periodo = 2;

# Search name, age and course from student where period equals to 3
select nome, idade, curso from aluno where periodo = 3;

# Search all from 3 first students
select * from aluno limit 3;

# Search students with inicial char M and more than 5 letters
select nome from aluno where nome like 'M_____%';

# Search how many students has more than 21 years old
select count(idade) from aluno where idade > 21;





