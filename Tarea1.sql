USE master
GO
CREATE DATABASE ReservasCoches
ON PRIMARY
( NAME			=ReservasCoches_Dat,
  FILENAME		='D:\FIEE_DATA\ReservasCoches_Dat.mdf',
  SIZE			=5 MB,
  MAXSIZE		=200,
  FILEGROWTH	=1)
LOG ON
( NAME			=ReservasCoches_Log,
  FILENAME		='D:\FIEE_DATA\ReservasCoches_Log.ldf',
  SIZE			=1 MB,
  MAXSIZE		=50,
  FILEGROWTH	=1MB)
GO
USE ReservasCoches
GO
CREATE TABLE CLIENTE
(IdCliente		INT			NOT NULL,
 nom_Cli		VARCHAR(30)	NOT NULL,
 dir_Cli		VARCHAR(50)	NOT NULL,
 dni			CHAR(8)		NOT	NULL,
 telefono		VARCHAR(15)	NOT	NULL,
 e_mail			VARCHAR(20)	NULL)
GO
CREATE TABLE RESERVA
(IdReserva		INT			NOT NULL,
 Fecha_Inicio	DATETIME	NOT NULL,
 Fecha_Fin		DATETIME	NOT	NULL,
 IdCliente		INT			NOT	NULL,
 IdAgencia		INT			NOT NULL)
GO
CREATE TABLE RESERVA_DETALLE
(IdReserva		INT			NOT NULL,
 IdCoche		INT			NOT NULL,
 Precio_coche	MONEY		NOT NULL)
GO
CREATE TABLE AGENCIA
(IdAgencia		INT			NOT NULL,
 Dir_Agencia	VARCHAR(50)	NOT NULL,
 Tef_Agencia	VARCHAR(15)	NOT NULL)
GO
CREATE TABLE COCHE
(IdCoche		INT			NOT NULL,
 NroPlaca		VARCHAR(20)	NOT NULL,
 MarcaCoche		VARCHAR(40)	NOT	NULL,
 AñoFabr		DATETIME	NOT	NULL,
 PrecioActAlq	MONEY		NOT	NULL,
 IdCochera		INT			NOT NULL)
GO
CREATE TABLE COCHERA
(IdCochera		INT			NOT NULL,
 DirCochera		VARCHAR(40)	NOT NULL,
 TelefCoch		VARCHAR(15)	NOT	NULL,
 Capacidad		INT			NOT NULL)
GO

ALTER TABLE CLIENTE 
ADD CONSTRAINT	 PKCliente
PRIMARY KEY (IdCliente)
GO
ALTER TABLE RESERVA 
ADD CONSTRAINT	 PKReserva
PRIMARY KEY (IdReserva)
GO
ALTER TABLE RESERVA_DETALLE 
ADD CONSTRAINT	 PKReservaDeralle
PRIMARY KEY (IdReserva,IdCoche)
GO
ALTER TABLE AGENCIA 
ADD CONSTRAINT	 PKAgencia
PRIMARY KEY (IdAgencia)
GO
ALTER TABLE COCHE 
ADD CONSTRAINT	 PKCoche
PRIMARY KEY (IdCoche)
GO
ALTER TABLE COCHERA 
ADD CONSTRAINT	 PKCochera
PRIMARY KEY (IdCochera)
GO

ALTER TABLE RESERVA
ADD CONSTRAINT FKCliente
FOREIGN KEY (IdCliente)
REFERENCES CLIENTE
GO
ALTER TABLE RESERVA
ADD CONSTRAINT FKAgencia
FOREIGN KEY (IdAgencia)
REFERENCES AGENCIA
GO
ALTER TABLE RESERVA_DETALLE
ADD CONSTRAINT FKResDetReserva
FOREIGN KEY (IdReserva)
REFERENCES RESERVA
GO
ALTER TABLE RESERVA_DETALLE
ADD CONSTRAINT FKResDetCoche
FOREIGN KEY (IdCoche)
REFERENCES COCHE
GO
ALTER TABLE COCHE
ADD CONSTRAINT FKCochera
FOREIGN KEY (IdCochera)
REFERENCES COCHERA
GO