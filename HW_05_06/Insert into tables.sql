USE [Academy];
GO


-- таблица Группы (Groups)
SELECT * FROM [Groups]
INSERT INTO [Groups] ([Name], [Rating], [Year]) 
VALUES ('KKL-79', 1, 1),
	   ('LZG-05', 5, 3),
	   ('XRT-00', 4, 2),
	   ('LUS-15', 1, 1),
	   ('INY-22', 2, 5),
	   ('QTM-86', 0, 1),
	   ('XJJ-11', 5, 4),
	   ('ATL-63', 4, 5),
	   ('DST-70', 4, 3),
	   ('MYM-65', 5, 4);


-- таблица Кафедры (Departments)
SELECT * FROM [Departments]
INSERT INTO [Departments] ([Financing], [Name]) 
VALUES (18000, 'Software Development'),
	   (10000, 'Design'),
	   (25000, 'Cybersecurity'),
	   (28000, 'Computer Science'),
	   (20000, 'Information Systems'),
	   (15000, 'Virtual Reality');


-- таблица Факультеты (Faculties)
SELECT * FROM [Faculties]
INSERT INTO [Faculties] ([Dean], [Name]) 
VALUES ('Ivanov Ivan', 'Computer Science'),
	   ('Smirnova Anna', 'Design'),
	   ('Petrov Petr', 'System Administration');


-- таблица Преподаватели (Teachers)
SELECT * FROM [Teachers]
INSERT INTO [Teachers] ([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES ('2012-10-15', 1, 0, 'Olga', 'assistent', 360, 500, 'Petrova'),
       ('2015-03-20', 1, 0, 'Eeugenia', 'assistent', 210, 400, 'Kim'),
       ('2018-07-22', 1, 0, 'Maria', 'assistent', 120, 240, 'Sidorova'),
       ('1998-12-03', 1, 0, 'Rinat', 'assistent',520, 700, 'Kuzmin'),
       ('1999-03-20', 1, 0, 'Roman', 'assistent', 500, 750, 'Nikulin'),
       ('2003-07-05', 0, 1, 'Sergey', 'professor', 500, 1200, 'Kozlov'),
       ('2010-09-23', 0, 1, 'Egor', 'professor', 500, 900, 'Saveliev'),
       ('2008-08-17', 0, 1, 'Karina', 'professor', 500, 800, 'Kotova'),
       ('1997-09-01', 0, 1, 'Alexey', 'professor', 500, 1050, 'Ivanov'),
       ('2000-01-01', 0, 1, 'Tatyana', 'professor', 500, 1500, 'Orlova');