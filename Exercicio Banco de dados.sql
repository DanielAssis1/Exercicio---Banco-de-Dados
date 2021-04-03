															/* Criação do banco */
create database restaurante;
use restaurante;

create table cozinha (id_Cozinha int primary key, tipo_Cozinha varchar(30), prato_Principal varchar(30), hora_De_Abertura TIME, hora_De_Fechamento TIME);
create table ingredientes (id_Ingrediente int primary key, nome_Ingrediente varchar(30), Data_De_Validade date);
create table funcionarios (id_Funcionario int primary key, nome_Funcionario varchar(30), atividade varchar(30));


							/*4) Incluir 5 itens na tabela de cozinha, 8 na tabela e ingredientes e 10 na tabela de funcionários.*/
insert into cozinha (id_Cozinha, tipo_Cozinha, prato_Principal, hora_De_Abertura, hora_De_Fechamento) VALUES (1, 'Mineira', 'Feijoada', '14:00', '20:00');
insert into cozinha (id_Cozinha, tipo_Cozinha, prato_Principal, hora_De_Abertura, hora_De_Fechamento) VALUES (2, 'Nordestina', 'Tapioca', '16:00', '22:30');
insert into cozinha (id_Cozinha, tipo_Cozinha, prato_Principal, hora_De_Abertura, hora_De_Fechamento) VALUES (3, 'Italiana', 'Yakissoba', '13:00', '22:00');
insert into cozinha (id_Cozinha, tipo_Cozinha, prato_Principal, hora_De_Abertura, hora_De_Fechamento) VALUES (4, 'Chinesa', 'Yakissoba', '10:00', '21:00');
insert into cozinha (id_Cozinha, tipo_Cozinha, prato_Principal, hora_De_Abertura, hora_De_Fechamento) VALUES (5, 'Japonesa', 'Tempura', '18:00', '23:00');

insert into ingredientes (id_Ingrediente, nome_Ingrediente, Data_De_Validade) VALUE (1, 'Arroz', '2021-03-29');
insert into ingredientes (id_Ingrediente, nome_Ingrediente, Data_De_Validade) VALUE (2, 'Feijão', '2021-03-28');
insert into ingredientes (id_Ingrediente, nome_Ingrediente, Data_De_Validade) VALUE (3, 'Carne de Porco', '2021-06-15');
insert into ingredientes (id_Ingrediente, nome_Ingrediente, Data_De_Validade) VALUE (4, 'Macarrão', '2021-05-12');
insert into ingredientes (id_Ingrediente, nome_Ingrediente, Data_De_Validade) VALUE (5, 'Farinha', '2021-03-05');
insert into ingredientes (id_Ingrediente, nome_Ingrediente, Data_De_Validade) VALUE (6, 'Linguiça', '2021,08-01');
insert into ingredientes (id_Ingrediente, nome_Ingrediente, Data_De_Validade) VALUE (7, 'Champignon', '2021-09-02');
insert into ingredientes (id_Ingrediente, nome_Ingrediente, Data_De_Validade) VALUE (8, 'Molho', '2021-07-18');

												
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (1, 'José Bonifácio da Silva', 'Cozinheiro');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (2, 'Jorge Agusto Meira', 'Ajudante');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (3, 'Fátima Rosa da Luz', 'Cozinheiro');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (4, 'Rosa Maria de Souza', 'Cozinheiro');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (5, 'Carlos Gomes Silveira', 'Ajudante');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (6, 'Fernando Souza Dias', 'Ajudante');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (7, 'Bernardo da Silva Junior', 'Cozinheiro');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (8, 'Kethlen Braga dos Santos', 'Cozinheiro');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (9, 'Sergio Santos Rodrigues', 'Outros');
insert into funcionarios (id_Funcionario, nome_Funcionario, atividade) VALUE (10, 'Lino Braga da Costa', 'Outros');


 
							/* 5) Criar uma consulta que retorne a quantidade de cozinhas cadastradas no banco de dados.*/
select count(id_Cozinha) as 'Número de cozinhas cadastradas no banco de dados' from cozinha;

							/* 6) Criar uma consulta que possua um filtro, buscando as cozinhas que possuam o horário de fechamento as 22 horas. */
