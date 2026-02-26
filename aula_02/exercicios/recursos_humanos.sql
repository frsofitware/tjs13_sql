-- Criando a DataBase.
CREATE DATABASE db_recursos_humanos;

-- Selecionando ela (database) como base de uso.
USE db_recursos_humanos;

-- Estruturando em: registro, nome, cargo, salário e senioridade.
CREATE TABLE tb_colaboradores(
registro BIGINT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(120) NOT NULL,
cargo VARCHAR(80) NOT NULL,
salario DECIMAL (10, 2) NOT NULL,
senioridade VARCHAR (80) NOT NULL
);

-- Atualização de verificação de valor de salário positivo inserido na tabela.
ALTER TABLE tb_colaboradores
ADD CONSTRAINT chk_salario_positivo CHECK (salario > 0);

-- Inserindo os Dados para manipulação.
INSERT INTO tb_colaboradores (nome, cargo, salario, senioridade) VALUES
("Ana Souza", "Estagiária de RH", 1300.00,"Pleno"),
("Bruno Martins", "Jovem Aprendiz Administrativo", 780.00, "Aprendiz"),
("Carla Mendes", "Analista de Suporte (Help Desk)", 2200.00, "Júnior"),
("Diego Alves", "Atendente de Suporte N1", 1800.00,"Júnior"),
("Fernanda Costa", "Assistente Financeiro", 2600.00, "Júnior"),
("Gustavo Rocha", "Analista de Dados", 7500.00, "Pleno"),
("Juliana Pereira", "UX/UI Designer", 6500.00, "Pleno"),
("Lucas Ribeiro", "CTO (Diretor de Tecnologia)", 38000.00, "Executivo")
;

-- Visualização da DataBase construída.
SELECT * FROM tb_colaboradores;

-- Visualização a partir dos colaboradores com salário maior que R$ 2.000.
SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

-- Visualização a partir dos colaboradores com salário menor que R$ 2.000.
SELECT * FROM tb_colaboradores WHERE salario < 2000.00;

-- Atualização da colaboradora Carla Mendes por cargo e salário (promoção de Júnior para Pleno).
UPDATE tb_colaboradores
SET cargo = "Analista de Suporte",
    salario = 3200.00,
    senioridade = "Pleno"
WHERE registro = 3;

-- Visualização estatística por total de funcionários, media de salário, maior salário e menor salário.
SELECT
    COUNT(*) AS total_funcionários,
    AVG(salario) AS salario_medio,
    MAX(salario) AS maior_salario,
    MIN(salario) AS menor_salario
FROM tb_colaboradores;

-- Visualização estatística por total de funcionários, media de salário, maior salário e menor salário.
SELECT
      senioridade,
      COUNT(*) AS quantidade,
      AVG(salario) AS media_salarial
FROM tb_colaboradores
GROUP BY senioridade;

-- Estruturação de relatório de informações dos colaboradores + visualização de Salário Anual.
CREATE VIEW vw_relatorio_salarios AS
SELECT 
      nome,
      cargo,
      senioridade,
      salario,
      salario * 12 AS salario_anual
FROM tb_colaboradores;

-- Visualização de relatório criado com informações dos colaboradores.
SELECT * FROM vw_relatorio_salarios;