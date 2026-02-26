CREATE DATABASE db_quitanda;

USE db_quitanda;

CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT, 
nome varchar(255) NOT NULL, 
quantidade int, 
data_validade date,
preco decimal NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES ("tomate", 1000, "2026-03-24", 8.99);

SELECT * FROM tb_produtos;

UPDATE tb_produtos SET preco = 8.99 WHERE id = 1;

ALTER TABLE tb_produtos MODIFY preco decimal(6, 2);

INSERT INTO tb_produtos(nome, quantidade, data_validade, preco)
VALUES ("banana", 15000, "2026-03-04", 12.50),
("morango", 5000, "2026-03-14", 22.00),
("alface", 500, "2026-03-01", 6.50),
("beterraba", 4000, "2026-03-24", 9.50)
;

DELETE FROM tb_produtos WHERE id = 6;

SELECT * FROM  tb_produtos WHERE id = 2;

SELECT * FROM  tb_produtos WHERE preco > 10.00;

SELECT * FROM  tb_produtos WHERE nome = "banana" OR preco > 10.00;

SELECT * FROM  tb_produtos WHERE nome = "banana" AND preco = 12.50;

SELECT * FROM  tb_produtos WHERE nome != "banana";

SELECT nome, 
	DATE_FORMAT(data_validade, '%d%m%Y') AS Data_Validade,
    CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco 
FROM tb_produtos;


ALTER TABLE tb_produtos ADD drescricao varchar(500);

ALTER TABLE tb_produtos CHANGE drescricao descricao_produto varchar(500);

-- SET SQL_SAFE_UPDATES = 0; PARA TIRAR A TRAVA DO WHERE NO UPDATE