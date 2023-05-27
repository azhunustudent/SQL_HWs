USE Academy;
GO

-- 1. Вывести номера корпусов, если суммарный фонд финансирования 
-- расположенных в них кафедр превышает 100000.
SELECT Building, 
	   SUM(Financing)
FROM Departments
GROUP BY Building
HAVING SUM(Financing) > 100000;
GO

-- 2. Вывести названия групп 5-го курса кафедры “Software Development”, 
-- которые имеют более 10 пар в первую неделю.
SELECT Groups.Name, 
	   Groups.Year, 
	   Departments.Name, 
	   COUNT(Lectures.Id) AS [Number of Lectures]
FROM Groups
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN GroupsLectures ON Groups.Id = GroupsLectures.GroupId
JOIN Lectures ON GroupsLectures.LectureId = Lectures.Id
WHERE Groups.Year = 5 AND Departments.Name = 'Software Development' AND Lectures.Date BETWEEN '2023-05-15' AND '2023-05-22'
GROUP BY Groups.Name, Groups.Year, Departments.Name
HAVING COUNT(Lectures.Id) > 10;
GO

-- 3. Вывести названия групп, имеющих рейтинг (средний рейтинг 
-- всех студентов группы) больше, чем рейтинг группы “D221”.
SELECT Groups.Name, 
	   AVG(Students.Rating) AS [Average Rating of Students]
FROM Groups
JOIN GroupsStudents ON Groups.Id = GroupsStudents.GroupId
JOIN Students ON GroupsStudents.StudentId = Students.Id
GROUP BY Groups.Name
HAVING AVG(Students.Rating) > (
	SELECT AVG(Rating) 
	FROM Groups AS G
	JOIN GroupsStudents AS GS ON G.Id = GS.GroupId
	JOIN Students AS S ON GS.StudentId = S.Id
	WHERE G.Name = 'D221'	-- AVG(Rating) = 3
);
GO

-- 4. Вывести фамилии и имена преподавателей, ставка которых
-- выше средней ставки профессоров.
SELECT Surname + ' ' + Name AS Teacher, 
	   Salary
FROM Teachers
WHERE Salary > (
	SELECT AVG(Salary)
	FROM Teachers 
	WHERE IsProfessor = 1	-- AVG(Salary) = 8375.00
);
GO

-- 5. Вывести названия групп, у которых больше одного куратора.
SELECT Groups.Name, 
	   COUNT(Curators.Id) AS [Number of Curators] 
FROM Groups
JOIN GroupsCurators ON Groups.Id = GroupsCurators.GroupId
JOIN Curators ON GroupsCurators.CuratorId = Curators.Id
GROUP BY Groups.Name
HAVING COUNT(Curators.Id) > 1;
GO

-- 6. Вывести названия групп, имеющих рейтинг (средний рейтинг всех 
-- студентов группы) меньше, чем минимальный рейтинг групп 5-го курса.
SELECT Groups.Name, 
	   AVG(Students.Rating) AS [Average Rating of Students]
FROM Groups
JOIN GroupsStudents ON Groups.Id = GroupsStudents.GroupId
JOIN Students ON GroupsStudents.StudentId = Students.Id
GROUP BY Groups.Name
HAVING AVG(Students.Rating) > (
	SELECT MIN(S.Rating)
	FROM Students AS S
	JOIN GroupsStudents AS GS ON S.Id = GS.StudentId
	JOIN Groups AS G ON GS.GroupId = G.Id
	WHERE G.Year = 5	-- MIN(S.Rating) = 1
);
GO

-- 7. Вывести названия факультетов, суммарный фонд финансирования кафедр 
-- которых больше суммарного фонда финансирования кафедр факультета 
-- “Computer Science”.
SELECT Faculties.Name, 
	   SUM(Departments.Financing) AS [Sum of Financing]
FROM Faculties
JOIN Departments ON Faculties.Id = Departments.FacultyId
GROUP BY Faculties.Name
HAVING SUM(Departments.Financing) > (
	SELECT SUM(D.Financing)
	FROM Departments AS D
	JOIN Faculties AS F ON D.FacultyId = F.Id
	WHERE F.Name = 'Computer Science'	-- SUM(D.Financing) = 131000.00
);
GO

-- 8. Вывести названия дисциплин и полные имена преподавателей, читающих 
-- наибольшее количество лекций по ним.
SELECT Subjects.Name, 
	   Teachers.Surname + ' ' + Teachers.Name AS Teacher, 
	   COUNT(Lectures.Id) AS [Number of Lectures]
FROM Subjects
JOIN Lectures ON Subjects.Id = Lectures.SubjectId
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
GROUP BY Subjects.Name, Teachers.Surname, Teachers.Name
HAVING COUNT(Lectures.Id) = (
	SELECT MAX(NumberOfLectures)	-- = 6
	FROM (
		SELECT SubjectId, COUNT(Id) AS NumberOfLectures
		FROM Lectures
		GROUP BY SubjectId
	) AS ResultCount
);
GO

-- 9. Вывести название дисциплины, по которому читается меньше всего лекций.
SELECT Subjects.Name,
	   COUNT(Lectures.Id) AS [Number of Lectures]
FROM Subjects
JOIN Lectures ON Subjects.Id = Lectures.SubjectId
GROUP BY Subjects.Name
HAVING COUNT(Lectures.Id) = (
	SELECT MIN(NumberOfLectures)	-- = 1
	FROM (
		SELECT SubjectId, COUNT(Id) AS NumberOfLectures
		FROM Lectures
		GROUP BY SubjectId
	) AS ResultCount
);
GO

-- 10. Вывести количество студентов и читаемых дисциплин на
-- кафедре “Software Development”.
SELECT COUNT(Subjects.Id) AS [Number of Subjects], 
	   COUNT(Students.Id) [Number of Students]
FROM Subjects
JOIN Lectures ON Subjects.Id = Lectures.SubjectId
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN GroupsStudents ON Groups.Id = GroupsStudents.GroupId
JOIN Students ON GroupsStudents.StudentId = Students.Id
WHERE Departments.Name = 'Software Development';
GO