-- SQLite

create table usuario (
    id integer not null unique primary key autoincrement,
    email varchar(50) not null,
    password varchar(30) not null,
    nome varchar(100) not null
);

create table empresa (
    id integer not null unique primary key autoincrement,
    cnpj char(14) not null,
    email varchar(50) not null,
    nome varchar(100) not null
);

create table selecao (
    id integer not null unique primary key autoincrement,
    titulo varchar(100) not null,
    nome_responsavel varchar(100) not null,
    fk_id_empresa integer not null references empresa,
    data date not null
);

create table rating (
    id integer not null unique primary key autoincrement,
    nome varchar(100) not null,
    rating integer not null,
    comentario varchar(240) not null,
    isBan boolean not null,
    fk_id_empresa integer not null references empresa,
    fk_id_selecao integer not null references selecao,
    data date not null
);

create table moderacao (
    id integer not null unique primary key autoincrement,
    motivo varchar(50) not null,
    comentario varchar(240) not null,
    fk_id_rating integer not null references rating 
);

-- drop table empresa;
-- drop table moderacao;
-- drop table rating;
-- drop table selecao;
-- drop table usuario;

insert into usuario (email, password, nome) values ('admin@mail.com', '123123', 'admin');
insert into empresa (cnpj, email, nome) values ('12121212121212', 'empresa@mail.com', 'super empresa legal');
insert into selecao (titulo, nome_responsavel, fk_id_empresa, data) values ('Dev full-stack', 'Gerente Lorem Ipsum', 1, DATE('now'));

insert into rating (nome, rating, comentario, isBan, fk_id_empresa, fk_id_selecao, data) 
values ('Lorem', 9, 'bah, foi muito boa mesmo essa seleção', false, 1, 1, DATE('now'));

insert into rating (nome, rating, comentario, isBan, fk_id_empresa, fk_id_selecao, data) 
values ('Natan', 10, 'o gerente Lorem Ipsum soube conduzir a seleção com maestria, nota 10', false, 1, 1, DATE('now'));

insert into rating (nome, rating, comentario, isBan, fk_id_empresa, fk_id_selecao, data) 
values ('Cara Chatão Mané', 5, 'Não gostei da seleção', false, 1, 1, DATE('now'));

select avg(rating) from rating where fk_id_empresa = 1;
select comentario, min(rating) from rating where fk_id_empresa = 1;
select comentario, max(rating) from rating where fk_id_empresa = 1;