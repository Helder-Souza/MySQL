/*Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco
deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as
informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.

Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de
criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela pizza com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 45 reais.

Faça um select trazendo os Produtos com valor entre 29 e 60 reais.

Faça um select utilizando LIKE buscando os Produtos com a letra C.

Faça um um select com Inner join entre tabela categoria e pizza.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são pizza doce).*/

CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    promocao BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(id)
    );
CREATE TABLE tb_pizza(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    preco FLOAT(4) NOT NULL,
    qtd_estoque INT(5) NOT NULL,
    descricao VARCHAR(30) NOT NULL,
    categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
    );
    
INSERT INTO tb_categoria(nome, tipo, promocao)
VALUES ("Doces","Comum",TRUE),
("Salgadas","Comum",TRUE),
("Doces","Brotinho",FALSE),
("Doces","Brotinho",FALSE);
UPDATE tb_categoria SET nome = "Salgadas" WHERE id = 4;
INSERT INTO tb_pizza(nome, preco, qtd_estoque, descricao, categoria_id)
VALUES ("Pizza Portuguesa", 35.99, 30, "Pizza sabor portuguesa",2),
("Pizza Calabresa", 32.99, 24, "Pizza sabor calabresa",2),
("Pizza Prestígio", 37.99, 14, "Pizza sabor prestígio",1),
("Pizza Baiana", 17.99, 9, "Pizza sabor baiana",4),
("Pizza Brigadeiro", 34.99, 12, "Pizza sabor brigadeiro",3);
UPDATE tb_pizza SET preco = 17.99 WHERE id = 5;
-- Chamando todos os produtos com preço maior que 45
SELECT * FROM tb_pizza WHERE preco > 45;
-- Chamando todos os produtos com preço entre 29 e 60
SELECT * FROM tb_pizza WHERE preco > 29 AND preco < 60;
-- Chamando os produtos que tenham a letra c no nome
SELECT * FROM tb_pizza WHERE nome LIKE "%c%";
-- Fazendo um select com inner join
SELECT * FROM tb_pizza 
 INNER JOIN tb_categoria ON tb_categoria.id = tb_pizza.categoria_id ORDER BY preco ASC;
-- Chamando todos os produtos da categoria salgado
SELECT tb_pizza.nome, tb_pizza.preco, tb_categoria.nome, tb_categoria.tipo
	FROM tb_pizza
INNER JOIN tb_categoria ON tb_categoria.id = tb_pizza.categoria_id
WHERE tb_categoria.nome like "%Sal%";