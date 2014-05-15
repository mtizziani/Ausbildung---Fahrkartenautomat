create database if not exists verkehr;

use verkehr;

create table if not exists payments(
  id int unsigned not null auto_increment,
  value int unsigned not null default 0,
  `timestring` long default CURRENT_TIMESTAMP,
  primary key(id)
);

create table if not exists money(
  id int unsigned not null auto_increment,
  image varchar(45) not null,
  value int unsigned not null default 0,
  countBegin int unsigned not null default 0,
  countNow int unsigned not null default 0,
  primary key(id)
);

create table if not exists options(
  id int unsigned not null auto_increment,
  `name` varchar(45) not null,
  factor double unsigned not null default 0.0,
  primary key(id);
);

create table if not exists pricegroup(
  id int unsigned not null auto_increment,
  `name` vachar(45) not null,
  value int unsigned not null default 0.
  primary key(id)
);

create table if not exists users(
  id int unsigned not null auto_increment,
  `name` varchar(45) not null,
  `pass` varchar(45) not null,
  primary key(id);
);

insert into money (image, value, countBegin)
values
  ('20eur.jpeg', 2000, 0),
  ('10eur.jpeg', 1000, 0),
  ('5eur.jpeg', 500, 0),
  ('2eur.jpeg', 200, 50),
  ('1eur.jpeg', 100, 100),
  ('50cent.jpeg', 50, 100),
  ('20cent.jpeg', 20, 200),
  ('10cent.jpeg', 10, 250),
  ('5cent.jpeg', 5, 200),
  ('2cent.jpeg', 2, 200),
  ('1cent.jpeg', 1, 200);

insert into pricegroup (name, value)
values
  ('A', 140),
  ('B', 280),
  ('C', 390),
  ('D', 965),
  ('E', 1250);

insert into options (name, factor)
values
  ('Hin- und Rückfahrt', 2.0),
  ('Fahrrad', 0.5),
  ('Zusatztiket', 0.8);

insert into users (name, pass) values ('Benutzer', 'test');