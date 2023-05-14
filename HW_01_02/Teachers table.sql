USE [Academy]
GO

ALTER TABLE [dbo].[Teachers] DROP CONSTRAINT [CK__Teachers__Surnam__5DCAEF64]
GO

ALTER TABLE [dbo].[Teachers] DROP CONSTRAINT [CK__Teachers__Salary__5CD6CB2B]
GO

ALTER TABLE [dbo].[Teachers] DROP CONSTRAINT [CK__Teachers__Premiu__5AEE82B9]
GO

ALTER TABLE [dbo].[Teachers] DROP CONSTRAINT [CK__Teachers__Name__59FA5E80]
GO

ALTER TABLE [dbo].[Teachers] DROP CONSTRAINT [CK__Teachers__Employ__59063A47]
GO

ALTER TABLE [dbo].[Teachers] DROP CONSTRAINT [DF__Teachers__Premiu__5BE2A6F2]
GO

/****** Object:  Table [dbo].[Teachers]    Script Date: 30.04.2023 20:57:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Teachers]') AND type in (N'U'))
DROP TABLE [dbo].[Teachers]
GO

/****** Object:  Table [dbo].[Teachers]    Script Date: 30.04.2023 20:57:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentDate] [date] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Premium] [money] NOT NULL,
	[Salary] [money] NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ((0)) FOR [Premium]
GO

ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([EmploymentDate]>='01.01.1990'))
GO

ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO

ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Premium]>=(0)))
GO

ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Salary]>(0)))
GO

ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Surname]<>N''))
GO


