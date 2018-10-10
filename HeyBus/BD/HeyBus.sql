/*create database if not exists HeyBus;
use HeyBus;

create table if not exists Acesso(
id_Acesso int auto_increment not null,
login_Acesso varchar(25),
senha_Acesso varchar(25),
nivel_Acesso char(15),
primary key (id_Acesso)
)ENGINE = innodb;

Delimiter $$ 
create Procedure SP_Cadastro_Acesso
(in login varchar(25), in senha varchar(25), in nivel char(15))
begin
	insert into Acesso (login_Acesso, senha_Acesso, nivel_Acesso) 
    values(login, senha, nivel);
end $$
Delimiter ;

create table if not exists Cliente(
id_Cliente int auto_increment not null,
cpf_Cliente char(14),
nome_Cliente varchar(70),
nascimento_Cliente date,
tel_Cliente char(20),
cel_Cliente char(20),
email_Cliente varchar(60),
primary key (id_Cliente)
) ENGINE = innodb;
alter table Cliente 
add column id_Acesso int;
alter table Cliente 
add foreign key (id_Acesso)
references Acesso(id_Acesso);

Delimiter $$ 
create Procedure SP_Cadastro_Cliente
(in cpf char(14),in nome varchar(70),in nascimento date,in tel char(20),in cel char(20),in email varchar(60),
 in acesso int)
begin 
	insert into Cliente (cpf_Cliente, nome_Cliente, nascimento_Cliente, tel_Cliente, cel_Cliente,
    email_Cleinte, id_Acesso) values (cpf, nome, nascimento, tel, cel, email, acesso);
end $$
Delimiter ;

Delimiter $$ 
create Procedure SP_Atualizar_Cliente
(in id int, in cpf char(14), in nome varchar(70), in nascimento date, in tel char(20), in cel char(20), in email varchar(60))
begin 
	update Cliente set 
					  cpf_Cliente = cpf,
					  nome_Cliente = nome,
                      nascimento_Cliente = nascimento,
                      tel_Cliente = tel,
                      cel_Cliente = cel,
                      email_Cliente = email
	where 
					  id_Cliente = id;
end $$
Delimiter ;

Delimiter $$
create Procedure SP_Deletar_Cliente
(in id int)
begin 
	delete from Cliente where id_Cliente = id;
end $$
Delimiter ;

Delimiter $$
create Procedure SP_Consultar_Cliente
(in id int)
begin 
	select Cliente.cpf_Cliente, Cliente.nome_Cliente, Cliente.nascimento_Cliente, Cliente.tel_Cliente, Cliente.cel_Cliente, Cliente.email_Cliente,
    Acesso.login_Acesso, Acesso.senha_Acesso from Cliente inner join Acesso on Cliente.id_Acesso = Acesso.id_Acesso where id_Cliente = id;
end $$
Delimiter ;

create table if not exists Funcionario(
id_Funcionario int auto_increment not null,
cpf_Funcionario char(14),
nome_Funcionario varchar(70),
email_Funcionario varchar(60),
endereco_Funcionario varchar(100),
primary key (id_Funcionario)
)ENGINE = innodb;
alter table Funcionario 
add column id_Acesso int;
alter table Funcionario
add foreign key(id_Acesso)
references Acesso(id_Acesso);

create table if not exists Gerente(
id_Gerente int auto_increment not null,
cpf_Gerente char(14),
nome_Gerente varchar(70),
email_Gerente varchar(60),
primary key (id_Gerente)
)ENGINE = innodb;
alter table Gerente
add column id_Acesso int;
alter table Gerente 
add foreign key(id_Acesso)
references Acesso(id_Acesso);

create table if not exists Rota(
id_Rota int auto_increment not null,
origem_Rota varchar(60),
destino_Rota varchar(60),
intinerario_Rota time,
distancia_Rota char(10),
primary key(id_Rota)
)ENGINE = innodb;

create table if not exists Onibus(
id_Onibus int auto_increment not null,
viacao_Onibus varchar(30),
categoria_Onibus varchar(30),
assentos_Onibus int,
manutencaoo_Onibus char(15),
primary key(id_Onibus)
)ENGINE = innodb;

create table if not exists Viagem(
id_Viagem int auto_increment not null,
id_Rota int,
id_Onibus int,
dataViagem date,
valorViagem decimal(3,2),
primary key(id_Viagem)
)ENGINE = innodb;
alter table Viagem 
add foreign key(id_Rota)
references Rota(id_Rota);
alter table Viagem 
add foreign key(id_Onibus)
references Onibus(id_Onibus);

create table if not exists FormaPagamento(
id_FormPag int auto_increment not null,
nome_FormPag char(15),
primary key(id_FormPag)
)ENGINE = innodb;
 
create table if not exists Passagem(
id_Passagem int auto_increment not null,
id_Cliente int,
id_Viagem int,
id_FormPag int,
cpf_Cliente char(14),
descontoPassagem decimal(3,2),
valorTotal decimal(4,2),
dataCompra datetime,
primary key(id_Passagem)
)ENGINE = innodb;
alter table Passagem
add foreign key(id_Cliente)
references Cliente(id_Cliente);
alter table Passagem
add foreign key(id_Viagem)
references Viagem(id_Viagem);
alter table Passagem
add foreign key(id_FormPag)
references FormaPagamento(id_FormPag);

create table if not exists Cartao(
id_Cartao int auto_increment not null,
num_Cartao int,
val_Cartao date,
nome_Cartao varchar(50),
bandeira_Cartao char(40),
codigo_Seg int,
primary key (id_Cartao)
)ENGINE = innodb;
alter table Cartao
add column id_Cliente int;
alter table Cartao
add foreign key(id_Cliente)
references Cliente(id_Cliente);