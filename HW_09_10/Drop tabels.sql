USE [Academy];
GO

-- таблица Группы и лекции (GroupsLectures)
ALTER TABLE [GroupsLectures] DROP CONSTRAINT [FK_GL_GroupId];
GO
ALTER TABLE [GroupsLectures] DROP CONSTRAINT [FK_GL_LectureId];
GO
DROP TABLE [GroupsLectures];
GO


-- таблица Лекции (Lectures)
ALTER TABLE [Lectures] DROP CONSTRAINT [FK_Lec_SubjectId];
GO
ALTER TABLE [Lectures] DROP CONSTRAINT [FK_Lec_TeacherId];
GO
DROP TABLE [Lectures];
GO


-- таблица Студенты (Students)
ALTER TABLE [Students] DROP CONSTRAINT [FK_Student_GroupId];
GO
DROP TABLE [Students];
GO


-- таблица Группы (Groups)
ALTER TABLE [Groups] DROP CONSTRAINT [FK_Group_DepartmentId];
GO
DROP TABLE [Groups];
GO


-- таблица Кафедры (Departments)
ALTER TABLE [Departments] DROP CONSTRAINT [FK_Dep_FacultyId];
GO
DROP TABLE [Departments];
GO


-- таблица Факультеты (Faculties)
DROP TABLE [Faculties];
GO


-- таблица Дисциплины (Teachers)
DROP TABLE [Teachers];
GO


-- таблица Дисциплины (Subjects)
DROP TABLE [Subjects];
GO