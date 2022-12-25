USE master
GO
CREATE DATABASE TransporteP
ON PRIMARY
( NAME			=TransporteP_Dat,
  FILENAME		='D:\FIEE_DATA\TransporteP_Dat.mdf',
  SIZE			=5 MB,
  MAXSIZE		=200,
  FILEGROWTH	=1)
LOG ON
( NAME			=TransporteP_Log,
  FILENAME		='D:\FIEE_DATA\TransporteP_Log.ldf',
  SIZE			=1 MB,
  MAXSIZE		=50,
  FILEGROWTH	=1MB)
GO
USE TransporteP
GO
CREATE TABLE CIUDAD
(IdCiudad		INT			NOT NULL,
 NombreC		VARCHAR(20)	NOT NULL,
 Altura			INT			NOT	NULL,
 Clima			VARCHAR(20)	NOT NULL,
 NroHabit		INT			)
GO

CREATE TABLE RUTA
(	NroRuta			INT			NOT NULL,
	Precio			MONEY		NOT NULL,
	HoraSalProg		DATETIME	NOT NULL,
	HoraLlegProg	DATETIME	NOT NULL, 
	IdCiudadOrg		INT			NOT NULL,
	IdCiudadDest	INT			NOT NULL)
GO	

CREATE TABLE VIAJE
(	NroViaje		INT			NOT NULL,
	FechaSalida		DATETIME	NOT NULL,
	HoraSalReal		DATETIME	NOT NULL,
	HoraLlegReal	DATETIME	NOT NULL, 
	NroRuta			INT			NOT NULL,
	NroBus			INT			NOT NULL	)
GO

CREATE TABLE VIAJE_TRIPULANTE
(	NroViaje		INT			NOT NULL,
	IdTripulante	INT			NOT NULL,
	CargoViaje		VARCHAR(20)	NOT NULL	)
GO

CREATE TABLE VIAJE_PASAJERO
(	NroViaje		INT			NOT NULL,
	IdPasajero		INT			NOT NULL,
	NroAsiento		VARCHAR(4)	NOT NULL,
	Pasaje			MONEY		NOT NULL 	)
GO
CREATE TABLE BUS
(	NroBus			INT			NOT NULL,
	Marca			VARCHAR(20)	NOT NULL,
	Modelo			VARCHAR(20)	NOT NULL,
	NroPlaca		VARCHAR(20)	NOT NULL,
	FechaFab		DATETIME	NOT NULL, 
	NroAsientos		INT			NOT NULL,
	IdFabricante	INT			NOT NULL	)
GO
CREATE TABLE TRIPULANTE
(	IdTripulante	INT			NOT NULL,
	Apellidos		VARCHAR(20)	NOT NULL,
	Nombres			VARCHAR(20)	NOT NULL,
	dniTrip			CHAR(8)		NULL,
	DirecTrip		VARCHAR(40)	NOT NULL,
	TelefTrip		VARCHAR(15)	NOT NULL	)
GO
CREATE TABLE PASAJERO
(	IdPasajero		INT			NOT NULL,
	Apellidos		VARCHAR(20)	NOT NULL,
	Nombres			VARCHAR(20)	NOT NULL,
	dni				CHAR(8)		NULL,
	DirPas			VARCHAR(40)	NOT NULL,
	TefPas			VARCHAR(15)	NOT NULL,
	FechaNac		DATETIME	NOT NULL 	)
GO
CREATE TABLE FABRICANTE
(	IdFabricante	INT			NOT NULL,
	NomComp			VARCHAR(20)	NOT NULL,
	Representante	VARCHAR(20)	NOT NULL,
	Direccion		VARCHAR(40)	NOT NULL,
	Telefono		VARCHAR(15)	NOT NULL 	)
GO

