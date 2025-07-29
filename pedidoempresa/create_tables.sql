-- Criar banco de dados
CREATE DATABASE pedidoempresa;
USE pedidoempresa;


CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);


CREATE TABLE uf (
    id_uf INT AUTO_INCREMENT PRIMARY KEY,
    sigla CHAR(2) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE cidade (
    id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    id_uf INT NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_uf) REFERENCES uf(id_uf)
);


CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(150) NOT NULL,
    id_categoria INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    observacoes TEXT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);


CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200),
    id_uf INT NOT NULL,
    id_cidade INT NOT NULL,
    cep VARCHAR(10),
    FOREIGN KEY (id_uf) REFERENCES uf(id_uf),
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);


CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    total_pedido DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


CREATE TABLE pedidos_produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    referencia VARCHAR(50),
    descricao VARCHAR(150),
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