select id_Cozinha as ID, tipo_Cozinha as Tipo, hora_De_Fechamento as 'Horário de Fechamento' from cozinha where hora_De_Fechamento > '22:00';
							
                            /* 7) Criar uma consulta que liste quais ingredientes estão vencidos. */
select id_Ingrediente as ID, nome_Ingrediente as Nome, Data_De_Validade as 'Data de Válidade' from ingredientes where Data_De_Validade < (select current_timestamp);


							/* 8) Criar relacionamentos entre as tabelas:
								  Uma cozinha pode ter mais de um ingrediente.
								  Uma cozinha também pode ter mais de um funcionário.*/

alter table ingredientes add fk_Id_Cozinha int;
alter table ingredientes add constraint fk_Id_Cozinha_Ingrediente foreign key (fk_Id_Cozinha) references cozinha (id_Cozinha);

alter table funcionarios add fk_Id_Cozinha int;
alter table funcionarios add constraint fk_Id_Cozinha_Funcionario foreign key (fk_Id_Cozinha) references cozinha (id_Cozinha);

									/* Inserção de dados nas chaves estrageiras */
UPDATE ingredientes set fk_Id_Cozinha = 1 where id_Ingrediente = 2;
UPDATE ingredientes set fk_Id_Cozinha = 1 where id_Ingrediente = 3;
UPDATE ingredientes set fk_Id_Cozinha = 1 where id_Ingrediente = 5;
UPDATE ingredientes set fk_Id_Cozinha = 1 where id_Ingrediente = 6;
UPDATE ingredientes set fk_Id_Cozinha = 3 where id_Ingrediente = 4;
UPDATE ingredientes set fk_Id_Cozinha = 3 where id_Ingrediente = 8;
UPDATE ingredientes set fk_Id_Cozinha = 3 where id_Ingrediente = 7;
UPDATE ingredientes set fk_Id_Cozinha = 5 where id_Ingrediente = 1;


UPDATE funcionarios set fk_Id_Cozinha = 1 where id_Funcionario = 1;
UPDATE funcionarios set fk_Id_Cozinha = 1 where id_Funcionario = 2;
UPDATE funcionarios set fk_Id_Cozinha = 1 where id_Funcionario = 5;
UPDATE funcionarios set fk_Id_Cozinha = 1 where id_Funcionario = 6;
UPDATE funcionarios set fk_Id_Cozinha = 1 where id_Funcionario = 9;
UPDATE funcionarios set fk_Id_Cozinha = 2 where id_Funcionario = 3;
UPDATE funcionarios set fk_Id_Cozinha = 3 where id_Funcionario = 4;
UPDATE funcionarios set fk_Id_Cozinha = 3 where id_Funcionario = 10;
UPDATE funcionarios set fk_Id_Cozinha = 4 where id_Funcionario = 7;
UPDATE funcionarios set fk_Id_Cozinha = 4 where id_Funcionario = 8;

/*	9) Criar uma consulta que realize a junção das tabelas Cozinha, Ingrediente e Funcionario e informe as cozinhas não possuam ingredientes. */

select id_Cozinha as ID,  tipo_Cozinha as Tipo from cozinha where id_Cozinha NOT IN (select distinct id_Cozinha from cozinha as C right join ingredientes as I ON C.id_Cozinha = I.fk_Id_Cozinha left join funcionarios as F ON  F.fk_Id_Cozinha = I.fk_Id_Cozinha);

/*	10) Criar uma consulta que realize a junção das tabelas Cozinha, Ingrediente e Funcionario e informe as cozinhas que possuam número de funcionários maior que 4; */

select distinct id_Cozinha as ID,  tipo_Cozinha as Tipo from cozinha as C left join ingredientes as I ON C.id_Cozinha = I.fk_Id_Cozinha where id_Cozinha IN (select id_Cozinha from cozinha as C right join funcionarios as F ON  F.fk_Id_Cozinha = C.id_Cozinha group by id_Cozinha HAVING COUNT(id_Cozinha) > 4);
