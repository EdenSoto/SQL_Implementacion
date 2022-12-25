USE MASTER
GO
CREATE DATABASE EduTec
ON PRIMARY
(NAME =  EduTec_Dat, FILENAME='D:\FIEE_DATA\EduTec.mdf', 
 SIZE = 5MB, MAXSIZE = 200, FILEGROWTH = 1 )
LOG ON
(NAME = EduTec_Log, FILENAME ='D:\FIEE_DATA\EduTec_Log.ldf',
 SIZE = 1MB, MAXSIZE = 200, FILEGROWTH= 1MB)
GO

USE EduTec
go

-- Creaci�n de las Tablas y Claves Primarias
-- -----------------------------------------

CREATE TABLE Alumno (
       IdAlumno             char(5) NOT NULL,
       ApeAlumno            varchar(30) NOT NULL,
       NomAlumno            varchar(30) NOT NULL,
       DirAlumno            varchar(50) NULL,
       TelAlumno            varchar(12) NULL,
       EmailAlumno          varchar(50) NULL
)
go


ALTER TABLE Alumno
       ADD PRIMARY KEY (IdAlumno)
go


CREATE TABLE Ciclo (
       IdCiclo              char(7) NOT NULL,
       FecInicio            datetime NULL,
       FecTermino           datetime NULL
)
go


ALTER TABLE Ciclo
       ADD PRIMARY KEY (IdCiclo)
go


CREATE TABLE Curso (
       IdCurso              char(4) NOT NULL,
       IdTarifa             char(1) NOT NULL,
       NomCurso             varchar(50) NOT NULL
)
go


ALTER TABLE Curso
       ADD PRIMARY KEY (IdCurso)
go


CREATE TABLE CursoProgramado (
       IdCursoProg          int IDENTITY,
       IdCurso              char(4) NOT NULL,
       IdCiclo              char(7) NOT NULL,
       IdProfesor           char(4) NULL,
       Vacantes             tinyint NOT NULL DEFAULT 20,
       PreCursoProg         money NOT NULL,
       Horario              varchar(24) NOT NULL,
       Activo               bit DEFAULT 1,
       Matriculados         tinyint NOT NULL DEFAULT 0
)
go


ALTER TABLE CursoProgramado
       ADD PRIMARY KEY (IdCursoProg)
go


CREATE TABLE Empleado (
       IdEmpleado           char(6) NOT NULL,
       Password             char(6) NOT NULL,
       ApeEmpleado          varchar(30) NOT NULL,
       NomEmpleado          varchar(30) NOT NULL,
       Cargo                varchar(25) NOT NULL,
       DirEmpleado          varchar(50) NULL,
       TelEmpleado          varchar(12) NULL,
       EmailEmpleado        varchar(50) NULL
)
go


ALTER TABLE Empleado
       ADD PRIMARY KEY (IdEmpleado)
go


CREATE TABLE Matricula (
       IdCursoProg          int NOT NULL,
       IdAlumno             char(5) NOT NULL,
       FecMatricula         datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       ExaParcial           real NULL,
       ExaFinal             real NULL,
       Promedio             real NULL,
       Subsanacion          bit DEFAULT 0,
       ExaSub               real NULL
)
go


ALTER TABLE Matricula
       ADD PRIMARY KEY (IdCursoProg, IdAlumno)
go


CREATE TABLE Parametro (
       Campo                varchar(10) NOT NULL,
       Contador             int NOT NULL
)
go


ALTER TABLE Parametro
       ADD PRIMARY KEY (Campo)
go


CREATE TABLE Profesor (
       IdProfesor           char(4) NOT NULL,
       ApeProfesor          varchar(30) NOT NULL,
       NomProfesor          varchar(30) NOT NULL,
       DirProfesor          varchar(50) NULL,
       TelProfesor          varchar(12) NULL,
       EmailProfesor        varchar(50) NULL
)
go


ALTER TABLE Profesor
       ADD PRIMARY KEY (IdProfesor)
go


CREATE TABLE Tarifa (
       IdTarifa             char(1) NOT NULL,
       PreTarifa            money NOT NULL,
       Descripcion          varchar(50) NULL
)
go


ALTER TABLE Tarifa
       ADD PRIMARY KEY (IdTarifa)
go

-- Creaci�n de Claves For�neas
-- ---------------------------

ALTER TABLE Curso
       ADD FOREIGN KEY (IdTarifa)
                             REFERENCES Tarifa
go


ALTER TABLE CursoProgramado
       ADD FOREIGN KEY (IdCiclo)
                             REFERENCES Ciclo
go


ALTER TABLE CursoProgramado
       ADD FOREIGN KEY (IdCurso)
                             REFERENCES Curso
go


ALTER TABLE CursoProgramado
       ADD FOREIGN KEY (IdProfesor)
                             REFERENCES Profesor
go


ALTER TABLE Matricula
       ADD FOREIGN KEY (IdCursoProg)
                             REFERENCES CursoProgramado
go


ALTER TABLE Matricula
       ADD FOREIGN KEY (IdAlumno)
                             REFERENCES Alumno
go



