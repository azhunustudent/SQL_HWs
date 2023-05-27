USE [Academy];
GO


-- ������� ������ � �������� (GroupsStudents)
ALTER TABLE [GroupsStudents] DROP CONSTRAINT [FK_GS_GroupId];
GO
ALTER TABLE [GroupsStudents] DROP CONSTRAINT [FK_GS_StudentId];
GO
DROP TABLE [GroupsStudents];
GO


-- ������� ������ � �������� (GroupsCurators)
ALTER TABLE [GroupsCurators] DROP CONSTRAINT [FK_GK_CuratorId];
GO
ALTER TABLE [GroupsCurators] DROP CONSTRAINT [FK_GK_GroupId];
GO
DROP TABLE [GroupsCurators];
GO


-- ������� ������ � ������ (GroupsLectures)
ALTER TABLE [GroupsLectures] DROP CONSTRAINT [FK_GL_GroupId];
GO
ALTER TABLE [GroupsLectures] DROP CONSTRAINT [FK_GL_LectureId];
GO
DROP TABLE [GroupsLectures];
GO


-- ������� ������ (Lectures)
ALTER TABLE [Lectures] DROP CONSTRAINT [FK_Lec_SubjectId];
GO
ALTER TABLE [Lectures] DROP CONSTRAINT [FK_Lec_TeacherId];
GO
DROP TABLE [Lectures];
GO


-- ������� ������ (Groups)
ALTER TABLE [Groups] DROP CONSTRAINT [FK_Group_DepartmentId];
GO
DROP TABLE [Groups];
GO


-- ������� ������� (Departments)
ALTER TABLE [Departments] DROP CONSTRAINT [FK_Dep_FacultyId];
GO
DROP TABLE [Departments];
GO


-- ������� ���������� (Teachers)
DROP TABLE [Teachers];
GO


-- ������� ���������� (Subjects)
DROP TABLE [Subjects];
GO


-- ������� �������� (Students)
DROP TABLE [Students];
GO


-- ������� ���������� (Faculties)
DROP TABLE [Faculties];
GO


-- ������� �������� (Curators)
DROP TABLE [Curators];
GO