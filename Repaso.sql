
/*En MarketPeru presentar una lista de proveedores, mostrando los 
  siguientes datos:
		Nombre del Proveedor,	
		Ubicación ( Departamento, Direccion y Ciudad) y 
		el Nombre del contacto.                                         */

use MarketPERU
go
select*from PROVEEDOR
go
select
	Nombre		as	[Nombre del Proveedor],
	Departamento +' - '+ Direccion +' - ' + Ciudad as Ubicación,
	Representante as [Nombre del contacto]
from PROVEEDOR
go


---  OBTENCION DE CAMPOS CALCULADOS
USE NORTHWIND
GO

SELECT * FROM PRODUCTS
GO

SELECT 
	PRODUCTNAME			AS PRODUCTO,
	UNITSINSTOCK		AS STOCK,
	UNITPRICE			AS PRECIO	 
FROM PRODUCTS
GO

SELECT 
	PRODUCTNAME					AS	PRODUCTO, 
	UNITSINSTOCK				AS	STOCK, 
	UNITPRICE					AS	PRECIO, 	
	UNITSINSTOCK * UNITPRICE	AS	[MONTO VALORADO]
FROM PRODUCTS
GO

-- PRESENTAR UNA LISTA DE INGRESOS 
-- POR CURSO DICTADO 
-- HASTA EL MOMENTO EN EDUTEC 
use EduTec
go
select*from CursoProgramado
go
select
	IdCursoProg as curso,
	Vacantes as vacantes,
	PreCursoProg as curso,
	PreCursoProg*Vacantes as Monto
from CursoProgramado
go
SELECT 
	IdCursoProg								AS	 [Curso programado], 
	IdCurso										AS	 Curso,
	PreCursoProg							AS	 Precio ,
	Matriculados								AS	 [Cantidad de matriculados],
  PreCursoProg * Matriculados	AS	 [Ingresos por curso dictado]
FROM CursoProgramado
GO
/* En Northwind presentar los detalles 
de cada pedido realizado 
mostrando la siguiente informacion:
	El numero de pedido, 
	el codigo del producto, 
	el precio de venta, 
	la cantidad vendida, 
	el subtotal, 
	el porcentaje de descuento, 
	el descuento aplicado, 
	y el monto pagado (subtototal - descuento)   */
use Northwind
go 

select*from [Order Details]
go
select
	OrderID as [numero de pedido],
	ProductID as [codigo del producto],
	UnitPrice as [precio de venta],
	Quantity as [cantidad vendida],
	UnitPrice*Quantity as [subtotal],
	Discount*100 as [porcentaje de descuento %],
	UnitPrice*Quantity*Discount as[descuento aplicado],
	UnitPrice*Quantity-UnitPrice*Quantity*Discount as [monto pagado]
from [Order Details]
go
/*UnitPrice * Quantity - UnitPrice * Quantity * Discount  = 
              UnitPrice * Quantity * (1-Discount)   */

-- LECTURAS DE REGISTROS SELECCIONADOS

USE EDUTEC
GO
SELECT * FROM MATRICULA
GO
SELECT IdCursoProg,IdAlumno,Promedio FROM MATRICULA
GO
SELECT  IdCursoProg,IdAlumno,Promedio FROM MATRICULA 
WHERE IdCursoProg = 2
GO
USE NORTHWIND
GO
SELECT * FROM SUPPLIERS
GO
SELECT SupplierID,CompanyName,Country FROM SUPPLIERS
GO
SELECT SupplierID,CompanyName,Country FROM SUPPLIERS 
WHERE Country = 'USA'
GO
SELECT * FROM Categories
GO
SELECT * FROM Products 
GO
SELECT * FROM Products 
WHERE CategoryID = 1
GO
SELECT SupplierID,CompanyName,Country FROM SUPPLIERS 
WHERE Country='AUSTRALIA'
GO
SELECT SupplierID,CompanyName,Country FROM SUPPLIERS 
WHERE Country = 'USA' AND  Country='AUSTRALIA'
GO
SELECT SupplierID,CompanyName,Country FROM SUPPLIERS 
WHERE Country = 'USA' OR  Country='AUSTRALIA'
GO

-- En MarketPeru presentar una lista de productos comestibles 
-- ( de consumo humano)
USE MarketPERU
GO
SELECT * FROM PRODUCTO
GO
SELECT * FROM CATEGORIA
GO
-- 1 2 4 5
SELECT * FROM PRODUCTO 
WHERE 
IdCategoria =1 OR IdCategoria =2 OR IdCategoria =4 OR IdCategoria =5
GO
-- SELECCIONANDO REGISTROS EN BASE A RANGOS
USE NORTHWIND
GO
SELECT ProductName,CategoryID,UnitPrice FROM Products
WHERE  UnitPrice >=20 AND UnitPrice <= 40
GO
SELECT ProductName,CategoryID,UnitPrice FROM Products 
WHERE UnitPrice BETWEEN 20 AND 40
GO
-- Si el intervalo es abierto, no se puede usar BETWEEN: 
SELECT ProductName,CategoryID,UnitPrice FROM Products
WHERE  UnitPrice >20 AND UnitPrice <40
GO
SELECT LastName,FirstName,HireDate FROM EMPLOYEES 
WHERE HireDate BETWEEN '19920101' AND '19921231'
GO
/* Presentar una lista de pedidos 
realizados el primer trimestre 
del año 1997, y que fueron 
atendidos por los empleados 
1, 5 u 8*/
use Northwind
go
select*from Orders
go
select
	OrderID,
	OrderDate,
	EmployeeID
from Orders
where EmployeeID in (1,5,8) and OrderDate between '19970101' and '19970331'
go


SELECT OrderID,OrderDate,EmployeeID 
FROM Orders
WHERE 
	(OrderDate BETWEEN '19970101' AND '19970331')
	AND
	EmployeeID IN (1,5,8)
GO
-- SELECCION DE REGISTROS EN BASE A LISTAS
USE EDUTEC
GO
SELECT IdCursoProg,IdAlumno,Promedio FROM MATRICULA 
WHERE PROMEDIO IN (8,12,18)
GO
USE MarketPERU 
GO
SELECT * FROM PRODUCTO 
WHERE IdCategoria NOT IN(3, 6)
GO
USE NORTHWIND
GO
SELECT PRODUCTID,PRODUCTNAME,SUPPLIERID FROM PRODUCTS
	WHERE  SUPPLIERID IN (5,7,10)
