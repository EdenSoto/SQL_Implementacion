USE MODEL--ubicar en una dirección
GO
USE tempdb
GO
USE master--ubicacion para crear base de datos
Go
CREATE DATABASE BETA--crear base de dato predeterminado
GO

USE master
GO
--crear un BD con archivos direccionados
CREATE DATABASE Ejemplo_2
ON PRIMARY
( NAME			=Ejemplo_2_Dat,
  FILENAME		='D:\FIEE_DATA\Ejemplo_2_Dat.mdf',
  SIZE			=5 MB,
  MAXSIZE		=200,
  FILEGROWTH	=5)
LOG ON
( NAME			=Ejemplo_2_Log,
  FILENAME		='D:\FIEE_DATA\Ejemplo_2_Log.ldf',
  SIZE			=1 MB,
  MAXSIZE		=100,
  FILEGROWTH	=1MB)
GO

EXECUTE SP_HELPDB--Ver todad las bse de datos que se tiene
GO
EXEC SP_HELPDB
GO
SP_HELPDB
GO
EXEC SP_HELPDB Ejemplo_2--Ver ubicacion la base de datos específico
GO

USE master
GO
CREATE DATABASE Ejemplo01
GO
CREATE DATABASE Ejemplo02
GO
CREATE DATABASE Ejemplo03
GO
EXEC SP_HELPDB
GO
--Eliminado un BD
DROP DATABASE Ejemplo03
GO
EXEC SP_HELPDB
GO
--Eliminando varias BD en una sola instrucción
DROP DATABASE Ejemplo01,Ejemplo02
GO
EXEC SP_HELPDB
GO

USE master
GO
--DROP DATABASE Tienda
--GO

CREATE DATABASE Tienda
ON PRIMARY
( NAME			=Tienda_Dat,
  FILENAME		='D:\FIEE_DATA\Tienda_Dat.mdf',
  SIZE			=5 MB,
  MAXSIZE		=200,
  FILEGROWTH	=5)
LOG ON
( NAME			=Tienda_Log,
  FILENAME		='D:\FIEE_DATA\Tienda_Log.ldf',
  SIZE			=1 MB,
  MAXSIZE		=100,
  FILEGROWTH	=1MB)
GO

USE Tienda
GO

CREATE TABLE PRODUCTO
(IdProducto		INT			NOT NULL,
 NomProd		VARCHAR(40)	NOT NULL,
 Unidad			VARCHAR(20)	NOT NULL)
GO

CREATE TABLE DETALLE_BOLETA
(IdProducto		INT			NOT NULL,
 NroBoleta		INT			NOT NULL,
 Can			INT			NOT	NULL,
 PreUniVen		MONEY		NOT NULL,
 SubTotal		MONEY		NOT NULL)
GO

CREATE TABLE BOLETA
(NroBoleta		INT			NOT NULL,
 Fecha			DATETIME	NOT NULL,
 Total			MONEY		NOT	NULL,
 idCliente		INT			NOT NULL,
 IdVendedor		INT			NOT NULL)
GO

CREATE TABLE CLIENTE
(IdCliente		INT			NOT NULL,
 CliNombre		VARCHAR(40)	NOT NULL,
 Telefono		VARCHAR(13)			)
GO

CREATE TABLE VENDEDOR
(IdVendedor		INT			NOT NULL,
 ApeVen			VARCHAR(30)	NOT NULL,
 NomVen			VARCHAR(30)	NOT NULL,
 Dni			CHAR(8)		NULL)
GO
--Definiendo las claves primarias
--(CONSTRAINTS) 
--Es un objeto de base de datos que establece un comportamente para un campo de una tabla

USE Tienda
GO
ALTER TABLE PRODUCTO--nombre de latabla
ADD CONSTRAINT PKProducto--nombre del constraints
PRIMARY KEY (idProducto)--tipo de campo
GO
EXEC sp_helpconstraint PRODUCTO
GO

ALTER TABLE DETALLE_BOLETA--nombre de latabla
ADD CONSTRAINT PKDetaBoleta--nombre del constraints
PRIMARY KEY (idProducto,NroBoleta)--tipo de campo
GO
EXEC sp_helpconstraint DETALLE_BOLETA
GO

ALTER TABLE BOLETA--nombre de latabla
ADD CONSTRAINT PKBoleta--nombre del constraints
PRIMARY KEY (NroBoleta)--tipo de campo
GO

ALTER TABLE CLIENTE--nombre de latabla
ADD CONSTRAINT PKCliente--nombre del constraints
PRIMARY KEY (IdCliente)--tipo de campo
GO

ALTER TABLE VENDEDOR--nombre de latabla
ADD CONSTRAINT PKVendedor--nombre del constraints
PRIMARY KEY (IdVendedor)--tipo de campo
GO

-----------------CLASE 2-------------------------
USE Tienda
GO

ALTER TABLE BOLETA
ADD CONSTRAINT FKCliente
FOREIGN KEY (IdCliente)
REFERENCES CLIENTE
GO
EXEC sp_helpconstraint BOLETA
GO
ALTER TABLE BOLETA
ADD CONSTRAINT FKVendedor
FOREIGN KEY (IdVendedor)
REFERENCES VENDEDOR
GO

ALTER TABLE DETALLE_BOLETA
ADD CONSTRAINT FKDetaProd
FOREIGN KEY (IdProducto)
REFERENCES PRODUCTO
GO

ALTER TABLE DETALLE_BOLETA
ADD CONSTRAINT FKDetaBol
FOREIGN KEY (NroBoleta)
REFERENCES BOLETA
GO