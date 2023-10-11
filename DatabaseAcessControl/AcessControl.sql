CREATE DATABASE C207;
USE C207;

CREATE TABLE students(
	matricula INT,
    curso VARCHAR(20),
    nome VARCHAR(60),
    periodo int,
    PRIMARY KEY(matricula, curso)
);



create user 'Monitor' IDENTIFIED BY '412#GES';
CREATE USER 'Professor' IDENTIFIED BY '1844#GEC';

GRANT insert, select, update, delete on c207.students to 'Monitor';
GRANT ALL privileges on c207.* to 'Professor';

REVOKE insert on c207.alunos from 'Monitor';
REVOKE create, drop on c207.* from 'Professor';

