USE Academy;
GO

-- 1. Вывести количество преподавателей кафедры “Software Development”.
SELECT COUNT(Teachers.Id) AS [Number of Teachers]
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
WHERE Departments.Name = 'Software Development';
GO

-- 2. Вывести количество лекций, которые читает преподаватель “Dave McQueen”.
SELECT COUNT(Lectures.Id) AS [Number of Lectures]
FROM Lectures 
JOIN Teachers ON Lectures.TeacherId =  Teachers.Id
WHERE Teachers.Surname = 'McQueen' AND Teachers.Name = 'Dave';
GO

-- 3. Вывести количество занятий, проводимых в аудитории “D201”.
SELECT COUNT(Lectures.Id) AS [Number of Lectures]
FROM Lectures
WHERE LectureRoom = 'D201';
GO

-- 4. Вывести названия аудиторий и количество лекций, проводимых в них.
SELECT LectureRoom, COUNT(Lectures.Id) AS [Number of Lectures]
FROM Lectures
GROUP BY LectureRoom;
GO

-- 5. Вывести количество студентов, посещающих лекции преподавателя “Jack Underhill”.
SELECT COUNT(Students.Id) AS [Number of Students]
FROM Students 
JOIN Groups ON Students.GroupId = Groups.Id
JOIN GroupsLectures ON Groups.Id = GroupsLectures.GroupId
JOIN Lectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
WHERE Teachers.Name = 'Jack' AND Teachers.Surname = 'Underhill';
GO

-- 6. Вывести среднюю ставку преподавателей факультета “Computer Science”.
SELECT AVG(Teachers.Salary) AS [Average of Salary]
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
JOIN Faculties ON Departments.FacultyId = Faculties.Id
WHERE Faculties.Name = 'Computer Science';
GO

-- 7. Вывести минимальное и максимальное количество студентов среди всех групп.
SELECT MIN(ResultCount.NumOfStudents) AS [Minimum of students], 
	   MAX(ResultCount.NumOfStudents) AS [Maximum of students]
FROM
(
	SELECT Groups.Name AS [Name], COUNT(Students.Id) AS [NumOfStudents]
	FROM Students
	JOIN Groups ON Students.GroupId = Groups.Id
	GROUP BY Groups.Name
) AS ResultCount;
GO

-- 8. Вывести средний фонд финансирования кафедр.
SELECT AVG(Financing) AS [Average of Financing]
FROM Departments;
GO

-- 9. Вывести полные имена преподавателей и количество читаемых ими дисциплин.
SELECT Teachers.Surname + ' ' + Teachers.Name AS [Teacher], COUNT(*) AS [Number of Subject]
FROM Teachers
JOIN Lectures ON Teachers.Id = Lectures.TeacherId
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
GROUP BY Teachers.Surname, Teachers.Name;
GO

-- 10. Вывести количество лекций в каждый день недели.
SELECT DayOfWeek, COUNT(GroupsLectures.Id) AS [Number of Lectures]
FROM GroupsLectures
GROUP BY DayOfWeek;
GO

-- 11. Вывести номера аудиторий и количество кафедр, чьи лекции в них читаются.
SELECT Lectures.LectureRoom, COUNT(Departments.Id) AS [Number of Departments]
FROM Lectures
JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Groups.DepartmentId = Departments.Id
GROUP BY Lectures.LectureRoom;
GO

-- 12. Вывести названия факультетов и количество дисциплин, которые на них читаются.
SELECT Faculties.Name, COUNT(Subjects.Id) AS [Number of Subjects]
FROM Faculties
JOIN Departments ON Faculties.Id = Departments.FacultyId
JOIN Groups ON Departments.Id = Groups.DepartmentId
JOIN GroupsLectures ON Groups.Id = GroupsLectures.GroupId
JOIN Lectures ON GroupsLectures.LectureId = Lectures.Id
JOIN Subjects ON Lectures.SubjectId = Subjects.Id
GROUP BY Faculties.Name;
GO

-- 13. Вывести количество лекций для каждой пары преподаватель-аудитория.
SELECT Teachers.Surname + ' ' + Teachers.Name AS [Teacher], Lectures.LectureRoom, COUNT(Lectures.Id) AS [Number of Letures]
FROM Lectures
JOIN Teachers ON Lectures.TeacherId = Teachers.Id
GROUP BY Teachers.Name, Teachers.Surname, Lectures.LectureRoom;
GO