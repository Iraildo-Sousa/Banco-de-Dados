CREATE DATABASE 07_Exercicio_SQL_Empreiteira;
USE 07_Exercicio_SQL_Empreiteira;

#DROP TABLE pessoa;
CREATE TABLE pessoa(

	idPessoa INT PRIMARY KEY AUTO_INCREMENT
    ,nome VARCHAR(200) NOT NULL
    ,cnpjCpf VARCHAR(30) NOT NULL
    ,nomeFantasia VARCHAR(200) NOT NULL
    ,telefone CHAR(20)
    ,email VARCHAR(200)
    ,situacao CHAR(1) NOT NULL DEFAULT 'A'

);

	
CREATE TABLE endereco(

	idEndereco INT PRIMARY KEY AUTO_INCREMENT
    ,rua VARCHAR(40)
    ,cidade CHAR(40) NOT NULL
    ,uf CHAR(2) NOT NULL
    ,bairro CHAR(40)
    ,cep CHAR(10) NOT NULL
    ,situacao CHAR(1) NOT NULL DEFAULT 'A'

);


CREATE TABLE empreiteira(

	idEmpreiteira INT PRIMARY KEY AUTO_INCREMENT
    ,areaAtuacao VARCHAR(40) NOT NULL
    ,tipoContrato VARCHAR(40) NOT NULL
    ,situacao CHAR(1) NOT NULL DEFAULT 'A'
    ,idPessoa INT NOT NULL
    ,FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)

);


CREATE TABLE colaborador(

	idColaborador INT PRIMARY KEY AUTO_INCREMENT
    ,funcao VARCHAR(40) NOT NULL
    ,matricula VARCHAR(15) NOT NULL
    ,salario DECIMAL(10,2) NOT NULL
    ,tipoContrato VARCHAR(40) NOT NULL
    ,situacao CHAR(1) NOT NULL DEFAULT 'A'
    ,idPessoa INT NOT NULL
    ,FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)
 

);


CREATE TABLE projeto(

	idProjeto INT PRIMARY KEY AUTO_INCREMENT
    ,valor DECIMAL(10,2) NOT NULL
    ,tipoProjeto VARCHAR(40)
    ,nomeProjeto VARCHAR(200)
    ,dataInicio DATE
    ,previsao CHAR(8) NOT NULL
    ,dataFim DATE
    ,statusProjeto CHAR(1) NOT NULL DEFAULT 'A'
    ,idColaborador INT NOT NULL
    ,FOREIGN KEY (idColaborador) REFERENCES colaborador(idColaborador)

);

DROP TABLE obra;

CREATE TABLE obra(

	idObra INT PRIMARY KEY AUTO_INCREMENT
    ,valor DECIMAL(10,2)
    ,dataInicio DATE 
    ,previsao INT NOT NULL
    ,dataFim DATE 
    ,statusObra CHAR(1) NOT NULL DEFAULT 'A'
    ,idEmpreiteira INT NOT NULL
    ,idProjeto INT NOT NULL
    
    ,FOREIGN KEY (idEmpreiteira) REFERENCES empreiteira(idEmpreiteira)
    ,FOREIGN KEY (idProjeto) REFERENCES projeto(idProjeto)

);
	
    
CREATE TABLE canteiroObra(

	idCanteiroObra INT PRIMARY KEY AUTO_INCREMENT
    ,statusServico VARCHAR(40) NOT NULL
    ,idObra INT NOT NULL
	,idColaborador INT NOT NULL
    ,FOREIGN KEY (idColaborador) REFERENCES colaborador(idColaborador)
	,FOREIGN KEY (idObra) REFERENCES obra(idObra)

);

SELECT * FROM pessoa;
SELECT * FROM endereco;
SELECT * FROM empreiteira;
SELECT * FROM colaborador;
SELECT * FROM projeto;
SELECT * FROM obra;
SELECT * FROM canteiroObra;

