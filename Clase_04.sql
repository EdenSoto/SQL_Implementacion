SELECT GETDATE()---Fecha del sitema
GO

USE MASTER
GO
CREATE DATABASE PruebaFK
GO

USE PruebaFK
GO
--Creamos la tabla cliente
--el campo clicop lo declaramos como PK
CREATE TABLE CLIENTE 
(	CLICOD		CHAR(2)  	    PRIMARY KEY,	
	CLINOM		VARCHAR(20)		NOT NULL )
GO
--Creamos la tabla pedido, el campo PEDCOD
	
CREATE TABLE PEDIDO 
(	PEDCOD		CHAR(3) 		PRIMARY KEY,	
	PEDFECHA	DATETIME 	DEFAULT GETDATE(),
	CLICOD		CHAR(2)		FOREIGN KEY REFERENCES CLIENTE(CLICOD) )
GO


EXEC SP_HELPCONSTRAINT PEDIDO
SELECT * FROM CLIENTE
SELECT * FROM PEDIDO

INSERT INTO CLIENTE VALUES('01','JOEL CARRASCO')
INSERT INTO CLIENTE VALUES('02','CESAR QUISPE')
INSERT INTO CLIENTE VALUES('03','RAUL CHUCO')
INSERT INTO CLIENTE VALUES('04','CESAR GUERRA')
INSERT INTO CLIENTE VALUES('05','GUSTAVO CORONEL')
GO
SELECT * FROM CLIENTE
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P01','01')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P02','01')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P03','02')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P04','02')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P05','02')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P06','03')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P07','03')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P08','03')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P09','04')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P10','04')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P11','05')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P12','02')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P13','01')
INSERT INTO PEDIDO (PEDCOD,CLICOD) VALUES('P14','01')
GO
SELECT * FROM CLIENTE
SELECT * FROM PEDIDO

DELETE FROM CLIENTE WHERE CLICOD='01'
GO
--no se puede porque tiene dejaria huerjanos :V
SP_HELPCONSTRAINT PEDIDO
GO
--delete_action (No action)
UPDATE CLIENTE 	SET CLICOD = '21'  WHERE CLICOD='01'
GO
SP_HELPCONSTRAINT PEDIDO
GO
--update_action (No action)
SELECT * FROM CLIENTE
SELECT * FROM PEDIDO
GO

INSERT INTO CLIENTE VALUES('06','RICARDO MARCELO')
GO
--Si funciona por no tener hijos :V Regostros huerfanos
UPDATE CLIENTE SET CLICOD='88'  	
WHERE CLICOD='06'
GO

DELETE FROM CLIENTE WHERE CLICOD='88'
GO
-------------------------------------------
CREATE TABLE CLIENTE2
(	CLICOD	CHAR(2)  	PRIMARY KEY, 	
	CLINOM  VARCHAR(20) )
GO

CREATE TABLE PEDIDO2
(	PEDCOD		CHAR(3)  	PRIMARY KEY, 	
	PEDFECHA	DATETIME 	DEFAULT GETDATE(),
	CLICOD		CHAR(2)		FOREIGN KEY REFERENCES CLIENTE2(CLICOD)
				ON DELETE CASCADE--CASCADE Transmite las ordenes de padre a hijo
				ON UPDATE CASCADE  )
GO
--CASCADE Transmite las ordenes de padre a hijo
EXEC SP_HELPCONSTRAINT PEDIDO2
GO

SELECT * FROM CLIENTE2
SELECT * FROM PEDIDO2
GO

INSERT INTO CLIENTE2 VALUES('01','JOEL CARRASCO')
INSERT INTO CLIENTE2 VALUES('02','CESAR QUISPE')
INSERT INTO CLIENTE2 VALUES('03','RAUL CHUCO')
INSERT INTO CLIENTE2 VALUES('04','CESAR GUERRA')
INSERT INTO CLIENTE2 VALUES('05','GUSTAVO CORONEL')
GO

INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P01','01')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P02','01')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P03','02')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P04','02')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P05','02')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P06','03')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P07','03')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P08','03')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P09','04')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P10','04')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P11','05')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P12','02')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P13','01')
INSERT INTO PEDIDO2 (PEDCOD,CLICOD) VALUES('P14','01')
GO

SELECT * FROM CLIENTE2
SELECT * FROM PEDIDO2
GO
UPDATE CLIENTE2  	SET CLICOD='29' 	WHERE CLICOD='01'
GO
DELETE FROM CLIENTE2 WHERE CLICOD='29'
GO

