create database biblioteca;
use biblioteca;

create table Cliente(
id_cliente int AUTO_INCREMENT,
nome varchar(100),
email varchar(40),
telefone varchar(20),
endereco varchar(100),
PRIMARY KEY (id_cliente)
);


create table Funcionario(
id_funcionario int AUTO_INCREMENT,
nome varchar(100),
cargo varchar(40),
CPF char(11),
PRIMARY KEY (id_funcionario)
);

create table Autor(
id_autor int AUTO_INCREMENT,
nome_autor varchar(100),
PRIMARY KEY (ID_Autor)
);

create table Livro(
id_livro int AUTO_INCREMENT,
id_funcionario INT, -- puxando a chave estrangeira id_funcionario
ISBN BIGINT,
titulo varchar(60),
ano_publicacao year,
genero varchar(15),
status_livro tinyint(1) default 1, -- 1 para disponivel, 0 para indisponível
editora varchar(40),
quantidade int,
data_registro date,
PRIMARY KEY (id_livro), -- define a chave primaria
CONSTRAINT fk_funcionario1 -- dá um nome para a chave estrangeira
foreign key (id_funcionario) -- "ativando" a chave estrangeira
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
id_cliente int,
id_livro int,
id_funcionario int,
data_saida date,
data_devolucao date,
primary key (id_emprestimo),
constraint fk_emprestimo_cliente foreign key (id_cliente) references Cliente(id_cliente),
constraint fk_emprestimo_livro foreign key (id_livro) references Livro(id_livro),
constraint fk_emprestimo_funcionario foreign key (id_funcionario) references Funcionario(id_funcionario)
);

INSERT INTO Funcionario (nome, cargo, CPF) VALUES 
('Renato Wong', 'Gerente', '11122233344'), ('Patrícia Chen', 'Bibliotecária', '22233344455'),
('Bruno Liu', 'Assistente', '33344455566'), ('Sônia Yang', 'Atendente', '44455566677'),
('Caio Zhao', 'TI', '55566677788'), ('Larissa Wu', 'Estagiária', '66677788899'),
('Douglas Lin', 'Segurança', '77788899900'), ('Tatiane Xu', 'Catalogadora', '88899900011'),
('Fábio Sun', 'Atendente', '99900011122'), ('Viviane Ma', 'Auxiliar', '00011122233');

INSERT INTO Autor (nome_autor) VALUES 
('Machado Zhang'), ('Clarice Liu'), ('Jorge Chen'), ('Guimarães Wong'), 
('Cecília Yang'), ('Érico Zhao'), ('Graciliano Wu'), ('Lygia Lin'), 
('Monteiro Xu'), ('Rachel Sun');

INSERT INTO Cliente (nome, email, telefone, endereco) VALUES 
('João Wong', 'joao.wong@ex.com', '11910000001', 'Rua da Sorte, 1'),
('Maria Chen', 'maria.chen@ex.com', '11910000002', 'Av. da Paz, 2'),
('Pedro Liu', 'pedro.liu@ex.com', '11910000003', 'Rua China, 3'),
('Ana Yang', 'ana.yang@ex.com', '11910000004', 'Rua Brasil, 4'),
('Lucas Zhao', 'lucas.zhao@ex.com', '11910000005', 'Rua do Porto, 5'),
('Carla Wu', 'carla.wu@ex.com', '11910000006', 'Av. Central, 6'),
('Marcos Lin', 'marcos.lin@ex.com', '11910000007', 'Rua das Flores, 7'),
('Julia Xu', 'julia.xu@ex.com', '11910000008', 'Al. Santos, 8'),
('Rafael Sun', 'rafael.sun@ex.com', '11910000009', 'Rua da Liberdade, 9'),
('Beatriz Ma', 'beatriz.ma@ex.com', '11910000010', 'Vila Nova, 10');

INSERT INTO Livro (id_funcionario, ISBN, titulo, ano_publicacao, genero, editora, quantidade, data_registro) VALUES 
(1, 9788535914840, 'O Mistério de Pequim', 2010, 'Suspense', 'Luz', 5, '2023-01-01'),
(2, 9788535914841, 'Samba em Shanghai', 2015, 'Romance', 'Estrela', 3, '2023-01-02'),
(3, 9788535914842, 'O Dragão do Pantanal', 2020, 'Fantasia', 'Sol', 10, '2023-01-03'),
(1, 9788535914843, 'Culinária Híbrida', 2022, 'Gastronomia', 'Lua', 2, '2023-01-04');

drop database biblioteca;