/*Crie um banco de dados para um e commerce, onde o sistema trabalhará com as
informações dos produtos deste ecommerce.
Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos produtos para se trabalhar com o serviço deste ecommerce.
Popule esta tabela com até 8 dados;
Faça um select que retorne os produtos com o valor maior do que 500.
Faça um select que retorne os produtos com o valor menor do que 500.
Ao término atualize um dado desta tabela através de uma query de atualização.*/
-- Criando o banco
create database db_E_commerce;
-- acessando o banco
use db_E_commerce;
-- Criando a tabela categoria
create table tb_categoria(
	id bigint auto_increment,
    nome varchar(20) not null,
	setor varchar(20) not null,
    tipo varchar(20) not null,
	primary key (id)
    );
-- Populando a tabela
insert into tb_categoria(nome, setor, tipo) 
values ("Video-game","entretenimento","Console");
insert into tb_categoria(nome, setor, tipo) 
values ("Jogo","entretenimento","Game");
insert into tb_categoria(nome, setor, tipo) 
values ("Laptop","informática","Notebook");
insert into tb_categoria(nome, setor, tipo) 
values ("Celular","informática","Smartphone");
-- Chamando os dados da tabela
select * from tb_categoria;
-- Criando a tabela produto
create table tb_produto(
	id bigint auto_increment,
    nome varchar(30) not null,
    preco decimal (10,2) not null,
    qtd_estoque int(3) not null,
    cor varchar(10) not null,
    marca varchar(10) not null,
    categoria_id bigint not null,
    primary key (id),
    foreign key (categoria_id) references tb_categoria (id)
    );
    -- Excluindo a coluna marca da tabela produto
alter table tb_produto drop column marca;
-- Adicionando a coluna marca à tabela produto
alter table tb_produto add column marca varchar(15) not null;
-- Populando a tabela produto
insert into tb_produto(nome, preco, qtd_estoque, cor, marca, categoria_id) 
values ("Ps5",5000.00,187,"Grafite","Sony",1);
insert into tb_produto(nome, preco, qtd_estoque, cor, marca, categoria_id) 
values ("F1-2021",249.99,17,"Azul","Codemasters",2);
insert into tb_produto(nome, preco, qtd_estoque, cor, marca, categoria_id) 
values ("Smartphone-9",2000.00,74,"Branco","Xiaomi",4);
insert into tb_produto(nome, preco, qtd_estoque, cor, marca, categoria_id) 
values ("Notebook",3700.00,23,"Cinza","acer",3);
insert into tb_produto(nome, preco, qtd_estoque, cor, marca, categoria_id) 
values ("Fifa21",299.99,14,"Rosa/Preto","Ea-Sports",2);
-- Chamando os produtos com preço maior que 500
select * from tb_produto where preco > 500;
-- Chamando os produtos com preço menor que 500
select * from tb_produto where preco < 500;
-- Alterando dados de um produto
update tb_produto SET marca = "Sony" WHERE id = 1;
-- Chamando todos os produtos
select * from tb_produto;