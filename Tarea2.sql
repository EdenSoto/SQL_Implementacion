USE master
GO
CREATE DATABASE Tarea2
ON PRIMARY
(	NAME = Tarea2_Dat, 
	FILENAME = 'D:\FIEE_DATA\Tarea2_Dat.mdf', 
	SIZE=5MB, 	MAXSIZE=200, 	FILEGROWTH=1)
LOG ON
(	NAME = Tarea2_Log, 
	FILENAME = 'D:\FIEE_DATA\Tarea2_Log.ldf', 
	SIZE=1MB,	MAXSIZE = 100, 	FILEGROWTH = 1)
GO
USE Tarea2
GO
--CREATE TABLE
CREATE TABLE EMPLEADO
(IdEmpleado		INT			NOT NULL,
 ApeEmp			VARCHAR(30)	NOT NULL,
 NombEmp		VARCHAR(30)	NOT	NULL,
 DNI_Emp		CHAR(8)		NOT NULL,
 direccion		VARCHAR(40)	NOT NULL)
GO

CREATE TABLE FAMILIAR
(IdFamiliar		INT			NOT NULL,
 ApeFam			VARCHAR(30)	NOT NULL,
 NomFam			VARCHAR(30)	NOT	NULL,
 parentesco		VARCHAR(20)	NOT	NULL,
 fechaNac		DATETIME	NOT NULL,
 IdEmpleado		INT			NOT NULL)
GO

CREATE TABLE EMP_DIRIGE_DEPA
(IdJefe			INT			NOT NULL,
 IdDepartamento	INT			NOT NULL,
 FechaInicio	DATETIME	NOT NULL)
GO

CREATE TABLE EMPLEADO_DEPA
(IdEmpleado		INT			NOT NULL,
 IdDepartamento	INT			NOT NULL,
 FechaIngreso	DATETIME	NOT NULL)
GO

CREATE TABLE DEPARTAMENTO
(IdDepartamento	INT			NOT NULL,
 nombreDepa		VARCHAR(20)	NOT NULL,
 Descripcion	VARCHAR(20)	NOT NULL)
GO

CREATE TABLE PROYECTO
(IdProyecto		INT			NOT NULL,
 nombreProy		VARCHAR(20)	NOT	NULL,
 FechaInicio	DATETIME	NOT	NULL,
 IdDepartamento	INT			NOT NULL,
 IdLugar		INT			NOT NULL)
GO

CREATE TABLE DEPARTM_LUGAR
(IdDepartamento	INT			NOT NULL,
 IdLugar		INT			NOT	NULL,
 NroOficina		VARCHAR(20)	NOT	NULL,
 telefono		VARCHAR(15)	NOT NULL,
 Aforo			VARCHAR(20)	NOT NULL)
GO

CREATE TABLE LUGAR
(IdLugar		INT			NOT NULL,
 Direccion		VARCHAR(40)	NOT	NULL,
 Distrito		VARCHAR(20)	NOT NULL,
 area			DECIMAL		NOT NULL)
GO
--PRIMARY KEY
ALTER TABLE EMPLEADO 
ADD CONSTRAINT	 CP_Empleado
PRIMARY KEY (IdEmpleado)
GO

ALTER TABLE FAMILIAR 
ADD CONSTRAINT	 CP_Familiar
PRIMARY KEY (IdFamiliar)
GO

ALTER TABLE EMP_DIRIGE_DEPA 
ADD CONSTRAINT	 CP_Emp_Dirige_Depa
PRIMARY KEY (IdJefe,IdDepartamento)
GO

ALTER TABLE EMPLEADO_DEPA 
ADD CONSTRAINT	 CP_Empleado_Depa
PRIMARY KEY (IdEmpleado,IdDepartamento)
GO

ALTER TABLE DEPARTAMENTO 
ADD CONSTRAINT	 CP_Departamento
PRIMARY KEY (IdDepartamento)
GO

ALTER TABLE PROYECTO 
ADD CONSTRAINT	 CP_Proyecto
PRIMARY KEY (IdProyecto)
GO

ALTER TABLE DEPARTM_LUGAR 
ADD CONSTRAINT	 CP_Departam_Lugar
PRIMARY KEY (IdDepartamento,IdLugar)
GO

