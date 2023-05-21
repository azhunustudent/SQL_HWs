USE Academy;
GO

-- 1. ������� ������� ������, �� ����������� �� ���� � �������� �������.
SELECT * FROM Departments
ORDER BY id DESC


-- 2. ������� �������� ����� � �� ��������, ��������� � �������� �������� 
-- ��������� ����� �Group Name� � �Group Rating� ��������������.
SELECT Name AS 'Group Name', Rating AS 'Group Rating'
FROM Groups


-- 3. ������� ��� �������������� �� �������, ������� ������ �� ��������� 
-- � �������� � ������� ������ �� ��������� � �������� (����� ������ � ��������).
SELECT Surname, (Premium/(Salary+Premium)*100) AS 'Premium', (100*Salary/(Salary+Premium)) AS 'Salary'
FROM Teachers


-- 4. ������� ������� ����������� � ���� ������ ���� � ��������� �������: 
-- �The dean of faculty [faculty] is [dean].�.
SELECT CONCAT('The dean of faculty [', Name, '] is [', Dean, '].') AS 'Faculty and Dean' 
FROM Faculties


-- 5. ������� ������� ��������������, ������� �������� ������������ � ������ ������� ��������� 1050.
SELECT Surname FROM Teachers
WHERE isProfessor = 1 AND Salary >= 1050


-- 6. ������� �������� ������, ���� �������������� ������� ������ 11000 ��� ������ 25000.
SELECT Name FROM Departments
WHERE Financing < 11000 OR Financing > 25000


-- 7. ������� �������� ����������� ����� ���������� �Computer Science�.
SELECT Name FROM Faculties
WHERE Name <> 'Computer Science'
-- WHERE NOT Name = 'Computer Science'


-- 8. ������� ������� � ��������� ��������������, ������� �� �������� ������������.
SELECT Surname, Position FROM Teachers
WHERE IsProfessor = 0
-- WHERE IsAssistant = 1
-- WHERE NOT IsProfessor = 1


-- 9. ������� �������, ���������, ������ � �������� �����������, 
-- � ������� �������� � ��������� �� 160 �� 550.
SELECT Surname, Position, Premium, Salary FROM Teachers
WHERE IsAssistant = 1 AND (Premium BETWEEN 160 AND 550)


-- 10. ������� ������� � ������ �����������.
SELECT Surname, Salary FROM Teachers
WHERE IsAssistant = 1


-- 11. ������� ������� � ��������� ��������������, ������� ���� ������� �� ������ �� 01.01.2000.
SELECT Surname, Position FROM Teachers
WHERE IsProfessor = 1 AND (EmploymentDate <= '01.01.2000')


-- 12. ������� �������� ������, ������� � ���������� ������� ������������� 
-- �� ������� �Software Development�. ��������� ���� ������ ����� �������� �Name of Department�.
SELECT Name AS [Name of Department] FROM Departments
WHERE Name < 'Software Development'
ORDER BY [Name of Department]


-- 13. ������� ������� �����������, ������� �������� (����� ������ � ��������) �� ����� 1200.
SELECT Surname FROM Teachers
WHERE IsAssistant = 1 AND (Salary + Premium) <= 1200
-- ������ ������ � ������������� ���������� ������� SUM � ��������� GROUP BY, HAVING:
--SELECT Surname, Position, SUM(Salary + Premium) AS Wages FROM Teachers
--	WHERE IsAssistant = 1
--	GROUP BY Surname, Position
--	HAVING SUM(Salary + Premium) <= 1200


-- 14. ������� �������� ����� 5-�� �����, ������� ������� � ��������� �� 2 �� 4.
SELECT Name, Year FROM Groups
WHERE Year = 5 AND Rating BETWEEN 2 AND 4


-- 15. ������� ������� ����������� �� ������� ������ 550 ��� ��������� ������ 200.
SELECT Surname FROM Teachers
WHERE IsAssistant = 1 AND (Salary < 550 OR Premium < 200)