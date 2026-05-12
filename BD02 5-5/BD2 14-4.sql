create database biblioteca;
use biblioteca;

create table Cliente(
id_cliente int AUTO_INCREMENT,
nome varchar(40),
email varchar(40),
telefone varchar(20),
endereco varchar(40),
PRIMARY KEY (id_cliente)
);


create table Funcionario(
id_funcionario int AUTO_INCREMENT,
nome varchar(40),
cargo varchar(40),
CPF char(11),
PRIMARY KEY (id_funcionario)
);

create table Autor(
id_autor int AUTO_INCREMENT,
nome_autor varchar(40),
PRIMARY KEY (ID_Autor)
);

create table Livro(
id_livro int AUTO_INCREMENT,
ISBN int(13),
titulo varchar(60),
ano_publicacao int(4),
genero varchar(15),
status_livro tinyint(1) default 1, -- 1 para disponivel, 0 para indisponível
editora varchar(40),
quantidade int,
data_registro varchar(10),
PRIMARY KEY (id_livro), -- define a chave primaria
CONSTRAINT fk_funcionario1 -- dá um nome para a chave estrangeira
foreign key (id_funcionario) -- puxando a chave estrangeira id_funcionario
references Funcionario(id_funcionario) -- indicando o lugar de origem da chave estrangeira
);

create table Livro_autor(
id_livro int,
id_autor int,
papel_autor varchar(100),
primary key (id_livro, id_autor),
constraint fk_livro_autor_livro foreign key (id_livro) references Livro(id_livro),
constraint fk_autor1 foreign key (id_autor) references Autor(id_autor)
);

create table emprestimo(
id_emprestimo int AUTO_INCREMENT,
data_saida varchar(10),
data_devolucao varchar(10),
primary key (id_emprestimo),
constraint fk_emprestimo_cliente foreign key (id_cliente) references Cliente(id_cliente),
constraint fk_emprestimo_livro foreign key (id_livro) references Livro(id_livro),
constraint fk_emprestimo_funcionario foreign key (id_funcionario) references Funcionario(id_funcionario)
);

drop database biblioteca;