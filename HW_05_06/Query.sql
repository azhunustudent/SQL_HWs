USE Academy;
GO

-- 1. Вывести таблицу кафедр, но расположить ее поля в обратном порядке.
SELECT * FROM Departments
ORDER BY id DESC


-- 2. Вывести названия групп и их рейтинги, используя в качестве названий 
-- выводимых полей “Group Name” и “Group Rating” соответственно.
SELECT Name AS 'Group Name', Rating AS 'Group Rating'
FROM Groups


-- 3. Вывести для преподавателей их фамилию, процент ставки по отношению 
-- к надбавке и процент ставки по отношению к зарплате (сумма ставки и надбавки).
SELECT Surname, (Premium/(Salary+Premium)*100) AS 'Premium', (100*Salary/(Salary+Premium)) AS 'Salary'
FROM Teachers


-- 4. Вывести таблицу факультетов в виде одного поля в следующем формате: 
-- “The dean of faculty [faculty] is [dean].”.
SELECT CONCAT('The dean of faculty [', Name, '] is [', Dean, '].') AS 'Faculty and Dean' 
FROM Faculties


-- 5. Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050.
SELECT Surname FROM Teachers
WHERE isProfessor = 1 AND Salary >= 1050


-- 6. Вывести названия кафедр, фонд финансирования которых меньше 11000 или больше 25000.
SELECT Name FROM Departments
WHERE Financing < 11000 OR Financing > 25000


-- 7. Вывести названия факультетов кроме факультета “Computer Science”.
SELECT Name FROM Faculties
WHERE Name <> 'Computer Science'
-- WHERE NOT Name = 'Computer Science'


-- 8. Вывести фамилии и должности преподавателей, которые не являются профессорами.
SELECT Surname, Position FROM Teachers
WHERE IsProfessor = 0
-- WHERE IsAssistant = 1
-- WHERE NOT IsProfessor = 1


-- 9. Вывести фамилии, должности, ставки и надбавки ассистентов, 
-- у которых надбавка в диапазоне от 160 до 550.
SELECT Surname, Position, Premium, Salary FROM Teachers
WHERE IsAssistant = 1 AND (Premium BETWEEN 160 AND 550)


-- 10. Вывести фамилии и ставки ассистентов.
SELECT Surname, Salary FROM Teachers
WHERE IsAssistant = 1


-- 11. Вывести фамилии и должности преподавателей, которые были приняты на работу до 01.01.2000.
SELECT Surname, Position FROM Teachers
WHERE IsProfessor = 1 AND (EmploymentDate <= '01.01.2000')


-- 12. Вывести названия кафедр, которые в алфавитном порядке располагаются 
-- до кафедры “Software Development”. Выводимое поле должно иметь название “Name of Department”.
SELECT Name AS [Name of Department] FROM Departments
WHERE Name < 'Software Development'
ORDER BY [Name of Department]


-- 13. Вывести фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 1200.
SELECT Surname FROM Teachers
WHERE IsAssistant = 1 AND (Salary + Premium) <= 1200
-- второй способ с использование агрегатной функции SUM и операторы GROUP BY, HAVING:
--SELECT Surname, Position, SUM(Salary + Premium) AS Wages FROM Teachers
--	WHERE IsAssistant = 1
--	GROUP BY Surname, Position
--	HAVING SUM(Salary + Premium) <= 1200


-- 14. Вывести названия групп 5-го курса, имеющих рейтинг в диапазоне от 2 до 4.
SELECT Name, Year FROM Groups
WHERE Year = 5 AND Rating BETWEEN 2 AND 4


-- 15. Вывести фамилии ассистентов со ставкой меньше 550 или надбавкой меньше 200.
SELECT Surname FROM Teachers
WHERE IsAssistant = 1 AND (Salary < 550 OR Premium < 200)