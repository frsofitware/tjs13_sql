-- Criando a DataBase.
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- Criando a Tabela de Classes.
CREATE TABLE tb_classes(
id_classe BIGINT AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
tipo_dano VARCHAR(20) NOT NULL,
arma_preferida VARCHAR(30) NOT NULL,
PRIMARY KEY (id_classe)
);

-- Criando a Tabela de Personagens.
CREATE TABLE tb_personagens (
id_personagem bigint AUTO_INCREMENT,
nome VARCHAR(80) NOT NULL,
raca VARCHAR(40) NOT NULL,
poder_ataque INT NOT NULL,
poder_defesa INT NOT NULL,
nivel INT NOT NULL,
classe_id bigint NOT NULL,
PRIMARY KEY (id_personagem),
CONSTRAINT fk_personagens_classes
   FOREIGN KEY (classe_id) REFERENCES tb_classes(id_classe)
);

-- Inserindo dados na Tabela Classes.
INSERT INTO tb_classes (nome,tipo_dano, arma_preferida) VALUES
('Guerreiro', 'Físico', 'Espada Longa'),
('Mago', 'Mágico', 'Cajado'),
('Ladino', 'Físico','Adagas'),
('Clérigo', 'Híbrido', 'Maça'),
('Arqueiro', 'Físico', 'Arco Longo');

-- Inserindo Dados na Tabela de Personagens.
INSERT INTO tb_personagens (nome, raca, poder_ataque, poder_defesa, nivel, classe_id) VALUES
('Lae''zel', 'Githyanki', '2400', 1600, 8, 1),
('Gale', 'Humano', 2600, 1100, 8, 2),
('Astarion', 'Elfo', 2100, 1200, 8, 3),
('Shadowheart', 'Meio-Elfo', 1900, 1800, 8, 4),
('Wyll', 'Humano', 2050, 1400, 8, 5),
('Karlach', 'Tiefling', 2800, 2000, 8, 1),
('Minthara', 'Drow', 1950, 1700, 8, 4),
('Isobel', 'Meio-Elfo', '2000', 1900, 9, 4);

-- Filtro: Selecionando Personagens que tem o Poder de Ataque maior que 2000.
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- Filtro: Selecionando Personagens que tem o Poder de Defesa entre 1000 e 2000.
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Filtro: Selecionando Personagens que tem a letra C entre a composição.
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- Une personagens com as Classes em uma Visualização.
SELECT
      p.id_personagem,
      p.nome,
      p.raca,
      p.poder_ataque,
      p.poder_defesa,
      p.nivel,
      c.nome AS classe,
      c.tipo_dano,
      c.arma_preferida
FROM tb_personagens p 
INNER JOIN tb_classes c 
ON p.classe_id = c.id_classe;

-- Une as Tabelas de Personagem e Classe e aplica um Filtro onde só aparece quem está marcado como Arqueiro.
SELECT
      p.id_personagem,
      p.nome,
      p.raca,
      p.poder_ataque,
      p.poder_defesa,
      p.nivel,
      c.nome AS classe 
FROM tb_personagens p 
INNER JOIN tb_classes c
ON p.classe_id = c.id_classe
WHERE c.nome = 'Arqueiro';