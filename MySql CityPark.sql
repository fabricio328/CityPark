
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nasc DATE NOT NULL,
    sexo CHAR(1),
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150),
    plano_vinc INT
);


CREATE TABLE Veiculo (
    placa VARCHAR(10) PRIMARY KEY,
    cor VARCHAR(20),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    id_cliente INT
);


CREATE TABLE Plano (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('semanal','mensal','anual') NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    forma_pagamento ENUM('dinheiro','cartao','pix') NOT NULL,
    placa VARCHAR(10)
);


CREATE TABLE Movimentacao (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10),
    data_entrada DATETIME NOT NULL,
    data_saida DATETIME,
    forma_pagamento ENUM('dinheiro','cartao','pix')
);


CREATE TABLE Vagas (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    status ENUM('livre','ocupada') NOT NULL
);

CREATE TABLE Historico (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10),
    data_entrada DATETIME NOT NULL,
    data_saida DATETIME,
    tipo_utilizacao ENUM('rotativo','plano') NOT NULL,
    id_plano INT,
    forma_pagamento ENUM('dinheiro','cartao','pix')
);




ALTER TABLE Veiculo
ADD CONSTRAINT fk_veiculo_cliente
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente);


ALTER TABLE Plano
ADD CONSTRAINT fk_plano_veiculo
FOREIGN KEY (placa) REFERENCES Veiculo(placa);


ALTER TABLE Movimentacao
ADD CONSTRAINT fk_movimentacao_veiculo
FOREIGN KEY (placa) REFERENCES Veiculo(placa);


ALTER TABLE Historico
ADD CONSTRAINT fk_historico_veiculo
FOREIGN KEY (placa) REFERENCES Veiculo(placa);


ALTER TABLE Historico
ADD CONSTRAINT fk_historico_plano
FOREIGN KEY (id_plano) REFERENCES Plano(id_plano);