ALTER TABLE LUGAR 
ADD CONSTRAINT	 CP_Lugar
PRIMARY KEY (IdLugar)
GO
EXEC SP_HELPCONSTRAINT EMPLEADO
EXEC SP_HELPCONSTRAINT FAMILIAR
EXEC SP_HELPCONSTRAINT EMP_DIRIGE_DEPA
EXEC SP_HELPCONSTRAINT EMPLEADO_DEPA
EXEC SP_HELPCONSTRAINT DEPARTAMENTO
EXEC SP_HELPCONSTRAINT PROYECTO
EXEC SP_HELPCONSTRAINT LUGAR
EXEC SP_HELPCONSTRAINT DEPARTM_LUGAR
GO
--FOREIGN KEY
ALTER TABLE FAMILIAR 
ADD CONSTRAINT FKEmpleado
FOREIGN KEY (IdEmpleado)  
REFERENCES EMPLEADO 
GO

ALTER TABLE EMP_DIRIGE_DEPA 
ADD CONSTRAINT FKJefeEMP
FOREIGN KEY (IdJefe	)  
REFERENCES EMPLEADO 
GO
ALTER TABLE EMP_DIRIGE_DEPA 
ADD CONSTRAINT FKDepartamentoEMP
FOREIGN KEY (IdDepartamento	)  
REFERENCES DEPARTAMENTO 
GO

ALTER TABLE EMPLEADO_DEPA 
ADD CONSTRAINT FKEmpleadoEmDepa
FOREIGN KEY (IdEmpleado	)  
REFERENCES EMPLEADO 
GO
ALTER TABLE EMPLEADO_DEPA 
ADD CONSTRAINT FKDepartamentoEmDepa
FOREIGN KEY (IdDepartamento	)  
REFERENCES DEPARTAMENTO 
GO

ALTER TABLE PROYECTO 
ADD CONSTRAINT FKDepartamentoPro
FOREIGN KEY (IdDepartamento	)  
REFERENCES DEPARTAMENTO 
GO
ALTER TABLE PROYECTO 
ADD CONSTRAINT FKLugarPro
FOREIGN KEY (IdLugar	)  
REFERENCES LUGAR 
GO

ALTER TABLE DEPARTM_LUGAR 
ADD CONSTRAINT FKLugarDepL
FOREIGN KEY (IdLugar	)  
REFERENCES LUGAR 
GO
ALTER TABLE DEPARTM_LUGAR 
ADD CONSTRAINT FKDepartamentoDepL
FOREIGN KEY (IdDepartamento	)  
REFERENCES DEPARTAMENTO 
GO

ALTER TABLE FAMILIAR 
ADD CONSTRAINT ParentInicial 
DEFAULT 'HIJO' FOR parentesco
GO
EXEC SP_HELPCONSTRAINT FAMILIAR
GO

ALTER TABLE EMPLEADO ADD Sueldo MONEY NULL
GO
EXEC SP_HELP EMPLEADO
GO

ALTER TABLE EMPLEADO 
ADD CONSTRAINT ReglaSueldo
CHECK  (Sueldo >=1000)
GO
EXEC SP_HELPCONSTRAINT EMPLEADO
GO

ALTER TABLE EMPLEADO 
ADD CONSTRAINT ConsDNI
UNIQUE(DNI_Emp)
GO
EXEC SP_HELPCONSTRAINT EMPLEADO
GO

EXEC SP_HELP EMPLEADO
GO
INSERT INTO EMPLEADO(IdEmpleado,NombEmp,DNI_Emp,direccion,Sueldo) 
			VALUES(1,'Flores','Ariana','32608612','Calle 1',1500)
GO
SELECT * FROM EMPLEADO
GO
INSERT INTO EMPLEADO VALUES(2,'Perez','AnTonio','03608512','Calle 2',1200)
INSERT INTO EMPLEADO VALUES(3,'Acosta','Claudia','13807552','Calle 3',1200)
GO
SELECT * FROM EMPLEADO
GO

UPDATE EMPLEADO	SET direccion=	'Nueva Direccion'
WHERE IdEmpleado =2
Go
SELECT * FROM EMPLEADO
GO

DELETE EMPLEADO  
WHERE IdEmpleado=3
GO
SELECT * FROM EMPLEADO
GO