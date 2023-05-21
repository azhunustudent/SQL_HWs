USE [Academy];
GO


-- таблица Кураторы (Curators)
INSERT INTO [Curators] ([Surname], [Name])
VALUES ('Ullrich', 'Rita'),
	   ('Stark', 'Garfield'),
	   ('Hilpert', 'Selina'),
	   ('Schamberger', 'Dakota'),
	   ('Weimann', 'Mya'),
	   ('Huel', 'Alexa'),
	   ('Dach', 'Jimmy');
GO


-- таблица Факультеты (Faculties)
INSERT INTO [Faculties] ([Financing], [Name])
VALUES (60000, 'Computer Science'),
	   (55000, 'Design'),
	   (50000, 'System Administration');
GO


-- таблица Кафедры (Departments)
INSERT INTO [Departments] ([Financing], [Name], [FacultyId])
VALUES (15000, 'Web Development', 1),
	   (15000, 'Mobile Development', 1),
	   (20000, 'Algorithms and Data Structures', 1),
	   (15000, 'Graphic Design', 2),
	   (19000, 'Animation', 2),
	   (17000, 'Web Design', 2),
	   (15000, 'System Services', 3),
	   (18000, 'Network Technologies', 3),
	   (20000, 'Information Security', 3);
GO


-- таблица Группы (Groups)
INSERT INTO [Groups] ([Name], [Year],[DepartmentId]) 
VALUES ('P101', 1, 1),
	   ('P303', 3, 2),
	   ('P205', 2, 1),
	   ('P107', 1, 3),
	   ('D501', 5, 5),
	   ('D206', 1, 4),
	   ('D404', 4, 6),
	   ('S508', 5, 9),
	   ('S308', 3, 8),
	   ('S402', 4, 7);
GO


-- таблица Группы и кураторы (GroupsCurators)
INSERT INTO [GroupsCurators] ([GroupId], [CuratorId])
VALUES (1, 1),
       (2, 1),
       (3, 2),
       (4, 2),
       (5, 3),
       (6, 4),
       (7, 4),
       (8, 5),
       (9, 7),
       (10, 6);
GO


-- таблица Дисциплины (Subjects)
INSERT INTO [Subjects] ([Name])
VALUES ('Frontend Development'),
	   ('Backend Development'),
	   ('Android App Development'),
	   ('iOS App Development'),
	   ('Machine Learning'),
	   ('Database Theory'),
	   ('Branding and Identity Design'),
	   ('2D Animation'),
	   ('3D Animation'),
	   ('UI/UX Design'),
	   ('Computer Networks'),
	   ('Server Management'),
	   ('Virtualization and Cloud Services'),
	   ('Cryptography and Information Protection');
GO


-- таблица Преподаватели (Teachers)
INSERT INTO [Teachers] ([Surname], [Name], [Salary])
VALUES ('Smitham', 'Lucas', 8000),
	   ('Goldner', 'Lurline', 7800),
	   ('Adams', 'Samantha', 7600),
	   ('Hahn', 'Jamie', 8700),
	   ('Rice', 'Frida', 9700),
	   ('Nitzsche', 'Kyle', 7500),
	   ('Blanda', 'Kristin', 8200);
GO


-- таблица Лекции (Lectures)
INSERT INTO [Lectures] ([LectureRoom], [SubjectId], [TeacherId])
VALUES ('A101', 1, 1),
	   ('A112', 2, 1),
	   ('B103', 3, 2),
	   ('B105', 6, 3),
	   ('C102', 10, 4),
	   ('B103', 8, 4),
	   ('C115', 7, 5),
	   ('D105', 11, 6),
	   ('B103', 13, 7),
	   ('D105', 12, 6);
GO


-- таблица Группы и лекции (GroupsLectures)
INSERT INTO [GroupsLectures] ([GroupId], [LectureId])
VALUES (1, 1),
       (2, 3),
       (3, 2),
       (4, 4),
       (5, 6),
       (6, 7),
       (7, 5),
       (8, 10),
       (9, 9),
       (10,8);
GO