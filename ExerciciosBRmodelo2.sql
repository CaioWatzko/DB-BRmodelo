--Exercício 01

CREATE TABLE Cliente (
    CodCli numeric(10) PRIMARY KEY,
    NomeCli varchar(50),
    fk_CondicaoPGTO_CodPGTO numeric(10)
);


CREATE TABLE Produto (
    CodPro numeric(10) PRIMARY KEY,
    NomePro varchar(50)
);

CREATE TABLE CondicaoPGTO (
    CodPGTO numeric(10) PRIMARY KEY,
    DiasPGTO numeric(8),
    NomePGTO varchar(50)
);

CREATE TABLE Transportadora (
    CodTran numeric(10) PRIMARY KEY,
    NomeTran varchar(50),
    CNPJtran numeric(25)
);

CREATE TABLE Pedido (
    fk_Cargo_CodCli numeric(10),
    fk_Produto_CodPro numeric(10),
    fk_Transportadora_CodTran numeric(10),
    CodPed numeric(10) PRIMARY KEY,
    QTDEped numeric(25),
    DataPed DATE
);
 
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (fk_CondicaoPGTO_CodPGTO)
    REFERENCES CondicaoPGTO (CodPGTO)
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_Cargo_Produto_Transportadora_1
    FOREIGN KEY (fk_Cargo_CodCli)
    REFERENCES Cliente (CodCli)
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_Cargo_Produto_Transportadora_2
    FOREIGN KEY (fk_Produto_CodPro)
    REFERENCES Produto (CodPro)
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_Cargo_Produto_Transportadora_3
    FOREIGN KEY (fk_Transportadora_CodTran)
    REFERENCES Transportadora (CodTran)


	
	--Inserção de Dados em Cliente
	insert into Cliente values
	(56, 'BIG', 2)
	insert into Cliente values
	(102, 'Muffato', 1)
	insert into Cliente values
	(985, 'Extra', 5)
	insert into Cliente values
	(5, 'Pão de Açucar', 4)
	insert into Cliente values
	(76, 'Condor', 3)

	--Inserção de Dados em Produto
	insert into Produto values
	(1, 'Sabão em Pó')
	insert into Produto values
	(2, 'Cortador de Unha')
	insert into Produto values
	(3, 'Geladeira')
	insert into Produto values
	(4, 'TV')
	insert into Produto values
	(5, 'Shampoo')

	--Inserção de Dados em CondicaoPGTO
	insert into CondicaoPGTO values
	(1, 15, 'Henrique')
	insert into CondicaoPGTO values
	(2, 28, 'Márcio')
	insert into CondicaoPGTO values
	(3, 28, 'Márcia')
	insert into CondicaoPGTO values
	(4, 5, 'Thaís')
	insert into CondicaoPGTO values
	(5, 45, 'Geovana')

	--Inserção de Dados em Transportadora
	insert into Transportadora values
	(1, 'Trans Norte', 123)
	insert into Transportadora values
	(2, 'Sulamericana', 569)
	insert into Transportadora values
	(3, 'Leste Louco', 4235)
	insert into Transportadora values
	(4, 'Sefex', 8556)
	insert into Transportadora values
	(5, 'Raizin', 29)


	--Inserção de Dados em Pedido
	insert into Pedido values
	(56, 2, 1, 1, 250, '20190203')
	insert into Pedido values
	(102, 1, 2, 2, 398, '20190506')
	insert into Pedido values
	(985, 5, 3, 3, 798, '20190603')
	insert into Pedido values
	(5, 4, 4, 4, 45, '20190819')
	insert into Pedido values
	(76, 3, 5, 5, 210, '20190115')



	--Exercício 02
	select C.CodCli, C.NomeCli
	from Cliente C, Produto P, CondicaoPGTO G, Transportadora T, Pedido E
	where C.CodCli > 10 and C.CodCli < 540
		  and G.DiasPGTO in (28, 45)
	order by C.CodCli

	--Exercício 03
	select C.NomeCli, P.NomePro, T.NomeTran, G.NomePGTO
	from Cliente C, Produto P, CondicaoPGTO G, Transportadora T
	where C.NomeCli between 30 and 140
	  and P.NomePro between 30 and 140
	  and T.NomeTran between 30 and 140
	  and G.NomePGTO between 30 and 140


	 --Exercício 04
	 update pedidos
	 set
