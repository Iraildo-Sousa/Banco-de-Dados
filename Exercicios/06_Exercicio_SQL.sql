CREATE DATABASE Exercicio03_ConsultaMedica;
USE Exercicio03_ConsultaMedica;

/* DROP DATABASE Exercicio03_ConsultaMedica; */

CREATE TABLE pessoa(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
cpf VARCHAR(14) NOT NULL,
rg VARCHAR(10) NOT NULL,
idade INT,
telefone VARCHAR(14),
situacao CHAR(1) NOT NULL

);

CREATE TABLE medico(
id_medico INT PRIMARY KEY AUTO_INCREMENT,
salario DECIMAL(10,2) NOT NULL,
crm VARCHAR(20) NOT NULL,
especialidade VARCHAR(40) NOT NULL,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)

);

CREATE TABLE paciente(
id_paciente INT PRIMARY KEY AUTO_INCREMENT,
plano_saude VARCHAR(40),
carteirinha INT,
situacao CHAR(1) NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY(id_pessoa) REFERENCES pessoa(id_pessoa)

);

CREATE TABLE consulta(
id_consulta INT PRIMARY KEY AUTO_INCREMENT,
agendamento DATETIME NOT NULL
,status_consulta VARCHAR(15)NOT NULL
,data_final_consulta DATETIME,
id_medico INT NOT NULL,
id_paciente INT NOT NULL,
FOREIGN KEY(id_medico)REFERENCES medico(id_medico),
FOREIGN KEY(id_paciente)REFERENCES paciente(id_paciente)

);

----------------------------------------------------------------------------------------------------------
SELECT * FROM pessoa;

INSERT INTO pessoa(nome,cpf,rg,idade,telefone,situacao)
VALUES('Barbara','5156156189','21556156',35,'(61)1561561','A'),
('Marcos','54565464','98797',35,'(61)89456456','A'),
('Andreia','778978945','98796634',37,'(61)9161651','A'),
('Adriano','8897897','4564564',19,'(61)7121623','A'),
('Paulo','9634234','97897564',28,'(61)76126','A'),
('Victor','3456464','648787',34,'(61)894651','A'),
('Ana Maria','978978954','78973645',41,'(61)811156','A'),
('Maria Braga','4789754','9789678',47,'(61)8465156','A');
SELECT * FROM medico;

INSERT INTO medico(salario,crm,especialidade,situacao,id_pessoa)
VALUES(8500.90,'CR5565456','Pediatra','A',9),
(10000,'CR85455','Clinico Geral','A',10),
(7500,'CR5643','Cardiologia','A',11),
(9500,'CR87644','Dermatologia','A',12);
SELECT * FROM paciente;

INSERT INTO paciente(plano_saude,carteirinha,situacao,id_pessoa)
VALUES('Bradesco',1231561,'P',13),
('Caixa Saude',845665,'A',14),
('Amil',897789,'A',15),
('UniMed',745646,'A','16');

SELECT * FROM consulta;

INSERT INTO consulta(agendamento,status_consulta,data_final_consulta,id_medico,id_paciente)
VALUES('2025-03-13 17:00:00','Agendado',null,1,1),
('2025-01-02 18:30:00','Finalizado','2025-01-02 23:58:00',2,2),
('2025-03-02 05:30:00','Agendado',null,3,3),
('2025-02-27 12:30:00','Finalizado','2025-02-27 13:30:00',4,4);

SELECT * FROM consulta;#Nome do medico/Espec/

SELECT
c.id_consulta,
p.nome AS medico,
p2.nome AS paciente,
c.agendamento,
c.data_final_consulta,
c.status_consulta,
m.especialidade

/* INNER JOIN é um relatório */


FROM consulta c
INNER JOIN medico m ON m.id_medico = c.id_medico
INNER JOIN pessoa p ON p.id_pessoa = m.id_pessoa
INNER JOIN paciente pc ON pc.id_paciente = c.id_paciente
INNER JOIN pessoa p2 ON p2.id_pessoa = pc.id_pessoa;


SELECT  

p.nome,
m.especialidade,
m.crm

FROM medico m

INNER JOIN pessoa p ON p.id_pessoa = m.id_pessoa;


/* Hugo trabalha em uma empresa que realiza consultas medicas, na parte da TI, seu chefe pediu um relatório com os dados:
Agendamento da consulta
Status da Consulta
Especialidade do Médico
CRM
Nome do Médico
Telefone do Médico */



SELECT

pm.nome AS Nome_Medico
,pp.nome  AS Nome_Paciente
,pm.telefone
,m.crm
,m.especialidade
,c.status_consulta
,c.agendamento

FROM consulta c

INNER JOIN medico m ON c.id_medico = m.id_medico
INNER JOIN pessoa pm ON m.id_pessoa = pm.id_pessoa
INNER JOIN paciente pc ON  pc.id_paciente = c.id_paciente
INNER JOIN pessoa pp ON pc.id_pessoa = pp.id_pessoa