--DEFINIENDO LAS CLAVES PRIMARIAS 
-- (CONSTRAINTS)
ALTER TABLE CIUDAD 
ADD CONSTRAINT	 PKCiudad
PRIMARY KEY (IdCiudad)
GO
EXEC SP_HELPCONSTRAINT CIUDAD
GO
ALTER TABLE RUTA 
ADD CONSTRAINT	 PKRuta
PRIMARY KEY (NroRuta)
GO
EXEC SP_HELPCONSTRAINT RUTA
GO
ALTER TABLE VIAJE 
ADD CONSTRAINT	 PKViaje
PRIMARY KEY (NroViaje)
GO
EXEC SP_HELPCONSTRAINT VIAJE
GO
ALTER TABLE VIAJE_TRIPULANTE
ADD CONSTRAINT	 PKViaje_Trip
PRIMARY KEY (NroViaje, IdTripulante)
GO
EXEC SP_HELPCONSTRAINT VIAJE_TRIPULANTE
GO
ALTER TABLE VIAJE_PASAJERO
ADD CONSTRAINT	 PK_VIAJE_PASAJ
PRIMARY KEY (NroViaje, IdPasajero)
GO
EXEC SP_HELPCONSTRAINT VIAJE_PASAJERO
GO
ALTER TABLE BUS 
ADD CONSTRAINT	 PKBus
PRIMARY KEY (NroBUS)
GO
EXEC SP_HELPCONSTRAINT BUS
GO
ALTER TABLE TRIPULANTE 
ADD CONSTRAINT	 PKTripulante
PRIMARY KEY (IdTripulante)
GO
EXEC SP_HELPCONSTRAINT TRIPULANTE
GO
ALTER TABLE PASAJERO 
ADD CONSTRAINT	 PKPasajero
PRIMARY KEY (IdPasajero)
GO
EXEC SP_HELPCONSTRAINT PASAJERO
GO
ALTER TABLE FABRICANTE 
ADD CONSTRAINT	 PKFabricante
PRIMARY KEY (IdFabricante)
GO
EXEC SP_HELPCONSTRAINT FABRICANTE
GO

-- ESTABLECIENDO LAS RELACIONES CON CONSTRAINTS 
-- DE FOREIGN KEY
ALTER TABLE RUTA 
ADD CONSTRAINT FKCiudaOrg
FOREIGN KEY (IdCiudadOrg)  
REFERENCES CIUDAD 
GO
ALTER TABLE RUTA 
ADD CONSTRAINT FKCiudadDes
FOREIGN KEY (IdCiudadDest)  
REFERENCES CIUDAD 
GO
EXEC SP_HELPCONSTRAINT RUTA
GO
ALTER TABLE VIAJE 
ADD CONSTRAINT FKRuta
FOREIGN KEY (NroRuta)  
REFERENCES RUTA 
GO

ALTER TABLE VIAJE 
ADD CONSTRAINT FKBus
FOREIGN KEY (NroBus)  
REFERENCES BUS 
GO
EXEC SP_HELPCONSTRAINT VIAJE
GO
ALTER TABLE VIAJE_TRIPULANTE 
ADD CONSTRAINT FKViajeTrip_Viaje
FOREIGN KEY (NroViaje)  
REFERENCES VIAJE 
GO

ALTER TABLE VIAJE_TRIPULANTE 
ADD CONSTRAINT FKViajeTrip_Trip
FOREIGN KEY (IdTripulante)  
REFERENCES TRIPULANTE 
GO

EXEC SP_HELPCONSTRAINT VIAJE_TRIPULANTE
GO

ALTER TABLE VIAJE_PASAJERO 
ADD CONSTRAINT FKViajePasaj_Viaje
FOREIGN KEY (NroViaje)  
REFERENCES VIAJE 
GO

ALTER TABLE VIAJE_PASAJERO 
ADD CONSTRAINT FKViajePasaj_Pasaj
FOREIGN KEY (IdPasajero)  
REFERENCES PASAJERO 
GO
EXEC SP_HELPCONSTRAINT VIAJE_PASAJERO
GO
ALTER TABLE BUS 
ADD CONSTRAINT FKFabricante
FOREIGN KEY (IdFabricante)  
REFERENCES FABRICANTE 
GO
EXEC SP_HELPCONSTRAINT BUS
GO

------Ejemplo Biblioteca--------
USE Master
GO
CREATE DATABASE Biblioteca
ON PRIMARY
(	NAME =  Biblio_Dat, 
	FILENAME='D:\FIEE_DATA\Biblio_Dat.mdf',
	SIZE = 5MB, 
	MAXSIZE = 200, 
	FILEGROWTH = 1 )
LOG ON
(	NAME = Biblio_Log, 
	FILENAME ='D:\FIEE_DATA\Biblio_Log.ldf',
	SIZE = 1MB, 
	MAXSIZE = 100, 
	FILEGROWTH= 1MB)
GO
USE Biblioteca
GO
SELECT * FROM INFORMATION_SCHEMA.DOMAINS --Ver tipos de datos 
GO
EXEC SP_ADDTYPE NumeroSocio,'SMALLINT' --Crear tipo de dato
GO
SELECT * FROM INFORMATION_SCHEMA.DOMAINS
GO
EXEC SP_ADDTYPE abc,'CHAR(1)'
EXEC SP_ADDTYPE Telefono,'CHAR(13)'
EXEC SP_ADDTYPE CodDep,'CHAR(2)'
EXEC SP_ADDTYPE Letras,'VARCHAR(15)'
GO
SELECT * FROM INFORMATION_SCHEMA.DOMAINS--ver tipos de datos
GO
USE  Biblioteca
GO
CREATE TABLE JUVENIL
 (	NumeroDeSocio		NumeroSocio		NOT NULL,
 	NumMiembroAdulto	NumeroSocio 	NOT NULL,
 	FechaNac			DATETIME		NOT NULL )
