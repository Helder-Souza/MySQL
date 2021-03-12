/*Crie um banco de dados para um serviço de um açougue, o nome do banco deverá ter o
seguinte nome db_cidade_das_carnes, onde o sistema trabalhará com as informações dos
produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não
esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

Faça um select utilizando LIKE buscando os Produtos com a letra C.

Faça um um select com Inner join entre tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são bovinos).*/
CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    PRIMARY KEY (id)
    );
CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT,
	nome VARCHAR(20) NOT NULL,
    preco FLOAT(7) NOT NULL,
    fracionavel BOOLEAN,
    segunda BOOLEAN,
    categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
    );
insert into tb_categoria(nome, tipo, estado)
values("Aves","Congelado","SP"),
	("Aves","Refigerado","MG"),
	("Bovino","Refrigerado","PR"),
	("Suíno","Congelado","RJ");


insert into tb_produto(nome, preco, segunda, fracionavel, categoria_id)
values("Peito de Frango",12.75,FALSE,TRUE,2),
	("Frango inteiro",23.98,FALSE,FALSE,1),
    ("Acém",19.75,TRUE,TRUE,3),
    ("Picanha",37.49,FALSE,TRUE,2),
    ("Bisteca",8.99,FALSE,FALSE,4);
-- Chamando os produtos com preço maior que 50
SELECT * FROM tb_produto WHERE preco > 50;
-- Chamando os produtos com preço entre 3 e 60
SELECT * FROM tb_produto WHERE preco > 3 AND preco < 60;
-- Chamando produtos que tenham a letra c no nome
SELECT * FROM tb_produto WHERE nome LIKE "%C%";
-- Fazendo um select com inner join
SELECT * FROM tb_produto
 INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id ORDER BY tb_produto.nome ASC;
-- Chamando os produtos da categoria bovino
SELECT tb_produto.nome, tb_produto.preco, tb_categoria.nome
	FROM tb_produto
INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id
	Where tb_categoria.nome LIKE "%Bovino%";