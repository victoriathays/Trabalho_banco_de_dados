/*TABELA USER*/
create table user(
id_user int auto_increment,
email varchar(50),
password varchar(8) not null,
name varchar(50) not null,
telefone varchar(20),
cidade varchar(30),
created date default now(),
updated date,
primary key(id_user)
);

select * from user;

insert into user (email, password, name, telefone, cidade)
values
('victoria@gmail.com', '123', 'Victoria', '23456789', 'Barreira'),
('luiza@gmail.com', '234', 'Luiza', '45678912', 'Redenção'),
('joyce@gmail.com', '345','Joyce', '98765432', 'Acarape'),
('samira@gmail.com', '567', 'Samira', '67541236', 'Acarape'),
('sara@gmail.com', '789','Sara', '57962635', 'Redenção'),
('perla@gmail.com', '543', 'Perla', '76534248', 'Redenção'),
('julia@gmail.com', '765', 'Julia', '25789741', 'Barreira'),
('maria@gmail.com', '987', 'Maria', '76355987', 'Barreira'),
('carol@gmail.com', '975', 'Carol', '9860754', 'Acarape'),
('lulu@gmail.com', '689', 'Lulu', '98576354', 'Fortaleza');

delete from user_roles where id_user = 2;

/*TABELA POST*/
create table post(
id_post int auto_increment primary key,
title varchar(10),
description text,
updated date,
id_user int,
foreign key(id_user) references user(id_user)
);

select * from post;

insert into post 
(title, description, id_user)
values
('É ','O melhor livro Evely Hugo', 1),
('Leiam ', 'muito boom!', 1),

('É  ','o melhor livro?', 2),
('COM CERTEZA!', 'oi', 2),

('Evely','Chorei lendo?', 3),
('SIM!', 'é isso', 3),

('Dia','e o que eu faço', 4),
('Durmo,', 'oi', 4),

('Musica  ','Starboy', 5),
('Cantor ', 'The W', 5);

select title, description from post where id_user = 3;
select title, description from post where id_user = 5;

update post 
set title = 'oi', 
description = 'tudo bem?',
updated = '2022-11-04'
where id_post = 1;

delete from post where id_post = 4;

/*TABELA ROLES*/
create table roles(
id_roles int primary key auto_increment,
name varchar(50) not null
);

select * from roles;
insert into roles (name)
values
("client"),
("employe"),
("admin");

/*TABELA USER E ROLES*/
create table user_roles(
id_user int,
id_roles int,
foreign key(id_user) references user(id_user),
foreign key(id_roles) references roles(id_roles)
);

select * from user_roles;

insert into user_roles (id_user, id_roles)
values
(1,1),
(2,1),
(3,3),
(4,3),
(5,2);

select user.id_user, user.email, roles.name from user_roles join user on
user_roles.id_user = user.id_user join roles on roles.id_roles = user_roles.id_roles
where roles.name = 'admin';


