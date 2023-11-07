DROP DATABASE IF EXISTS list4;
CREATE DATABASE list4;
USE list4;

-- COMMAND TO DISABLE SAFE MODE --
SET SQL_SAFE_UPDATES = 0;

-- CREATE AGENTE TABLE --
CREATE TABLE IF NOT EXISTS `Agente` (
    idAgente INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(45),
    nascimento DATE,
    habilidade VARCHAR(45),
    sexo VARCHAR(45),
    email VARCHAR(45)
);

-- CREATE MISSAO TABLE --
CREATE TABLE IF NOT EXISTS `missao` (
    idmissao INT NOT NULL PRIMARY KEY,
    vilao_idvilao INT NOT NULL,
    FOREIGN KEY (vilao_idvilao) REFERENCES vilao(idvilao),
    data DATE,
    nome VARCHAR(45),
    local VARCHAR(45),
    duracao INT
);

-- CREATE VILAO TABLE --
CREATE TABLE IF NOT EXISTS `vilao` (
    idvilao INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    num_crimes INT NOT NULL
);

-- CREATE RELATIONSHIP BEHIND AGENT AND MISSION TABLE --
CREATE TABLE Agente_has_missao (
    Agente_idAgente INT,
    missao_idmissao INT,
    FOREIGN KEY (Agente_idAgente) REFERENCES Agente(idAgente),
    FOREIGN KEY (missao_idmissao) REFERENCES missao(idmissao)
);

-- CREATE USER IN DATABASE --
CREATE USER 'Dimitri' IDENTIFIED BY '412#GES';

-- GIVE ALL PRIVILEGES IN ALL TABLES TO THIS USER --
GRANT ALL PRIVILEGES ON *.* TO 'Dimitri';

-- DELETE EMAIL COLUMN FROM AGENTE TABLE --
ALTER TABLE Agente DROP COLUMN email;

-- INSERT VALUES INTO THE TABLE --
INSERT into Agente(idAgente, nome, endereco) values (1, 'Joana', 'Rua A');
INSERT into Agente(idAgente, nome, endereco) values (2, 'Jonatas', 'Rua B');
INSERT into Agente(idAgente, nome, endereco) values (3, 'João Pedro', 'Rua C');

INSERT into missao(idmissao, data, nome) values (1, '2003-05-16', 'Plano B');
INSERT into missao(idmissao, data, nome) values (2, '2003-05-16', 'Missao Impossivel');
INSERT into missao(idmissao, data) values (3, '2003-05-16');

INSERT into vilao(idvilao, nome, num_crimes) values (157, 'Coringa', 12);
INSERT into vilao(idvilao, nome, num_crimes) values (100, 'Bergamel', 123);
INSERT into vilao(idvilao, nome, num_crimes) values (0, 'Junin', 1);

-- MAKE A SELECT THAT RETURN THE MISSION NAME AND YOUR VILLAIN NAME TOO --
SELECT 
    m.nome,
    v.nome
FROM
    missao AS m
JOIN 
    vilao AS v 
ON 
    m.vilao_idvilao = v.idvilao;

-- MAKE A SELECT THAT RETURN THE AGENT NAME AND YOUR MISSIONS NAME TOO --
SELECT
    a.nome,
    m.nome
FROM
    Agente AS a
JOIN
    Agente_has_missao AS am
ON 
    a.idAgente = am.Agente_idAgente
JOIN
    missao AS m
ON
    am.missao_idmissao = m.idmissao;

-- REMOVE DELETE PERMISSION FROM USER --
REVOKE DELETE ON *.* FROM 'Dimitri';    
