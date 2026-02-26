-- Criando a DataBase.
CREATE DATABASE db_sakura_glitch;
USE db_sakura_glitch;

-- Estruturando em: id, nome, plataforma, entrega, tipo de conteúdo, edição, categoria de gênero, preço, estoque e uma classe de preço.
CREATE TABLE tb_produtos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    plataforma ENUM('PC', 'PS5', 'Xbox Series', 'Nintendo Switch') NOT NULL,
    entrega ENUM('Física', 'Digital') NOT NULL,
    tipo_conteudo ENUM('Jogo Base', 'DLC', 'Expansão', 'Passe de Batalha') NOT NULL,
    edicao ENUM('Standard', 'Deluxe', 'Collector', 'Definitive') DEFAULT 'Standard',
    categoria_genero VARCHAR(50),
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    classe_preco VARCHAR(20) AS (CASE WHEN preco >= 500 THEN 'Premium' ELSE 'Comum' END)
);

-- Entrada do Registro de Estoque de Jogos.
INSERT INTO tb_produtos (nome, plataforma, entrega, tipo_conteudo, edicao, categoria_genero, preco, estoque) VALUES
('Resident Evil Requiem', 'PS5', 'Física', 'Jogo Base', 'Collector', 'Survival Horror', 1499.00, 2),
('Baldur\'s Gate 3', 'PS5', 'Física', 'Jogo Base', 'Deluxe', 'RPG', 649.90, 5),
('Final Fantasy VII Rebirth', 'PS5', 'Física', 'Jogo Base', 'Deluxe', 'JRPG', 599.00, 8),
('Elden Ring: Shadow of the Erdtree', 'PC', 'Física', 'Expansão', 'Collector', 'Soulslike', 520.00, 4),
('The Sims 4: Expansão Rural', 'PC', 'Digital', 'Expansão', 'Standard', 'Simulação', 199.00, 50),
('Stardew Valley', 'PC', 'Digital', 'Jogo Base', 'Standard', 'Cozy Game', 24.99, 100),
('Resident Evil 4: Separate Ways', 'PC', 'Digital', 'DLC', 'Standard', 'Survival Horror', 49.90, 200),
('The Last of Us Part II Remastered', 'PS5', 'Física', 'Jogo Base', 'Standard', 'Ação/Drama', 249.00, 10),
('Final Fantasy XVI', 'PS5', 'Digital', 'Jogo Base', 'Standard', 'Action RPG', 310.00, 15),
('Tactics Ogre: Reborn', 'Nintendo Switch', 'Física', 'Jogo Base', 'Standard', 'Estratégia Tática', 220.00, 6);

-- Visualização a partir de valor atribuido.
SELECT * FROM tb_produtos WHERE preco > 500;
SELECT * FROM tb_produtos WHERE preco < 500;

-- Visão de Vitrine: Nome, Plataforma e Edição.
SELECT nome, edicao, plataforma, entrega, CONCAT('R$ ', preco) as Preco 
FROM tb_produtos 
ORDER BY preco DESC;

-- Filtro para Buscar apenas Conteúdos Adicionais (DLCs e Expansões).
SELECT nome, tipo_conteudo, preco 
FROM tb_produtos 
WHERE tipo_conteudo IN ('DLC', 'Expansão');

-- Visualizar o Valor Total em estoque por Edição.
SELECT 
    edicao, 
    COUNT(*) AS qtd_titulos, 
    CONCAT('R$ ', FORMAT(SUM(preco * estoque), 2, 'pt_BR')) AS total_patrimonio
FROM tb_produtos 
GROUP BY edicao;

-- Atualização de valor e modelo.
UPDATE tb_produtos 
SET 
    edicao = 'Definitive',
    preco = 349.90,
    estoque = 3
WHERE id = 2 AND plataforma = 'PS5';

-- Verificando as alterações feitas.
SELECT nome, plataforma, edicao, preco, estoque, classe_preco
FROM tb_produtos
WHERE nome = "Baldur's Gate 3";
