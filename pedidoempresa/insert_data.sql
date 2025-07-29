USE pedidoempresa;

-- Inserir categorias
INSERT INTO categoria (descricao) VALUES
('Eletrônicos'),
('Roupas'),
('Alimentos');

-- Inserir UFs
INSERT INTO uf (sigla, descricao) VALUES
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro');

-- Inserir cidades
INSERT INTO cidade (id_uf, descricao) VALUES
(1, 'São Paulo'),
(2, 'Rio de Janeiro');

-- Inserir produtos
INSERT INTO produtos (descricao, id_categoria, preco_unitario, quantidade_estoque, observacoes) VALUES
('Notebook Dell', 1, 3500.00, 10, '15 polegadas'),
('Camiseta Polo', 2, 79.90, 50, 'Tamanho M'),
('Chocolate Nestlé', 3, 5.50, 200, NULL);

-- Inserir clientes
INSERT INTO clientes (nome_completo, cpf_cnpj, telefone, email, endereco, id_uf, id_cidade, cep) VALUES
('Maria Silva', '12345678901', '11999999999', 'maria@email.com', 'Rua A, 123', 1, 1, '01000-000'),
('João Souza', '98765432100', '21988888888', 'joao@email.com', 'Av. B, 456', 2, 2, '20000-000');

-- Inserir pedidos
INSERT INTO pedidos (id_cliente, data_pedido, total_pedido) VALUES
(1, '2025-07-29', 3580.00),
(2, '2025-07-29', 159.80);

-- Inserir pedidos_produtos
INSERT INTO pedidos_produtos (id_pedido, id_produto, referencia, descricao, quantidade, valor_unitario, valor_total) VALUES
(1, 1, 'REF001', 'Notebook Dell', 1, 3500.00, 3500.00),
(1, 3, 'REF002', 'Chocolate Nestlé', 10, 8.00, 80.00),
(2, 2, 'REF003', 'Camiseta Polo', 2, 79.90, 159.80);