INSERT INTO pessoa(nome, cnpjCpf, nomeFantasia, telefone, email)
VALUE('Ynayra Empreiteira Ltda', '17.376.634/0001-46', 'Ynayra Empreiteira', '(61) 99957-9733', 'ynayrayna@gmail.com'),
	 ('Hugo Empreiteira Ltda', '50.237.288/0001-90', 'Hugo Obras', '(61) 98113-0146', 'hugoempreiteiraltda@gmail.com'),
     ('André Sousa', '059.442.700-20', 'Andrezão', '(61) 98936-2168', 'andresousa1452@gmail.com'),
     ('Ybson Costa', '558.000.980-18','Ibsin', '(61) 96755-3516', 'ibsinybson@gmail.com'),
     ('Ana Empreiteira Ltda', '430.138.190-22', 'Ana Empreiteira', '(61) 97917-1027', 'anaempreiteira@gmail.com'),
    ('João Pereira', '123.456.789-10', 'JP', '(61) 98765-4321', 'joaopereira@gmail.com'),
    ('Maria Silva', '234.567.890-21', 'Silva Construções', '(61) 98876-5432', 'maria.silva@gmail.com'),
    ('Carlos Oliveira', '345.678.901-32', 'Carlos Obras', '(61) 97654-3210', 'carlos.oliveira@gmail.com'),
    ('Lucas Almeida', '456.789.012-43', 'Almeida Construtora', '(61) 96543-2109', 'lucasalmeida@gmail.com'),
    ('Fernanda Costa', '567.890.123-54', 'Costa Engenharia', '(61) 95432-1098', 'fernandacosta@gmail.com');

     
INSERT INTO endereco(rua, cidade, uf, bairro, cep)
VALUES
    ('Rua das Flores', 'Brasília', 'DF', 'Asa Sul', '70000-000'),
    ('Avenida das Nações', 'Brasília', 'DF', 'Asa Norte', '70020-000'),
    ('Quadra 104 Bloco C', 'Brasília', 'DF', 'Guará', '71000-000'),
    ('Avenida W3 Sul', 'Brasília', 'DF', 'Plano Piloto', '70300-000'),
    ('Quadra 307 Bloco F', 'Brasília', 'DF', 'Cruzeiro', '70610-000'),
    ('Rua 32 Norte', 'Brasília', 'DF', 'Águas Claras', '71950-000'),
    ('SCS QD 02 Bloco G', 'Brasília', 'DF', 'Setor Comercial Sul', '70309-000'),
    ('Qnd 36', 'Brasília', 'DF', 'Taguatinga', '72000-000'),
    ('SHCGN 710 Bloco C', 'Brasília', 'DF', 'Guará', '71200-000'),
    ('QNM 11 Bloco C', 'Brasília', 'DF', 'Ceilândia', '72200-000');

INSERT INTO empreiteira(areaAtuacao, tipoContrato, idPessoa)
VALUES
    ('Construção Civil', 'Contrato de Prestação de Serviço', 1),   -- Ynayra Empreiteira Ltda
    ('Obras Públicas', 'Contrato de Empreitada', 2),             -- Hugo Empreiteira Ltda
    ('Construção de Edifícios', 'Contrato de Empreitada', 4),    -- Ybson Costa
    ('Projetos e Construção', 'Contrato de Prestação de Serviço', 5); -- Ana Empreiteira Ltda
    
INSERT INTO colaborador(funcao, matricula, salario, tipoContrato, idPessoa)
VALUE 
	('Bombeiro Hidráulico', 'BOM456454', 4044.23, 'CLT', 5),
    ('Eletricista', 'ELE856568', 2366.02, 'CNPJ', 6),
    ('Arquiteto', 'ARQ75654', 3330.78, 'CNPJ', 7),
    ('Arquiteto', 'ARQ65354', 3330.78, 'CNPJ', 8),
    ('Pedreiro', 'PED452413', 2983.45, 'CLT', 9),
    ('Mestre de Obra', 'MES45847', 4007.03, 'CNPJ', 10);
 
INSERT INTO projeto(valor, tipoProjeto, nomeProjeto, dataInicio, previsao, dataFim, idColaborador)
VALUE
	(1478562.80, 'Escola Ensino Fundamental', 'Colégio Marista', '2025-01-10', 7, '2025-07-10', 3),
    (5854695.00, 'Escola Técnica e Ensino Médio', 'Senac', '2025-01-10', 8, '2025-08-10', 4),
    (400477.82, 'Escola Ensino Médio', 'Colégio Militar Dom Pedro II', '2025-01-10', 4, '2025-04-10', 3),
    (3854625.75, 'Escola Ensino Fundamental', 'Biângulo', '2025-01-10', 7, '2025-07-10', 4);
    
INSERT INTO obra(valor, dataInicio, previsao, dataFim, idEmpreiteira, idProjeto)
VALUE 
	(1478562.80, '2025-03-10', 7, '2025-09-10', 1, 1),
    (5854695.00, '2025-03-10', 8, '2025-10-10', 2, 2),
    (400477.82, '2025-03-10', 4, '2025-06-10', 3, 3),
    (3854625.75, '2025-03-10', 7, '2025-09-10', 4, 4);
    
INSERT INTO canteiroObra(statusServico, idObra, idColaborador)
VALUE('Em andamento', 1, 3),
	 ('Em análise', 2, 4),
     ('Em andamento,', 3, 3),
     ('Em andamento', 4, 4);
