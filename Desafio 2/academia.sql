create database academia;

use academia;

/* Lógico_1: */
create table mensalidade(
	estudante decimal(10,2),
	normal decimal(10,2)
);
CREATE TABLE Modalidade (
    CodMod NUMERIC PRIMARY KEY,
    Nome VARCHAR(25)
);

CREATE TABLE Turma (
    CodigoTurma NUMERIC PRIMARY KEY,
    Bloco NUMERIC,
    Horario TIMESTAMP,
    fk_Modalidade_CodMod NUMERIC,
    fk_Professor_Matricula NUMERIC
);

CREATE TABLE Professor (
    Matricula NUMERIC PRIMARY KEY,
    Nome VARCHAR(25),
    Sexo VARCHAR(25)
);

CREATE TABLE Aluno (
    Sexo VARCHAR(25),
    Nome VARCHAR(25),
    Matricula NUMERIC PRIMARY KEY,
    fk_Estado_Singla VARCHAR(25)
);

CREATE TABLE Estado (
    Nome VARCHAR(25),
    Singla VARCHAR(25) PRIMARY KEY
);

CREATE TABLE Participa (
    fk_Aluno_Matricula NUMERIC,
    fk_Turma_CodigoTurma NUMERIC
);
 
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_2
    FOREIGN KEY (fk_Modalidade_CodMod)
    REFERENCES Modalidade (CodMod)
    ON DELETE CASCADE;
 
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_3
    FOREIGN KEY (fk_Professor_Matricula)
    REFERENCES Professor (Matricula)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_Estado_Singla)
    REFERENCES Estado (Singla)
    ON DELETE CASCADE;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_1
    FOREIGN KEY (fk_Aluno_Matricula)
    REFERENCES Aluno (Matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_2
    FOREIGN KEY (fk_Turma_CodigoTurma)
    REFERENCES Turma (CodigoTurma)
    ON DELETE SET NULL;
    
    -- insert into
    
insert into Modalidade
values(01,'Musculação'),
(02,'Lutas'),
(03,'Crossfit'),
(04,'Dança'),
(05,'Natação'),
(06,'Funcional');

-- insert professor

insert into professor
values(123,'Cayan', 'Masculino'),
(124,'dayanne', 'feminino'),
(125,'igor', 'Masculino'),
(126,'Geovanna', 'feminino'),
(127,'igor', 'Masculino'),
(128,'rhuann', 'Masculino');

-- insert estado

insert into  estado
values('Paraiba','PB'),
('Acre','AC'),
('Alagoas','AL'),
('Amapá','MP'),
('Amazonas','AM'),
('Ceara','CE');

-- insert  aluno
insert into aluno
values('Masculino','Cayan', '223','PB'),
('feminino','dayanne', '224','CE'),
('Masculino','igor', '225','AM'),
('feminino','Geovanna', '226','AL'),
('Masculino','igor', '227','AC'),
('Masculino','rhuann', '228','MP');

-- insert turma

insert into turma
values(333, 1,'2024-03-05 06:00:00',01,123),
(334, 2,'2024-03-05 07:00:00',06,124),
(335, 3,'2024-03-05 08:00:00',02,125),
(336, 4,'2024-03-05 09:00:00',03,126),
(337, 5,'2024-03-05 10:00:00',04,127),
(338, 6,'2024-03-05 11:00:00',05,128);

-- insert participa

insert into participa
values(223,333),
(224,334),
(225,335),
(225,335),
(225,335),
(226,336);

insert into mensalidade
values(15.00, 30.00);

-- operaçoes

SELECT * FROM aluno WHERE nome LIKE 'A%';


SELECT * FROM professor WHERE nome LIKE 'C_ _ _ _ ';

#Exemplo 3: Mostrar todos os Alunos cujos nomes não começam com a letra "A".

SELECT * FROM aluno WHERE nome NOT LIKE 'A%';


SELECT * FROM aluno WHERE Matricula IS NULL;


SELECT * FROM aluno WHERE Matricula = '223' AND nome = 'Cayan';


SELECT COUNT(*) AS Quantidade FROM aluno;


SELECT SUM(estudante) AS Total FROM mensalidade;


SELECT AVG(estudante) AS 'Media dos Preços' FROM mensalidade;


SELECT MAX(estudante) AS 'Maior Preço' FROM mensalidade;


SELECT MIN(normal) AS 'Menor Preço' FROM mensalidade;