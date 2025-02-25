CREATE DATABASE sistemaVenda2;
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