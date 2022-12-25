--Itegridad referencial
USE master
GO


CREATE DATABASE PruebaIntegridad
ON PRIMARY
(	NAME = PI_Dat, 
	FILENAME = 'D:\FIEE_DATA\PI_Dat.mdf', 
	SIZE=5MB, 	MAXSIZE=200, 	FILEGROWTH=1)
LOG ON
(	NAME = PI_Log, 
	FILENAME = 'D:\FIEE_DATA\PI_Log.ldf', 
	SIZE=1MB,	MAXSIZE = 100, 	FILEGROWTH = 1)
GO
USE PruebaIntegridad
GO
--Forma abrevbiada
CREATE TABLE Departamento 
( IdDepartamento	INTEGER		PRIMARY KEY, 
  Nombre			VARCHAR(30) NOT NULL )
GO
EXEC SP_HELP departamento
GO
EXEC SP_HELPCONSTRAINT  departamento
GO
CREATE TABLE Empleado(
	IdEmpleado INTEGER NOT NULL, 
	Paterno VARCHAR(15) NOT NULL, 
	IdDepartamento INTEGER NOT NULL)
GO
EXEC SP_HELPCONSTRAINT empleado
GO
ALTER TABLE Empleado 
ADD CONSTRAINT pk_empleado 
PRIMARY KEY(IdEmpleado)
GO
EXEC SP_HELPCONSTRAINT empleado
GO
CREATE TABLE Producto ( 
	IdProducto	INTEGER	PRIMARY KEY, 
	Nombre		VARCHAR(30)		NOT NULL, 
	Precio			MONEY		NOT	NULL)
GO
CREATE TABLE Factura ( 
	IdFactura		INTEGER		PRIMARY KEY,
	FechaFac		DATETIME			NOT NULL, 	
	Cliente			VARCHAR(50)		NOT NULL)
GO
CREATE TABLE DetalleFactura (
	IdFactura	INTEGER NOT NULL,	
	IdProducto	INTEGER NOT NULL,
	Cantidad	INTEGER NOT NULL,	
	PrecioV		MONEY  NOT NULL	     
	PRIMARY KEY (IdFactura, IdProducto)   )
GO


/* Alter table detalleFactura  
  add constraint pk_detalleFactura 
  primary key(IdFactura,IdEmpleado)  */--Forma larga


  SP_HELPCONSTRAINT detalleFactura
  GO

--ESTABLECIENDO UNA LLAVE FORANEA o Foreign Key (FK)
-- Vamos a crear en la Tabla Empleado una CONSTRAINT de tipo FOREIGN KEY 
 --A este nuevo CONSTRAINT le vamos a poner el nombre fk_empleado
 --y va a trabajar sobre el campo IdDepartamento de esta Tabla Empleado
 --haciendo referencia a la Clave primaria (IdDepartamento) de la Tabla  Departamento.
--Previamente creamos un diagrama de la dase de datos actual, y verificamos que las tablas Departamento y Empleado no esta relacionadas todavia.
ALTER TABLE Empleado 
ADD CONSTRAINT fk_Depa 
FOREIGN KEY (IdDepartamento) 
REFERENCES Departamento
GO
-- Relacionar todas las otras tablas
ALTER TABLE Factura 
ADD CodEmp INT 
GO
ALTER TABLE Factura 
ADD CONSTRAINT fk_emp 
FOREIGN KEY (CodEmp) 
REFERENCES Empleado
GO
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


SELECT * FROM departamento
GO
INSERT INTO Departamento (IdDepartamento,Nombre) 
                                    VALUES ( 10,'Contabilidad')
GO

SELECT * FROM departamento
GO
--Se puede omitir INTO en microsof
--(IdDepartamento,Nombre)si no se pone se tine que colocar la inf ordenado
INSERT departamento VALUES ( 7,'Recursos Humanos')
INSERT departamento VALUES ( 20,'Logistica')
INSERT departamento VALUES ( 13,'Ventas')
GO

SELECT*FROM Departamento
GO

INSERT Departamento VALUES ( 20,'Marketing')
GO

INSERT Departamento VALUES(21,'Ventas')
GO

select*from departamento
GO
--UNIQUE
ALTER TABLE Departamento	
ADD CONSTRAINT u_nombre	
UNIQUE(Nombre)
GO

select*from departamento
GO

--Borrar un registro de la tabla
DELETE Departamento  
WHERE IdDepartamento=21
GO
SELECT*FROM DEPARTAMENTO
GO
ALTER TABLE Departamento	
ADD CONSTRAINT u_nombre	
UNIQUE(Nombre)
GO

SP_HELPCONSTRAINT  Departamento
GO

select*from departamento
GO

INSERT Departamento VALUES (88,'LOGISTICA')
GO
/*Luego verificamos nuevamente como queda el Diagrama y 
comprobamos que ya estan relacionadas las dos tablas  
Tambien comprobamos por medio de Procedimentos Almacemados
como esta la Tabla Empleado actualmente*/
SP_HELPCONSTRAINT empleado
GO
SELECT * FROM departamento
SELECT * FROM empleado
GO
/*Observamos que en la tabla Empleado no hay registros todavia.
Luego Insertamos los siguientes registros*/
insert empleado values (1,'Castro',13)
insert empleado values (2,'Quiroga',1) 
insert empleado values (3,'Mejia',10)
insert empleado values (4,'Aviles',20)
GO
/*

Salen los siguientes mensajes:

(1 row(s) affected)

Msg 547, Level 16, State 0, Line 2
The INSERT statement conflicted with the FOREIGN KEY constraint "fk_empleado". 
The conflict occurred in database "PruebaIntegridad", 
table "dbo.departamento", column 'IdDepartamento'.
The statement has been terminated.

(1 row(s) affected)

(1 row(s) affected)

Comprobamos como quedo la tabla Empleado
comprobamos que la insercion
insert empleado values (2,'Quiroga',1)
no tuvo exito, ya que no existe el departamento con codigo 1
si se permitiera esto tendriamos registrado al empleado Quiroga 
que no esta relacionado con ningun departamento de la tabla Departamento
lo cual seria considerado como un registro sin refencia,
un registro que no tiene padre, un "registro huerfano", 
lo cual esta restringido en este contexto
Comprobamos la situacion final de las dos tablas Departamento y Empleado*/
select*from departamento
select*from Empleado
GO
select * from producto
go
ALTER TABLE Producto 
ADD CONSTRAINT PreDefa 
DEFAULT 5 FOR Precio
GO
sp_helpconstraint Producto
go
select * from producto
go
INSERT INTO Producto (Idproducto,nombre) VALUES (1,'leche')
GO
select * from producto
go
ALTER TABLE Producto 
ADD CONSTRAINT RangoPre
CHECK (precio BETWEEN 5 AND 150)--BETWEEN =entre
go
INSERT INTO PRODUCTO VALUES (2,'QUINUA',9)
GO
select * from producto
go

INSERT INTO PRODUCTO VALUES (3,'AVENA',4)
GO

INSERT INTO PRODUCTO VALUES (4,'ARROZ',151)
GO
SELECT * FROM PRODUCTO
GO

SELECT GETDATE()
GO


SP_HELPCONSTRAINT  Orders
GO