-- Criando a DataBase.
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- Criando a Tabela de Categorias.
CREATE TABLE tb_categorias (
id_categoria BIGINT AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(100) NOT NULL,
tamanho_padrao VARCHAR(20) NOT NULL,
PRIMARY KEY (id_categoria)
);

-- Criando a Tabela de Pizzas.
CREATE TABLE tb_pizzas (
id_pizza BIGINT AUTO_INCREMENT,
nome VARCHAR(80) NOT NULL,
ingredientes VARCHAR(255) NOT NULL,
tamanho VARCHAR (20) NOT NULL,
valor DECIMAL(6, 2) NOT NULL,
borda_recheada BOOLEAN NOT NULL,
categoria_id BIGINT NOT NULL,
PRIMARY KEY (id_pizza),
CONSTRAINT fk_pizzas_categorias
	FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id_categoria)
);

-- Inserindo Dados em Categorias.
INSERT INTO tb_categorias (nome, descricao, tamanho_padrao) VALUES
('Tradicional', 'Pizzas Salgadas Clássicas', 'Grande'),
('Especial', 'Combinações Premium e Ingredientes Especiais', 'Grande'),
('Vegetariana', 'Sem carnes, foco em Legumes e Queijos', 'Média'),
('Doce', 'Pizzas com Chocolate, Frutas e Doces', 'Média'),
('Vegana', 'Sem Ingredientes de Origem Animal', 'Média');

-- Inserindo dados em Pizzas.
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, valor, borda_recheada, categoria_id) VALUES
('Mussarela', 'Mussarela, Molho de Tomate, Orégano', 'Grande', 44.90, 0, 1),
('Calabresa', 'Calabresa, Cebola, Mussarela, Molho, Orégano', 'Grande', 49.90, 1, 1),
('Margherita', 'Mussarela, Tomate, Manjericão, Molho', 'Grande', 52.00, 0, 1),
('Frango com Catupiry', 'Frango, Catupiry, Milho, Mussarela, Molho', 'Grande', 59.90, 1, 2),
('Quatro Queijos', 'Mussarela, Gorgonzola, Parmesão, Provolone', 'Grande', 64.90, 0, 2),
('Vegetariana Suprema', 'Pimentão, Cebola, Champignon, Azeitona, Tomate, Mussarela', 'Média', 54.90, 0, 3),
('Chocolate com Morango', 'Chocolate, Morango, Leite Condensado', 'Média', 55.00, 0, 4),
('Vegana de Palmito', 'Palmito, Tomate, Azeitona, Cebola, Molho', 'Média', 47.50, 0, 5);

-- Filtro: Valores de Pizza que são maiores que R$ 45.
SELECT * FROM tb_pizzas
WHERE valor > 45.00;

-- Filtro: Valores de Pizza que estão entre  R$ 50 a R$ 100.
SELECT * FROM tb_pizzas
WHERE valor BETWEEN 50.00 AND 100.00;

-- Filtro: Mostrar Pizzas que possuem a letra M no nome (em qualquer parte da composição).
SELECT * FROM tb_pizzas
WHERE nome LIKE '%M%';

-- Filtro: Mostrar a composição da Tabela de Pizzas integrada a tabela de Categoria.
SELECT
      p.id_pizza,
      p.nome,
      p.ingredientes,
      p.tamanho,
      p.valor,
      p.borda_recheada,
      c.nome AS categoria,
      c.descricao,
      c.tamanho_padrao
FROM tb_pizzas p
INNER JOIN tb_categorias c
ON p.categoria_id = c.id_categoria;

-- Filtro: Mostrar uma busca de Sabores de Pizza categorizadas como Doce.
SELECT
      p.id_pizza,
      p.nome,
      p.ingredientes,
      p.tamanho,
      p.valor,
      c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c
ON p.categoria_id = c.id_Categoria
WHERE c.nome = 'Doce';          