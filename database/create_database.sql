-- ============================================================
-- Projeto: Help Desk Ticket Analysis
-- Arquivo: create_database.sql
-- Autor: Jhonatan Silva Oliveira
-- Descrição: Estrutura do banco de dados fictício utilizado
-- para análise de chamados de suporte técnico.
-- ============================================================

CREATE DATABASE IF NOT EXISTS helpdesk_db;

USE helpdesk_db;

-- ============================================================
-- Tabela de usuários
-- ============================================================

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

-- ============================================================
-- Tabela de técnicos
-- ============================================================

CREATE TABLE tecnicos (
    id_tecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nivel VARCHAR(20) NOT NULL
);

-- ============================================================
-- Tabela de categorias de atendimento
-- ============================================================

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

-- ============================================================
-- Tabela principal de chamados
-- ============================================================

CREATE TABLE chamados (
    id_chamado INT PRIMARY KEY AUTO_INCREMENT,

    id_usuario INT NOT NULL,
    id_tecnico INT,
    id_categoria INT NOT NULL,

    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,

    prioridade ENUM(
        'Baixa',
        'Media',
        'Alta',
        'Critica'
    ) NOT NULL,

    status_chamado ENUM(
        'Aberto',
        'Em atendimento',
        'Aguardando usuario',
        'Resolvido',
        'Fechado'
    ) NOT NULL DEFAULT 'Aberto',

    data_abertura DATETIME NOT NULL,
    prazo_sla DATETIME NOT NULL,
    data_resolucao DATETIME,

    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario),

    FOREIGN KEY (id_tecnico)
        REFERENCES tecnicos(id_tecnico),

    FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);
