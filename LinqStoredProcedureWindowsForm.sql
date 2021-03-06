USE [master]
GO
/****** Object:  Database [belajarlinq]    Script Date: 13/09/2021 14:27:34 ******/
CREATE DATABASE [belajarlinq]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'belajarlinq', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQL2016\MSSQL\DATA\belajarlinq.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'belajarlinq_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQL2016\MSSQL\DATA\belajarlinq_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [belajarlinq] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [belajarlinq].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [belajarlinq] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [belajarlinq] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [belajarlinq] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [belajarlinq] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [belajarlinq] SET ARITHABORT OFF 
GO
ALTER DATABASE [belajarlinq] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [belajarlinq] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [belajarlinq] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [belajarlinq] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [belajarlinq] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [belajarlinq] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [belajarlinq] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [belajarlinq] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [belajarlinq] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [belajarlinq] SET  DISABLE_BROKER 
GO
ALTER DATABASE [belajarlinq] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [belajarlinq] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [belajarlinq] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [belajarlinq] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [belajarlinq] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [belajarlinq] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [belajarlinq] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [belajarlinq] SET RECOVERY FULL 
GO
ALTER DATABASE [belajarlinq] SET  MULTI_USER 
GO
ALTER DATABASE [belajarlinq] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [belajarlinq] SET DB_CHAINING OFF 
GO
ALTER DATABASE [belajarlinq] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [belajarlinq] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [belajarlinq] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'belajarlinq', N'ON'
GO
ALTER DATABASE [belajarlinq] SET QUERY_STORE = OFF
GO
USE [belajarlinq]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [belajarlinq]
GO
/****** Object:  Table [dbo].[ProductInfo]    Script Date: 13/09/2021 14:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInfo](
	[ProductID] [int] NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[Design] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
 CONSTRAINT [PK_ProductInfo] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[delete_data]    Script Date: 13/09/2021 14:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_data]
@idProduct int
as
delete from dbo.ProductInfo where ProductID = @idProduct;
GO
/****** Object:  StoredProcedure [dbo].[insert_data]    Script Date: 13/09/2021 14:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_data]
@idProduct int,
@itemName nVarchar(50),
@Design nVarchar(50),
@Color nVarchar(50),
@ExpiryDate datetime,
@InsertDate datetime
as
insert into dbo.ProductInfo values(@idProduct, @itemName, @Design, @Color, @InsertDate, null ,@ExpiryDate);
GO
/****** Object:  StoredProcedure [dbo].[search_data_by_id]    Script Date: 13/09/2021 14:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[search_data_by_id]
@idProduct int
as
select * from dbo.ProductInfo where ProductID = @idProduct;
GO
/****** Object:  StoredProcedure [dbo].[show_data]    Script Date: 13/09/2021 14:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[show_data] 
as
select * from dbo.ProductInfo
GO
/****** Object:  StoredProcedure [dbo].[update_data]    Script Date: 13/09/2021 14:27:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_data]
@idProduct int,
@itemName nVarchar(50),
@Design nVarchar(50),
@Color nVarchar(50),
@ExpiryDate datetime,
@UpdateDate datetime
as
update dbo.ProductInfo set ItemName = @itemName, Design = @Design, Color = @Color, ExpiryDate = @ExpiryDate, UpdateDate = @UpdateDate where ProductID = @idProduct
GO
USE [master]
GO
ALTER DATABASE [belajarlinq] SET  READ_WRITE 
GO
