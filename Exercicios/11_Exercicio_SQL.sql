CREATE DATABASE 11_Exercicio_SQL;
USE 11_Exercicio_SQL;

CREATE TABLE pessoa(

	idPessoa INT PRIMARY KEY AUTO_INCREMENT
    ,nome CHAR(80) NOT NULL
    ,cpf VARCHAR(14) NOT NULL
    ,email VARCHAR(50) NOT NULL
    ,situacao CHAR(1) NOT NULL DEFAULT 'A'

);

CREATE TABLE produto(

	idProduto INT PRIMARY KEY AUTO_INCREMENT
    ,denominação VARCHAR(200) NOT NULL
    ,quantiddade INT
    ,preco DECIMAL(10,2) NOT NULL
    ,situacao CHAR(1) NOT NULL DEFAULT 'A'

);

-- DROP TABLE vendedor;

CREATE TABLE vendedor(

	idVendedor INT PRIMARY KEY AUTO_INCREMENT,## Chave primaria da tabela.
	salario DECIMAL(10,2),
	matricula VARCHAR(30) NOT NULL,
	situacao CHAR(1) NOT NULL DEFAULT 'A',
	idPessoa INT NOT NULL,
	FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)
    
);

-- DROP TABLE cliente;

CREATE TABLE cliente(

	idCliente INT PRIMARY KEY AUTO_INCREMENT,## Chave primaria da tabela.
	fidelidade VARCHAR(20),
	desconto DECIMAL(10,2),
	situacao CHAR(1) DEFAULT 'A',
	idPessoa INT NOT NULL,
	FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)
    
);


CREATE TABLE formaPagamento(

	idFormaPagamento INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(40) NOT NULL,
	parcela INT,
	prazo INT,
	situacao CHAR(1) DEFAULT 'A'
    
);


CREATE TABLE venda(

	idVenda INT PRIMARY KEY AUTO_INCREMENT,## Chave primaria da tabela.
	dataCompra DATETIME DEFAULT CURRENT_TIMESTAMP,## Default + Current_timestamp pega a data e a hora.
	valorTotal DECIMAL(10,2),
	desconto DECIMAL(10,2),
	acrescimo DECIMAL(10,2),
	numeroPedido INT NOT NULL,
	cancelado CHAR(1) NOT NULL,
	idCliente INT NOT NULL,
	idVendedor INT NOT NULL,
	idFormaPagamento INT,
	FOREIGN KEY(idCliente) REFERENCES cliente(idCliente),
	FOREIGN KEY(idVendedor) REFERENCES vendedor(idVendedor),
	FOREIGN KEY(idFormaPagamento) REFERENCES formaPagamento(idFormaPagamento)
    
);

CREATE TABLE itensVenda(
idItensVenda INT PRIMARY KEY AUTO_INCREMENT,
desconto DECIMAL(10,2),
acrescimo DECIMAL(10,2),
quantidade INT NOT NULL,
preco DECIMAL(10,2),
valorTotal DECIMAL(10,2) DEFAULT ((quantidade*preco)-desconto+acrescimo),
cancelado CHAR(1),
idProduto INT NOT NULL,
idVenda INT NOT NULL,
FOREIGN KEY(idProduto) REFERENCES produto(idProduto),
FOREIGN KEY(idVenda) REFERENCES venda(idVenda)

);


ALTER TABLE venda
ADD statusVenda VARCHAR (50);

SELECT * FROM pessoa;
SELECT * FROM produto;
SELECT * FROM formaPagamento;
SELECT * FROM cliente;
SELECT * FROM vendedor;
SELECT * FROM venda;

INSERT INTO pessoa(nome, cpf, email) 
VALUES 
	('João Silva', '123.456.789-00', 'joao.silva@example.com'),
	('Maria Oliveira', '987.654.321-00', 'maria.oliveira@example.com'),
	('Carlos Souza', '555.666.777-88', 'carlos.souza@example.com');

INSERT INTO pessoa (nome, cpf, email)
VALUES
('Ana Costa', '111.222.333-44', 'ana.costa@example.com'),
('Lucas Pereira', '222.333.444-55', 'lucas.pereira@example.com'),
('Fernanda Rocha', '333.444.555-66', 'fernanda.rocha@example.com'),
('Carlos Lima', '444.555.666-77', 'carlos.lima@example.com'),
('Juliana Almeida', '555.666.777-88', 'juliana.almeida@example.com'),
('Roberto Martins', '666.777.888-99', 'roberto.martins@example.com'),
('Patrícia Souza', '777.888.999-00', 'patricia.souza@example.com'),
('Marcos Silva', '888.999.000-11', 'marcos.silva@example.com'),
('Beatriz Oliveira', '999.000.111-22', 'beatriz.oliveira@example.com'),
('Ricardo Gomes', '000.111.222-33', 'ricardo.gomes@example.com');