GO
-- Presentar una lista de clientes que sean de algun pais de America
SELECT CustomerID,CompanyName,Country FROM Customers
GO
SELECT CompanyName,Country FROM Customers
WHERE Country IN
('Mexico','Argentina','Brazil','USA','Venezuela','Canada')
GO 
/*  SELECCION DE REGISTROS EN BASE A CADENAS DE CARACTERES
Tipos de caracteres comodín
Utilice los siguientes caracteres comodín para formar el criterio de búsqueda de
la cadena de caracteres:
Comodín Descripción
%		Cualquier cadena de cero o más caracteres.
_		Cualquier carácter individual.
[]		Cualquier carácter individual contenido en el intervalo o
		conjunto especificado.
[^]		Cualquier carácter individual no contenido en el intervalo o
		conjunto especificado.

*/
USE EDUTEC
GO
SELECT IdAlumno,ApeAlumno,NomAlumno FROM ALUMNO
GO
SELECT IdAlumno,ApeAlumno,NomAlumno FROM ALUMNO 
WHERE ApeAlumno LIKE '%MA%'
GO
SELECT IdAlumno,ApeAlumno,NomAlumno FROM ALUMNO 
WHERE ApeAlumno LIKE '%PA%'
GO
SELECT IdAlumno,ApeAlumno,NomAlumno FROM ALUMNO 
WHERE ApeAlumno LIKE '%AS%'
GO
SELECT IdAlumno,ApeAlumno,NomAlumno FROM ALUMNO 
WHERE ApeAlumno LIKE '%S%'
GO
/*Presentar los productos correspondientes a la marca LAIVE     */
USE MarketPERU
GO
SELECT Nombre, PrecioProveedor FROM PRODUCTO
WHERE Nombre LIKE '%LAIVE%'
GO

USE EduTec
GO

SELECT * FROM ALUMNO WHERE APEALUMNO LIKE '_A%'
GO

/*En Northwind, presentar todos los Clientes con codigo de cinco letras
 que terminen con las letra  'S'   y que la penultima sea cualquier letra 
comprendida entre M y P.  */
USE Northwind
GO 
SP_HELP CUSTOMERS
GO
SELECT CustomerID, CompanyName FROM CUSTOMERS 
WHERE CustomerID LIKE '___[M-P]S' 
GO

--  [a,e,x,7]

/*Todos los clientes, cuyos nombres comiencen por la letra L 
   y cuya segunda letra no sea A. */

SELECT CustomerID,CompanyName 
FROM CUSTOMERS 
WHERE CompanyName LIKE 'L[^A]%' 
GO
SELECT CustomerID,CompanyName FROM CUSTOMERS 
WHERE CompanyName LIKE 'L%' 
GO

-- ORDENANDO LOS RESULTADOS

USE EDUTEC
GO
SELECT IDALUMNO,APEALUMNO,NOMALUMNO FROM ALUMNO
GO

SELECT IDALUMNO,APEALUMNO,NOMALUMNO FROM ALUMNO
ORDER BY APEALUMNO
GO
SELECT IDALUMNO,APEALUMNO,NOMALUMNO FROM ALUMNO
ORDER BY APEALUMNO DESC
GO
SELECT IDALUMNO,IDCURSOPROG,PROMEDIO FROM MATRICULA 
WHERE IDCURSOPROG = 2
ORDER BY PROMEDIO DESC
GO

USE NORTHWIND
GO
SELECT CATEGORYID,PRODUCTNAME,PRODUCTID,UNITPRICE 
FROM PRODUCTS	
ORDER BY CATEGORYID, PRODUCTNAME 
GO
SELECT CATEGORYID,PRODUCTNAME,PRODUCTID,UNITPRICE 
FROM PRODUCTS	
ORDER BY CATEGORYID DESC, PRODUCTNAME 
GO

SELECT CATEGORYID,PRODUCTNAME,PRODUCTID,UNITPRICE 
FROM PRODUCTS	
ORDER BY CATEGORYID DESC, PRODUCTNAME  DESC
GO
/*En MarketPeru, presentar una lista de productos ordenados por
Proveedor y precio (EL MAS CARO PRIMERO) */
USE MarketPERU
GO
SELECT IdProveedor,PrecioProveedor,Nombre,IdProducto FROM PRODUCTO
ORDER BY IdProveedor, PrecioProveedor DESC
GO


/*En MarketPeru, presentar una lista de productos ordenados por
Proveedor y precio (EL MAS CARO PRIMERO) */
use MarketPERU
go
select*from PRODUCTO
go

select
	IdProducto,
	IdProveedor,
	PrecioProveedor
from PRODUCTO
order by IdProveedor,PrecioProveedor desc

go
SELECT IdProveedor,PrecioProveedor,Nombre,IdProducto FROM PRODUCTO
ORDER BY IdProveedor, PrecioProveedor DESC
GO
/*Clase 6 
Lunes 28 de Febrero del 2022
 7 p.m.
 */

USE EduTec
GO
SELECT* 
FROM MATRICULA 
GO
SELECT IDALUMNO,IDCURSOPROG,PROMEDIO 
FROM MATRICULA 
WHERE  IDCURSOPROG = 2 	
ORDER BY PROMEDIO DESC
GO
SELECT TOP 3 
IDALUMNO,IDCURSOPROG,PROMEDIO 
FROM MATRICULA 
WHERE  IDCURSOPROG=2 	
ORDER BY PROMEDIO DESC
GO
SELECT  TOP 3 WITH TIES 
IDALUMNO,IDCURSOPROG,PROMEDIO 
FROM MATRICULA 
WHERE  IDCURSOPROG=2 	
ORDER BY PROMEDIO DESC
GO
-- GENERACION DE RESUMENES DE DATOS

USE EDUTEC
SELECT* 
FROM ALUMNO
GO
GO
SELECT COUNT(*) AS [Numero de Alumnos] --cuantos datos hay
FROM ALUMNO
GO
SELECT COUNT(DirAlumno) AS [Numero de Alumnos] --cuantos datos hay en diralumno
FROM ALUMNO
GO
select*from Matricula
go
SELECT COUNT(IDALUMNO) AS [Numero de MATRICULADOS] --cuantos datos hay idalumno
FROM MATRICULA
GO
SELECT COUNT(FecMatricula) AS [Numero de MATRICULADOS] 
FROM MATRICULA
GO
SELECT * FROM TARIFA
GO
SELECT MAX(PRETARIFA) AS COSTO_MAYOR--halla el mayor de los datos en columna
FROM TARIFA
GO

