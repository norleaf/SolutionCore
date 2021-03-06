USE [SolutionCore]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [FK_users_roles]
GO
ALTER TABLE [dbo].[contacts] DROP CONSTRAINT [FK_contacts_companies]
GO
ALTER TABLE [dbo].[companies] DROP CONSTRAINT [FK_companies_zip_codes]
GO
/****** Object:  Index [IX_zip_codes]    Script Date: 30-10-2015 21:25:56 ******/
ALTER TABLE [dbo].[zip_codes] DROP CONSTRAINT [IX_zip_codes]
GO
/****** Object:  Table [dbo].[zip_codes]    Script Date: 30-10-2015 21:25:56 ******/
DROP TABLE [dbo].[zip_codes]
GO
/****** Object:  Table [dbo].[users]    Script Date: 30-10-2015 21:25:56 ******/
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 30-10-2015 21:25:56 ******/
DROP TABLE [dbo].[settings]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 30-10-2015 21:25:56 ******/
DROP TABLE [dbo].[roles]
GO
/****** Object:  Table [dbo].[contacts]    Script Date: 30-10-2015 21:25:56 ******/
DROP TABLE [dbo].[contacts]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 30-10-2015 21:25:56 ******/
DROP TABLE [dbo].[companies]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 30-10-2015 21:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[companies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[cvr] [int] NOT NULL,
	[phone] [int] NULL,
	[email] [varchar](255) NULL,
	[ceo] [varchar](255) NULL,
	[startup_date] [date] NULL,
	[is_activ] [bit] NULL,
	[description] [text] NULL,
	[financial_report] [varchar](255) NULL,
	[advertising_protected] [bit] NULL,
	[empoye_count] [int] NULL,
	[zip_code_id] [int] NULL,
	[address] [varchar](255) NULL,
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contacts]    Script Date: 30-10-2015 21:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](255) NOT NULL,
	[lastname] [varchar](255) NOT NULL,
	[phone] [int] NULL,
	[email] [varchar](255) NULL,
	[company_id] [int] NOT NULL,
 CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles]    Script Date: 30-10-2015 21:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[access_level] [int] NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[settings]    Script Date: 30-10-2015 21:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_name] [varchar](255) NOT NULL,
	[url] [varchar](255) NOT NULL,
	[logo] [varchar](255) NULL,
 CONSTRAINT [PK_settings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 30-10-2015 21:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[firstname] [varchar](255) NULL,
	[lastname] [varchar](255) NULL,
	[email] [varchar](255) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zip_codes]    Script Date: 30-10-2015 21:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[zip_codes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[zip_code] [varchar](50) NOT NULL,
	[city] [varchar](255) NOT NULL,
 CONSTRAINT [PK_zip_codes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[companies] ON 

INSERT [dbo].[companies] ([id], [name], [cvr], [phone], [email], [ceo], [startup_date], [is_activ], [description], [financial_report], [advertising_protected], [empoye_count], [zip_code_id], [address]) VALUES (1, N'Solution Team', 233434, 343434234, N'something@solution.dk', N'Meik B', NULL, 1, N'awesome', NULL, 0, 5, 3, N'Fjeldhammervej 17A')
INSERT [dbo].[companies] ([id], [name], [cvr], [phone], [email], [ceo], [startup_date], [is_activ], [description], [financial_report], [advertising_protected], [empoye_count], [zip_code_id], [address]) VALUES (2, N'EASJ', 12334567, 34346565, N'easj@easj.dk', N'Michael Claudius', CAST(N'2015-10-10' AS Date), 1, N'almost awsome', NULL, 1, 2300, 5, N'Elisagårdsvej 5')
INSERT [dbo].[companies] ([id], [name], [cvr], [phone], [email], [ceo], [startup_date], [is_activ], [description], [financial_report], [advertising_protected], [empoye_count], [zip_code_id], [address]) VALUES (3, N'Microsoft', 343214, 12345667, N'billy@hotmail.com', N'Bill Gates', CAST(N'2015-05-05' AS Date), NULL, NULL, NULL, NULL, 15, 2, N'Tuborg Blvd')
SET IDENTITY_INSERT [dbo].[companies] OFF
SET IDENTITY_INSERT [dbo].[settings] ON 

INSERT [dbo].[settings] ([id], [site_name], [url], [logo]) VALUES (1, N'solutioncore', N'localetellerandet', NULL)
SET IDENTITY_INSERT [dbo].[settings] OFF
SET IDENTITY_INSERT [dbo].[zip_codes] ON 

INSERT [dbo].[zip_codes] ([id], [zip_code], [city]) VALUES (1, N'4690', N'Haslev')
INSERT [dbo].[zip_codes] ([id], [zip_code], [city]) VALUES (2, N'2300', N'København S')
INSERT [dbo].[zip_codes] ([id], [zip_code], [city]) VALUES (3, N'2610', N'Rødovre')
INSERT [dbo].[zip_codes] ([id], [zip_code], [city]) VALUES (4, N'2000', N'Frederiksberg')
INSERT [dbo].[zip_codes] ([id], [zip_code], [city]) VALUES (5, N'4000', N'Roskilde')
SET IDENTITY_INSERT [dbo].[zip_codes] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_zip_codes]    Script Date: 30-10-2015 21:25:56 ******/
ALTER TABLE [dbo].[zip_codes] ADD  CONSTRAINT [IX_zip_codes] UNIQUE NONCLUSTERED 
(
	[zip_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[companies]  WITH CHECK ADD  CONSTRAINT [FK_companies_zip_codes] FOREIGN KEY([zip_code_id])
REFERENCES [dbo].[zip_codes] ([id])
GO
ALTER TABLE [dbo].[companies] CHECK CONSTRAINT [FK_companies_zip_codes]
GO
ALTER TABLE [dbo].[contacts]  WITH CHECK ADD  CONSTRAINT [FK_contacts_companies] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[contacts] CHECK CONSTRAINT [FK_contacts_companies]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
