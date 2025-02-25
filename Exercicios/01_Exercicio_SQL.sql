CREATE DATABASE formulario;
USE formulario;

CREATE TABLE pessoa
(

	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50), 
    cpf VARCHAR(15) NOT NULL,
    rg VARCHAR(8) NOT NULL,
    idade INT,
    situacao CHAR(3) NOT NULL

);

CREATE TABLE cliente 
(

	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    fidelidade VARCHAR(30), 
    saldo DECIMAL(10,2) NOT NULL,
    situacao CHAR(3) NOT NULL,
    idCliente2 INT NOT NULL,
    FOREIGN KEY(idCliente2) REFERENCES pessoa(idPessoa)

);

CREATE TABLE funcionario
(

	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    salario DECIMAL(10,2),
    funcao VARCHAR(30),
    situacao CHAR(3),
    idPessoa INT NOT NULL,
    FOREIGN KEY(idPessoa) REFERENCES pessoa(idPessoa)

);

CREATE TABLE endereco
(

	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(20) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(20),
    uf VARCHAR(2) NOT NULL,
    cidade VARCHAR(15) NOT NULL,
    pais VARCHAR(15) NOT NULL,
    idPessoa INT NOT NULL,
    FOREIGN KEY(idPessoa) REFERENCES pessoa(idPessoa)

);

SELECT * FROM pessoa, endereco; 

INSERT INTO pessoa(nome, cpf, rg, idade, situacao) /* CONTINUA NA LINHA ABAIXO */ VALUES('Maria', '1234567812', '12345678', '26', 'A');

SELECT * FROM endereco;

INSERT INTO endereco(rua, cep, numero, complemento, uf, cidade, pais) ## CONTINUA NA PRÓXIMA LINHA ##
VALUES ('Asa', '7215456', '15', 'Solar', 'GO', 'Planaltina', 'Brasil');