SELECT MIN(PRETARIFA) AS COSTO_MENOR --halla el menor de los datos en columna
FROM TARIFA
GO
SELECT AVG(PRETARIFA) AS COSTO_PROMEDIO--halla el promedio de los datos en columna
FROM TARIFA
GO
--
USE NORTHWIND
GO
SELECT MAX(UNITPRICE) FROM PRODUCTS
GO
SELECT 
	PRODUCTNAME, 
	MAX(UNITPRICE) AS COSTO_MAYOR 
FROM PRODUCTS
--le falta grup by para ser ordenado
GO
--SUBCONSULTAS
SELECT 
	ProductName, 
	UnitPrice 
FROM PRODUCTS
WHERE 
UnitPrice = (SELECT MAX(UNITPRICE) FROM PRODUCTS)
GO
--En MarketPeru Presentar una lista 
-- de productos cuyos precios 
-- sean inferiores al precio promedio
use MarketPERU
go

select*from PRODUCTO
go
select
	IdProducto,
	IdProveedor,
	PrecioProveedor
from PRODUCTO
where PrecioProveedor<(select avg(PrecioProveedor) from PRODUCTO)
order by PrecioProveedor desc
go
SELECT 
		Nombre								AS	Producto,
		PrecioProveedor						AS	Precio
FROM PRODUCTO
WHERE 
PrecioProveedor < (SELECT  AVG(PrecioProveedor) FROM PRODUCTO)
ORDER BY 2 DESC
GO
SELECT 
		Nombre											AS	Producto,
		PrecioProveedor									AS	Precio,
		(SELECT  AVG(PrecioProveedor) FROM PRODUCTO)	AS	Promedio
FROM PRODUCTO
WHERE 
PrecioProveedor < (SELECT  AVG(PrecioProveedor) FROM PRODUCTO)
ORDER BY 2 DESC
GO
SELECT 
		Nombre											AS	Producto,
		PrecioProveedor									AS	Precio,
		(SELECT  AVG(PrecioProveedor) FROM PRODUCTO)	AS	Promedio
FROM PRODUCTO
WHERE 
PrecioProveedor >= (SELECT  AVG(PrecioProveedor) FROM PRODUCTO)
ORDER BY 2 DESC
GO
-- CONSULTAS AGRUPADAS 

USE NORTHWIND
GO
SELECT CUSTOMERID,ORDERID FROM ORDERS	
ORDER BY CUSTOMERID
GO
SELECT CUSTOMERID,ORDERID FROM ORDERS	
ORDER BY 1
GO

SELECT 
	CUSTOMERID,
	COUNT(ORDERID) --cuenta cuantos hay de un mismo customerid
FROM ORDERS 	
GROUP BY CUSTOMERID
GO
SELECT 
	CUSTOMERID,
	COUNT(ORDERID) AS [NUMERO DE PEDIDOS DEL CLIENTE] 
FROM ORDERS   	
GROUP BY CUSTOMERID
ORDER BY COUNT(ORDERID) DESC
GO

SELECT 
	CUSTOMERID,
	COUNT(ORDERID) AS [NUMERO DE PEDIDOS DEL CLIENTE] 
FROM ORDERS   	
GROUP BY CUSTOMERID
ORDER BY 2 DESC
GO
/*En Northwind, presentar 
el total de unidades 
vendidas por producto.*/

use Northwind
go
select*from [Order Details]
go
select
	ProductID as producto,
	count(Quantity) as vendido
from [Order Details]
group by ProductID
order by 2 desc
go
select*from [Order Details]
go
SELECT 
	ProductID, 
	Quantity 
FROM [Order Details]
ORDER BY ProductID
GO
-- Agrupando la Consulta:

SELECT 
  ProductID, 
  SUM(Quantity) AS [Total de unidades vendidas] 
FROM [Order Details]
GROUP BY ProductID
ORDER BY 2 DESC
GO

/*En Pubs Presentar 
el total de ejemplares 
vendidos por libro o titulo*/
use pubs
go

select*from sales
go

select
	title_id as Título,
	sum(qty) as cantidad
from sales
group by title_id
order by 2 desc
go
SELECT 
	title_id, 
	SUM(QTY) AS [Ejemplares vendidos]
FROM sales
GROUP BY title_id 
ORDER BY 2 DESC
GO
/*En Northwind, presentar 
el monto total de ventas 
por producto.*/
use Northwind
go

select*from [Order Details]
go
select
	ProductID as producto,
	--UnitPrice as precio,
	--Quantity as cantidad,
	--Discount*100 as descuento,
	ROUND(sum(UnitPrice*Quantity*(1-Discount)),2) as monto
from [Order Details]
group by ProductID
order by 2 desc
go
SELECT 
	ProductID, 
	ROUND( SUM(Quantity * UnitPrice * (1-Discount)), 2)  AS [Monto Total de  ventas] 
FROM [Order Details] 
GROUP BY ProductID 
ORDER BY 2 DESC
GO

SELECT 
	ProductID, 
	SUM(Quantity) AS [Total de unidades vendidas] 
FROM [Order Details]
GROUP BY ProductID 
ORDER BY 2 DESC
GO
SELECT 
	ProductID,
	SUM(Quantity) AS [Total de unidades vendidas] ,
    ROUND(SUM(Quantity * UnitPrice* (1-Discount)),2) AS [Monto Total de  ventas], 
	AVG(UnitPrice) AS Promedio
FROM [Order Details]	
GROUP BY ProductID	
ORDER BY 3 DESC
GO


/*En Edutec, se pide 
presentar el total de 
matriculados por Curso */
use EduTec
go
select*from CursoProgramado
go
select
	IdCurso as curso,
	sum(Matriculados) as Matriculados
from CursoProgramado
group by IdCurso
order by 2 desc
go
/*En Edutec, se pide presentar el total de Ingresos  
por Curso*/
use EduTec
go
select*from CursoProgramado
go
select*from Curso
go
select*from Tarifa
go
select
	IdCurso as Curso,
	sum(Matriculados*PreCursoProg) as [Ingreso X curso]
from CursoProgramado
group by IdCurso
order by 2 desc
go

/*En MarketPeru. Presentar el monto total 
  de compras por producto*/
use MarketPERU
go

select*from ORDEN_DETALLE
go
select
	IdProducto as producto,
	sum(PrecioCompra*CantidadRecibida) as [Monto de compra]
from ORDEN_DETALLE
group by IdProducto
order by 2 desc
go

