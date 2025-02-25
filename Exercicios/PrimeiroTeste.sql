CREATE DATABASE PrimeiroTeste; ## Criação do nome da tabela
USE PrimeiroTeste; ## Nessa linha estamos usando o banco de dados

CREATE TABLE pessoa
(
	
    idPessoa int PRIMARY KEY AUTO_INCREMENT,
	nome varchar(45) NOT NULL,
	cpf varchar(11) NOT NULL,
	rg varchar(8) NOT NULL,
	idade int,
	situacao char(1) not null
    
);

create table funcionario
(

	idFuncionario int primary key auto_increment,
    salario decimal(10,2),
    funcao varchar(15),
    situacao char(2),
    idTeste int not null,
    foreign key(idTeste) references pessoa(idPessoa)

);

select * from pessoa, funcionario;
select cpf from pessoa;