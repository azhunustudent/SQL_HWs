USE [Academy];
GO


-- таблица Кураторы (Curators)
CREATE TABLE [Curators]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(max) NOT NULL CHECK([Name] <> N''),
	[Surname] nvarchar(max) NOT NULL CHECK([Surname] <> N'')
);
GO


-- таблица Факультеты (Faculties)
CREATE TABLE [Faculties]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Financing] money NOT NULL CHECK([Financing] >= 0) default(0),
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') unique
);
GO


-- таблица Кафедры (Departments)
CREATE TABLE [Departments]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Financing] money NOT NULL CHECK([Financing] >= 0) default(0),
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') unique,
	[FacultyId] int NOT NULL,
	CONSTRAINT [FK_Dep_FacultyId] FOREIGN KEY ([FacultyId]) REFERENCES [Faculties]([Id])
);
GO


-- таблица Группы (Groups)
CREATE TABLE [Groups]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(10) NOT NULL CHECK([Name] <> N'') unique,
	[Year] int NOT NULL CHECK([Year] BETWEEN 1 AND 5),
	[DepartmentId] int NOT NULL,
	CONSTRAINT [FK_Group_DepartmentId] FOREIGN KEY ([DepartmentId]) REFERENCES [Departments]([Id])
);
GO


-- таблица Группы и кураторы (GroupsCurators)
CREATE TABLE [GroupsCurators]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CuratorId] int NOT NULL,
	[GroupId] int NOT NULL,
	CONSTRAINT [FK_GC_CuratorId] FOREIGN KEY ([CuratorId]) REFERENCES [Curators]([Id]),
	CONSTRAINT [FK_GC_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [Groups]([Id])
);
GO


-- таблица Дисциплины (Subjects)
CREATE TABLE [Subjects]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') unique
);
GO


-- таблица Преподаватели (Teachers)
CREATE TABLE [Teachers]
(
	[Id] int NOT NULL identity(1,1) primary key,
	[Name] nvarchar(max) NOT NULL CHECK([Name] <> N''),
	[Salary] money NOT NULL CHECK([Salary] > 0),
	[Surname] nvarchar(max) NOT NULL CHECK([Surname] <> N'')
);
GO


-- таблица Лекции (Lectures)
CREATE TABLE [Lectures]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[LectureRoom] nvarchar(max) NOT NULL CHECK([LectureRoom] <> N''),
	[SubjectId] int NOT NULL,
	[TeacherId] int NOT NULL,
	CONSTRAINT [FK_Lec_SubjectId] FOREIGN KEY ([SubjectId]) REFERENCES [Subjects]([Id]),
	CONSTRAINT [FK_Lec_TeacherId] FOREIGN KEY ([TeacherId]) REFERENCES [Teachers]([Id])
);
GO


-- таблица Группы и лекции (GroupsLectures)
CREATE TABLE [GroupsLectures]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GroupId] int NOT NULL,
	[LectureId] int NOT NULL,
	CONSTRAINT [FK_GL_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [Groups]([Id]),
	CONSTRAINT [FK_GL_LectureId] FOREIGN KEY ([LectureId]) REFERENCES [Lectures]([Id])
);
GO