SELECT 
	IdProducto,
	SUM(PrecioCompra *CantidadRecibida) AS [Monto de compras]
FROM ORDEN_DETALLE
GROUP BY IdProducto
ORDER BY 2 DESC
GO
/* En Northwind.
Presentar el total de gastos 
de envios pagados a 
cada transportista */
USE Northwind
GO
SP_HELPCONSTRAINT orders
go

SELECT 
  ShipVia,
  SUM(Freight) AS [Gasto de Envios]
FROM Orders
GROUP BY ShipVia
ORDER BY 2 DESC
GO
select * from Shippers
go
--CONSULTAS AGRUPADAS CON FILTRO HAVING
USE NORTHWIND
GO
SELECT * FROM ORDERS
GO
SELECT 
   CUSTOMERID,
   COUNT(ORDERID) AS [NUMERO DE PEDIDOS DEL CLIENTE] 
FROM ORDERS
GROUP BY CUSTOMERID 
ORDER BY 2 DESC
GO
--
SELECT 
CUSTOMERID,
COUNT(ORDERID) AS [NUMERO DE PEDIDOS DEL CLIENTE] 
FROM ORDERS
GROUP BY CUSTOMERID 
HAVING COUNT(ORDERID) < 5 	
ORDER BY 2 DESC
GO
SELECT 
	CUSTOMERID,
	COUNT(ORDERID) AS [NUMERO DE PEDIDOS DEL CLIENTE] 
FROM ORDERS
WHERE YEAR(OrderDate) = 1997
GROUP BY CUSTOMERID 
ORDER BY 2 DESC
GO
SELECT 
	CUSTOMERID,
	COUNT(ORDERID) AS [NUMERO DE PEDIDOS DEL CLIENTE] 
FROM ORDERS
WHERE YEAR(OrderDate) = 1997
GROUP BY CUSTOMERID 
HAVING COUNT(ORDERID) < 5
ORDER BY 2 DESC
GO
--- OTRO EJEMPLO
SELECT 
	ProductID,
	SUM(Quantity) AS [Total de unidades vendidas] ,
	ROUND(SUM(Quantity * UnitPrice*(1-Discount)), 2) AS [Monto Total de  ventas] 
FROM [Order Details]
GROUP BY ProductID
HAVING 
ROUND(SUM(Quantity * UnitPrice *(1-Discount) ) ,2)
                    BETWEEN 15000 AND 20000
ORDER BY 3 DESC
GO

/*		CONSULTAS A VARIAS TABLAS (JOINS)  -  
   CONSULTAS A DOS TABLAS.  
En EduTec se solicita informacion de las matriculas 
de los alumnos, presentando los siguientes datos:     
Apellidos y nombres de los alumnos, 
Curso programado en que se matriculo
y el promedio obtenido */
USE EDUTEC
GO
-- Establecer el ORIGEN DE DATOS:
SELECT *
FROM		Alumno
INNER JOIN	Matricula	ON Alumno.IdAlumno=Matricula.IdAlumno
GO
SELECT 
	Alumno.ApeAlumno, 
	Alumno.NomAlumno, 
    Matricula.IdCursoProg, 
	Matricula.Promedio
FROM		Alumno
INNER JOIN	Matricula	ON Alumno.IdAlumno=Matricula.IdAlumno
GO

/* En PUBS se solicita presentar 
una lista de libros con los siguientes datos:
		Nombre del Libro, 
		Nombre de la editorial, 
		pais de origen 
		Categoria del libro y 
		precio del libro.																		*/
USE pubs
GO

SELECT *
FROM publishers
INNER JOIN	titles ON publishers.pub_id = titles.pub_id
GO

SELECT 
	titles.title, 
	publishers.pub_name, 
	publishers.country, 
	titles.type, 
	titles.price
FROM		publishers
INNER JOIN	titles			ON publishers.pub_id = titles.pub_id
GO

SELECT 
*
FROM		publishers	P
INNER JOIN	titles T	ON P.pub_id = T.pub_id
GO

SELECT 
	T.title, 
	P.pub_name, 
	P.country, 
	T.type, 
	T.price
FROM		publishers	P
INNER JOIN	titles T	ON P.pub_id = T.pub_id
GO

SELECT 
	T.title		AS Libro, 
	T.type		AS Categoria, 
	P.pub_name	AS Editorial,
    P.country	AS [Pais de origen], 
	T.price		AS [Precio del libro]
FROM		publishers	P
INNER JOIN	titles T ON P.pub_id = T.pub_id
GO

/*Presentar el total de gastos
 de flete por compañia transportista 
en Northwind*/

USE Northwind
GO
SP_HELPCONSTRAINT ORDERS
GO

SELECT 
	*
FROM		Shippers S
INNER JOIN	Orders O ON	S.ShipperID = O.ShipVia
GO

SELECT 
	S.CompanyName		AS [Compañia transportista], 
	SUM(O.Freight)	    AS [Total de gastos de flete]
FROM		Shippers S
INNER JOIN	Orders O ON	S.ShipperID = O.ShipVia
GROUP BY S.CompanyName
ORDER BY 2 DESC
GO


/*Presentar la existencia actual por proveedor 
  y por producto (Northwind)*/

use Northwind
go

select*
from Suppliers S
inner join Products P on S.SupplierID=P.SupplierID
go
select
	S.CompanyName,
	P.ProductName
from Suppliers S
inner join Products P on S.SupplierID=P.SupplierID
go
SELECT 
	S.ContactName		AS Proveedor,  
	P.ProductName		AS Producto,  
    P.UnitsInStock		AS [Existencia actual]
FROM				Suppliers	S 
INNER JOIN	Products	P ON S.SupplierID = P.SupplierID
ORDER BY 1,2
GO

-- CONSULTAS A TRES TABLAS

/* En Edutec se solicita informacion de las matriculas 
   de los alumnos, presentando los siguientes datos:
	Apellidos y nombres de los alumnos, 
	Curso programado en que se matriculo, 
	el codigo del profesor que dicto el curso y 
	el promedio obtenido */
USE EDUTEC
GO
--Alumno-matricula- cursoprogramado-
select *
from Alumno A
inner join Matricula M on A.IdAlumno=M.IdAlumno
inner join CursoProgramado C on M.IdCursoProg=C.IdCursoProg
go


select 
	A.ApeAlumno as Apellido,
	A.NomAlumno as Nombre,
	M.IdCursoProg as Curso,
	C.IdProfesor as Profesor,
	M.Promedio as Promedio
