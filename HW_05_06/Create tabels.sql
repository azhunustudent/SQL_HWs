USE [Academy];
GO


-- таблица Группы (Groups)
CREATE TABLE [Groups]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[Name] nvarchar(10) NOT NULL CHECK([Name] <> N'') unique,
	[Rating] int NOT NULL CHECK([Rating] BETWEEN 0 AND 5),
	[Year] int NOT NULL CHECK([Year] BETWEEN 1 AND 5)
);
GO


-- таблица Кафедры (Departments)
CREATE TABLE [Departments]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[Financing] money NOT NULL CHECK([Financing] >= 0.0) default(0.0),
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') unique
);
GO


-- таблица Факультеты (Faculties)
CREATE TABLE [Faculties]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[Dean] nvarchar(max) NOT NULL CHECK([Dean] <> N''),
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') unique
);
GO


-- таблица Дисциплины (Teachers)
CREATE TABLE [Teachers]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[EmploymentDate] date NOT NULL CHECK([EmploymentDate] >= '01.01.1990'),
	[IsAssistant] bit NOT NULL default(0),
	[IsProfessor] bit NOT NULL default(0),
	[Name] nvarchar(max) NOT NULL CHECK([Name] <> N''),
	[Position] nvarchar(max) NOT NULL CHECK([Position] <> N''),
	[Premium] money NOT NULL CHECK([Premium] >= 0.0) default(0.0),
	[Salary] money NOT NULL CHECK([Salary] > 0.0),
	[Surname] nvarchar(max) NOT NULL CHECK([Surname] <> N'')
);
GO