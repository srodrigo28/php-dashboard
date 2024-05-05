create database dashboard collate utf8_unicode_ci;

use dashboard;

create table tb_vendas(
	id int not null primary key auto_increment,
	data_venda datetime default current_timestamp,
	total float(10,2) not null
);

create table tb_clientes(
	id int not null primary key auto_increment,
	cliente_ativo boolean default true
);

create table tb_contatos(
	id int not null primary key auto_increment,
	tipo_contato int not null
);

create table tb_despesas(
	id int not null primary key auto_increment,
	data_despesa datetime default current_timestamp,
	total float(10,2) not null
);

insert into tb_vendas(data_venda, total)values('2018-08-15', 150.20);
insert into tb_vendas(data_venda, total)values('2018-08-16', 255.36);
insert into tb_vendas(data_venda, total)values('2018-08-18', 70.95);
insert into tb_vendas(data_venda, total)values('2018-09-01', 35.00);
insert into tb_vendas(data_venda, total)values('2018-09-11', 2047.12);
insert into tb_vendas(data_venda, total)values('2018-09-19', 122.85);
insert into tb_vendas(data_venda, total)values('2018-09-23', 957.14);
insert into tb_vendas(data_venda, total)values('2018-10-01', 333.55);
insert into tb_vendas(data_venda, total)values('2018-10-02', 100.33);
insert into tb_vendas(data_venda, total)values('2018-10-03', 1853.12);
insert into tb_vendas(data_venda, total)values('2018-10-04', 47.47);

-- true/1 = ativo | false/0 = inativo
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(false);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(false);
insert into tb_clientes(cliente_ativo)values(false);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(true);
insert into tb_clientes(cliente_ativo)values(false);
insert into tb_clientes(cliente_ativo)values(true);

-- 1 = crítica | 2 = sugestão | 3 = elogio
insert into tb_contatos(tipo_contato)values(1);
insert into tb_contatos(tipo_contato)values(1);
insert into tb_contatos(tipo_contato)values(2);
insert into tb_contatos(tipo_contato)values(1);
insert into tb_contatos(tipo_contato)values(3);
insert into tb_contatos(tipo_contato)values(2);
insert into tb_contatos(tipo_contato)values(1);
insert into tb_contatos(tipo_contato)values(1);
insert into tb_contatos(tipo_contato)values(3);
insert into tb_contatos(tipo_contato)values(3);
insert into tb_contatos(tipo_contato)values(3);
insert into tb_contatos(tipo_contato)values(1);
insert into tb_contatos(tipo_contato)values(2);
insert into tb_contatos(tipo_contato)values(2);
insert into tb_contatos(tipo_contato)values(1);

insert into tb_despesas(data_despesa, total)values('2018-08-20', 93.47);
insert into tb_despesas(data_despesa, total)values('2018-09-01', 350.27);
insert into tb_despesas(data_despesa, total)values('2018-09-04', 108.12);
insert into tb_despesas(data_despesa, total)values('2018-09-20', 15.66);
insert into tb_despesas(data_despesa, total)values('2018-10-03', 83.55);