from Alumno A
inner join Matricula M on A.IdAlumno=M.IdAlumno
inner join CursoProgramado C on M.IdCursoProg=C.IdCursoProg
--order by 5 desc,1
go


SELECT	
	A.ApeAlumno, 
	A.NomAlumno, 
	M.IdCursoProg, 
    CP.IdProfesor, 
	M.Promedio
FROM			  Alumno					   A
INNER JOIN Matricula				   M  ON	A.IdAlumno=M.IdAlumno
INNER JOIN CursoProgramado CP ON M.IdCursoProg=CP.IdCursoProg
GO


SELECT 
	A.ApeAlumno + ',  ' + A.NomAlumno AS Alumno, 
	M.IdCursoProg									  AS [Curso programamdo],
	CP.IdProfesor									 AS [Codigo del profesor] , 
	M.Promedio										 AS [Promedio obtenido en el curso]
FROM			  Alumno					 A
INNER JOIN Matricula				 M	    ON A.IdAlumno=M.IdAlumno
INNER JOIN CursoProgramado CP	ON M.IdCursoProg=CP.IdCursoProg
GO

USE MarketPERU
GO

SELECT 
	*
FROM	CATEGORIA	C
INNER JOIN PRODUCTO	P	 ON C.IdCategoria = P.IdCategoria
INNER JOIN PROVEEDOR	PV ON	P.IdProveedor = PV.IdProveedor
GO

SELECT 
	P.Nombre			 AS  [Nombre del producto], 
	P.IdProducto		 AS  [Codigo del producto], 
	C.Categoria		 AS  [Nombre de la Categoria], 
	PV.Nombre			 AS  [Nombre del Proveedor], 
	P.StockActual    AS  [Existencia en almacen]
FROM			 CATEGORIA	C
INNER JOIN PRODUCTO	P	 ON C.IdCategoria = P.IdCategoria
INNER JOIN PROVEEDOR	PV ON	P.IdProveedor = PV.IdProveedor
GO

/* En MarketPeru se solicita una lista de productos mostrando 
Nombre del producto, nombre del proveedor, 
ubicacion y origen del proveedor, nombre de la categoria, 
precio y 	existencia, para las categorias consideradas de consumo humano */

USE MarketPERU 
GO
SELECT 
PD.Nombre												AS Producto, 
P.Nombre												AS Proveedor, 
P.Departamento +'  -  ' +P.Ciudad + ' - ' +P.Direccion  AS [Ubicación y origen] , 
C.Categoria, 
PD.PrecioProveedor										AS Precio, 
PD.StockActual											AS Existencia
FROM			 PROVEEDOR P
INNER JOIN PRODUCTO  PD	ON	P.IdProveedor = PD.IdProveedor
INNER JOIN CATEGORIA C	ON	PD.IdCategoria = C.IdCategoria
WHERE 
C.Categoria IN 
('GOLOSINAS','EMBUTIDOS','LACTEOS','LICORES Y GASEOSAS')
GO


SELECT 
PD.Nombre												AS Producto, 
P.Nombre												AS Proveedor, 
P.Departamento +'  -  ' +P.Ciudad + ' - ' +P.Direccion AS [Ubicación y origen] , 
C.Categoria, 
PD.PrecioProveedor											AS Precio, 
PD.StockActual												AS Existencia
FROM			PROVEEDOR P
INNER JOIN PRODUCTO PD	ON	P.IdProveedor = PD.IdProveedor
INNER JOIN CATEGORIA C	ON	PD.IdCategoria = C.IdCategoria
WHERE C.IdCategoria IN (1,2,4,5)
GO	
--
SELECT 
PD.Nombre												AS Producto, 
P.Nombre												AS Proveedor, 
P.Departamento +'  -  ' +P.Ciudad + ' - ' +P.Direccion	AS [Ubicación y origen] , 
C.Categoria, 
PD.PrecioProveedor										AS Precio, 
PD.StockActual											AS Existencia
FROM	   PROVEEDOR P
INNER JOIN PRODUCTO PD	ON	P.IdProveedor = PD.IdProveedor
INNER JOIN CATEGORIA C	ON	PD.IdCategoria = C.IdCategoria
WHERE C.IdCategoria NOT IN (3,6)
GO	

/*
Presentar el total de unidades vendidas que correspondesn a ---------------------------------------------------------------------------------------------------------------------
cada Categoria existente.
*/
use MarketPERU
go

select*from CATEGORIA
go

select*
from CATEGORIA C
inner join PRODUCTO P on C.IdCategoria =P.IdCategoria
inner join GUIA_DETALLE G on P.IdProducto=G.IdProducto
go
select
	C.Categoria as Categoria,
	sum(G.Cantidad )as [Unidades vendidas]

from CATEGORIA C
inner join PRODUCTO P on C.IdCategoria =P.IdCategoria
inner join GUIA_DETALLE G on P.IdProducto=G.IdProducto
group by C.Categoria
order by 2 desc
go

use Northwind
go

select*
from Categories C
inner join Products P on C.CategoryID=P.CategoryID
inner join [Order Details] OD on P.ProductID=OD.ProductID
go

select
	C.CategoryName as Categoria,
	sum(OD.Quantity) as [Unidades vendidas]

from Categories C
inner join Products P on C.CategoryID=P.CategoryID
inner join [Order Details] OD on P.ProductID=OD.ProductID
group by C.CategoryName
order by 2 desc
go


/*CONSULTAS A CUATRO TABLAS
En Pubs se solicita presentar los 
tres autores con mayor numero 
de ejemplares vendidos.*/
USE pubs
GO

SELECT *
FROM		authors		A
INNER JOIN	titleauthor	TA	ON	A.au_id = TA.au_id
INNER JOIN	titles		T	ON	TA.title_id = T.title_id
INNER JOIN	sales		S	ON	T.title_id = S.title_id
GO

SELECT  
	A.au_lname		AS [Apellidos], 
	A.au_fname		AS [Nombres], 
	SUM(S.qty)		AS [Ejemplares vendidos]
FROM		authors			A
INNER JOIN	titleauthor		TA		ON	A.au_id = TA.au_id
INNER JOIN	titles			T		ON	TA.title_id = T.title_id
INNER JOIN	sales			S		ON	T.title_id = S.title_id
GROUP BY A.au_lname, A.au_fname
ORDER BY 3 DESC
GO
SELECT  
	A.au_lname	+','+A.au_fname	AS [Autor],  
	SUM(S.qty)		AS [Ejemplares vendidos]
