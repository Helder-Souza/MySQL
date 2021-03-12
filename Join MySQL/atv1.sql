/*Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter
o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as
informações dos personagens desse game.

O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.

siga exatamente esse passo a passo:

Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos
relevantes da classe para se trabalhar com o serviço desse game Online.

Crie uma tabela tb_personagem e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionários para se trabalhar com o serviço desse game Online
(não esqueça de criar a foreign key de tb_classe nesta tabela).

Popule esta tabela classe com até 5 dados.

Popule esta tabela personagem com até 8 dados.

Faça um select que retorne os personagens com o poder de ataque maior do que 2000.

Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000.

Faça um select utilizando LIKE buscando os personagens com a letra C.

Faça um um select com Inner join entre tabela classe e personagem.

Faça um select onde traga todos os personagem de uma classe específica (exemplo todos
os personagens que são arqueiros).*/

CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;
CREATE TABLE tb_classe(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    raça VARCHAR(20) NOT NULL,
    pais_origem VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
    );
ALTER TABLE tb_classe DROP COLUMN nome;
ALTER TABLE tb_classe ADD COLUMN intencao VARCHAR(15) NOT NULL;
ALTER TABLE tb_classe DROP COLUMN pais_origem;
ALTER TABLE tb_classe ADD COLUMN origem VARCHAR(25) NOT NULL;
CREATE TABLE tb_personagem(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    poder_ataque INT(7) NOT NULL,
    poder_defesa INT(7) NOT NULL,
    ki INT(7) NOT NULL,
    nivel_esquiva VARCHAR(7) NOT NULL,
    raça_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(raça_id) REFERENCES tb_classe(id)
    );
    
INSERT INTO tb_classe(intencao,raça,origem)
	VALUES ("Maligna","majin","Dragon Ball Z"),
    ("Benigna","Namekuseijin","Dragon Ball"),
    ("Desconhecida","Saiyajin","Dragon Ball");
ALTER TABLE tb_personagem DROP COLUMN nivel_esquiva;
INSERT INTO tb_personagem(nome, poder_ataque, poder_defesa, ki, raça_id)
	VALUES ("Goku",7400,5300,9750,3),
    ("Picolli",4300,2800,4750,2),
    ("Majin-Boo",7100,5500,9550,1),
    ("Raditz",3800,1850,2750,3);
UPDATE tb_personagem SET nome = "Picollo" WHERE id = 2;
SELECT * FROM tb_personagem WHERE poder_ataque > 2000;
SELECT * FROM tb_personagem WHERE poder_defesa > 1000 and poder_defesa <2000;
SELECT * FROM tb_personagem WHERE nome like "%c%";
SELECT * FROM tb_personagem
INNER JOIN tb_classe ON tb_classe.id = tb_personagem.raça_id;
SELECT tb_personagem.nome, tb_personagem.ki, tb_classe.raça
	FROM tb_personagem
INNER JOIN tb_classe ON tb_classe.id = tb_personagem.raça_id
WHERE tb_classe.raça LIKE "%Sa%";