INSERT INTO pessoa (nome, cpf, email)
VALUES
    ('Ana Silva', '123.456.789-00', 'ana.silva@email.com'),
    ('João Souza', '987.654.321-00', 'joao.souza@email.com'),
    ('Maria Oliveira', '112.233.445-66', 'maria.oliveira@email.com'),
    ('Carlos Santos', '556.677.889-00', 'carlos.santos@email.com'),
    ('Patrícia Lima', '998.877.665-44', 'patricia.lima@email.com'),
    ('Lucas Pereira', '123.789.456-12', 'lucas.pereira@email.com'),
    ('Fernanda Costa', '321.654.987-00', 'fernanda.costa@email.com'),
    ('Rafael Almeida', '654.987.123-45', 'rafael.almeida@email.com'),
    ('Juliana Rocha', '432.567.891-23', 'juliana.rocha@email.com'),
    ('Ricardo Martins', '876.543.210-99', 'ricardo.martins@email.com'),
    ('Beatriz Santos', '210.987.654-32', 'beatriz.santos@email.com'),
    ('Gustavo Oliveira', '987.321.654-76', 'gustavo.oliveira@email.com'),
    ('Camila Ferreira', '123.654.987-65', 'camila.ferreira@email.com'),
    ('Eduardo Barbosa', '345.678.123-45', 'eduardo.barbosa@email.com'),
    ('Tatiane Almeida', '765.432.109-87', 'tatiane.almeida@email.com');


INSERT INTO pessoa (nome, cpf, email)
VALUES
('Rafael Costa', '123.987.654-32', 'rafael.costa@example.com'),
('Sofia Pereira', '234.876.543-21', 'sofia.pereira@example.com');

-- DROP TABLE produto;

INSERT INTO produto (denominação, quantiddade, preco, situacao)
VALUES
	('Arroz Branco 5kg', 150, 19.99, 'A'),
	('Feijão Carioca 1kg', 200, 7.49, 'A'),
	('Óleo de Soja 900ml', 80, 6.29, 'A'),
	('Macarrão Espaguete 500g', 120, 3.99, 'A'),
	('Leite Integral 1L', 250, 4.49, 'A');

INSERT INTO vendedor (salario, matricula, idPessoa)
VALUES
(2500.00, 'V001', 1),  -- idPessoa = 1
(3200.50, 'V002', 2),  -- idPessoa = 2
(2800.75, 'V003', 3),  -- idPessoa = 3
(3500.00, 'V004', 4),  -- idPessoa = 4
(3000.00, 'V005', 5);  -- idPessoa = 5

INSERT INTO cliente (fidelidade, desconto, idPessoa)
VALUES
('Bronze', 5.00, 6),  
('Prata', 10.00, 7),  
('Ouro', 15.00, 8),   
('Platinum', 20.00, 9), 
('Gold', 10.50, 10),     
('Prata', 8.00, 11),     
('Ouro', 12.50, 12),     
('Bronze', 4.50, 13),    
('Platinum', 25.00, 14), 
('Gold', 18.00, 15);    

INSERT INTO FormaPagamento (descricao, parcela, prazo)
VALUES
	('Cartão de Crédito', 12, 30),
	('Cartão de Débito', 1, 0),
	('Boleto Bancário', 1, 5),
	('Pix', 1, 0),
	('Transferência Bancária', 1, 0),
	('Dinheiro', 1, 0),
	('Cheque', 1, 7),
	('Financiamento', 24, 60),
	('Parcelamento Loja', 10, 30),
	('Pagamento à Vista', 1, 0);

INSERT INTO venda(valorTotal, desconto, acrescimo, numeroPedido, cancelado, idCliente, idVendedor, idFormaPagamento)
VALUE 
	(0, 0, 0, 1, 'N', 31, 11, 1);
    
INSERT INTO itensVenda (desconto, acrescimo, quantidade, preco, cancelado, idProduto, idVenda)
VALUES
    (5.00, 2.00, 1, 120.00, 'N', 1, 31),   -- Item 1
    (10.00, 3.00, 2, 150.00, 'N', 2, 32),  -- Item 2
    (0.00, 0.00, 5, 200.00, 'N', 3, 33),   -- Item 3
    (15.00, 5.00, 3, 80.00, 'N', 4, 34),   -- Item 4
    (12.00, 7.00, 4, 50.00, 'N', 5, 35),   -- Item 5
    (8.00, 4.00, 6, 100.00, 'N', 6, 36),  -- Item 6
    (20.00, 10.00, 2, 70.00, 'N', 7, 37),  -- Item 7
    (6.00, 2.00, 10, 30.00, 'N', 8, 38),  -- Item 8
    (4.00, 1.00, 8, 110.00, 'N', 9, 39),  -- Item 9
    (7.00, 3.00, 12, 90.00, 'N', 10, 40);  -- Item 10

