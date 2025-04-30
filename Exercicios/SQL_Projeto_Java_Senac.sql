CREATE DATABASE Gerenciar_alunos;
USE Gerenciar_alunos;

-- DROP TABLE pessoa;

CREATE TABLE pessoa (

	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(17) NOT NULL,
    email VARCHAR(50) NOT NULL,
	situacao CHAR(2) DEFAULT "A"
    
);

-- DROP TABLE login;

CREATE TABLE login (

	id_login INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(200) NOT NULL,
    senha VARCHAR(14) NOT NULL,
    hierarquia CHAR(2) NOT NULL,
    situacao CHAR(1) DEFAULT "A"

);

CREATE TABLE professor (

	id_professor INT PRIMARY KEY AUTO_INCREMENT,
    especialidade VARCHAR(50),
    situacao CHAR(2),
	id_pessoa INT NOT NULL,
    
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);

CREATE TABLE aluno (

	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(500),
    situacao CHAR(2) DEFAULT "A",
    id_pessoa INT NOT NULL,
    
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)

);

-- DROP TABLE projeto;

CREATE TABLE projeto (

	id_projeto INT PRIMARY KEY AUTO_INCREMENT,
	nome_projeto VARCHAR(50) NOT NULL,
    descricao_projeto VARCHAR(500) NOT NULL,
    situacao CHAR(2) DEFAULT "A",
    id_professor INT,
    
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
    
);

CREATE TABLE projeto_andamento (

	id_projeto_andamento INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
	data_fim DATETIME DEFAULT CURRENT_TIMESTAMP,
    situacao CHAR(2), 
	id_projeto INT,
    id_aluno INT,
    
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_projeto),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
    
);