USE [Academy];
GO


-- таблица Факультеты (Faculties)
INSERT INTO [Faculties] ([Name])
VALUES ('Computer Science'),
	   ('Design'),
	   ('System Administration');
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
	   (20000, 'Information Security', 3),
	   (20000, 'Software Development', 1);
GO


-- таблица Группы (Groups)
INSERT INTO [Groups] ([Name], [Year],[DepartmentId]) 
VALUES ('P101', 1, 1),
	   ('P303', 3, 2),
	   ('P205', 2, 10),
	   ('P107', 1, 3),
	   ('D501', 5, 5),
	   ('D206', 1, 4),
	   ('D404', 4, 6),
	   ('S508', 5, 9),
	   ('S308', 3, 8),
	   ('S402', 4, 7);
GO


-- таблица Студенты (Students)
INSERT INTO [Students] ([GroupId], [Name], [Surname]) 
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
	   (6, 'Kiehn', 'Jerrod'),
	   (6, 'McLaughlin', 'Lea'),
	   (6, 'Monahan', 'Jacynthe'),
	   (7, 'Lakin', 'Ulises'),
	   (7, 'Davis', 'Judah'),
	   (7, 'Skiles', 'Ezequiel'),
	   (8, 'Schuppe', 'Brett'),
	   (8, 'Treutel', 'Albert'),
	   (8, 'Medhurst', 'Clay'),
	   (8, 'Kozey', 'Margarita'),
	   (8, 'Stark', 'Nora'),
	   (9, 'Friesen', 'Viviane'),
	   (9, 'Torp', 'Carmella'),
	   (9, 'Huel', 'Landen'),
	   (9, 'Goyette', 'Bonita'),
	   (9, 'Abbott', 'Otho'),
	   (10, 'Hills', 'Millie'),
	   (10, 'Bosco', 'Elliott'),
	   (10, 'Herman', 'Green'),
	   (10, 'Hoppe', 'Lilly'),
	   (10, 'Marks', 'Shyanne');
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
	   ('Underhill', 'Jack', 7500),
	   ('McQueen', 'Dave', 8200);
GO


-- таблица Лекции (Lectures)
INSERT INTO [Lectures] ([LectureRoom], [SubjectId], [TeacherId])
VALUES ('A201', 1, 1),
	   ('A312', 2, 1),
	   ('B103', 3, 2),
	   ('D305', 6, 3),
	   ('C102', 10, 4),
	   ('B103', 8, 4),
	   ('C315', 7, 5),
	   ('D201', 11, 6),
	   ('B103', 13, 7),
	   ('D201', 12, 6);
GO


-- таблица Группы и лекции (GroupsLectures)
INSERT INTO [GroupsLectures] ([DayOfWeek], [GroupId], [LectureId])
VALUES (1, 1, 1),
       (2, 2, 3),
       (3, 3, 2),
       (4, 4, 4),
       (5, 5, 6),
       (6, 6, 7),
       (7, 7, 5),
       (3, 8, 10),
       (5, 9, 9),
       (7, 10,8);
GO