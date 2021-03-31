/*Crie um banco de dados para um serviço de uma loja de móveis e decoração, o nome do
banco deverá ter o seguinte: db_nome minha_casa_mais_bonita, onde o sistema trabalhará
com as informações dos produtos desta loja.

O sistema trabalhará com 3 tabelas tb_produto e tb_categoria e tb_usuario.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta loja.

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço desta loja(não esqueça de criar
a foreign key de tb_categoria nesta tabela).

Crie a tabela Usuario e utilize a habilidade de abstração e determine 5 atributos relevantes
dos tb_usuario para se trabalhar com o serviço desta loja.

Popule atabela Categoria com até 5 dados.

Popule a tabela Produto com até 8 dados.

Popule atabela Usuario com até 5 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

Faça um select utilizando LIKE buscando os Produtos com a letra B.

Faça um select utilizando LIKE buscando os Usuários com a letra C.

Faça um um select com Inner join entre tabela categoria e produto.

faça um select que retorne a média de preços dos produtos;

faça um select que retorne a soma de preços dos produtos;

faça um select que quantidade de produtos cadastrados na tabela

Faça um select onde traga todos os Produtos de uma categoria específica*/
CREATE DATABASE db_minha_casa_mais_bonita;

USE db_minha_casa_mais_bonita;

CREATE TABLE tb_categoria (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_produto (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL,
    preco FLOAT NOT NULL,
    qtd_estoque INT(5) NOT NULL,
    setor VARCHAR(25) NOT NULL,
    ativo BOOLEAN,
    categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

CREATE TABLE tb_usuario (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    senha VARCHAR(35) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(9) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_categoria (nome)
VALUES ("Cadeiras"),
	("Mesas"),
    ("Guarda-Roupas"),
    ("Estantes"),
    ("Armários-Cozinha");
    
INSERT INTO tb_produto (nome, preco, qtd_estoque, setor, ativo, categoria_id)
VALUES ("Cadeira gamer",779.99,17,"Escritório/Entretenimento",1,1),
	("Guarda-Roupa Closet Modulado Barcelona Demolição",448.79,5,"Móveis para Quarto",1,3),
    ("Cadeira de escritório com base cromada",219.90,3,"Escritório",1,1),
    ("Estante Dijon",1267.19,2,"Móveis para Sala",1,4),
    ("Mesa de jantar",370.47,9,"Móveis para cozinha",1,2),
    ("Cozinha compacta Atenas",461.98,7,"Móveis para cozinha",1,5);
    
INSERT INTO tb_usuario (nome, email, senha, cpf, telefone)
VALUES ("Helder","helder@helder.com","12345","12345678901","9999-9999"),
	("Jemerson","jemerson@je.com","54321","11111111111","7777-7777"),
    ("Maria","maria@maria.com","senha","23322332231","8787-7878");

-- Chamando os Produtos com o valor maior do que 50 reais.
SELECT * FROM tb_produto WHERE preco > 50;

-- Chamando os Produtos com valor entre 3 e 60 reais.
SELECT * FROM tb_produto WHERE preco BETWEEN 3 AND 60;

-- Chamando os produtos que contém a letra b no nome
SELECT * FROM tb_produto WHERE nome LIKE "%b%";

-- Chamando os usuários que contém a letra c no nome
SELECT * FROM tb_usuario WHERE nome LIKE "%c%";

-- Fazendo um select com inner join
SELECT * FROM tb_produto INNER JOIN tb_categoria
	ON tb_categoria.id = tb_produto.categoria_id ORDER BY tb_categoria.nome ASC;
    
-- Fazendo um select que retorna a média de preços dos produtos;
SELECT FORMAT(AVG(preco),2,'de_DE') FROM tb_produto;

-- Fazendo um select que retorna a soma de preços dos produtos;
SELECT FORMAT(SUM(preco),2,'de_DE') From tb_produto;

-- Fazendo um select que retorna a quantidade de produtos cadastrados na tabela
SELECT COUNT(*) FROM tb_produto;
    
-- Chamando os produtos da categoria cadeiras
SELECT tb_produto.nome, tb_produto.preco, tb_categoria.nome
	FROM tb_produto
INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id WHERE tb_categoria.nome LIKE "%ca%";