FROM		authors			A
INNER JOIN	titleauthor		TA		ON	A.au_id = TA.au_id
INNER JOIN	titles			T		ON	TA.title_id = T.title_id
INNER JOIN	sales			S		ON	T.title_id = S.title_id
GROUP BY A.au_lname, A.au_fname
ORDER BY 2 DESC
GO

SELECT  TOP 3 
	A.au_lname	 AS [Apellidos], 
	A.au_fname	AS [Nombres], 
	SUM(S.qty)		AS [Ejemplares vendidos]
FROM				authors		A
INNER JOIN	titleauthor	TA	ON	A.au_id = TA.au_id
INNER JOIN	titles			T		ON	TA.title_id = T.title_id
INNER JOIN	sales			S		ON	T.title_id = S.title_id
GROUP BY A.au_lname, A.au_fname
ORDER BY 3 DESC
GO

SELECT  TOP 3 WITH TIES
	A.au_lname	 AS [Apellidos], 
	A.au_fname	AS [Nombres], 
	SUM(S.qty)		AS [Ejemplares vendidos]
FROM				authors		A
INNER JOIN	titleauthor	TA	ON	A.au_id = TA.au_id
INNER JOIN	titles			T		ON	TA.title_id = T.title_id
INNER JOIN	sales			S		ON	T.title_id = S.title_id
GROUP BY A.au_lname, A.au_fname
ORDER BY 3 DESC
GO

-- CONSULTAS A CINCO TABLAS
/*Presentar una lista de matriculas, 
mostrado la siguiente informacion:
Apellidos y nombres del alumno, 
Codigo del curso programado, 
Nombre del curso,
Apellidos y nombres del Profesor y 
el Promedio obtenido.*/
USE EduTec
GO

SELECT 
	*
FROM Alumno					A
INNER JOIN Matricula		M  ON A.IdAlumno = M.IdAlumno
INNER JOIN CursoProgramado	CP ON M.IdCursoProg=CP.IdCursoProg
INNER JOIN Curso			C  ON CP.IdCurso = C.IdCurso
INNER JOIN Profesor			P  ON CP.IdProfesor = P.IdProfesor
GO


SELECT 
	A.ApeAlumno, 
	A.NomAlumno,  
	CP.IdCursoProg, 
	C.NomCurso,
	P.ApeProfesor, 
	P.NomProfesor, 
	M.Promedio
FROM		Alumno			A
INNER JOIN Matricula		M   ON A.IdAlumno = M.IdAlumno
INNER JOIN CursoProgramado	CP  ON M.IdCursoProg=CP.IdCursoProg
INNER JOIN Curso			C	ON CP.IdCurso = C.IdCurso
INNER JOIN Profesor			P	ON CP.IdProfesor = P.IdProfesor
ORDER BY 3
GO
---presentar los 3 empleados que vendiero más
USE NORTHWIND
GO

SELECT 
*
FROM		Employees		E
INNER JOIN	Orders			O  ON E.EmployeeID=O.EmployeeID
INNER JOIN	[Order Details]	OD ON O.OrderID=OD.OrderID
GO

SELECT 
E.LastName,
E.FirstName,
ROUND(SUM(OD.UnitPrice *OD.Quantity * (1-OD.Discount)),2) AS Monto
FROM		Employees		E
INNER JOIN	Orders			O	ON E.EmployeeID=O.EmployeeID
INNER JOIN	[Order Details] OD	ON O.OrderID=OD.OrderID
GROUP BY E.LastName, E.FirstName
ORDER BY 3 DESC
GO

SELECT TOP 3 WITH TIES
E.LastName,
E.FirstName,
ROUND(SUM(OD.UnitPrice *OD.Quantity * (1-OD.Discount)),2) AS Monto
FROM		Employees		E
INNER JOIN	Orders			O	ON E.EmployeeID=O.EmployeeID
INNER JOIN	[Order Details] OD	ON O.OrderID=OD.OrderID
GROUP BY E.LastName, E.FirstName
ORDER BY 3 DESC
GO



SELECT TOP 3 WITH TIES
E.LastName, E.FirstName, E.EmployeeID,
ROUND(SUM(OD.UnitPrice *OD.Quantity * (1-OD.Discount)),2) AS Monto
FROM			Employees	E
INNER JOIN	Orders			O ON E.EmployeeID=O.EmployeeID
INNER JOIN	[Order Details] OD ON O.OrderID=OD.OrderID
GROUP BY E.LastName, E.FirstName,E.EmployeeID
ORDER BY 4 DESC
GO

-- Presentar el monto total -----------------------------------------------------------------------------------------------------------------------------------------------
--de ventas por region en Northwind
USE Northwind
GO

SELECT 
*
FROM		Region				R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN	Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN	Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
GO


SELECT 
	R.RegionDescription	AS [Nombre de Region],
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount) ),2)	AS [Monto de ventas]
FROM		Region				R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN	Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN	Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
GROUP BY R.RegionDescription
ORDER BY 2 DESC
GO	

-- Presentar el monto total de ventas por region en Northwind
-- SOLO PARA LAS REGIONES NORTE Y SUR, 
-- durante el primer semestre de 1997
SELECT * FROM REGION
GO
-- Northern,   Southern                                                                                   
SELECT 
	R.RegionDescription	AS [Nombre de Region],
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount) ),2)	AS [Monto de ventas]
FROM		Region				R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN	Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN	Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
where R.RegionDescription='Northern' or R.RegionDescription='Southern'and O.OrderDate BETWEEN '19970101' AND '19970630'
GROUP BY R.RegionDescription
ORDER BY 2 DESC
GO	



SELECT 
R.RegionDescription   AS [Nombre de Region],
ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
FROM	   Region				R
INNER JOIN Territories			T	ON R.RegionID=T.RegionID
INNER JOIN EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
GROUP BY R.RegionDescription
HAVING R.RegionDescription IN ('Northern','Southern')
ORDER BY 2 DESC
GO	

SELECT 
R.RegionDescription   AS [Nombre de Region],
ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
FROM	   Region				R
INNER JOIN Territories			T ON R.RegionID=T.RegionID
INNER JOIN EmployeeTerritories ET ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]	   OD ON O.OrderID=OD.OrderID
GROUP BY R.RegionDescription
HAVING R.RegionDescription IN ('Northern','Southern')
ORDER BY 2 DESC
GO	

/*Presentar el monto de ventas por region
 y categoria 
  (lo que se vendio en cada region
   por cada categoria)
*/

