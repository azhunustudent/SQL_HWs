USE Academy;
GO

-- 1. Вывести все возможные пары строк преподавателей и групп.
SELECT Teachers.Surname, Teachers.Name, Groups.Name 
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id;
GO

-- 2. Вывести названия факультетов, фонд финансирования
-- кафедр которых превышает фонд финансирования факультета.
SELECT Faculties.Name, Faculties.Financing AS [Faculties Financing], 
	SUM(Departments.Financing) AS [Depatment Financing]
	FROM Faculties
	JOIN Departments ON Faculties.Id = Departments.FacultyId
	GROUP BY Faculties.Financing, Faculties.Name
	HAVING SUM(Departments.Financing) > Faculties.Financing;
GO

-- 3. Вывести фамилии кураторов групп и названия групп, которые они курируют.
SELECT Curators.Surname, Groups.Name 
	FROM Curators
	JOIN GroupsCurators ON Curators.Id = GroupsCurators.CuratorId
	JOIN Groups ON GroupsCurators.GroupId = Groups.Id;
GO

-- 4. Вывести имена и фамилии преподавателей, которые читают
-- лекции у группы “P107”.
SELECT Teachers.Surname, Teachers.Name
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id
	WHERE Groups.Name = 'P107';
GO

-- 5. Вывести фамилии преподавателей и названия факультетов
-- на которых они читают лекции.
SELECT Teachers.Surname, Faculties.Name 
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id
	JOIN Departments ON Groups.DepartmentId = Departments.Id
	JOIN Faculties ON Departments.FacultyId = Faculties.Id;
GO

-- 6. Вывести названия кафедр и названия групп, которые к
-- ним относятся.
SELECT Departments.Name, Groups.Name
	FROM Departments
	JOIN Groups ON Departments.Id = Groups.DepartmentId;
GO

-- 7. Вывести названия дисциплин, которые читает преподаватель “Samantha Adams”.
SELECT Subjects.Name
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN Subjects ON Lectures.SubjectId = Subjects.Id
	WHERE Teachers.Name = 'Samantha' AND Teachers.Surname = 'Adams';
GO

-- 8. Вывести названия кафедр, на которых читается дисциплина “Database Theory”.
SELECT Departments.Name 
	FROM Subjects
	JOIN Lectures ON Subjects.Id = Lectures.SubjectId
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id
	JOIN Departments ON Groups.DepartmentId = Departments.Id
	WHERE Subjects.Name = 'Database Theory';
GO

-- 9. Вывести названия групп, которые относятся к факультету “Computer Science”.
SELECT Groups.Name
	FROM Groups
	JOIN Departments ON Groups.DepartmentId = Departments.Id
	JOIN Faculties ON Departments.FacultyId = Faculties.Id
	WHERE Faculties.Name = 'Computer Science';
GO

-- 10. Вывести названия групп 5-го курса, а также название факультетов, 
-- к которым они относятся.
SELECT Groups.Name, Faculties.Name
	FROM Groups
	JOIN Departments ON Groups.DepartmentId = Departments.Id
	JOIN Faculties ON Departments.FacultyId = Faculties.Id
	WHERE Groups.Year = 5;
GO

-- 11. Вывести полные имена преподавателей и лекции, которые они читают 
-- (названия дисциплин и групп), причем отобрать только те лекции, 
-- которые читаются в аудитории “B103”.
SELECT Teachers.Surname, Teachers.Name, Subjects.Name, Groups.Name 
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN Subjects ON Lectures.SubjectId = Subjects.Id
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id
	WHERE Lectures.LectureRoom = 'B103';
GO