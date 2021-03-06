USE [master]
GO
/****** Object:  Database [OurExpense]    Script Date: 08/30/2016 20:17:53 ******/
CREATE DATABASE [OurExpense] ON  PRIMARY 
( NAME = N'OurExpense', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\OurExpense.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OurExpense_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\OurExpense_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OurExpense] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OurExpense].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OurExpense] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [OurExpense] SET ANSI_NULLS OFF
GO
ALTER DATABASE [OurExpense] SET ANSI_PADDING OFF
GO
ALTER DATABASE [OurExpense] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [OurExpense] SET ARITHABORT OFF
GO
ALTER DATABASE [OurExpense] SET AUTO_CLOSE ON
GO
ALTER DATABASE [OurExpense] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [OurExpense] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [OurExpense] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [OurExpense] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [OurExpense] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [OurExpense] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [OurExpense] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [OurExpense] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [OurExpense] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [OurExpense] SET  ENABLE_BROKER
GO
ALTER DATABASE [OurExpense] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [OurExpense] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [OurExpense] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [OurExpense] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [OurExpense] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [OurExpense] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [OurExpense] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [OurExpense] SET  READ_WRITE
GO
ALTER DATABASE [OurExpense] SET RECOVERY SIMPLE
GO
ALTER DATABASE [OurExpense] SET  MULTI_USER
GO
ALTER DATABASE [OurExpense] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [OurExpense] SET DB_CHAINING OFF
GO
USE [OurExpense]
GO
/****** Object:  User [OurExpenseAdmin]    Script Date: 08/30/2016 20:17:53 ******/
CREATE USER [OurExpenseAdmin] FOR LOGIN [OurExpenseAdmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Validator_History]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Validator_History](
	[Pdate] [nvarchar](15) NULL,
	[TransactionID] [bigint] NULL,
	[RoommateID] [int] NULL,
	[ValidatorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Validator]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Validator](
	[TransactionID] [bigint] NOT NULL,
	[RoommateID] [int] NOT NULL,
	[ValidatorID] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalExpense_History]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalExpense_History](
	[Pdate] [nvarchar](15) NULL,
	[RoommateID] [int] NULL,
	[TotalExpenseCost] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roommates]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roommates](
	[RoommateID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Sex] [char](1) NULL,
	[Password] [varchar](10) NULL,
 CONSTRAINT [Roommates_primary] PRIMARY KEY CLUSTERED 
(
	[RoommateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rejector_History]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rejector_History](
	[Pdate] [nvarchar](15) NULL,
	[TransactionID] [bigint] NULL,
	[RoommateID] [int] NULL,
	[RejectorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rejector]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rejector](
	[TransactionID] [bigint] NOT NULL,
	[RoommateID] [int] NOT NULL,
	[RejectorID] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FEMALE]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FEMALE](
	[ID] [int] NULL,
	[Image] [varbinary](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpenseLog_History]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpenseLog_History](
	[RoommateID] [int] NULL,
	[TransactionID] [bigint] NULL,
	[Purchasedate] [nvarchar](15) NULL,
	[ExpenseLogDetail] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[Valid] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpenseLog]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpenseLog](
	[RoommateID] [int] NOT NULL,
	[TransactionID] [bigint] NOT NULL,
	[Purchasedate] [nvarchar](15) NULL,
	[ExpenseLogDetail] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[Valid] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TotalExpense]    Script Date: 08/30/2016 20:17:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalExpense](
	[RoommateID] [int] NOT NULL,
	[TotalExpenseCost] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoommateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TotalExpense_update]    Script Date: 08/30/2016 20:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[TotalExpense_update]
@tid bigint,
@validID int,
@cust_ID int,
@Amt float(10)
as
BEGIN
UPDATE ExpenseLog SET Valid='Y' WHERE RoommateID=@validID and TransactionID =@tid;
UPDATE TotalExpense SET TotalExpenseCost=TotalExpenseCost-4*(@Amt/5) WHERE RoommateID=@validID;
UPDATE TotalExpense SET TotalExpenseCost=TotalExpenseCost+(@Amt/5) WHERE RoommateID!=@validID;
insert into Validator values(@tid,@validID,@cust_ID);
END;
GO
/****** Object:  StoredProcedure [dbo].[Expense_Rejection]    Script Date: 08/30/2016 20:17:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Expense_Rejection]
@tid bigint,
@validID int,
@cust_ID int
AS
BEGIN
UPDATE ExpenseLog SET Valid='R' WHERE RoommateID=@validID and TransactionID =@tid;
insert into Rejector values(@tid,@validID,@cust_ID);
END;
GO
/****** Object:  ForeignKey [fk_to_roommates]    Script Date: 08/30/2016 20:17:54 ******/
ALTER TABLE [dbo].[ExpenseLog]  WITH CHECK ADD  CONSTRAINT [fk_to_roommates] FOREIGN KEY([RoommateID])
REFERENCES [dbo].[Roommates] ([RoommateID])
GO
ALTER TABLE [dbo].[ExpenseLog] CHECK CONSTRAINT [fk_to_roommates]
GO
/****** Object:  ForeignKey [fk_to_roommates1]    Script Date: 08/30/2016 20:17:54 ******/
ALTER TABLE [dbo].[TotalExpense]  WITH CHECK ADD  CONSTRAINT [fk_to_roommates1] FOREIGN KEY([RoommateID])
REFERENCES [dbo].[Roommates] ([RoommateID])
GO
ALTER TABLE [dbo].[TotalExpense] CHECK CONSTRAINT [fk_to_roommates1]
GO
