USE [Academy]
GO

ALTER TABLE [dbo].[Departments] DROP CONSTRAINT [CK__Department__Name__52593CB8]
GO

ALTER TABLE [dbo].[Departments] DROP CONSTRAINT [CK__Departmen__Finan__5070F446]
GO

ALTER TABLE [dbo].[Departments] DROP CONSTRAINT [DF__Departmen__Finan__5165187F]
GO

/****** Object:  Table [dbo].[Departments]    Script Date: 30.04.2023 20:54:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
DROP TABLE [dbo].[Departments]
GO

/****** Object:  Table [dbo].[Departments]    Script Date: 30.04.2023 20:54:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Financing] [money] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Departments] ADD  DEFAULT ((0)) FOR [Financing]
GO

ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Financing]>=(0)))
GO

ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO


