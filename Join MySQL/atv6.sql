/*Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco
deverá ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as
informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço de um site de cursos
onlines(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.

Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

Faça um select utilizando LIKE buscando os Produtos com a letra J.

Faça um um select com Inner join entre tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria Java).*/

CREATE DATABASE db_cursoDaMinhaVida;
USE db_cursoDaMinhaVida;
CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    formato VARCHAR(15) NOT NULL,
    PRIMARY KEY (id)
    );

CREATE TABLE tb_curso(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    preco DECIMAL (6,2) NOT NULL,
    duracao VARCHAR(20) NOT NULL,
    ativo BOOLEAN,
    periodo VARCHAR(20) NOT NULL,
    curso_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(curso_id) REFERENCES tb_categoria (id)
    );
    
INSERT INTO tb_categoria (nome, tipo, formato)
VALUES ("Java","Bootcamp","Presencial"),
	("PHP","tecnico","Semi-presencial"),
    ("GTI","tecnologo","Presencial"),
    ("Phyton","Bootcamp","Ead");
    
INSERT INTO tb_curso (nome, preco, duracao, ativo, periodo, curso_id)
VALUES ("Introdução",300,"7 meses", TRUE, "Integral",1),
	("Especialização",1700,"20 meses", TRUE, "Vespertino",2),
    ("Avançado",345,"6 meses", TRUE,"Noturno",4),
    ("Avançado",1350,"3 meses",FALSE,"Manhã",3);
-- Chamando os produtos com preço maior que 50
SELECT * FROM tb_curso WHERE preco > 50;
-- Chamando os produtos com preço entre 3 e 60
SELECT * FROM tb_curso WHERE preco > 3 AND preco < 60;
-- Chamando os curso que tem a letra j no nome
SELECT * FROM tb_curso WHERE nome LIKE "%J%";
-- Usando o Join para relacionar as tabelas
SELECT * FROM tb_curso INNER JOIN tb_categoria 
	ON tb_categoria.id = tb_curso.curso_id;
-- Chamando uma categoria específica
SELECT tb_curso.nome, tb_curso.preco, tb_categoria.nome
	FROM tb_curso
INNER JOIN tb_categoria ON tb_categoria.id = tb_curso.curso_id
	WHERE tb_categoria.nome LIKE "%Ja%";