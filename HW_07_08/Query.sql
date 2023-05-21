USE Academy;
GO

-- 1. ������� ��� ��������� ���� ����� �������������� � �����.
SELECT Teachers.Surname, Teachers.Name, Groups.Name 
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id;
GO

-- 2. ������� �������� �����������, ���� ��������������
-- ������ ������� ��������� ���� �������������� ����������.
SELECT Faculties.Name, Faculties.Financing AS [Faculties Financing], 
	SUM(Departments.Financing) AS [Depatment Financing]
	FROM Faculties
	JOIN Departments ON Faculties.Id = Departments.FacultyId
	GROUP BY Faculties.Financing, Faculties.Name
	HAVING SUM(Departments.Financing) > Faculties.Financing;
GO

-- 3. ������� ������� ��������� ����� � �������� �����, ������� ��� ��������.
SELECT Curators.Surname, Groups.Name 
	FROM Curators
	JOIN GroupsCurators ON Curators.Id = GroupsCurators.CuratorId
	JOIN Groups ON GroupsCurators.GroupId = Groups.Id;
GO

-- 4. ������� ����� � ������� ��������������, ������� ������
-- ������ � ������ �P107�.
SELECT Teachers.Surname, Teachers.Name
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id
	WHERE Groups.Name = 'P107';
GO

-- 5. ������� ������� �������������� � �������� �����������
-- �� ������� ��� ������ ������.
SELECT Teachers.Surname, Faculties.Name 
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id
	JOIN Departments ON Groups.DepartmentId = Departments.Id
	JOIN Faculties ON Departments.FacultyId = Faculties.Id;
GO

-- 6. ������� �������� ������ � �������� �����, ������� �
-- ��� ���������.
SELECT Departments.Name, Groups.Name
	FROM Departments
	JOIN Groups ON Departments.Id = Groups.DepartmentId;
GO

-- 7. ������� �������� ���������, ������� ������ ������������� �Samantha Adams�.
SELECT Subjects.Name
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN Subjects ON Lectures.SubjectId = Subjects.Id
	WHERE Teachers.Name = 'Samantha' AND Teachers.Surname = 'Adams';
GO

-- 8. ������� �������� ������, �� ������� �������� ���������� �Database Theory�.
SELECT Departments.Name 
	FROM Subjects
	JOIN Lectures ON Subjects.Id = Lectures.SubjectId
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id
	JOIN Departments ON Groups.DepartmentId = Departments.Id
	WHERE Subjects.Name = 'Database Theory';
GO

-- 9. ������� �������� �����, ������� ��������� � ���������� �Computer Science�.
SELECT Groups.Name
	FROM Groups
	JOIN Departments ON Groups.DepartmentId = Departments.Id
	JOIN Faculties ON Departments.FacultyId = Faculties.Id
	WHERE Faculties.Name = 'Computer Science';
GO

-- 10. ������� �������� ����� 5-�� �����, � ����� �������� �����������, 
-- � ������� ��� ���������.
SELECT Groups.Name, Faculties.Name
	FROM Groups
	JOIN Departments ON Groups.DepartmentId = Departments.Id
	JOIN Faculties ON Departments.FacultyId = Faculties.Id
	WHERE Groups.Year = 5;
GO

-- 11. ������� ������ ����� �������������� � ������, ������� ��� ������ 
-- (�������� ��������� � �����), ������ �������� ������ �� ������, 
-- ������� �������� � ��������� �B103�.
SELECT Teachers.Surname, Teachers.Name, Subjects.Name, Groups.Name 
	FROM Teachers
	JOIN Lectures ON Teachers.Id = Lectures.TeacherId
	JOIN Subjects ON Lectures.SubjectId = Subjects.Id
	JOIN GroupsLectures ON Lectures.Id = GroupsLectures.LectureId
	JOIN Groups ON GroupsLectures.GroupId = Groups.Id
	WHERE Lectures.LectureRoom = 'B103';
GO