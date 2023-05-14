USE [Academy];
GO


DROP TABLE [Groups];
GO

CREATE TABLE [Groups]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[Name] nvarchar(10) NOT NULL CHECK([Name] <> N'') unique,
	[Rating] int NOT NULL CHECK([Rating] BETWEEN 0 AND 5),
	[Year] int NOT NULL CHECK([Year] BETWEEN 1 AND 5)
);
GO


DROP TABLE [Departments];
GO

CREATE TABLE [Departments]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[Financing] money NOT NULL CHECK([Financing] >= 0) default(0),
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') unique
);
GO


DROP TABLE [Faculties];
GO

CREATE TABLE [Faculties]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') unique
);
GO


DROP TABLE [Teachers];
GO

CREATE TABLE [Teachers]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[EmploymentDate] date NOT NULL CHECK([EmploymentDate] >= '01.01.1990'),
	[Name] nvarchar(max) NOT NULL CHECK([Name] <> N''),
	[Premium] money NOT NULL CHECK([Premium] >= 0) default(0),
	[Salary] money NOT NULL CHECK([Salary] > 0),
	[Surname] nvarchar(max) NOT NULL CHECK([Surname] <> N'')
);
GO