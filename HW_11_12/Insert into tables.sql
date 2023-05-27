USE [Academy];
GO

-- таблица Кураторы (Curators)
INSERT INTO [Curators] ([Surname], [Name])
VALUES ('Adams', 'Doris'),
	   ('Schuster', 'Ricardo'),
	   ('Predovic', 'Bessie'),
	   ('Medhurst', 'Sonia'),
	   ('Emmerich', 'Carmen'),
	   ('Towne', 'Alexandrine');
GO


-- таблица Факультеты (Faculties)
INSERT INTO [Faculties] ([Name])
VALUES ('Computer Science'),
	   ('Design'),
	   ('System Administration');
GO


-- таблица Кафедры (Departments)
INSERT INTO [Departments] ([Financing], [Building], [Name], [FacultyId])
VALUES (32000, 1, 'Web Development', 1),
	   (32000, 2, 'Mobile Development', 1),
	   (35000, 3, 'Algorithms and Data Structures', 1),
	   (45000, 1, 'Graphic Design', 2),
	   (49000, 1, 'Animation', 2),
	   (47000, 3, 'Web Design', 2),
	   (25000, 2, 'System Services', 3),
	   (30000, 3, 'Network Technologies', 3),
	   (27000, 1, 'Information Security', 3),
	   (32000, 2, 'Software Development', 1);	-- 10
GO


-- таблица Группы (Groups)
INSERT INTO [Groups] ([Name], [Year],[DepartmentId]) 
VALUES ('P101', 1, 1),
	   ('P313', 3, 2),
	   ('P205', 2, 10),
	   ('P147', 1, 3),
	   ('P533', 5, 10),		-- 5
	   ('P512', 5, 10),		-- 6
	   ('D531', 5, 5),
	   ('D221', 1, 4),
	   ('D404', 4, 6),
	   ('S518', 5, 9),
	   ('S328', 3, 8),
	   ('S422', 4, 7);
GO


-- таблица Студенты (Students)
INSERT INTO [Students] ([Rating], [Name], [Surname]) 
VALUES (1, 'Glover', 'Agustina'),
	   (1,'Klein', 'Dustin'),
	   (1,'Frami', 'Gerda'),
	   (2,'Eichmann', 'Carroll'),
	   (2,'Zieme', 'Nichole'),
	   (2,'Schneider', 'Imelda'),
	   (2,'Bosco', 'Justyn'),
	   (3,'Schinner', 'Hazle'),
	   (3,'Wintheiser', 'Yesenia'),
	   (4,'Purdy', 'Bridgette'),
	   (4,'Bogan', 'Kennedy'),
	   (4,'Roberts', 'Jackson'),
	   (4,'Braun', 'Hassan'),
	   (4,'Boyle', 'Libbie'),
	   (5,'Stanton', 'Kaley'),
	   (5, 'Ryan', 'Madonna'),
	   (5, 'Zboncak', 'Meta'),
	   (1, 'Kiehn', 'Jerrod'),
	   (1, 'McLaughlin', 'Lea'),
	   (1, 'Monahan', 'Jacynthe'),
	   (2, 'Lakin', 'Ulises'),
	   (2, 'Davis', 'Judah'),
	   (2, 'Skiles', 'Ezequiel'),
	   (3, 'Schuppe', 'Brett'),
	   (3, 'Treutel', 'Albert'),
	   (3, 'Medhurst', 'Clay'),
	   (3, 'Kozey', 'Margarita'),
	   (3, 'Stark', 'Nora'),
	   (3, 'Friesen', 'Viviane'),
	   (4, 'Torp', 'Carmella'),
	   (4, 'Huel', 'Landen'),
	   (4, 'Goyette', 'Bonita'),
	   (4, 'Abbott', 'Otho'),
	   (5, 'Hills', 'Millie'),
	   (5, 'Bosco', 'Elliott'),
	   (5, 'Herman', 'Green'),
	   (5, 'Hoppe', 'Lilly'),
	   (5, 'Marks', 'Shyanne');
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
	   ('Cryptography and Information Protection'),
	   ('Programming Languages'),		-- 15
	   ('Object-Oriented Programming');	-- 16
GO


-- таблица Преподаватели (Teachers)
INSERT INTO [Teachers] ([IsProfessor], [Surname], [Name], [Salary])
VALUES (1, 'Smitham', 'Lucas', 8000),
	   (0, 'Goldner', 'Lurline', 7800),
	   (1, 'Adams', 'Samantha', 7600),
	   (0, 'Hahn', 'Jamie', 8700),
	   (1, 'Rice', 'Frida', 9700),
	   (0, 'Underhill', 'Jack', 7500),
	   (1, 'McQueen', 'Dave', 8200);
GO


-- таблица Лекции (Lectures)
INSERT INTO [Lectures] ([Date], [SubjectId], [TeacherId])
VALUES ('2020-11-15', 1, 1),
	   ('2021-10-16', 2, 1),
	   ('2020-12-22', 3, 2),
	   ('2019-02-02', 6, 3),
	   ('2022-05-10', 10, 4),
	   ('2022-01-08', 8, 4),
	   ('2019-08-30', 7, 5),
	   ('2020-11-28', 11, 6),
	   ('2021-09-13', 13, 7),
	   ('2022-06-07', 12, 6),
	   ('2023-05-19', 15, 2),	-- 11
	   ('2023-05-19', 15, 2),
	   ('2023-05-19', 15, 2),
	   ('2023-05-20', 15, 2),
	   ('2023-05-20', 15, 2),
	   ('2023-05-20', 15, 2),
	   ('2023-05-20', 16, 3),
	   ('2023-05-21', 16, 3),
	   ('2023-05-21', 16, 3),
	   ('2023-05-21', 16, 3),
	   ('2023-05-21', 16, 3),
	   ('2023-05-20', 16, 3);	-- 22
GO


-- таблица Группы и кураторы (GroupsCurators)
INSERT INTO [GroupsCurators] ([CuratorId], [GroupId])
VALUES (1, 1),
	   (2, 2),
	   (3, 3),
	   (2, 4),
	   (5, 5),
	   (4, 6),
	   (3, 7),
	   (3, 8),
	   (1, 9),
	   (2, 10),
	   (3, 10),
	   (2, 1),
	   (5, 2),
	   (4, 3),
	   (2, 5);
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
       (10,8),
	   (5, 11),
	   (5, 12),
	   (5, 13),
	   (5, 14),
	   (5, 15),
	   (5, 16),
	   (5, 17),
	   (5, 18),
	   (5, 19),
	   (5, 21),
	   (5, 22);
GO


-- таблица Группы и студенты (GroupsStudents)
INSERT INTO [GroupsStudents] ([GroupId], [StudentId])
VALUES (1, 1),
	   (1, 2),
	   (1, 3),
	   (2, 4),
	   (2, 5),
	   (2, 6),
	   (2, 7),
	   (3, 8),
	   (3, 9),
	   (4, 10),
	   (4, 11),
	   (4, 12),
	   (4, 13),
	   (4, 14),
	   (5, 15),
	   (5, 16),
	   (5, 17),
	   (6, 18),
	   (6, 19),
	   (6, 20),
	   (7, 21),
	   (7, 22),
	   (7, 23),
	   (8, 24),
	   (8, 25),
	   (8, 26),
	   (8, 27),
	   (8, 28),
	   (9, 29),
	   (9, 30),
	   (9, 31),
	   (9, 32),
	   (9, 33),
	   (10, 34),
	   (10, 35),
	   (10, 36),
	   (10, 37),
	   (10, 38);
GO