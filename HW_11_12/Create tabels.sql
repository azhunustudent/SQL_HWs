USE [Academy];
GO


-- таблица Кураторы (Curators)
CREATE TABLE [Curators]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(MAX) NOT NULL CHECK([Name] <> N''),
	[Surname] nvarchar(MAX) NOT NULL CHECK([Surname] <> N'')
);
GO


-- таблица Факультеты (Faculties)
CREATE TABLE [Faculties]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') UNIQUE
);
GO


-- таблица Кафедры (Departments)
CREATE TABLE [Departments]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Building] int NOT NULL CHECK([Building] BETWEEN 1 AND 5),
	[Financing] money NOT NULL CHECK([Financing] >= 0) DEFAULT(0),
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') UNIQUE,
	[FacultyId] int NOT NULL,
	CONSTRAINT [FK_Dep_FacultyId] FOREIGN KEY([FacultyId]) REFERENCES [Faculties]([Id])
);
GO


-- таблица Группы (Groups)
CREATE TABLE [Groups]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(10) NOT NULL CHECK([Name] <> N'') UNIQUE,
	[Year] int NOT NULL CHECK([Year] BETWEEN 1 AND 5),
	[DepartmentId] int NOT NULL,
	CONSTRAINT [FK_Group_DepartmentId] FOREIGN KEY([DepartmentId]) REFERENCES [Departments]([Id])
);
GO


-- таблица Студенты (Students)
CREATE TABLE [Students]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(MAX) NOT NULL CHECK([Name] <> N''),
	[Rating] int NOT NULL CHECK([Rating] BETWEEN 0 AND 5),
	[Surname] nvarchar(MAX) NOT NULL CHECK([Surname] <> N''),
);
GO


-- таблица Дисциплины (Subjects)
CREATE TABLE [Subjects]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(100) NOT NULL CHECK([Name] <> N'') UNIQUE
);
GO


-- таблица Преподаватели (Teachers)
CREATE TABLE [Teachers]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[IsProfessor] bit NOT NULL DEFAULT(0),
	[Name] nvarchar(MAX) NOT NULL CHECK([Name] <> N''),
	[Salary] money NOT NULL CHECK([Salary] > 0),
	[Surname] nvarchar(MAX) NOT NULL CHECK([Surname] <> N'')
);
GO


-- таблица Лекции (Lectures)
CREATE TABLE [Lectures]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Date] date NOT NULL CHECK([Date] <= GETDATE()),
	[SubjectId] int NOT NULL,
	[TeacherId] int NOT NULL,
	CONSTRAINT [FK_Lec_SubjectId] FOREIGN KEY([SubjectId]) REFERENCES [Subjects]([Id]),
	CONSTRAINT [FK_Lec_TeacherId] FOREIGN KEY([TeacherId]) REFERENCES [Teachers]([Id])
);
GO


-- таблица Группы и кураторы (GroupsCurators)
CREATE TABLE [GroupsCurators]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CuratorId] int NOT NULL,
	[GroupId] int NOT NULL,
	CONSTRAINT [FK_GK_CuratorId] FOREIGN KEY([CuratorId]) REFERENCES [Curators]([Id]),
	CONSTRAINT [FK_GK_GroupId] FOREIGN KEY([GroupId]) REFERENCES [Groups]([Id])
);
GO


-- таблица Группы и лекции (GroupsLectures)
CREATE TABLE [GroupsLectures]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GroupId] int NOT NULL,
	[LectureId] int NOT NULL,
	CONSTRAINT [FK_GL_GroupId] FOREIGN KEY([GroupId]) REFERENCES [Groups]([Id]),
	CONSTRAINT [FK_GL_LectureId] FOREIGN KEY([LectureId]) REFERENCES [Lectures]([Id])
);
GO


-- таблица Группы и студенты (GroupsStudents)
CREATE TABLE [GroupsStudents]
(
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[GroupId] int NOT NULL,
	[StudentId] int NOT NULL,
	CONSTRAINT [FK_GS_GroupId] FOREIGN KEY([GroupId]) REFERENCES [Groups]([Id]),
	CONSTRAINT [FK_GS_StudentId] FOREIGN KEY([StudentId]) REFERENCES [Students]([Id])
);
GO