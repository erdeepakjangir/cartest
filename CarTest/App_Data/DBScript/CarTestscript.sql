USE [master]
GO
/****** Object:  Database [CarTest]    Script Date: 10/2/2017 8:29:08 AM ******/
CREATE DATABASE [CarTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CarTest.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CarTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CarTest_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarTest] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CarTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CarTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarTest] SET RECOVERY FULL 
GO
ALTER DATABASE [CarTest] SET  MULTI_USER 
GO
ALTER DATABASE [CarTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CarTest', N'ON'
GO
USE [CarTest]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 10/2/2017 8:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](100) NULL,
	[Model] [nvarchar](100) NULL,
	[Year] [int] NULL,
	[Price] [float] NULL,
	[New] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 10/2/2017 8:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 10/2/2017 8:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 10/2/2017 8:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 10/2/2017 8:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 10/2/2017 8:29:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Cars] ADD  DEFAULT ((0)) FOR [New]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [fk_user_id] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [fk_user_id]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [CarTest] SET  READ_WRITE 
GO