SELECT 
R.RegionDescription   AS [Nombre de Region],
C.CategoryName		  AS Categoría,
ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
FROM			Region			R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
INNER JOIN	Products			P	ON OD.ProductID = P.ProductID
INNER JOIN	Categories			C	ON P.CategoryID=C.CategoryID
GROUP BY R.RegionDescription,C.CategoryName	
ORDER BY 1, 2
GO	


--=======================================================
-- USO DE CONVERT
USE EduTec
GO
SELECT GETDATE()AS [FECHA ACTUAL]
GO
SELECT 	
CONVERT(CHAR(12),GETDATE(),101) AS '101(USA)mm/dd/yy',
CONVERT(CHAR(12),GETDATE(),102) AS '102(ANSI)yy.mm.dd',
CONVERT(CHAR(12),GETDATE(),103) AS '103(BRIT/FRAN)dd/mm/yy'
GO

SELECT 
	A.ApeAlumno, 
	A.NomAlumno,
	M.FecMatricula AS [Fecha de Matricula],
	CP.IdCurso,
	CP.IdCiclo
FROM		Alumno			A 
INNER JOIN	Matricula		M  ON A.IdAlumno=M.IdAlumno
INNER JOIN	CursoProgramado CP ON M.IdcursoProg=CP.IdcursoProg
GO

SELECT 
	A.ApeAlumno, 
	A.NomAlumno,
	CONVERT(CHAR(12),M.FecMatricula,103) AS [Fecha de Matricula],
	CP.IdCurso,
	CP.IdCiclo
