USE [Academy]
GO

ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [CK__Groups__Year__4CA06362]
GO

ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [CK__Groups__Rating__4BAC3F29]
GO

ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [CK__Groups__Name__4AB81AF0]
GO

/****** Object:  Table [dbo].[Groups]    Script Date: 30.04.2023 20:57:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
DROP TABLE [dbo].[Groups]
GO

/****** Object:  Table [dbo].[Groups]    Script Date: 30.04.2023 20:57:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Rating] [int] NOT NULL,
	[Year] [int] NOT NULL,
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

ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO

ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO

ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Year]>=(1) AND [Year]<=(5)))
GO


