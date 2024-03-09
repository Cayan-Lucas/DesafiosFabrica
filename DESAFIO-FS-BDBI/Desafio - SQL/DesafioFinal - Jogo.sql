create database Jogo;
use jogo;

CREATE TABLE Jogador (
    ID_Jogador INTEGER PRIMARY KEY,
    Nome VARCHAR(25),
    Username VARCHAR(25),
    Pontuacao REAL,
    Nivel_Alcancado INTEGER,
    fk_Partida_ID_Partida INTEGER
);

CREATE TABLE Partida (
    ID_Partida INTEGER PRIMARY KEY,
    ID_Jogador INTEGER,
    Data DATE,
    Resultado VARCHAR(25),
    Duracao FLOAT
);

CREATE TABLE Conquista (
    ID_Conquista INTEGER PRIMARY KEY,
    Nome VARCHAR(25),
    Descricao VARCHAR(25)
);

CREATE TABLE Consegue (
    fk_Jogador_ID_Jogador INTEGER,
    fk_Conquista_ID_Conquista INTEGER
);
 
ALTER TABLE Jogador ADD CONSTRAINT FK_Jogador_2
    FOREIGN KEY (fk_Partida_ID_Partida)
    REFERENCES Partida (ID_Partida)
    ON DELETE RESTRICT;
 
ALTER TABLE Consegue ADD CONSTRAINT FK_Consegue_1
    FOREIGN KEY (fk_Jogador_ID_Jogador)
    REFERENCES Jogador (ID_Jogador)
    ON DELETE RESTRICT;
 
ALTER TABLE Consegue ADD CONSTRAINT FK_Consegue_2
    FOREIGN KEY (fk_Conquista_ID_Conquista)
    REFERENCES Conquista (ID_Conquista)
    ON DELETE RESTRICT;
    
    -- Adicionando uma nova Coluna na tabela Partida
    alter table partida add column Rounds int ;
    
    
    -- Inserindo dados nas tabelas
    
    insert into partida
    values
    (10001, 12345,'2024-03-09 08:33:45','Vitoria',35.00,15),
    (20002, 12346,'2024-03-09 08:36:45','Derrota',12.00,15),
    (30003, 12347,'2024-03-09 08:37:45','Derrota',20.35,15),
    (40004, 12348,'2024-03-09 08:39:45','Vitoria',50.24,15),
    (50005, 12349,'2024-03-09 08:32:45','Vitoria',9.00,15);
    
    insert into jogador
    values
	(12345,'Cayan','Markdelas',100.00,135,10001),
    (12346,'Rhuann','Litz',10.24,30,20002),
    (12347,'Caio','Xit caio',20.35,100,30003),
    (12348,'Cesar','Caesar',50.24,130,40004),
    (12349,'Larissa','Goiabinha',65.00,90,50005);
    
    insert into conquista
    values
    (11,'Avaçalador','Matou 5 sem morrer'),
    (22,'Inicio do double kill','primeira eliminação dupla'),
    (33,'Aventureiro','Jogou 10 partidas'),
    (44,'Imortal','Terminou sem morrer'),
    (55,'Grão Mestre',' rank máximo');
    
    insert into consegue
    values
    (12345,11),
    (12346,22),
    (12349,33),
    (12345,44),
    (12347,55);
    

-- Mostrando tabelas

select * from partida;

select * from jogador;

select * from  consegue;

select * from  conquista;


    
    