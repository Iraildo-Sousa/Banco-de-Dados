	CREATE DATABASE sistemaVenda;
    USE sistemaVenda;
    
    CREATE TABLE pessoa(
    
		idPessoa INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(50) NOT NULL,
		cpf VARCHAR(15) NOT NULL,
        telefone VARCHAR(15), 
        email VARCHAR(50), 
        situacao CHAR(1) NOT NULL
        
    );
    
    CREATE TABLE cliente(
    
		idCliente INT PRIMARY KEY AUTO_INCREMENT, 
        fidelidade VARCHAR(30),
        desconto DECIMAL(10,2),
        situacao CHAR(1),
        idPessoa INT UNIQUE NOT NULL,
        FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)
    
    );
    
    CREATE TABLE vendedor(
    
		idVendedor INT PRIMARY KEY AUTO_INCREMENT,
		salario DECIMAL(10,2) NOT NULL, 
        matricula VARCHAR(30) NOT NULL, 
        situacao CHAR(1) NOT NULL, 
        idPessoa INT NOT NULL,
        FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)
    );
    

    
    CREATE TABLE venda(
    
		idVenda INT PRIMARY KEY AUTO_INCREMENT,
        dataCompra DATETIME DEFAULT CURRENT_TIMESTAMP,
        valorTotal DECIMAL(10,2) NOT NULL, 
        desconto DECIMAL(10,2),
        acrescimo DECIMAL(10,2),
        numeroPedido INT NOT NULL,
        cancelado CHAR(2),
        idFormaPagamento INT NOT NULL,
        idCliente INT NOT NULL,
        idVendedor INT NOT NULL,
        
        FOREIGN KEY (idFormaPagamento) REFERENCES formaPagamento(idFormaPagamento),
        FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
        FOREIGN KEY (idVendedor) REFERENCES vendedor(idVendedor)
    
    );
    
    CREATE TABLE produto(
    
		idProduto INT PRIMARY KEY AUTO_INCREMENT,
        denominacao VARCHAR(50) NOT NULL,
        quantidadeEstoque INT NOT NULL,
        preco DECIMAL(10,2),
        situacao CHAR(1)
    
    );
    
    CREATE TABLE itensVenda(
    
		idItensVenda INT PRIMARY KEY AUTO_INCREMENT,
        desconto DECIMAL(10,2),
        acrescimo DECIMAL(10,2),
        quantidade INT NOT NULL,
        preco DECIMAL(10,2) NOT NULL,
        valorTotal DECIMAL(10,2) NOT NULL,
        cancelado CHAR(1),
        idProduto INT NOT NULL,
        idVenda INT NOT NULL,
    
		FOREIGN KEY (idProduto) REFERENCES produto(idProduto),
        FOREIGN KEY (idVenda) REFERENCES venda(idVenda)
    
    );
    
    DROP TABLE endereco; 
    
    CREATE TABLE endereco(
    
		idEndereco INT PRIMARY KEY AUTO_INCREMENT,
        rua VARCHAR(15), 
        bairro VARCHAR(15) NOT NULL,
		cidade VARCHAR(15) NOT NULL,
        uf CHAR(2) NOT NULL,
        cep VARCHAR(15) NOT NULL,
        situacao CHAR(1) NOT NULL,
        idPessoa INT NOT NULL,
        FOREIGN KEY (idPessoa) REFERENCES pessoa(idPessoa)
    
    );
    
    SELECT * FROM pessoa;
	SELECT * FROM cliente; 
    SELECT * FROM vendedor;
	SELECT * FROM formaPagamento;
    SELECT * FROM venda;
    SELECT * FROM produto;
    SELECT * FROM itensVenda;
	SELECT * FROM endereco;
    
    INSERT INTO pessoa(nome, cpf, telefone, email, situacao) /* continua na próxima linha */
    VALUES ('Hugo Lelis', '1234567894', '31545646', 'asddas@gmail.com', '1');

    INSERT INTO cliente(fidelidade, desconto, situacao, idPessoa)
    VALUES ('fiel', '50', 'A', 1);
    
    INSERT INTO vendedor(salario, matricula, situacao, idPessoa)
    VALUES (5000.00, '4562', 'A', 1);
    
    INSERT INTO formaPagamento(descricao, parcela, prazo, situacao)
    VALUES ('Carro para vender', 5, 5, 'A');
    
	INSERT INTO venda(valorTotal, desconto, acrescimo, numeroPedido, cancelado, idFormaPagamento, idCliente, idVendedor)
    VALUES (50, 5, 4, 54, 'n', 1, 1, 1);
    
    INSERT INTO produto(denominacao, quantidadeEstoque, preco, situacao)
    VALUES ('carro', 5, 50.0, 'D');
    
    INSERT INTO itensVenda(desconto, acrescimo, quantidade, preco, valorTotal, cancelado, idProduto, idVenda)
    VALUES (50.1, 2.1, 1, 456.20, 500.00, 'N', 1, 1);
    
    INSERT INTO endereco(rua, bairro, cidade, uf, cep, situacao, idPessoa)
    VALUES ('Constatino Neri', 'Santa Luzia', 'Acrilândia', 'AC', '33213030', 'A', 1);

    SELECT * FROM itensVenda;
    
    SELECT iv.desconto, iv.acrescimo 
    FROM itensVenda iv
    INNER JOIN produto pr ON pr.idProduto = iv.idProduto;
    
    
	UPDATE itensVenda SET valorTotal = ((preco*quantidade)-desconto+acrescimo) WHERE idItensVenda = 11