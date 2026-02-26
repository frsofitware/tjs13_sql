-- Criando a DataBase.
CREATE DATABASE db_escola;
USE db_escola;

-- Estruturando em: nome, turma, nota1, nota2, nota3, nota4 e media_final.
CREATE TABLE tb_registro_estudantes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    turma VARCHAR(50) NOT NULL,
    nota1 DECIMAL(3, 1) NOT NULL,
    nota2 DECIMAL(3, 1) NOT NULL,
    nota3 DECIMAL(3, 1) NOT NULL,
    nota4 DECIMAL(3, 1) NOT NULL,
    media_final DECIMAL(3, 1) AS ((nota1 + nota2 + nota3 + nota4) / 4),
    matricula_ativa BOOLEAN DEFAULT TRUE,
    CONSTRAINT chk_notas CHECK (nota1 <= 10 AND nota2 <= 10 AND nota3 <= 10 AND nota4 <= 10)
);

-- Inserção de Registros dos Alunos.
INSERT INTO tb_registro_estudantes (nome, turma, nota1, nota2, nota3, nota4) VALUES
('Sofia Sabrina', '3º Ano A', 9.5, 9.8, 9.0, 10.0),
('Heloisa Albuquerque', '3º Ano A', 8.0, 7.5, 8.5, 9.0),
('Luis Queiroz', '2º Ano B', 10.0, 9.5, 10.0, 10.0),
('Lucas Oliveira', '2º Ano B', 6.0, 6.5, 5.5, 7.0),
('Bruno Martins', '1º Ano C', 5.5, 4.0, 6.0, 5.0),
('Carla Mendes', '2º Ano B', 7.0, 7.2, 8.0, 7.5),
('Diego Alves', '3º Ano A', 4.5, 5.0, 4.0, 3.5),
('Fernanda Costa', '1º Ano C', 8.8, 9.2, 8.5, 9.5);

-- Visualizando a Tabela com os Dados.
SELECT * FROM tb_registro_estudantes;

-- Filtro: Estudantes com média final maior que 7.0.
SELECT nome, turma, media_final FROM tb_registro_estudantes WHERE media_final > 7.0;

-- Filtro: Estudantes com média final menor que 7.0.
SELECT nome, turma, media_final FROM tb_registro_estudantes WHERE media_final < 7.0;

-- Atualizando Registros: Corrigindo a nota do 4º bimestre do Lucas para ele passar de ano.
UPDATE tb_registro_estudantes 
SET nota4 = 8.5 
WHERE id = 4;

-- Verificando a atualização de Dados.
SELECT * FROM tb_registro_estudantes;

-- Organização dos Dados em Aprovado(a), Recuperação e Reprovado(a).
SELECT 
    nome, 
    media_final,
    CASE 
        WHEN media_final >= 7.0 THEN 'APROVADO(A)'
        WHEN media_final >= 5.0 THEN 'RECUPERAÇÃO'
        ELSE 'REPROVADO(A)'
    END AS status_escolar
FROM tb_registro_estudantes
ORDER BY media_final DESC;

-- Visualização em Sistema de Ranking (por desempenho em Média Final)
SELECT 
    turma,
    nome,
    media_final
FROM tb_registro_estudantes
ORDER BY turma ASC, media_final DESC;