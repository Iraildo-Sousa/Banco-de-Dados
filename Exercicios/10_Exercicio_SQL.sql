CREATE DATABASE 10_Exercicio_SQL;
USE 10_Exercicio_SQL;

CREATE TABLE livro(

	idLivro INT PRIMARY KEY AUTO_INCREMENT
    ,nome CHAR(50) NOT NULL
    ,paginas INT
    ,genero CHAR(50) NOT NULL
    ,autor CHAR(50) NOT NULL
    ,situacao CHAR(1) NOT NULL DEFAULT 'A'

);

INSERT INTO livro(nome ,paginas ,genero ,autor)
VALUE
	('Maus', 296, 'quadrinhos', 'art spiegelman');

INSERT INTO livro(nome ,paginas ,genero ,autor)
VALUE   
	('1984', 328, 'distopia', 'George Orwell'),
	('O Senhor dos Anéis', 1216, 'fantasia', 'J.R.R. Tolkien');
   
     
SELECT * FROM livro;

CREATE TABLE livroDelete(

	idLivroDelete INT PRIMARY KEY AUTO_INCREMENT
    ,idLivro INT 
	,nome CHAR(50) NOT NULL
    ,paginas INT
    ,genero CHAR(50) NOT NULL
    ,autor CHAR(50) NOT NULL

);

DELETE FROM livro WHERE idLivro = '3';
SELECT * FROM livroDelete;

DELIMITER //

CREATE TRIGGER historicoLivro
BEFORE DELETE
ON livro FOR EACH ROW
BEGIN 
INSERT INTO livroDelete(idLivro, nome ,paginas ,genero ,autor)
VALUE
	(OLD.idLivro, OLD.nome, OLD.paginas, OLD.genero, OLD.autor);

END
//