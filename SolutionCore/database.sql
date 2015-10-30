USE [master]
GO
/****** Object:  Database [SolutionCore]    Script Date: 30-10-2015 21:17:16 ******/
CREATE DATABASE [SolutionCore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SolutionCore', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SolutionCore.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SolutionCore_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SolutionCore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SolutionCore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SolutionCore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SolutionCore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SolutionCore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SolutionCore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SolutionCore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SolutionCore] SET ARITHABORT OFF 
GO
ALTER DATABASE [SolutionCore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SolutionCore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SolutionCore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SolutionCore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SolutionCore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SolutionCore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SolutionCore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SolutionCore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SolutionCore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SolutionCore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SolutionCore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SolutionCore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SolutionCore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SolutionCore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SolutionCore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SolutionCore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SolutionCore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SolutionCore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SolutionCore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SolutionCore] SET  MULTI_USER 
GO
ALTER DATABASE [SolutionCore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SolutionCore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SolutionCore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SolutionCore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SolutionCore]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 30-10-2015 21:17:16 ******/
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
/****** Object:  Table [dbo].[contacts]    Script Date: 30-10-2015 21:17:17 ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 30-10-2015 21:17:17 ******/
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
/****** Object:  Table [dbo].[settings]    Script Date: 30-10-2015 21:17:17 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 30-10-2015 21:17:17 ******/
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
/****** Object:  Table [dbo].[zip_codes]    Script Date: 30-10-2015 21:17:17 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_zip_codes] UNIQUE NONCLUSTERED 
(
	[zip_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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
USE [master]
GO
ALTER DATABASE [SolutionCore] SET  READ_WRITE 
GO
