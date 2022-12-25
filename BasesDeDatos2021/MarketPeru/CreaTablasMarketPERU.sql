-- Creaci�n de la base de dato
-------------------------------
USE master
go


CREATE DATABASE MarketPERU
ON PRIMARY
(NAME =  MarketPERU_Dat, FILENAME='D:\FIEE_DATA\MarketPERU_Dat.mdf', 
 SIZE = 5MB, MAXSIZE = 200, FILEGROWTH = 1 )
LOG ON
(NAME = MarketPERU_Log, FILENAME ='D:\FIEE_DATA\MarketPERU_Log.ldf',
 SIZE = 1MB, MAXSIZE = 200, FILEGROWTH= 1MB)
GO
USE MarketPERU
go
-- Creaci�n de las tablas
-------------------------

CREATE TABLE GUIA_DETALLE (
        IdGuia               int NOT NULL,
        IdProducto           int NOT NULL,
        PrecioVenta          money NOT NULL,
        Cantidad             smallint NOT NULL )
go
 
 
ALTER TABLE GUIA_DETALLE
	ADD PRIMARY KEY (IdGuia, IdProducto)
go
 
CREATE TABLE ORDEN_DETALLE (
        IdOrden              int NOT NULL,
        IdProducto           int NOT NULL,
        PrecioCompra         money NOT NULL,
        CantidadSolicitada   smallint NOT NULL,
        CantidadRecibida     smallint NULL,
        Estado               varchar(10) NULL )
go
  
ALTER TABLE ORDEN_DETALLE
        ADD PRIMARY KEY (IdOrden, IdProducto)
go
 
CREATE TABLE PRODUCTO (
        IdProducto           int IDENTITY,
        IdCategoria          int NOT NULL,
        IdProveedor          int NOT NULL,
        Nombre               varchar(40) NOT NULL,
        UnidadMedida         varchar(30) NULL,
        PrecioProveedor      money NULL,
        StockActual          smallint NULL,
        StockMinimo          smallint NULL,
        Descontinuado        bit )
go
 
ALTER TABLE PRODUCTO
        ADD PRIMARY KEY (IdProducto)
go
 
ALTER TABLE PRODUCTO
	ADD UNIQUE (Nombre, UnidadMedida)
go
CREATE TABLE PROVEEDOR (
        IdProveedor          int IDENTITY,
        Nombre               varchar(40) NOT NULL,
        Representante        varchar(30) NULL,
        Direccion            varchar(60) NULL,
        Ciudad               varchar(15) NULL,
        Departamento         varchar(15) NULL,
        CodigoPostal         varchar(15) NULL,
        Telefono             varchar(15) NULL,
        Fax                  varchar(15) NULL )
go
 
ALTER TABLE PROVEEDOR
        ADD PRIMARY KEY (IdProveedor)
go
 
CREATE TABLE CATEGORIA (
        IdCategoria          int IDENTITY,
        Categoria            varchar(20) NOT NULL,
        Descripcion          varchar(40) NULL )
go
 
ALTER TABLE CATEGORIA
        ADD PRIMARY KEY (IdCategoria)
go

ALTER TABLE CATEGORIA
	ADD UNIQUE (Categoria)
go
 
CREATE TABLE GUIA (
        IdGuia               int NOT NULL,
        IdLocal              int NOT NULL,
        FechaSalida          datetime NOT NULL,
        Transportista        varchar(30) NOT NULL )
go

ALTER TABLE GUIA
        ADD PRIMARY KEY (IdGuia)
go

CREATE TABLE LOCAL (
        IdLocal              int NOT NULL,
        Direccion            varchar(60) NULL,
        Distrito             varchar(20) NULL,
        Telefono             varchar(15) NULL,
        Fax                  varchar(15) NULL )
go
 
ALTER TABLE LOCAL
        ADD PRIMARY KEY (IdLocal)
go

CREATE TABLE ORDEN (
        IdOrden              int NOT NULL,
        FechaOrden           datetime NOT NULL,
        FechaEntrada         datetime NULL )
go
 
ALTER TABLE ORDEN
        ADD PRIMARY KEY (IdOrden)
go
 
 
ALTER TABLE GUIA_DETALLE
	ADD FOREIGN KEY (IdProducto)
	REFERENCES PRODUCTO
go
 
ALTER TABLE GUIA_DETALLE
        ADD FOREIGN KEY (IdGuia)
	REFERENCES GUIA
go
  
ALTER TABLE ORDEN_DETALLE
        ADD FOREIGN KEY (IdOrden)
	REFERENCES ORDEN
go
 
ALTER TABLE ORDEN_DETALLE
        ADD FOREIGN KEY (IdProducto)
	REFERENCES PRODUCTO
go
  
ALTER TABLE PRODUCTO
        ADD FOREIGN KEY (IdProveedor)
	REFERENCES PROVEEDOR
go
 
ALTER TABLE PRODUCTO
        ADD FOREIGN KEY (IdCategoria)
	REFERENCES CATEGORIA
go
 
ALTER TABLE GUIA
        ADD FOREIGN KEY (IdLocal)
	REFERENCES LOCAL
go
 
SELECT name FROM sysobjects WHERE type = 'U'
go
 