-- DROP TABLE itensVenda;
-- DROP TABLE venda;

INSERT INTO venda (valorTotal, desconto, acrescimo, numeroPedido, cancelado, idCliente, idVendedor, idFormaPagamento)
VALUES
    (500.00, 10.00, 5.00, 1001, 'N', 31, 11, 1),   -- Venda 1
    (200.00, 15.00, 3.00, 1002, 'N', 32, 12, 2),   -- Venda 2
    (1200.00, 50.00, 20.00, 1003, 'N', 33, 11, 3),  -- Venda 3
    (750.00, 30.00, 10.00, 1004, 'N', 34, 14, 1),   -- Venda 4
    (950.00, 25.00, 15.00, 1005, 'N', 34, 15, 2),   -- Venda 5
    (450.00, 5.00, 7.00, 1006, 'N', 35, 15, 3),    -- Venda 6
    (300.00, 10.00, 2.00, 1007, 'N', 36, 11, 1),    -- Venda 7
    (1100.00, 35.00, 10.00, 1008, 'N', 37, 12, 2),   -- Venda 8
    (600.00, 20.00, 5.00, 1009, 'N', 38, 13, 3),    -- Venda 9
    (800.00, 40.00, 10.00, 1010, 'N', 39, 14, 1);   -- Venda 10


##=======================================================================================================================

SELECT * FROM itensVenda;
/*
DELIMITER //

CREATE TRIGGER inserirPreco
AFTER INSERT
ON 
BEGIN
INSERT INTO 
UPDATE itensVenda SET NEW.preco = (SELECT preco FROM produto WHERE idProduto = NEW.idProduto) WHERE idVenda = NEW.idVenda

END
//

*/
-------------------------------------------------------------------------------------------------------------------------------
-- DROP TABLE historicoPreco;

CREATE TABLE historicoPreco(

	idHistoricoPreco INT PRIMARY KEY AUTO_INCREMENT
    ,denominacao VARCHAR(200) NOT NULL
    ,precoAntigo DECIMAL(10,2)
    ,precoNovo DECIMAL(10,2)
    ,idProduto INT NOT NULL
    ,FOREIGN KEY (idProduto) REFERENCES produto(idProduto)

);

SELECT * FROM pessoa;
SELECT * FROM venda;
SELECT * FROM produto;
SELECT * FROM historicoPreco;
SELECT * FROM cliente;
SELECT * FROM vendedor;
SELECT * FROM itensVenda;

INSERT historicoPreco(denominacao, preco, idProduto)
VALUES 
	('Todi', 10, 1);


UPDATE produto SET preco = 88 WHERE idProduto =1;

-- DROP TRIGGER historicoPreco;

DELIMITER //

CREATE TRIGGER historicoPreco
AFTER UPDATE
ON produto FOR EACH ROW
BEGIN
IF (OLD.preco <> NEW.preco) THEN
INSERT INTO historicoPreco(denominacao, precoAntigo, precoNovo, idProduto)
VALUES(NEW.denominação, OLD.preco, NEW.preco, NEW.idProduto);
END IF;
END
 
 //
 
 -- ---------------------------------------------------------------------------------------------------------------------------------------

USE  
 SELECT * FROM itensVenda;
 SELECT * FROM atualizacaoPreco;
 -- Desconto, Acréscimo, ID Produto e ID da Venda
 
 CREATE TABLE atualizacaoPreco(
 
	idAtualizacaoPreco INT PRIMARY KEY
    ,desconto DECIMAL(10,2)
    ,acrescimo DECIMAL(10,2)
    ,idProduto INT
    ,idVenda INT
 
 );
 
 DELIMITER //
 
 CREATE TRIGGER atualizacaoPreco
 BEFORE INSERT
 ON itensVenda FOR EACH ROW
 BEGIN 
 SET NEW.preco = (SELECT preco FROM produto WHERE idProduto = NEW.idProduto),
 NEW.valorTotal = ((NEW.quantidade * NEW.preco) - NEW.desconto + NEW.acrescimo);

 END
 //
 
 SELECT * FROM itensVenda ORDER BY idItensVenda DESC;
 INSERT INTO itensVenda(desconto, acrescimo, quantidade, idProduto, idVenda)
 VALUE 	(0, 0, 8, 1, 32);