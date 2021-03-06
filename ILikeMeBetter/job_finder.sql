USE [master]
GO
/****** Object:  Database [job_finder]    Script Date: 9/28/2021 11:38:17 AM ******/
CREATE DATABASE [job_finder]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'job_finder', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\job_finder.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'job_finder_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\job_finder_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [job_finder] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [job_finder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [job_finder] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [job_finder] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [job_finder] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [job_finder] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [job_finder] SET ARITHABORT OFF 
GO
ALTER DATABASE [job_finder] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [job_finder] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [job_finder] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [job_finder] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [job_finder] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [job_finder] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [job_finder] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [job_finder] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [job_finder] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [job_finder] SET  DISABLE_BROKER 
GO
ALTER DATABASE [job_finder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [job_finder] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [job_finder] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [job_finder] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [job_finder] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [job_finder] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [job_finder] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [job_finder] SET RECOVERY FULL 
GO
ALTER DATABASE [job_finder] SET  MULTI_USER 
GO
ALTER DATABASE [job_finder] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [job_finder] SET DB_CHAINING OFF 
GO
ALTER DATABASE [job_finder] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [job_finder] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [job_finder] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [job_finder] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'job_finder', N'ON'
GO
ALTER DATABASE [job_finder] SET QUERY_STORE = OFF
GO
USE [job_finder]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/28/2021 11:38:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Account_Login]    Script Date: 9/28/2021 11:38:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Sp_Account_Login]
	@UserName varchar(20),
	@Password varchar(50)
as
Begin
	declare @count int
	declare @res bit
	select @count = count(*) from Account where UserName = @UserName and Password = @Password
	if @count > 0
		set @res = 1
	else 
		set @res = 0

	select @res
End
GO
USE [master]
GO
ALTER DATABASE [job_finder] SET  READ_WRITE 
GO