/*Funciones Principales en SQL server*/
--Funciones Aritmeticas

SELECT ROUND(81.9994,3),ROUND(81.9996,3)

SELECT ABS(5*-15)

SELECT RAND()

SELECT SIGN(-51.2)

SELECT SIGN(51.2)

SELECT PI()

SELECT 10*RAND()

SELECT ROUND((10*RAND()),0)

SELECT FLOOR(81.45),CEILING(81.45)

SELECT FLOOR(81.45),CEILING(-81.45)

SELECT POWER(2,4)

SELECT POWER(5,2)

SELECT SQUARE(5)

SELECT SQRT(25)

SELECT POWER(16,0.25)
--Funciones de cadena

SELECT  'FIEE'  +  '           ' +    'UNI'
SELECT ASCII('A'), CHAR(65)
SELECT ASCII('@'), CHAR(64)
SELECT UPPER('Juan Perez'), LOWER('JUAN PEREZ')--convertir de mayscula  minuscula
SELECT '            FIM            '  +  'UNI'

SELECT LTRIM ('            FIEE            ') +  'UNI'
SELECT RTRIM ('            FIEE            ') +  'UNI'

SELECT RTRIM (LTRIM ('            FIEE            '))+''+ +  'UNI'

SELECT 
REPLICATE ('FIM',5) + 
SPACE(20)+ 
REPLICATE('UNIVERSIDAD',4)


SELECT 
REVERSE('UNIVERSIDAD') + SPACE(20) + --invertir
RIGHT('UNIVERSIDAD',3) +  SPACE(20) + LEFT('UNIVERSIDAD',3)--extraer carecters

SELECT 
STUFF ( --cambiar carecteres parte de carecters
'UNIVERSIDAD NACIONAL DE INGENIERIA',
13,
8,
'PANAMERICANA')

SELECT 
SUBSTRING( 'ESTA ES UNA CADENA DE EJEMPLO',6,13)--sustraer parte de una cadena

--Funciones de fecha

SELECT 
DATEPART(HOUR, GETDATE()),  
DATEPART(MINUTE, GETDATE())

SELECT DATEPART(MONTH, GETDATE())

SELECT 
DATEPART(M, GETDATE()), DATEPART(D, GETDATE()), 
DATEPART(YY, GETDATE())

--Diferencia entre Fechas

SELECT DATEDIFF(DAY, '20220223', GETDATE())

--23/02/2022 Formato Feances /Ingles
--02/23/2022 Formato USA
--20220223   Formato ANSI
SELECT DATEDIFF(HOUR, '20220223', GETDATE())
SELECT MONTH('20141208')

SELECT MONTH(GETDATE())

SELECT DATENAME(MONTH, GETDATE())

SELECT DATENAME(WEEKDAY, GETDATE())

SELECT DATENAME(WEEKDAY, '18210728')

SELECT MONTH(0), DAY(0), YEAR(0)

SELECT MONTH(GETDATE()), DAY(GETDATE()), YEAR(GETDATE())

SELECT YEAR('20140328')
GO


--Luego de instalar las bases de datos
USE EduTec
GO
--Leyendo todos los campos de una tabla

SELECT*FROM Empleado
GO

SELECT*FROM Profesor
GO

SELECT*FROM Alumno
GO

------------------------
USE MarketPERU
GO

SELECT*FROM PRODUCTO
GO
---------------------
USE pubs
GO

SELECT*FROM titles
GO
SELECT*FROM stores
GO
SELECT*FROM publishers
GO
-----------------------
USE Northwind
GO
SELECT*FROM Customers
GO
SELECT*FROM Suppliers
GO
SELECT*FROM Shippers
GO
--Consultando campos seleccionados
USE EduTec
GO
SELECT*FROM Empleado
SELECT IdEmpleado,ApeEmpleado,NomEmpleado
FROM Empleado
GO

SELECT NomEmpleado,ApeEmpleado,IdEmpleado
FROM Empleado
GO
-------------------------
--En Northwin se pide presentar
--una lista de proveedorres
--mostrado los siguientes datos:
--Nombre del proveedor,
--Pais de origen,
--Direccion y
--ciudad
USE Northwind
GO
SELECT CompanyName,Country,Address,City
FROM Suppliers
GO
/*Presentar una lista de proveedores en MarketPerumostrando
codigo,nombre del proveedor,Direccioon y telefono.*/
USE MarketPERU
GO
SELECT*FROM PROVEEDOR
GO
SELECT IdProveedor,Nombre,Direccion,Telefono
FROM PROVEEDOR
GO