USE master
GO
CREATE DATABASE TecnoEduca
ON PRIMARY
( NAME			=TecnoEduca_Dat,
  FILENAME		='D:\ExamenFin\TecnoEduca_Dat.mdf',
  SIZE			=5 MB,
  MAXSIZE		=200,
  FILEGROWTH	=5)
LOG ON
( NAME			=TecnoEduca_Log,
  FILENAME		='D:\ExamenFin\TecnoEduca_Log.ldf',
  SIZE			=1 MB,
  MAXSIZE		=100,
  FILEGROWTH	=1MB)
GO


--------------
USE TecnoEduca
GO
CREATE TABLE CURSOASIGNADO 
(IdCursoAsig	INT	IDENTITY(1,1)	NOT NULL,
 FechaInicio	DATE				NOT NULL,
 Costo			MONEY				NOT	NULL,
 Aula			VARCHAR(4)			NOT NULL)
GO

CREATE TABLE PROFESOR
(IdProfesor			INT	IDENTITY(1,1)		NOT NULL,
 ApeProfesor		VARCHAR(30)				NOT NULL,
 NomProfesor		VARCHAR(30)				NOT	NULL,
 Especialidad		VARCHAR(80)				NOT NULL,
 Fecha_Ingreso		DATE					NOT NULL,
 RUC_Profesor		CHAR(11)				NOT NULL,
 DirProfesor		VARCHAR(60)				 NULL)
GO
-------------
ALTER TABLE CURSOASIGNADO WITH NOCHECK
ADD CONSTRAINT Reglacosto
CHECK (Costo >=0)
GO
EXEC SP_HELPCONSTRAINT CURSOASIGNADO 
GO
-----------
ALTER TABLE PROFESOR 
ADD CONSTRAINT FechaDef 
DEFAULT  GETDATE() FOR Fecha_Ingreso
GO

EXEC SP_HELPCONSTRAINT PROFESOR 
GO

--------
ALTER TABLE PROFESOR	
ADD CONSTRAINT RUCunico
UNIQUE(RUC_Profesor)
GO

EXEC SP_HELPCONSTRAINT PROFESOR 
GO
--------------
ALTER TABLE PROFESOR
ADD CONSTRAINT PKProfesor
PRIMARY KEY (IdProfesor)
GO

ALTER TABLE CURSOASIGNADO
ADD CONSTRAINT PKCursoAsig
PRIMARY KEY (IdCursoAsig)
GO


ALTER TABLE CURSOASIGNADO ADD IdProfesor INT NOT NULL 
GO
ALTER TABLE CURSOASIGNADO 
ADD CONSTRAINT FKProfesor
FOREIGN KEY (IdProfesor)  
REFERENCES PROFESOR 
GO
---------

INSERT INTO PROFESOR(ApeProfesor,NomProfesor,Especialidad,RUC_Profesor) 
			VALUES('Perez','Antonio','Matemática','25638468916')
GO
INSERT INTO PROFESOR(ApeProfesor,NomProfesor,Especialidad,RUC_Profesor) 
			VALUES('Acosta','Claudia','Química','55638668916')
GO
INSERT INTO PROFESOR(ApeProfesor,NomProfesor,Especialidad,RUC_Profesor) 
			VALUES('Salazar','Juan','Física','23638469946')
GO
SELECT * FROM PROFESOR
GO

UPDATE PROFESOR	SET DirProfesor=	'Calle 1'
WHERE IdProfesor =1
Go

UPDATE PROFESOR	SET DirProfesor=	'Calle 2'
WHERE IdProfesor =2
Go
SELECT * FROM PROFESOR
GO


DELETE PROFESOR 
WHERE IdProfesor =3
GO
SELECT * FROM PROFESOR
GO
-----------------------

use pubs
go

select*from publishers
go
--sin filtro 
select
	pub_id as [código del editor],
	pub_name as [nombre del editor],
	country +'-'+ city as Ubicación
from publishers
go
--con filtro
select
	pub_id as [código del editor],
	pub_name as [nombre del editor],
	country +'-'+ city as Ubicación
from publishers
where country!='USA'
go
-----------
--nombre del producto, nombre de la categoria y proveedor
use MarketPERU
go

select*
from		CATEGORIA	C
inner join	PRODUCTO	P	ON C.IdCategoria=P.IdCategoria
inner join	PROVEEDOR	PV	ON P.IdProveedor=PV.IdProveedor
go
select*from PROVEEDOR
go
select
	P.Nombre as [nombre del producto],
	C.Categoria as [nombre de la categoria],
	PV.Representante as [proveedor]
from		CATEGORIA	C
inner join	PRODUCTO	P	ON C.IdCategoria=P.IdCategoria
inner join	PROVEEDOR	PV	ON P.IdProveedor=PV.IdProveedor
where C.Categoria in ('LACTEOS' , 'LIMPIEZA') and PV.IdProveedor in (2,5,11)
order by 3
go


