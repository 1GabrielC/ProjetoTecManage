-- Criação do banco de dados

USE projetotecmanage;

-- Tabela de Laboratórios
CREATE TABLE LABORATORIO (
    laboratorio_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(100),
    data_entrada_pecas DATE,
    quantidade_total_pecas INT DEFAULT 0
);

SELECT * FROM LABORATORIO;


-- Tabela de Máquinas
CREATE TABLE MAQUINA (
    maquina_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpu VARCHAR(50),
    ram VARCHAR(50),
    armazenamento VARCHAR(50),
    status ENUM('funcionando', 'em manutenção', 'fora de uso') NOT NULL DEFAULT 'funcionando',
    laboratorio_id INT,
    FOREIGN KEY (laboratorio_id) REFERENCES LABORATORIO(laboratorio_id) ON DELETE SET NULL
);

SELECT * FROM MAQUINA;

-- Tabela de Peças
CREATE TABLE PECAS (
    peca_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    fabricante VARCHAR(50),
    quantidade_estoque INT NOT NULL DEFAULT 0
);

-- Tabela de Consertos
CREATE TABLE CONSERTO (
    conserto_id INT AUTO_INCREMENT PRIMARY KEY,
    maquina_id INT NOT NULL,
    data DATE NOT NULL,
    tipo ENUM('corretiva', 'preventiva') NOT NULL,
    descricao TEXT,
    FOREIGN KEY (maquina_id) REFERENCES MAQUINA(maquina_id) ON DELETE CASCADE
);

-- Tabela de Manutenção
CREATE TABLE MANUTENCAO (
    manutencao_id INT AUTO_INCREMENT PRIMARY KEY,
    maquina_id INT NOT NULL,
    data_manutencao DATE NOT NULL,
    tipo ENUM('corretiva', 'preventiva') NOT NULL,
    descricao TEXT,
    FOREIGN KEY (maquina_id) REFERENCES MAQUINA(maquina_id) ON DELETE CASCADE
);

-- Tabela de Usuários
CREATE TABLE USUARIO (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_usuario ENUM('técnico', 'administrador') NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL -- Armazenar hash da senha
);

-- Tabela de Logs de Ações
CREATE TABLE LOG_ACOES (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    data_acao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao_acao TEXT,
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(usuario_id) ON DELETE CASCADE
);

-- Tabela de Agendamentos de Manutenção
CREATE TABLE AGENDA_MANUTENCAO (
    agenda_id INT AUTO_INCREMENT PRIMARY KEY,
    maquina_id INT NOT NULL,
    data_agendada DATE NOT NULL,
    descricao TEXT,
    FOREIGN KEY (maquina_id) REFERENCES MAQUINA(maquina_id) ON DELETE CASCADE
);

-- Relacionamento entre Consertos e Peças (consertos utilizam peças)
CREATE TABLE CONSERTO_PECAS (
    conserto_id INT NOT NULL,
    peca_id INT NOT NULL,
    quantidade_usada INT NOT NULL DEFAULT 1,
    FOREIGN KEY (conserto_id) REFERENCES CONSERTO(conserto_id) ON DELETE CASCADE,
    FOREIGN KEY (peca_id) REFERENCES PECAS(peca_id) ON DELETE CASCADE,
    PRIMARY KEY (conserto_id, peca_id)
);

CREATE TABLE USUARIO (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_usuario ENUM('técnico', 'administrador') NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL -- Armazenar hash da senha
);

INSERT INTO USUARIO (nome, tipo_usuario, login, senha) 
VALUES ('João da Silva', 'administrador', 'root', 'root');

SELECT * FROM USUARIO;



