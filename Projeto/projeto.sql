# ------------ Comandos DDL ------------
DROP schema IF EXISTS projeto;
create schema projeto;
use projeto;

# -- Criação da tabela Produto
CREATE TABLE Produto (
    produtoID INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    quantidadeEstoque INT
);

# -- Criação da tabela Categoria
CREATE TABLE Categoria (
    categoriaID INT PRIMARY KEY,
    nomeCategoria VARCHAR(50)
);

# -- Criação da tabela ProdutoCategoria (relacionamento N para M entre Produto e Categoria)
CREATE TABLE ProdutoCategoria (
    produtoID INT,
    categoriaID INT,
    PRIMARY KEY (produtoID, categoriaID),
    FOREIGN KEY (produtoID) REFERENCES Produto(produtoID),
    FOREIGN KEY (categoriaID) REFERENCES Categoria(categoriaID)
);

# -- Criação da tabela Cliente
CREATE TABLE Cliente (
    clienteID INT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(100)
);

# -- Criação da tabela DetalhesCliente (relacionamento 1 para 1 com Cliente)
CREATE TABLE DetalhesCliente (
    clienteID INT PRIMARY KEY,
    endereco VARCHAR(255),
    numeroTelefone VARCHAR(20),
    FOREIGN KEY (clienteID) REFERENCES Cliente(clienteID)
);

# -- Criação da tabela Pedido
CREATE TABLE Pedido (
    pedidoID INT PRIMARY KEY,
    clienteID INT,
    dataPedido DATE,
    status VARCHAR(20),
    FOREIGN KEY (clienteID) REFERENCES Cliente(clienteID)
);

# -- Criação da tabela ItemPedido (relacionamento 1 para N "Pedido -> Produto")
CREATE TABLE ItemPedido (
    itemID INT PRIMARY KEY,
    pedidoID INT,
    produtoID INT,
    quantidade INT,
    precoUnitario DECIMAL(10, 2),
    FOREIGN KEY (pedidoID) REFERENCES Pedido(pedidoID),
    FOREIGN KEY (produtoID) REFERENCES Produto(produtoID)
);

# ------------ Comandos DML ------------
-- Create
INSERT INTO Produto (produtoID, nome, preco, quantidadeEstoque)
VALUES (1, 'Celular', 999.99, 50);

-- Read
SELECT * FROM Produto;

-- Update
UPDATE Produto
SET preco = 899.99
WHERE produtoID = 1;

-- Delete
DELETE FROM Produto
WHERE produtoID = 1;