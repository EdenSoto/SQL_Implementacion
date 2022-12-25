--concatenado terminos
USE EduTec
GO

SELECT IDEMPLEADO,APEEMPLEADO,NOMEMPLEADO
FROM Empleado
GO
SELECT
	IdEmpleado,
	ApeEmpleado + ','+ NomEmpleado
FROM Empleado
GO
--Estableciendo Titulos ala columnas
SELECT
	IdEmpleado AS Código,
	ApeEmpleado + ','+ NomEmpleado AS Empleado
FROM Empleado
GO

SELECT
	ApeProfesor+','+NomProfesor AS PROFESOR,
	DirProfesor					 AS DIRECCION,
	EmailProfesor				AS[CORREO ELECTRONICO]
FROM Profesor
GO

/*En MarketPeru presentar una lista de proveedores, mostrando los 
  siguientes datos:
		Nombre del Proveedor,	
		Ubicación ( Departamento, Direccion y Ciudad) y 
		el Nombre del contacto.                                         */

USE MarketPERU
GO

SELECT * FROM PROVEEDOR
GO
SELECT 
Nombre							AS	[Nombre del Proveedor], 
Departamento+ '  -  ' +  direccion  + '  -  ' + Ciudad AS Ubicación, 
Representante				AS	[Nombre del contacto]  
FROM PROVEEDOR
GO
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

USE EDUTEC
GO

SELECT * FROM CursoProgramado
GO

SELECT 
	IdCursoProg, 
	IdCurso, 
	PreCursoProg, 
	Matriculados 
FROM CursoProgramado
GO

SELECT 
	IdCursoProg					AS	 [Curso programado], 
	IdCurso						AS	 Curso,
	PreCursoProg				AS	 Precio ,
	Matriculados				AS	 [Cantidad de matriculados],
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
USE Northwind
GO
SELECT * FROM [Order Details]
GO

SELECT 
	OrderID								AS	[Numero de pedido], 
	ProductID							AS	[Codigo del producto], 
	UnitPrice							AS	[Precio de venta],
	Quantity							AS	[Cantidad vendida],
	UnitPrice * Quantity				AS	SubTotal, 
	discount * 100 						AS	[Porcentaje de descuento (%)],
	UnitPrice * Quantity * Discount		AS	[Descuento Aplicado],
   UnitPrice * Quantity * (1-Discount)	AS	[Monto pagado]
FROM [Order Details]
GO
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

-- En MarketPeru presentar una lista de productos  
-- cuyos precios sean mayores o iguales a 10
-- y menores o iguales a 20
SELECT 
IdProducto, Nombre, IdCategoria, PrecioProveedor 
FROM PRODUCTO 
WHERE PrecioProveedor >=10   AND   PrecioProveedor <=20
GO
-- En MarketPeru presentar una lista de productos comestibles 
--( de consumo humano) cuyos precios sean mayores o iguales a 10
-- y menores o iguales a 20
SELECT 
IdProducto, Nombre,IdCategoria, PrecioProveedor 
FROM PRODUCTO 
WHERE 
 (IdCategoria =1 OR IdCategoria =2 OR IdCategoria =4  OR IdCategoria =5)
 AND 
 (PrecioProveedor >=10   AND   PrecioProveedor <=20)
GO

SELECT IdProducto, Nombre, PrecioProveedor FROM PRODUCTO 
WHERE 
	IdCategoria IN (1, 2, 4, 5)   AND 
	(PrecioProveedor BETWEEN 10   AND  20)
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
select orderid, orderdate,employeeid
from orders
where 
	employeeid in (1,5,8) 
	and 
	(orderdate between '19970101' and '19970331')
GO




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
------------------------------------------------------
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

SELECT * FROM ALUMNO 
WHERE APEALUMNO LIKE '_A%'
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
WHERE CompanyName LIKE 'L[^A]%' --^A negación
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
ORDER BY APEALUMNO--ordenar la tabla
GO
SELECT IDALUMNO,APEALUMNO,NOMALUMNO FROM ALUMNO
ORDER BY APEALUMNO DESC --ordenar la tabla alreves
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