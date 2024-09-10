CREATE DATABASE IF NOT EXISTS Livraria;
use livraria;

-- Criação da tabela de Autores
CREATE TABLE IF NOT EXISTS Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criação da tabela de Livros com CONSTRAINT de chave estrangeira
CREATE TABLE IF NOT EXISTS Livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao INT,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
    ON DELETE CASCADE   -- Se um autor for deletado, os livros associados serão deletados.
    ON UPDATE CASCADE   -- Se o id_autor mudar, será atualizado nos livros associados.
);

-- Criação da tabela de Empréstimos com CONSTRAINT de chave estrangeira
CREATE TABLE IF NOT EXISTS Emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
    ON DELETE RESTRICT  -- Impede deletar um livro que está emprestado.
    ON UPDATE CASCADE   -- Se o id_livro mudar, será atualizado nos empréstimos associados.
);

ALTER TABLE Livro
MODIFY COLUMN titulo VARCHAR(255);

-- ADD: Para adicionar novas colunas ou restrições à tabela. Ex:ALTER TABLE nome_da_tabela ADD COLUMN nome_da_nova_coluna TIPO_DE_DADO;
-- DROP: Para remover colunas ou restrições existentes. Ex: ALTER TABLE Pedidos DROP COLUMN Data_de_Criação;
-- MODIFY: Para alterar tipos de dados ou características das colunas (como tamanho). Ex: ALTER TABLE Produtos MODIFY COLUMN preco DECIMAL(10,2);
-- RENAME TO: Para renomear tabelas ou colunas. ALTER TABLE nome_da_tabela RENAME COLUMN nome_atual_da_coluna TO novo_nome_da_coluna; ou  ALTER TABLE nome_atual RENAME TO novo_nome;

-- Select Version();

-- ALTER TABLE Emprestimo RENAME COLUMN data_devolucao TO devolucao; -- MariaDB versão 10.5.2
 
-- ALTER TABLE emprestimo CHANGE COLUMN  devolucao data_devolucao DATE; -- MariaDB Legacy

INSERT INTO Autor (nome) VALUES
('Machado de Assis'),
('J.K. Rowling'),
('George Orwell'),
('Jane Austen'),
('J.R.R. Tolkien'),
('Gabriel García Márquez'),
('F. Scott Fitzgerald'),
('Ernest Hemingway'),
('Mark Twain'),
('Agatha Christie');

INSERT INTO Livro (titulo, ano_publicacao, id_autor) VALUES
('Dom Casmurro', 1899, 1),
('Harry Potter e a Pedra Filosofal', 1997, 2),
('1984', 1949, 3),
('Orgulho e Preconceito', 1813, 4),
('O Senhor dos Anéis', 1954, 5),
('Cem Anos de Solidão', 1967, 6),
('O Grande Gatsby', 1925, 7),
('O Velho e o Mar', 1952, 8),
('As Aventuras de Tom Sawyer', 1876, 9),
('Assassinato no Expresso do Oriente', 1934, 10);


INSERT INTO Emprestimo (data_emprestimo, data_devolucao, id_livro) VALUES
('2024-01-10', '2024-01-17', 1),
('2024-01-12', NULL, 2),  -- Empréstimo em andamento
('2024-01-05', '2024-01-12', 3),
('2024-01-07', '2024-01-14', 4),
('2024-01-03', NULL, 5),  -- Empréstimo em andamento
('2024-01-09', '2024-01-16', 6),
('2024-01-11', '2024-01-18', 7),
('2024-01-15', NULL, 8),  -- Empréstimo em andamento
('2024-01-08', '2024-01-15', 9),
('2024-01-02', '2024-01-09', 10);

select * from Livro;

UPDATE livro
SET titulo = 'Autor 1984' where id_livro = 3;

select * from livro;

select * from livro where ano_publicacao > 1899;

-- 9 Selecione livros por ano_publicacao em ordem crescente
select * from livro order by ano_publicacao asc;

select * from livro order by ano_publicacao desc;