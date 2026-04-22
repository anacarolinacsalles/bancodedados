CREATE TABLE Pessoa (
    id_pessoa INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    rua VARCHAR(120) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    cep CHAR(8) NOT NULL,
    CHECK (CHAR_LENGTH(cep) = 8)
);

CREATE TABLE Telefone (
    id_pessoa INT NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_pessoa, telefone),
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa),
    CHECK (CHAR_LENGTH(telefone) >= 10)
);

CREATE TABLE Cliente (
    id_pessoa INT PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    data_cadastro DATE NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa),
    CHECK (CHAR_LENGTH(cpf) = 11)
);

CREATE TABLE Artista (
    id_pessoa INT PRIMARY KEY,
    nome_artistico VARCHAR(120) NOT NULL,
    estilo_musical_1 VARCHAR(60) NOT NULL,
    estilo_musical_2 VARCHAR(60),
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa)
);

CREATE TABLE Evento (
    id_evento INT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    data DATE NOT NULL,
    local VARCHAR(150) NOT NULL,
    capacidade_total INT NOT NULL,
    CHECK (capacidade_total > 0)
);

CREATE TABLE Setor (
    id_setor INT PRIMARY KEY,
    nome_setor VARCHAR(80) NOT NULL,
    capacidade INT NOT NULL,
    preco_base NUMERIC(10,2) NOT NULL,
    id_evento INT NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    CHECK (capacidade > 0),
    CHECK (preco_base >= 0)
);

CREATE TABLE Apresentacao (
    id_apresentacao INT PRIMARY KEY,
    horario_inicio VARCHAR(5) NOT NULL,
    duracao INT NOT NULL,
    palco VARCHAR(50) NOT NULL,
    id_evento INT NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    CHECK (duracao > 0)
);

CREATE TABLE Compra (
    id_compra INT PRIMARY KEY,
    data_compra DATE NOT NULL,
    valor_compra NUMERIC(10,2) NOT NULL,
    canal_vendas VARCHAR(50) NOT NULL,
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Cliente(id_pessoa),
    CHECK (valor_compra >= 0),
    CHECK (canal_vendas IN ('Online', 'Bilheteria', 'App'))
);

CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    metodo VARCHAR(30) NOT NULL,
    status VARCHAR(30) NOT NULL,
    data_pagamento DATE NOT NULL,
    valor_pago NUMERIC(10,2) NOT NULL,
    id_compra INT NOT NULL UNIQUE,
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
    CHECK (valor_pago >= 0),
    CHECK (metodo IN ('Cartao', 'Pix', 'Boleto', 'Dinheiro')),
    CHECK (status IN ('Pendente', 'Aprovado', 'Cancelado'))
);

CREATE TABLE Ingresso (
    id_ingresso INT PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL,
    valor_final NUMERIC(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL,
    id_setor INT NOT NULL,
    id_compra INT NOT NULL,
    FOREIGN KEY (id_setor) REFERENCES Setor(id_setor),
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
    CHECK (valor_final >= 0),
    CHECK (tipo IN ('Inteira', 'Meia', 'VIP', 'Camarote')),
    CHECK (status IN ('Valido', 'Cancelado', 'Utilizado'))
);

CREATE TABLE Participa (
    id_pessoa INT NOT NULL,
    id_evento INT NOT NULL,
    data_presenca DATE NOT NULL,
    avaliacao INT,
    PRIMARY KEY (id_pessoa, id_evento),
    FOREIGN KEY (id_pessoa) REFERENCES Cliente(id_pessoa),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento),
    CHECK (avaliacao IS NULL OR (avaliacao BETWEEN 1 AND 5))
);

CREATE TABLE Apresenta (
    id_pessoa INT NOT NULL,
    id_apresentacao INT NOT NULL,
    PRIMARY KEY (id_pessoa, id_apresentacao),
    FOREIGN KEY (id_pessoa) REFERENCES Artista(id_pessoa),
    FOREIGN KEY (id_apresentacao) REFERENCES Apresentacao(id_apresentacao)
);