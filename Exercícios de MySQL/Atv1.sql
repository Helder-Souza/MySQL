/*Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos funcionários desta empresa.
Crie uma tabela de funcionários e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionários para se trabalhar com o serviço deste RH.
Popule esta tabela com até 5 dados;
Faça um select que retorne os funcionários com o salário maior do que 2000.
Faça um select que retorne os funcionários com o salário menor do que 2000.
Ao término atualize um dado desta tabela através de uma query de atualização.*/

-- Criando o banco RH
create database db_RH;
-- acessando o banco
use db_RH;
-- Criando a tabela cargo
create table tb_cargo(
	id bigint auto_increment,
    setor varchar(10) not null,
    salario decimal (5,2) not null,
    ativo boolean not null,
    primary key (id)
    );
-- Excluindo a coluna setor da tabela cargo
alter table tb_cargo drop column setor;
-- Criando a coluna setor com um número maior de caracteres à tabela cargo
alter table tb_cargo add column setor varchar (30) not null;
-- Excluindo a coluna salario da tabela cargo
alter table tb_cargo drop column salario;
-- Adicionando a coluna salario à tabela cargo com uma quantidade maior de caracteres
alter table tb_cargo add column salario decimal (12,2) not null;
-- Populando a tabela cargo
insert into tb_cargo(setor,salario,ativo) values ("Desenvolvimento",3500.00,true);
insert into tb_cargo(setor,salario,ativo) values ("Gestão",7300.00,true);
insert into tb_cargo(setor,salario,ativo) values ("Segurança da informação",6500.00,true);
insert into tb_cargo(setor,salario,ativo) values ("Marketing",2400.00,true);
-- Chamando o conteúdo da tabela 
select * from tb_cargo;
-- Criando a tabela funcionario
create table tb_funcionario(
	id bigint auto_increment,
    nome varchar(30) not null,
    matricula int(10) not null,
    numeroDependentes int (2),
    telefone int (9) not null,
    cpf bigint not null,
    cargo_id bigint not null,
    primary key (id),
    foreign key (cargo_id) references tb_cargo(id)
    );
-- Populando a tabela 
insert into tb_funcionario(nome,matricula,numeroDependentes,telefone,cpf,cargo_id)
values ("Julio",1484,2,925252525,29999999999,3);
insert into tb_funcionario(nome,matricula,numeroDependentes,telefone,cpf,cargo_id)
values ("Maria",1475,0,911117777,98988989523,2);
insert into tb_funcionario(nome,matricula,numeroDependentes,telefone,cpf,cargo_id)
values ("João",1306,1,952535455,11111111111,1);
insert into tb_funcionario(nome,matricula,numeroDependentes,telefone,cpf,cargo_id)
values ("Debora",1333,3,987877874,12345678901,4);
insert into tb_funcionario(nome,matricula,numeroDependentes,telefone,cpf,cargo_id)
values ("Ana",1494,2,952535654,10987654321,3);
-- Excluindo a coluna salario da tabela cargo
alter table tb_cargo drop column salario;
-- Adicionando a coluna salario à tabela funcionario
alter table tb_funcionario add column salario float(15) not null;
-- Adicionando dados à coluna salario
UPDATE tb_funcionario SET salario = 6500 WHERE id = 1;
UPDATE tb_funcionario SET salario = 7300 WHERE id = 2;
UPDATE tb_funcionario SET salario = 3500 WHERE id = 3;
UPDATE tb_funcionario SET salario = 2400 WHERE id = 4;
UPDATE tb_funcionario SET salario = 6500 WHERE id = 5;
-- Chamando funcionarios com o salario maior que 2000
select * from tb_funcionario where salario>2000;
-- Chamando funcionarios com o salario menor que 2000
select * from tb_funcionario where salario<2000;
-- Chamando funcionarios que tenham as letras De no nome
select * from tb_funcionario where nome like "%De%";