GO
CREATE TABLE Miembros
(NroMiembro NumeroSocio	IDENTITY(1,1)	NOT NULL,--Autoincrementable
 Apellidos	Letras						NOT NULL,
 Nombres	Letras						NOT NULL,
 Iniciales	abc							NULL )
GO
SELECT * FROM INFORMATION_SCHEMA.TABLES --Ver tablas 
GO
EXEC SP_HELP Miembros--ver informacion de un objeto
GO
ALTER TABLE Miembros ADD Edad TINYINT NULL--Agregar un campo a la tabla 
GO
ALTER TABLE Miembros DROP COLUMN Edad--Eliminar un campo a la tabla 
GO

--CONSTRAINTS=Es un objeto que establece un comportamiento 
ALTER TABLE Miembros 
ADD Departamento CodDep NULL
GO
SP_HELP Miembros--ver informacion de un objeto
GO
EXEC SP_HELPCONSTRAINT Miembros --ver informacion de constraints de un objeto
GO
ALTER TABLE Miembros 
ADD CONSTRAINT DepartInicial 
DEFAULT 'LI' FOR Departamento--Dar un valor predeterminado en aucencia de datos
GO
EXEC SP_HELPCONSTRAINT Miembros --ver informacion de constraints de un objeto
GO
SP_HELP DepartInicial
GO
SELECT * FROM Miembros--Informacion de los campos
GO
--Taras
--ingresar datos 
--cambiar datos 
--eliminar datos
INSERT INTO Miembros(Apellidos,Nombres,Iniciales,Departamento) 
			VALUES('CARRASCO','JOEL','A','SM')
GO
SELECT * FROM Miembros--Informacion de los campos
GO
INSERT INTO Miembros (Nombres,Apellidos) 
                         VALUES('GUSTAVO','CORONEL')
GO
SELECT * FROM Miembros--Informacion de los campos
GO
INSERT INTO Miembros (Nombres,Apellidos) 
                       VALUES('RICARDO','MARCELO')
GO
SELECT * FROM Miembros--Informacion de los campos
GO
-------------------------------------------------------
SP_HELP Miembros--ver informacion de un objeto
GO
ALTER TABLE Miembros 
ADD Telefono	 Telefono NULL
GO
SP_HELP Miembros--ver informacion de un objeto
GO
SELECT * FROM Miembros--Informacion de los campos
GO
INSERT INTO Miembros (Nombres,Apellidos,Telefono) 
				           VALUES('ALEJANDRO','HUAPAYA','4557729')
GO
SELECT * FROM Miembros--Informacion de los campos
GO
/*Contraints
PRIMARY KEY
FOREIGN KEY
DEFAULT
CHECK
UNIQUE*/

ALTER TABLE Miembros 
ADD CONSTRAINT ReglaTelefono
CHECK  (Telefono LIKE '(206)[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
GO

ALTER TABLE Miembros WITH NOCHECK--no revisa los valores
ADD CONSTRAINT ReglaTelefono
CHECK (Telefono LIKE '(206)[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
GO

EXEC SP_HELPCONSTRAINT Miembros --ver informacion de constraints de un objeto
GO
SELECT * FROM Miembros--Informacion de los campos
GO

INSERT INTO Miembros (Nombres,Apellidos,Telefono) 
                            VALUES('PEDRO','DIAS','5227812')--el telefono no tiene el formato
GO
INSERT INTO Miembros (Nombres,Apellidos,Telefono) 
                       VALUES('PEDRO','DIAS','(206)522-7812')
GO
SELECT * FROM Miembros--Informacion de los campos
GO
--Probando actualizacionde datos
UPDATE Miembros	SET Telefono='(212)533-4567'--el telefono no tiene el formato	
WHERE NroMiembro =1
Go

UPDATE Miembros  SET Telefono='(206)533-4567'  
WHERE NroMiembro =1
GO

SELECT * FROM Miembros--Informacion de los campos
GO
/*ALTER TABLE Miembros DROP CONSTRAINT ReglaTelefono
Go
*/--Eliminar un constraint

UPDATE Miembros SET Telefono='(206)455-7729'
WHERE NroMiembro=4
GO
SELECT * FROM Miembros--Informacion de los campos
GO



