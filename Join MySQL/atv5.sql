/*Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome
do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, onde o sistema
trabalhará com as informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos
(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

Faça um select utilizando LIKE buscando os Produtos com a letra C.

Faça um um select com Inner join entre tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria hidráulica).*/

/*CREATE DATABASE db_construindo_a_nossa_vida;
USE db_construindo_a_nossa_vida;*/
/*CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    setor VARCHAR(15) NOT NULL,
    PRIMARY KEY (id)
    );*/
    
/*CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    preco DECIMAL (6,2) NOT NULL,
    qtd_estoque INT(7) NOT NULL,
    peso FLOAT(5) NOT NULL,
    categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
    );*/
    
 /*INSERT INTO tb_categoria(nome, tipo, setor)
 VALUES("Construção","Alvenaria","Construção"),
	("Construção","Drywall","Construção"),
    ("Acabamento","Pintura","Decoração"),
    ("Acabamento","Revestimento","Construção"); 
 */   
 INSERT INTO tb_produto(nome, preco, qtd_estoque, peso, categoria_id)
 VALUES ("Bloco",2.00,10000,0.300,1),
	("Cimento",25.00,70000,50,1),
    ("Revestimento",150.00,354,20,4),
    ("Lata tinta",220.00,10000,18,3),
    ("Chapa",28.00,10000,.18,1);
    
-- Chamando os produtos com preço maior que 50
SELECT * FROM tb_produto WHERE preco > 50;
-- Chamando os produtos com preço entre 3 e 60
SELECT * FROM tb_produto WHERE preco > 3 AND preco < 60;
-- Chamando os produtos que tem a letra c no nome
SELECT * FROM tb_produto WHERE nome LIKE "%c%";
-- Fazendo um select com inner join
SELECT * FROM tb_produto INNER JOIN tb_categoria
	ON tb_categoria.id = tb_produto.categoria_id ORDER BY tb_categoria.nome ASC;
-- Chamando os produtos da categoria construção
SELECT tb_produto.nome, tb_produto.preco, tb_categoria.nome
	FROM tb_produto
INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id WHERE tb_categoria.nome LIKE "%co%";