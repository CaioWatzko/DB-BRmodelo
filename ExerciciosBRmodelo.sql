--Exercício 01--

CREATE TABLE Fincionario (
    Matricula numeric(10) PRIMARY KEY,
    NomeF varchar(50)
);

CREATE TABLE Dependente (
    Codigo numeric(10) PRIMARY KEY,
    NomeD varchar(50),
    fk_Fincionario_Matricula numeric(10)
);
 
ALTER TABLE Dependente ADD CONSTRAINT FK_Dependente_2
    FOREIGN KEY (fk_Fincionario_Matricula)
    REFERENCES Fincionario (Matricula)

	--Exercício 02--
	select F.NomeF , D.NomeD from Fincionario F, Dependente D
	where F.Matricula = fk_Fincionario_Matricula

	--Exercício 03--
	select F.NomeF, count(D.NomeD) as QtdeDeDepend from Fincionario F, Dependente D
	group by F.NomeF



	--Exercício 04--


CREATE TABLE Veiculo (
    Placa varchar(7) PRIMARY KEY,
    Marca varchar(20),
    Modelo numeric(38),
    Cor varchar(20),
    IPVA numeric(10),
    fk_Proprietario_Codigo numeric(10)
);

CREATE TABLE Proprietario (
    Codigo numeric(10) PRIMARY KEY,
    Nome varchar(38),
    CPF numeric(11)
);
 
ALTER TABLE Veiculo ADD CONSTRAINT FK_Veiculo_2
    FOREIGN KEY (fk_Proprietario_Codigo)
    REFERENCES Proprietario (Codigo)

--Exercício 05
select P.Nome, V.* from Proprietario P, Veiculo V
where P.Codigo = V.fk_Proprietario_Codigo

--Exercício 06--
select sum(V.IPVA) as IPVA_por_CPF from Veiculo V, Proprietario P
group by P.CPF


--Exercício 07--


CREATE TABLE Diciplina (
    Codigo numeric(10) PRIMARY KEY,
    NomeD varchar(25),
    fk_Professor_Matricula numeric(10)
);

CREATE TABLE Professor (
    Matricula numeric(10) PRIMARY KEY,
    NomeP varchar(38)
);
 
ALTER TABLE Diciplina ADD CONSTRAINT FK_Diciplina_2
    FOREIGN KEY (fk_Professor_Matricula)
    REFERENCES Professor (Matricula)

	--Exercício 08--
	select P.NomeP, D.NomeD from Professor P, Diciplina D
	where P.Matricula = D.fk_Professor_Matricula

	--Exercício 09--
	select P.NomeP, count(D.NomeD) as Qtde from Professor P, Diciplina D
	group by P.NomeP

	+--Exercício 10--





	+--Exercício 03--





	--Ecercício 16--


CREATE TABLE DependenteUF (
    CodDependente numeric (11) PRIMARY KEY,
    NomeDep varchar(38),
    DataNasc DATE,
    fk_Funcionario_Matricula numeric (11)
);

CREATE TABLE FuncionarioUF (
    Matricula numeric (11) PRIMARY KEY,
    NomeFunc varchar(38),
    CPF numeric (11),
    Email varchar(38),
    fk_Municipio_CodMunicipio numeric (11)
);

CREATE TABLE Municipio (
    CodMunicipio numeric (11) PRIMARY KEY,
    NomeMunicipio varchar(38),
    fk_UF_CodUF numeric (11)
);

CREATE TABLE UF (
    CodUF numeric (11) PRIMARY KEY,
    NomeUF varchar(38)
);
 
ALTER TABLE DependenteUF alter column NomeDep varchar(80)

ALTER TABLE DependenteUF ADD CONSTRAINT FK_Dependente_22
    FOREIGN KEY (fk_Funcionario_Matricula)
    REFERENCES FuncionarioUF (Matricula)
 
ALTER TABLE FuncionarioUF ADD CONSTRAINT FK_Funcionario_22
    FOREIGN KEY (fk_Municipio_CodMunicipio)
    REFERENCES Municipio (CodMunicipio)

ALTER TABLE Municipio ADD CONSTRAINT FK_Municipio_2
    FOREIGN KEY (fk_UF_CodUF)
    REFERENCES UF (CodUF)
	
	--Inserção Na tabela Dependentes
	insert into DependenteUF values
	(1, 'Augusto Cunha', '19960316', 1)
	insert into DependenteUF values
	(2, 'Manezinho', '19980102', 3)
	insert into DependenteUF values
	(3, 'fanfarrinha', '19601205', 3)
	insert into DependenteUF values
	(4, 'Porq Terra', '19850918', 2)
	insert into DependenteUF values
	(5, 'Maia da Costa', '19790817', 5)

	--Inserção na Tabela FuncionarioUF--
	insert into FuncionarioUF values
	(1, 'José Nunes', 55689878656, 'jose@gmail.com', 3)
	insert into FuncionarioUF values
	(2, 'Agatha Faria', 01222145623, 'agfaria@gmail.com', 5)
	insert into FuncionarioUF values
	(3, 'Mario Jap', 99853642187, 'itsme@gmail.com', 2)
	insert into FuncionarioUF values
	(4, 'Fernanda Toucinho', 47658955233, 'torr@gmail.com', 1)
	insert into FuncionarioUF values
	(5, 'Carlos Moro', 78526545535, 'carlos@gmail.com', 1)

	--Inserção Na Tabela Municipio--
	insert into Municipio values
	(1, 'Santo André', 1)
	insert into Municipio values
	(2, 'Palmas', 2)
	insert into Municipio values
	(3, 'Curitiba', 4)
	insert into Municipio values
	(4, 'Joinville', 3)
	insert into Municipio values
	(5, 'Bahia', 5)

	--Inserção na Tabela UF--
	insert into UF values
	(1, 'São Paulo')
	insert into UF values
	(2, 'Tocantins')
	insert into UF values
	(3, 'Santa Catarina')
	insert into UF values
	(4, 'Paraná')
	insert into UF values
	(5, 'Bahia')


	--Exercício 17--
	Select F.NomeFunc, D.NomeDep, M.NomeMunicipio, U.NomeUF 
	from FuncionarioUF F, DependenteUF D, Municipio M, UF U
	where F.Matricula = D.fk_Funcionario_Matricula
	and M.CodMunicipio = F.fk_Municipio_CodMunicipio
	and U.CodUF = M.fk_UF_CodUF

	--Exercício 18--
	select F.NomeFunc, count (D.NomeDep) as QtdeDep_Palmas_TOC
	from FuncionarioUF F, DependenteUF D, Municipio M, UF U
	where M.NomeMunicipio = 'Palmas'
	and U.NomeUF = 'Tocantins'
	group by F.NomeFunc

	--Exercício 19--
	select U.NomeUF, count(F.NomeFunc) as QtdeFunc from UF U, FuncionarioUF F
	group by U.NomeUF

	--Exercício 20--
	update FuncionarioUF
	set Email = substring(U.NomeUF, 1, 5) + substring(M.NomeMunicipio, 1, 3) + RIGHT(D.NomeDep,4) + '@unicesumar.edu.br' 
	from DependenteUF D, Municipio M, UF U
	where U.NomeUF = 'Paraná' OR  U.NomeUF =  'São Paulo' OR U.NomeUF = 'Santa Catarina' OR U.NomeUF = 'Minas Gerais' OR U.NomeUF = 'Bahia'
	and D.DataNasc > '19800101' and D.DataNasc < '20190926'

	--Exercício 21--
	delete from DependenteUF where 