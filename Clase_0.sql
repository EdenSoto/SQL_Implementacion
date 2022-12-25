--Itegridad referencial
USE master
GO


CREATE DATABASE PruebaIntegridad
ON PRIMARY
(	NAME = PI_Dat, 
	FILENAME = 'C:\FIEE_DATA\PI_Dat.mdf', 
	SIZE=5MB, 	MAXSIZE=200, 	FILEGROWTH=1)
LOG ON
(	NAME = PI_Log, 
	FILENAME = 'C:\FIEE_DATA\PI_Log.ldf', 
	SIZE=1MB,	MAXSIZE = 100, 	FILEGROWTH = 1)
GO

CREATE TABLE Departamento 
( IdDepartamento	INTEGER		PRIMARY KEY, 
  Nombre					VARCHAR(30) NOT NULL )
GO

EXEC SP_HELPCONSTRAINT  departamento
GO
CREATE TABLE Empleado
(IdEmpleado INTEGER NOT NULL, 
 Paterno VARCHAR(15) NOT NULL, 
 IdDepartamento INTEGER NOT NULL)
GO
EXEC SP_HELPCONSTRAINT  empleado
GO
ALTER TABLE Empleado 
ADD CONSTRAINT pk_empleado 
PRIMARY KEY(IdEmpleado)
GO
CREATE TABLE Producto ( 
	IdProducto	INTEGER	PRIMARY KEY, 
	Nombre		VARCHAR(30)		NOT NULL, 
	Precio			MONEY				NOT	NULL)
GO

CREATE TABLE Factura ( 
	IdFactura		INTEGER		PRIMARY KEY,
	FechaFac		DATETIME			NOT NULL, 	
	Cliente			VARCHAR(50)		NOT NULL)
GO

CREATE TABLE DetalleFactura (
	IdFactura	INTEGER NOT NULL,	
	IdProducto	INTEGER NOT NULL,
	Cantidad		INTEGER NOT NULL,	
	PrecioV		MONEY  NOT NULL	     
	PRIMARY KEY (IdFactura, IdProducto)   )
GO
CREATE TABLE DetalleFactura (
	IdFactura	INTEGER NOT NULL,	
	IdProducto	INTEGER NOT NULL,
	Cantidad		INTEGER NOT NULL,	
	PrecioV		MONEY  NOT NULL	     
	PRIMARY KEY (IdFactura, IdProducto)   )
GO



ALTER TABLE Empleado 
ADD CONSTRAINT fk_Depa 
FOREIGN KEY (IdDepartamento) 
REFERENCES Departamento
GO
ALTER TABLE Factura 
ADD CodEmp INT
GO

ALTER TABLE Factura 
ADD CONSTRAINT fk_emp 
FOREIGN KEY (CodEmp) 
REFERENCES Empleado
GO

ALTER TABLE Empleado 
ALTER TABLE Factura 
ALTER TABLE Factura 
ADD CONSTRAINT fk_emp 
ALTER TABLE DetalleFactura 
ADD CONSTRAINT fk_FacDet 
FOREIGN KEY (IdFactura) 
REFERENCES Factura
GO

ALTER TABLE DetalleFactura
 ADD CONSTRAINT fk_ProdDet 
FOREIGN KEY (IdProducto) 
REFERENCES Producto
GO