FROM		Alumno			A 
INNER JOIN	Matricula		M	ON A.IdAlumno=M.IdAlumno
INNER JOIN	CursoProgramado CP  ON M.IdcursoProg=CP.IdcursoProg
GO
-- Enviando los resultados a una tabla Temporal ( # )
USE EduTec
GO
SELECT A.IdAlumno,A.ApeAlumno,A.NomAlumno,
CONVERT(CHAR(12),M.FecMatricula,103) AS 'Fecha de Matricula',
CP.IdCurso,CP.IdCiclo
FROM		Alumno			A 
INNER JOIN Matricula		M ON A.IdAlumno=M.IdAlumno
INNER JOIN CursoProgramado CP ON M.IdcursoProg=CP.IdcursoProg
GO

SELECT 
	A.IdAlumno,	A.ApeAlumno,	A.NomAlumno,
	CONVERT(CHAR(12),M.FecMatricula,103) AS [Fecha de Matricula],
	CP.IdCurso,	CP.IdCiclo
INTO #TabTempo1-------temporal
FROM Alumno A 
INNER JOIN Matricula		M ON A.IdAlumno=M.IdAlumno
INNER JOIN CursoProgramado CP ON M.IdcursoProg=CP.IdcursoProg
GO

SELECT * FROM #TabTempo1
GO

DROP TABLE #TabTempo1
GO
SELECT * FROM #TabTempo1 ORDER BY IdAlumno
GO
USE MarketPeru
GO
SELECT P.IdProveedor, P.Nombre AS Proveedor,
CONVERT(CHAR(12),G.FechaSalida,103) AS 'Fecha de Salida',
PR.Nombre AS Producto, GD.IdGuia
INTO #ProductosEnviados
FROM		PROVEEDOR		P 
INNER JOIN	PRODUCTO		PR	ON P.IdProveedor = PR.IdProveedor
INNER JOIN	GUIA_DETALLE	GD	ON PR.IdProducto = GD.IdProducto
INNER JOIN	GUIA			G	ON GD.IDGuia = G.IDGuia
GO

SELECT  * FROM #ProductosEnviados
GO

SELECT * FROM #ProductosEnviados ORDER BY IdProveedor
GO
DROP TABLE #ProductosEnviados
GO
-- Enviando los resultados a una tabla permanente
USE EduTec
GO
SELECT 
	A.IdAlumno,	A.ApeAlumno,	A.NomAlumno,
	CONVERT(CHAR(12),M.FecMatricula,103) AS [Fecha de Matricula],
	CP.IdCurso,	CP.IdCiclo
INTO TablaEjemplo3
FROM		Alumno			A 
INNER JOIN	Matricula		M	ON A.IdAlumno=M.IdAlumno
INNER JOIN	CursoProgramado CP	ON M.IdcursoProg=CP.IdcursoProg
GO

SELECT * FROM TablaEjemplo3 ORDER BY IdAlumno
GO
--
USE MarketPeru
GO
SELECT 
P.Nombre,OD.CantidadRecibida,
CONVERT(CHAR(12),O.FechaEntrada,103) AS 'Fecha de Ingreso'
INTO IngresoDeProductos
FROM		Producto		P 
INNER JOIN	Orden_Detalle	OD	ON P.IdProducto = OD.IdProducto
INNER JOIN	Orden			O	ON OD.IdOrden = O.IdOrden
GO
SELECT * FROM IngresoDeProductos ORDER BY Nombre
GO
--
/* Presentar el total de ventas por region por año, en Northwind
y guardar los resultados en tablas historicas
*/
USE Northwind
GO
SELECT 
	R.RegionDescription, 
	ROUND(SUM(OD.Quantity*OD.UnitPrice * (1-od.discount)),2) AS MONTO
INTO VentasRegion_1996
FROM			Region			R 
INNER JOIN		Territories		T	ON	R.RegionID=T.RegionID
INNER JOIN		EmployeeTerritories ET ON T.TerritoryID=ET.TerritoryID
INNER JOIN		Employees		E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN		Orders			O  ON E.EmployeeID=O.EmployeeID
INNER JOIN		[Order Details] OD ON O.OrderID=OD.OrderID
WHERE YEAR(O.OrderDate)=1996
GROUP BY R.RegionDescription
ORDER BY 2 DESC
GO
SELECT * FROM VentasRegion_1996
GO
SELECT 
	R.RegionDescription, 
	ROUND(SUM(OD.Quantity*OD.UnitPrice * (1-od.discount)),2) AS MONTO
INTO VentasRegion_1997
FROM			Region			R 
INNER JOIN		Territories		T	ON	R.RegionID=T.RegionID
INNER JOIN		EmployeeTerritories ET ON T.TerritoryID=ET.TerritoryID
INNER JOIN		Employees		E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN		Orders			O  ON E.EmployeeID=O.EmployeeID
INNER JOIN		[Order Details] OD ON O.OrderID=OD.OrderID
WHERE YEAR(O.OrderDate)=1997
GROUP BY R.RegionDescription
ORDER BY 2 DESC
GO
SELECT * FROM VentasRegion_1996
SELECT * FROM VentasRegion_1997
go
SELECT 
	R.RegionDescription, 
	ROUND(SUM(OD.Quantity*OD.UnitPrice * (1-od.discount)),2) AS MONTO
INTO VentasRegion_1998
FROM			Region			R 
INNER JOIN		Territories		T	ON	R.RegionID=T.RegionID
INNER JOIN		EmployeeTerritories ET ON T.TerritoryID=ET.TerritoryID
INNER JOIN		Employees		E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN		Orders				O  ON E.EmployeeID=O.EmployeeID
INNER JOIN		[Order Details] OD ON O.OrderID=OD.OrderID
WHERE YEAR(O.OrderDate)=1998
GROUP BY R.RegionDescription
ORDER BY 2 DESC
GO
select * from VentasRegion_1996
select * from VentasRegion_1997
select * from VentasRegion_1998
go

USE Northwind
GO
SELECT * FROM Orders 
GO
/*

GUARDAR EN TABLA HISTORICAS EL MONTO TOTAL DE VENTAS 
POR CATEGORIA POR MES DE UN AÑO DETERMINADO POR UD
*/
USE Northwind
GO
SELECT * FROM Orders 
GO
SELECT 
	R.RegionDescription   AS [Nombre de Region],
	C.CategoryName		  AS Categoría,
	YEAR(O.OrderDate)	  AS  Año,
	MONTH(O.OrderDate)    AS  Mes,
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
INTO Tarea3_1998_05
FROM			Region			R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
INNER JOIN	Products			P	ON OD.ProductID = P.ProductID
INNER JOIN	Categories			C	ON P.CategoryID=C.CategoryID
WHERE YEAR(O.OrderDate)=1998 and MONTH(O.OrderDate)=5
GROUP BY R.RegionDescription,C.CategoryName	,YEAR(O.OrderDate),MONTH(O.OrderDate)
ORDER BY 2 
GO
SELECT * FROM Tarea3_1998_05
GO
drop table Tarea3_1998_05
go
SELECT 
	R.RegionDescription   AS [Nombre de Region],
	C.CategoryName		  AS Categoría,
	YEAR(O.OrderDate)	  AS  Año,
	MONTH(O.OrderDate)    AS  Mes,
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
INTO Tarea3_1998_02
FROM			Region			R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
INNER JOIN	Products			P	ON OD.ProductID = P.ProductID
INNER JOIN	Categories			C	ON P.CategoryID=C.CategoryID
WHERE YEAR(O.OrderDate)=1998 and MONTH(O.OrderDate)=2
GROUP BY C.CategoryName	,R.RegionDescription,YEAR(O.OrderDate),MONTH(O.OrderDate)
ORDER BY 2
GO
SELECT * FROM Tarea3_1998_02
GO

SELECT 
	R.RegionDescription   AS [Nombre de Region],
	C.CategoryName		  AS Categoría,
	YEAR(O.OrderDate)	  AS  Año,
	MONTH(O.OrderDate)    AS  Mes,
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
INTO Tarea3_1998_03
FROM			Region			R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
INNER JOIN	Products			P	ON OD.ProductID = P.ProductID
INNER JOIN	Categories			C	ON P.CategoryID=C.CategoryID
WHERE YEAR(O.OrderDate)=1998 and MONTH(O.OrderDate)=3
GROUP BY C.CategoryName	,R.RegionDescription,YEAR(O.OrderDate),MONTH(O.OrderDate)
ORDER BY 2
GO
SELECT * FROM Tarea3_1998_03
GO

drop table Tarea3_1998_01
go
SELECT 
	R.RegionDescription   AS [Nombre de Region],
	C.CategoryName		  AS Categoría,
	YEAR(O.OrderDate)	  AS  Año,
	MONTH(O.OrderDate)    AS  Mes,
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
INTO Tarea3_1998_04
FROM			Region			R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
INNER JOIN	Products			P	ON OD.ProductID = P.ProductID
INNER JOIN	Categories			C	ON P.CategoryID=C.CategoryID
WHERE YEAR(O.OrderDate)=1998 and MONTH(O.OrderDate)=4
GROUP BY C.CategoryName	,R.RegionDescription,YEAR(O.OrderDate),MONTH(O.OrderDate)
ORDER BY 2
GO
SELECT * FROM Tarea3_1998_04
GO

SELECT 
	R.RegionDescription   AS [Nombre de Region],
	C.CategoryName		  AS Categoría,
	YEAR(O.OrderDate)	  AS  Año,
	MONTH(O.OrderDate)    AS  Mes,
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
INTO Tarea3_1998_05
FROM			Region			R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
INNER JOIN	Products			P	ON OD.ProductID = P.ProductID
INNER JOIN	Categories			C	ON P.CategoryID=C.CategoryID
WHERE YEAR(O.OrderDate)=1998 and MONTH(O.OrderDate)=5
GROUP BY C.CategoryName	,R.RegionDescription,YEAR(O.OrderDate),MONTH(O.OrderDate)
ORDER BY 2
GO
SELECT * FROM Tarea3_1998_05
GO

SELECT 
	R.RegionDescription   AS [Nombre de Region],
	C.CategoryName		  AS Categoría,
	YEAR(O.OrderDate)	  AS  Año,
	MONTH(O.OrderDate)    AS  Mes,
	ROUND(SUM(OD.UnitPrice * OD.Quantity * (1-OD.Discount) ),2)   AS [Monto de ventas]
INTO Tarea3_1998_12
FROM			Region			R
INNER JOIN	Territories			T	ON R.RegionID=T.RegionID
INNER JOIN	EmployeeTerritories ET	ON T.TerritoryID=ET.TerritoryID
INNER JOIN Employees			E	ON ET.EmployeeID=E.EmployeeID
INNER JOIN Orders				O	ON E.EmployeeID=O.EmployeeID	
INNER JOIN	[Order Details]		OD	ON O.OrderID=OD.OrderID
INNER JOIN	Products			P	ON OD.ProductID = P.ProductID
INNER JOIN	Categories			C	ON P.CategoryID=C.CategoryID
WHERE YEAR(O.OrderDate)=1998 and MONTH(O.OrderDate)=12
GROUP BY C.CategoryName	,R.RegionDescription,YEAR(O.OrderDate),MONTH(O.OrderDate)
ORDER BY 2
GO
SELECT * FROM Tarea3_1998_12
GO