/*Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as
informações dos alunos deste registro dessa escola.
Crie uma tabela alunos/a e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos alunos/a para se trabalhar com o serviço dessa escola.

Popule esta tabela com até 8 dados;
Faça um select que retorne o/as alunos/a com a nota maior do que 7.
Faça um select que retorne o/as alunos/a com a nota menor do que 7.
Ao término atualize um dado desta tabela através de uma query de atualização.*/
-- Criando o banco
create database db_escola;
-- Criando a tabela alunos
create table tb_alunos(
	id bigint not null,
    nome varchar(30) not null,
    matricula int(5) not null,
    classe varchar(20) not null,
    sala int(3) not null,
    nota float not null,
    primary key (id)
    );
-- Modificando a coluna id
ALTER TABLE tb_alunos MODIFY COLUMN id bigint auto_increment;
-- Populando a tabela
insert into tb_alunos (nome, matricula, classe, sala, nota) 
values ("Manoel", 145, "6° C",5,7.5);
insert into tb_alunos (nome, matricula, classe, sala, nota) 
values ("Rogério", 128, "8 ° D",14,9.0);
insert into tb_alunos (nome, matricula, classe, sala, nota) 
values ("Rafael", 212, "3 ° A",12,5.7);
insert into tb_alunos (nome, matricula, classe, sala, nota) 
values ("Maria", 127, "8° D",14,10);
insert into tb_alunos (nome, matricula, classe, sala, nota) 
values ("Beatriz", 148, "6° C",5,3.4);
-- Retornando o/as alunos/a com a nota maior do que 7.
select * from tb_alunos where nota > 7;
-- Retornando o/as alunos/a com a nota menor do que 7.
select * from tb_alunos where nota < 7;
-- Chamando todos os alunos/a
select * from tb_alunos;
-- Alterando dados 
update tb_alunos set nota = 9 where id = 5;