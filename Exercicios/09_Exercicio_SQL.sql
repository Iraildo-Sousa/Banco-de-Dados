/* TRIGGER */

USE 07_Exercicio_SQL_Empreiteira;

SELECT * FROM pessoa ORDER BY idPessoa DESC; /* Colocar em forma decrescente */
INSERT INTO pessoa(nome, cnpjCpf, nomeFantasia, telefone, email)
VALUE ('Marcos', '2356446000145', 'Nodelay Ltda', '61954662564', 'marcosnodelay@gmail.com');

SELECT * FROM pessoa;

CREATE TABLE relatorio(

	idRelatorio INT PRIMARY KEY AUTO_INCREMENT
    ,idPessoa INT
    ,nome VARCHAR(200) NOT NULL
    ,cnpjCpf VARCHAR(30) NOT NULL
    ,nomeFantasia VARCHAR(200) NOT NULL
    ,telefone CHAR(20)
    
);

DROP TRIGGER historicoTabelaPessoa;

DELIMITER //
CREATE TRIGGER historicoTabelaPessoa
BEFORE DELETE
ON pessoa FOR EACH ROW
BEGIN
INSERT INTO relatorio(idPessoa, nome, cnpjCpf, nomeFantasia, telefone)
VALUES (OLD.idPessoa, OLD.nome, OLD.cnpjCpf, OLD.nomeFantasia, OLD.telefone);
END
//

DELETE FROM pessoa WHERE idPessoa IN (11, 12);
SELECT * FROM relatorio;