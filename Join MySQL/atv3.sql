/*Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as
informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não
esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

Faça um select utilizando LIKE buscando os Produtos com a letra B.

Faça um um select com Inner join entre tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são cosméticos).*/

CREATE DATABASE db_farmacia_do_bem;
USE db_farmacia_do_bem;
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    setor VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
    );
    
CREATE TABLE tb_produto(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    preco FLOAT(5) NOT NULL,
	qtd_estoque INT(5) NOT NULL,
    ness_receita BOOLEAN NOT NULL,
    categoria_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
    );
    
INSERT INTO tb_categoria(nome, tipo, setor)
VALUES ("Medicamentos","Comprimido","Saúde"),
("Medicamentos","Líquido","Saúde"),
("Beleza","Pastoso","Cosméticos"),
("Fisioterapia","Produto Ortopedico","Ortopedia");

INSERT INTO tb_produto(nome, preco, qtd_estoque, ness_receita, categoria_id)
VALUES ("Dipirona", 7.44, 87, FALSE, 1),
("Dipirona", 5.74, 37, FALSE, 2),
("Gel-cola", 8.45, 17, FALSE, 3),
("Almofada", 203.12, 5, TRUE, 4),
("Almofada", 203.12, 5, TRUE, 4);
-- Chamando os produtos com preço maior que 50
SELECT * FROM tb_produto WHERE preco > 50;
-- Chamando os produtos com preco entre 3 e 60
SELECT * FROM tb_produto WHERE preco > 3 AND preco <60;
-- Chamando os produtos que tenham a letra b no nome
SELECT * FROM tb_produto WHERE nome LIKE "%b%";
-- Fazendo um select com inner join
SELECT * FROM tb_produto
 INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id ORDER BY tb_produto.nome ASC;
-- Chamando os produtos da categoria cosméticos
SELECT tb_produto.nome, tb_produto.preco, tb_categoria.setor
	FROM tb_produto
INNER JOIN tb_categoria ON tb_categoria.id = tb_produto.categoria_id
	WHERE tb_categoria.setor LIKE "%c%";