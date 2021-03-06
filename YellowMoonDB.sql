USE [YellowMoon]
GO
ALTER TABLE [dbo].[UpdateRecord] DROP CONSTRAINT [FK_UpdateRecord_Cake]
GO
ALTER TABLE [dbo].[Payment] DROP CONSTRAINT [FK_Payment_Order]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail] DROP CONSTRAINT [FK_OrderDetail_Cake]
GO
ALTER TABLE [dbo].[Cake] DROP CONSTRAINT [FK_Cake_Category]
GO
ALTER TABLE [dbo].[Account] DROP CONSTRAINT [FK_Account_Role]
GO
/****** Object:  Table [dbo].[UpdateRecord]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP TABLE [dbo].[UpdateRecord]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP TABLE [dbo].[Payment]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP TABLE [dbo].[OrderDetail]
GO
/****** Object:  Table [dbo].[OrderCake]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP TABLE [dbo].[OrderCake]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Cake]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP TABLE [dbo].[Cake]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP TABLE [dbo].[Account]
GO
USE [master]
GO
/****** Object:  Database [YellowMoon]    Script Date: 03/12/2021 12:16:09 PM ******/
DROP DATABASE [YellowMoon]
GO
/****** Object:  Database [YellowMoon]    Script Date: 03/12/2021 12:16:09 PM ******/
CREATE DATABASE [YellowMoon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YellowMoon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\YellowMoon.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YellowMoon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\YellowMoon_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YellowMoon] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YellowMoon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YellowMoon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YellowMoon] SET ARITHABORT OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YellowMoon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YellowMoon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YellowMoon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YellowMoon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YellowMoon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YellowMoon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YellowMoon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YellowMoon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YellowMoon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YellowMoon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YellowMoon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YellowMoon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YellowMoon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YellowMoon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YellowMoon] SET RECOVERY FULL 
GO
ALTER DATABASE [YellowMoon] SET  MULTI_USER 
GO
ALTER DATABASE [YellowMoon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YellowMoon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YellowMoon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YellowMoon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [YellowMoon] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'YellowMoon', N'ON'
GO
USE [YellowMoon]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03/12/2021 12:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NULL,
	[fullname] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[roleId] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cake]    Script Date: 03/12/2021 12:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cake](
	[cakeId] [nvarchar](255) NOT NULL,
	[cakeName] [nvarchar](255) NOT NULL,
	[imgPath] [nvarchar](255) NOT NULL,
	[categoryId] [nvarchar](255) NOT NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[createDate] [date] NOT NULL,
	[expirationDate] [date] NOT NULL,
	[status] [int] NOT NULL,
	[createBy] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Cake] PRIMARY KEY CLUSTERED 
(
	[cakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/12/2021 12:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [nvarchar](255) NOT NULL,
	[categoryName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderCake]    Script Date: 03/12/2021 12:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderCake](
	[orderId] [nvarchar](255) NOT NULL,
	[orderBy] [nvarchar](255) NOT NULL,
	[shipAddress] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
	[orderDate] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 03/12/2021 12:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailId] [nvarchar](255) NOT NULL,
	[orderId] [nvarchar](255) NOT NULL,
	[cakeId] [nvarchar](255) NOT NULL,
	[cakeName] [nvarchar](255) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 03/12/2021 12:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentId] [nvarchar](255) NOT NULL,
	[orderId] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
	[method] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/12/2021 12:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UpdateRecord]    Script Date: 03/12/2021 12:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateRecord](
	[updateId] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[cakeId] [nvarchar](255) NOT NULL,
	[updateDate] [date] NOT NULL,
 CONSTRAINT [PK_UpdateRecord] PRIMARY KEY CLUSTERED 
(
	[updateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([email], [password], [fullname], [address], [phone], [roleId], [status]) VALUES (N'anhnd16091998@gmail.com', N'adaddada', N'Nguyen Duy Anh', N'833 Xa lộ Hà Nội, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai', N'0336125588', 2, 0)
INSERT [dbo].[Account] ([email], [password], [fullname], [address], [phone], [roleId], [status]) VALUES (N'chubao@gmail.com', N'1234567', N'Ho Bao', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 2, 0)
INSERT [dbo].[Account] ([email], [password], [fullname], [address], [phone], [roleId], [status]) VALUES (N'cuonghx@gmail.com', N'1234567', N'Ho Xuan Cuong', N'555B Đại lộ Bình Dương, Hiệp Thành, Thủ Dầu Một, Bình Dương', N'0985654327', 1, 0)
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'05c98592-7657-4732-bd82-29714cae6f37', N'Banh Mi Khong', N'', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 1, N'dbadandasasa', 30000, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-04' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'066a013e-99c8-46c3-a242-dd1461ef2f7e', N'Banh trung thu ngon vl', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 5, N'Nguyen Hau', 100000, CAST(N'2020-10-15' AS Date), CAST(N'2021-10-08' AS Date), 0, N'anhnd16091998@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'16dfb222-0c2d-11eb-adc1-0242ac120002', N'Banh Trung thu 14', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 10, N'Day la banh trung thu', 50000, CAST(N'2020-10-12' AS Date), CAST(N'2021-12-10' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'268952de-8723-47cc-b4a0-4496af3514b9', N'Banh Mi Khong chua', N'channel4.jpg', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 24, N'ke', 20000, CAST(N'2021-12-02' AS Date), CAST(N'2021-12-13' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'33f3f551-ae45-4f7f-b040-76308f752cdf', N'Banh Tiktok', N'', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 110, N'Banh deo', 24000, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-07' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'66fd16ad-386e-4647-844f-2d0ae3f22e20', N'Banh Trung thu deo', N'news8.jpg', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 22, N'Banh Trung thu cuc bgd', 22222, CAST(N'2021-11-29' AS Date), CAST(N'2021-12-15' AS Date), 0, N'chubao@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'6df0466b-b475-4867-bd6d-9acd8eaab6ad', N'Banh Trung thu 16', N'event6.jpg', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 23, N'Hailh', 2000, CAST(N'2021-12-03' AS Date), CAST(N'2021-12-21' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'7fcbd7fc-0c2d-11eb-adc1-0242ac120002', N'Banh Trung thu 2', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 3, N'Day la banh trung thu', 70000, CAST(N'2020-10-12' AS Date), CAST(N'2021-10-12' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'92c21150-0c2d-11eb-adc1-0242ac120002', N'Banh Trung thu 3', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 6, N'Day la banh trung thu', 30000, CAST(N'2020-10-12' AS Date), CAST(N'2021-10-12' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'a46b0db2-0c2d-11eb-adc1-0242ac120002', N'Banh Trung thu 4', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 5, N'Day la banh trung thu', 40000, CAST(N'2020-10-12' AS Date), CAST(N'2021-09-20' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', N'Banh-trung-thu-nuong-1.jpg', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 20, N'Cuong Wibu', 220000, CAST(N'2021-12-02' AS Date), CAST(N'2021-12-24' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'b7d3215a-0c2d-11eb-adc1-0242ac120002', N'Banh Trung thu 5', N'', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 20, N'Day la banh trung thu', 40000, CAST(N'2020-10-12' AS Date), CAST(N'2021-09-20' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'bb86f856-5447-42cb-bc8a-2ee441c1363a', N'Banh Mi Khong Ngot', N'download.jpg', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 15, N'ok', 30000, CAST(N'2021-12-02' AS Date), CAST(N'2021-12-14' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', N'news8.jpg', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 25, N'ngon', 21000, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-11' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'cf46bf7c-0c2d-11eb-adc1-0242ac120002', N'Banh Trung thu 6', N'', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 22, N'Day la banh trung thu', 36000, CAST(N'2020-10-12' AS Date), CAST(N'2021-09-20' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'd3fbb586-9ac1-4dbf-bd4e-fd0e6384087f', N'Bánh Kinhdo', N'', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 20, N'Bánh ngon vclll', 9000, CAST(N'2020-10-13' AS Date), CAST(N'2022-01-05' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', N'Banh Taobao', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 19, N'dbadanda', 399000, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-11' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'da97f65c-dcf5-400e-9367-c2dfc0e11a47', N'Banh Taobao nhan ngot', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 33, N'dbadan', 20000, CAST(N'2021-11-30' AS Date), CAST(N'2021-12-04' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'e229bfa4-0c2d-11eb-adc1-0242ac120002', N'Banh Trung thu 7', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 4, N'Day la banh trung thu', 50000, CAST(N'2020-10-12' AS Date), CAST(N'2021-10-20' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'e3134a69-d22e-442b-8bdc-785a9d700266', N'Banh gi day', N'', N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', 3, N'Ngon day', 1000000, CAST(N'2020-10-14' AS Date), CAST(N'2021-12-14' AS Date), 0, N'cuonghx@gmail.com')
INSERT [dbo].[Cake] ([cakeId], [cakeName], [imgPath], [categoryId], [quantity], [description], [price], [createDate], [expirationDate], [status], [createBy]) VALUES (N'ed8b4c96-0c2d-11eb-adc1-0242ac120002', N'Banh Trung thu 8', N'', N'09ce0b30-0c2b-11eb-adc1-0242ac120002', 23, N'Day la banh trung thu', 79000, CAST(N'2020-10-12' AS Date), CAST(N'2021-12-20' AS Date), -1, N'chubao@gmail.com')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'09ce0b30-0c2b-11eb-adc1-0242ac120002', N'Bánh trung thu nướng
')
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (N'a8f7fe88-0c2a-11eb-adc1-0242ac120002', N'Bánh trung thu dẻo
')
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'027109a6-9365-46d9-a305-4f7b7f0cfa14', N'baoabo@gmail.com', N'QL51, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Việt Nam', N'0984333213', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'127716dc-c6bc-4f48-8c31-80d87301455e', N'sadthuseetinh@gmail.com', N'QL51, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Việt Nam', N'0985463522', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'13ec033d-601c-4c9f-8bce-810f607dffe6', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'276805da-8ae0-45e8-b5fe-00e75018c13f', N'anhnd16091998@gmail.com', N'833 Xa lộ Hà Nội, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai', N'0336125588', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'2cc32510-2c5e-47b6-913e-ef953add57bb', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'375a1e95-f24b-4cb5-96fe-b1b38c3a27ad', N'sadthuseetinh@gmail.com', N'QL51, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Việt Nam', N'0985463522', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'40eb14d7-18a8-4f75-b46c-6f11c72e1c47', N'sadthuseetinh@gmail.com', N'QL51, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Việt Nam', N'0985463522', 0, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'4244c46f-cac0-4a33-bc1b-b5297dd2bec1', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'45b32edd-c622-4e50-9728-8caff795c412', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'4b934c15-16d1-4f71-b280-3200011cd67c', N'anhnd16091998@gmail.com', N'833 Xa lộ Hà Nội, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai', N'0336125588', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'5fda4516-375c-43b5-9407-4bb2aef018f3', N'anhnd16091998@gmail.com', N'833 Xa lộ Hà Nội, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai', N'0336125588', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'723e35db-d686-4071-b025-8bc74af18415', N'baoabo@gmail.com', N'QL51, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Việt Nam', N'0984333213', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'72438312-440e-4699-a9f9-4f86afd82716', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 1, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'7b7f4a1c-9cc6-4e91-a98f-02015436d9df', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', -1, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'7c00d3db-b165-4cee-88f1-68350a7d32a0', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-03' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'8cca71a5-b5ca-4c52-b149-f772189e72c4', N'sadthuseetinh@gmail.com', N'QL51, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Việt Nam', N'0985463522', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'9a019ce2-47f9-47c9-ade5-e326365911c5', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'a8427965-0414-4189-ba95-927487ff2fd9', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-03' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'ac8e3979-133f-4dca-a561-725731294708', N'sadthuseetinh@gmail.com', N'QL51, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Việt Nam', N'0985463522', 0, CAST(N'2021-12-03' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'b0be4d13-09c4-4e79-853b-7354d4aefa44', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'b6db8e2c-1b9e-456b-b924-fb8ecad0413b', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'd889ca3d-1d9c-4503-868a-d7d05ac57f80', N'baoabo@gmail.com', N'QL51, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai, Việt Nam', N'0984333213', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'e933d721-44a4-4ad1-aae9-125046e8f8ce', N'anhnd16091998@gmail.com', N'833 Xa lộ Hà Nội, Long Bình Tân, Thành phố Biên Hòa, Đồng Nai', N'0336125588', 0, CAST(N'2021-12-02' AS Date))
INSERT [dbo].[OrderCake] ([orderId], [orderBy], [shipAddress], [phone], [status], [orderDate]) VALUES (N'f5433eb3-4562-4528-933c-b51ad45fceec', N'chubao@gmail.com', N'792 Nguyễn Kiệm, Phường 3, Gò Vấp, Thành phố Hồ Chí Minh', N'0984324455', 0, CAST(N'2021-12-01' AS Date))
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'023563b0-007b-4dcf-99f6-f1c191378b69', N'a8427965-0414-4189-ba95-927487ff2fd9', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 2, 440000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'02e96063-f613-4d5a-9dfe-4401d3b31895', N'7c00d3db-b165-4cee-88f1-68350a7d32a0', N'268952de-8723-47cc-b4a0-4496af3514b9', N'Banh Mi Khong chua', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'054f572f-5ba6-499b-83a7-fe42c1db0f3d', N'72438312-440e-4699-a9f9-4f86afd82716', N'05c98592-7657-4732-bd82-29714cae6f37', N'Banh Mi Khong', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'0b69394d-0c98-4636-a993-9c54ef3207a7', N'5fda4516-375c-43b5-9407-4bb2aef018f3', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'17cf8366-6273-49dd-99ab-769b82348c8e', N'7c00d3db-b165-4cee-88f1-68350a7d32a0', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 220000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'1ba602aa-41fb-430f-a7ee-239f8c489886', N'b0be4d13-09c4-4e79-853b-7354d4aefa44', N'33f3f551-ae45-4f7f-b040-76308f752cdf', N'Banh Tiktok', 1, 24000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'2427d3ec-5c18-4c76-8913-d9087a22ed36', N'72438312-440e-4699-a9f9-4f86afd82716', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'24da0321-3b36-42a4-9ee3-27200471e884', N'40eb14d7-18a8-4f75-b46c-6f11c72e1c47', N'05c98592-7657-4732-bd82-29714cae6f37', N'Banh Mi Khong', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'2833bb4b-ea53-4103-95c2-e121b36132ad', N'45b32edd-c622-4e50-9728-8caff795c412', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'2ae153db-5032-4cfe-b849-2180743386fa', N'72438312-440e-4699-a9f9-4f86afd82716', N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', N'Banh Taobao', 1, 399000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'4afc13cc-2928-4409-89c1-dcde394e24bc', N'027109a6-9365-46d9-a305-4f7b7f0cfa14', N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', N'Banh Taobao', 1, 399000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'4c9c225a-f688-415f-a74f-8987ae966d7c', N'9a019ce2-47f9-47c9-ade5-e326365911c5', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 2, 42000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'4cd56984-f819-4a4a-aeb0-bf2580905608', N'8cca71a5-b5ca-4c52-b149-f772189e72c4', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'4ff840c9-3f52-46f0-8d33-6c120c0044ab', N'e933d721-44a4-4ad1-aae9-125046e8f8ce', N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', N'Banh Taobao', 1, 399000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'566a0e14-3dda-4e70-a980-a52596aa3fee', N'127716dc-c6bc-4f48-8c31-80d87301455e', N'bb86f856-5447-42cb-bc8a-2ee441c1363a', N'Banh Mi Khong Ngot', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'65008292-37f5-43db-a949-cf8e99fe2906', N'7b7f4a1c-9cc6-4e91-a98f-02015436d9df', N'33f3f551-ae45-4f7f-b040-76308f752cdf', N'Banh Tiktok', 1, 24000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'67bfec02-606d-4826-b630-7db8ef7b8c76', N'72438312-440e-4699-a9f9-4f86afd82716', N'33f3f551-ae45-4f7f-b040-76308f752cdf', N'Banh Tiktok', 1, 24000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'6e57e387-8db9-4402-b38a-eeb12bfadf4d', N'4244c46f-cac0-4a33-bc1b-b5297dd2bec1', N'da97f65c-dcf5-400e-9367-c2dfc0e11a47', N'Banh Taobao nhan ngot', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'705ff4e6-8cc5-499c-8276-f36ac834e7fe', N'd889ca3d-1d9c-4503-868a-d7d05ac57f80', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'7191e6eb-59a6-44a5-be26-87c69716f5c9', N'e933d721-44a4-4ad1-aae9-125046e8f8ce', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'725308e7-c1ef-45db-a8b5-9921bc3515b5', N'5fda4516-375c-43b5-9407-4bb2aef018f3', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 4, 84000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'74d68f80-d445-48d3-898d-e689f417482e', N'375a1e95-f24b-4cb5-96fe-b1b38c3a27ad', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'7a1a1300-ca29-4561-a8f1-206faddfd9dc', N'4244c46f-cac0-4a33-bc1b-b5297dd2bec1', N'05c98592-7657-4732-bd82-29714cae6f37', N'Banh Mi Khong', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'7f94b34e-ffa8-4abf-9e23-a2290cd55949', N'ac8e3979-133f-4dca-a561-725731294708', N'268952de-8723-47cc-b4a0-4496af3514b9', N'Banh Mi Khong chua', 2, 40000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'817b30b5-e743-4fbb-a92e-7f3cf3f6496d', N'40eb14d7-18a8-4f75-b46c-6f11c72e1c47', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'81fbce4c-47fa-4ebc-93c8-dba787286859', N'4b934c15-16d1-4f71-b280-3200011cd67c', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'83539029-6134-4851-b6c9-9b2aeec579cf', N'f5433eb3-4562-4528-933c-b51ad45fceec', N'05c98592-7657-4732-bd82-29714cae6f37', N'Banh Mi Khong', 2, 60000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'8acc0910-cd19-4db2-b578-a4858f32aa3c', N'5fda4516-375c-43b5-9407-4bb2aef018f3', N'bb86f856-5447-42cb-bc8a-2ee441c1363a', N'Banh Mi Khong Ngot', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'8fb2aa01-6014-4080-875b-a444fb81cc0b', N'13ec033d-601c-4c9f-8bce-810f607dffe6', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'9002619c-fc72-4bad-b346-503e70481d92', N'e933d721-44a4-4ad1-aae9-125046e8f8ce', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'9689b79a-b0c5-454b-a0c6-0aae72ae0212', N'276805da-8ae0-45e8-b5fe-00e75018c13f', N'bb86f856-5447-42cb-bc8a-2ee441c1363a', N'Banh Mi Khong Ngot', 3, 90000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'9b3971a5-3118-427b-a226-33b97b50005a', N'd889ca3d-1d9c-4503-868a-d7d05ac57f80', N'bb86f856-5447-42cb-bc8a-2ee441c1363a', N'Banh Mi Khong Ngot', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'a1056b83-eb05-47ad-a5cc-9fd74ce5f132', N'723e35db-d686-4071-b025-8bc74af18415', N'268952de-8723-47cc-b4a0-4496af3514b9', N'Banh Mi Khong chua', 3, 60000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'a20909c0-6b56-4de7-9285-dee848c7e80b', N'723e35db-d686-4071-b025-8bc74af18415', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 220000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'a223c1ee-132f-4c52-a9af-b712166e4efb', N'13ec033d-601c-4c9f-8bce-810f607dffe6', N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', N'Banh Taobao', 1, 399000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'a89a436b-4f91-426f-b149-d921c8514955', N'4244c46f-cac0-4a33-bc1b-b5297dd2bec1', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'ac28cc7a-d2cc-4c8d-9a9b-abc84959cb26', N'127716dc-c6bc-4f48-8c31-80d87301455e', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', N'Banh Mi KhongMan ', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'b0c6328f-cc3b-48e6-9c7b-c1a1daf90018', N'b0be4d13-09c4-4e79-853b-7354d4aefa44', N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', N'Banh Taobao', 1, 399000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'b9f9bc60-8111-4b96-adc7-68fc75a3421f', N'027109a6-9365-46d9-a305-4f7b7f0cfa14', N'33f3f551-ae45-4f7f-b040-76308f752cdf', N'Banh Tiktok', 1, 24000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'caae0fe2-1410-4c31-bd2d-f9645f403e10', N'f5433eb3-4562-4528-933c-b51ad45fceec', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'dd194697-e024-48f0-82b0-b5e7aac312e7', N'f5433eb3-4562-4528-933c-b51ad45fceec', N'33f3f551-ae45-4f7f-b040-76308f752cdf', N'Banh Tiktok', 2, 48000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'de011b07-25bf-4b2d-86d8-6d12b2badc80', N'13ec033d-601c-4c9f-8bce-810f607dffe6', N'da97f65c-dcf5-400e-9367-c2dfc0e11a47', N'Banh Taobao nhan ngot', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'de503943-4421-41b1-bac6-3104a558d5c3', N'f5433eb3-4562-4528-933c-b51ad45fceec', N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', N'Banh Taobao', 1, 399000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'e2af221e-e21e-4057-9786-f5d4bd793fd4', N'8cca71a5-b5ca-4c52-b149-f772189e72c4', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', N'Banh Taobao nhan man', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'e8e6ee32-c879-48e9-b5ae-e5f119be19c2', N'e933d721-44a4-4ad1-aae9-125046e8f8ce', N'bb86f856-5447-42cb-bc8a-2ee441c1363a', N'Banh Mi Khong Ngot', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'eaf03b09-9fa4-4729-99d0-33e3eb132807', N'b6db8e2c-1b9e-456b-b924-fb8ecad0413b', N'05c98592-7657-4732-bd82-29714cae6f37', N'Banh Mi Khong', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'eebc8eab-9e70-419c-9bd2-212a0fec2bdf', N'2cc32510-2c5e-47b6-913e-ef953add57bb', N'268952de-8723-47cc-b4a0-4496af3514b9', N'Banh Mi Khong chua', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'f33a8181-1286-4ea8-b996-8ca56e380344', N'7b7f4a1c-9cc6-4e91-a98f-02015436d9df', N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', N'Banh Taobao', 2, 798000)
INSERT [dbo].[OrderDetail] ([orderDetailId], [orderId], [cakeId], [cakeName], [quantity], [price]) VALUES (N'f43a178a-b7e7-44b0-b9e2-1e36a59cca6f', N'45b32edd-c622-4e50-9728-8caff795c412', N'05c98592-7657-4732-bd82-29714cae6f37', N'Banh Mi Khong', 1, 30000)
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'1482f3bc-dbda-45ba-bacd-8f1609aa6752', N'72438312-440e-4699-a9f9-4f86afd82716', 1, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'262633ce-5647-4d81-8048-1562fa36493f', N'9a019ce2-47f9-47c9-ade5-e326365911c5', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'2a995c61-2d15-41ff-aad3-48ee7ff9aa21', N'2cc32510-2c5e-47b6-913e-ef953add57bb', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'3a4b605b-d097-4c42-9e32-59e7859e7491', N'4b934c15-16d1-4f71-b280-3200011cd67c', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'47023358-9345-4d5f-a2f7-35e5512cde89', N'723e35db-d686-4071-b025-8bc74af18415', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'4eb0537f-1b8b-4c54-8d81-8fad9b9db00f', N'e933d721-44a4-4ad1-aae9-125046e8f8ce', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'5bcd64f4-468c-45e4-812a-579563805d2e', N'127716dc-c6bc-4f48-8c31-80d87301455e', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'6daaa4a0-832c-437b-8bb4-3c663e4eb901', N'7b7f4a1c-9cc6-4e91-a98f-02015436d9df', -1, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'7949f38e-9047-4bdb-a17c-5c350abc5976', N'45b32edd-c622-4e50-9728-8caff795c412', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'80e67364-ce17-4933-be4d-4f6ccfe1c5bb', N'13ec033d-601c-4c9f-8bce-810f607dffe6', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'8f80e290-5906-4e1b-8d3c-31ce12546323', N'7c00d3db-b165-4cee-88f1-68350a7d32a0', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'990b9d7f-948f-49f2-8545-3f7c1b22d156', N'ac8e3979-133f-4dca-a561-725731294708', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'9c66c049-cd68-4187-8573-3609dd2076fa', N'5fda4516-375c-43b5-9407-4bb2aef018f3', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'9fb555ab-40cd-4e56-872a-f4cc83d75b23', N'375a1e95-f24b-4cb5-96fe-b1b38c3a27ad', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'9fe7a314-9fa0-4c30-b877-d26afab1ba72', N'40eb14d7-18a8-4f75-b46c-6f11c72e1c47', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'a1050e2e-e9b6-43f2-baf2-35ef468c640c', N'b0be4d13-09c4-4e79-853b-7354d4aefa44', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'a3379418-526f-11ec-bf63-0242ac130002', N'f5433eb3-4562-4528-933c-b51ad45fceec', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'a4a439f4-7fb8-43ed-8e20-2c079c9529b1', N'4244c46f-cac0-4a33-bc1b-b5297dd2bec1', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'ab48589b-92c1-4c9d-a5c2-29f3db594b78', N'b6db8e2c-1b9e-456b-b924-fb8ecad0413b', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'b38eb6b9-1e08-4dc6-a848-8c74cd135fd4', N'a8427965-0414-4189-ba95-927487ff2fd9', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'b918158a-ec0e-4113-8de7-c2724e30ed44', N'8cca71a5-b5ca-4c52-b149-f772189e72c4', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'cb35c73d-9148-4ea7-87d7-3506b6ef5d8d', N'd889ca3d-1d9c-4503-868a-d7d05ac57f80', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'ce1611a0-1ec0-4e67-8867-89db30059ea1', N'276805da-8ae0-45e8-b5fe-00e75018c13f', 0, N'Cash')
INSERT [dbo].[Payment] ([paymentId], [orderId], [status], [method]) VALUES (N'eb35fa07-696d-4e33-a0a5-f726ae2b0551', N'027109a6-9365-46d9-a305-4f7b7f0cfa14', 0, N'Cash')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'04e64320-240a-4d88-bedf-2424fe2f3214', N'cuonghx@gmail.com', N'33f3f551-ae45-4f7f-b040-76308f752cdf', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'0e2dea48-a3be-46e0-8cad-496eeb46f499', N'anhnd16091998@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'0fd78909-ea4f-47d2-bd07-e71e9ca0a637', N'cuonghx@gmail.com', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'16bb0221-3800-463a-a98a-a018d0cf47b3', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'1cdc5eb3-ad61-4cd9-9aca-f275cef0fceb', N'cuonghx@gmail.com', N'bd9a017a-48dd-4402-981b-2b153a8bfcd0', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'1d8d9d58-cc59-48d3-915c-6389ce36d751', N'cuonghx@gmail.com', N'd3fbb586-9ac1-4dbf-bd4e-fd0e6384087f', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'1fccd2b0-cdf9-4925-bb29-be0f894436b6', N'cuonghx@gmail.com', N'33f3f551-ae45-4f7f-b040-76308f752cdf', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'48f9b7ff-e821-4aee-86bd-6ec19b7e9179', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'51214416-2f67-45dd-84d0-f8586cd0eb7c', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'51c7da77-a3a0-4c1a-affa-44a56f52e316', N'cuonghx@gmail.com', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'60b5f781-b559-4747-ab16-23dd6faf39e8', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'67b39e68-4913-48f5-b1c5-21a70e1c201b', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'683e06f9-f138-44b6-b0a8-9f8b477f037c', N'cuonghx@gmail.com', N'ed8b4c96-0c2d-11eb-adc1-0242ac120002', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'72aba3c8-68f9-4e5f-8345-d97f53f9bf7d', N'cuonghx@gmail.com', N'33f3f551-ae45-4f7f-b040-76308f752cdf', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'8ba59b4b-27d7-4aed-94fe-591a5c30427e', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'8cd64758-8169-4fc8-8030-56d8e665cd5e', N'cuonghx@gmail.com', N'05c98592-7657-4732-bd82-29714cae6f37', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'9096fec6-7d54-4d2e-8433-312a90c4e741', N'cuonghx@gmail.com', N'66fd16ad-386e-4647-844f-2d0ae3f22e20', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'9ae5ca90-dbbf-4571-bc0e-b80737097726', N'cuonghx@gmail.com', N'd3fbb586-9ac1-4dbf-bd4e-fd0e6384087f', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'9e30a27a-fd89-4d2d-8f85-e61bd1ef5b58', N'cuonghx@gmail.com', N'16dfb222-0c2d-11eb-adc1-0242ac120002', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'a0dc882e-8c1a-4963-ac64-da8dbdaee6ee', N'cuonghx@gmail.com', N'ed8b4c96-0c2d-11eb-adc1-0242ac120002', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'a3a1de09-e242-4936-ae11-4ce3ba0ae9d6', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'b113973e-36d9-4c56-a581-16ef36436480', N'cuonghx@gmail.com', N'da97f65c-dcf5-400e-9367-c2dfc0e11a47', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'bc778b27-8bf4-46c8-a8d6-22396a76f358', N'cuonghx@gmail.com', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'cc02e9bc-866b-4bbe-bcdf-deb76cf15905', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'ccaedc3f-6bb1-43be-a766-2ffbd3a957d2', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'cf3aed90-2c22-40ed-aa12-9874a00824e4', N'cuonghx@gmail.com', N'e229bfa4-0c2d-11eb-adc1-0242ac120002', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'd36f06e1-d38c-4e43-a312-e8ec7c9f50f5', N'cuonghx@gmail.com', N'66fd16ad-386e-4647-844f-2d0ae3f22e20', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'dda7f373-7910-4638-94a2-ee94561640c8', N'cuonghx@gmail.com', N'33f3f551-ae45-4f7f-b040-76308f752cdf', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'df8eaa95-fcd3-4f3d-a3e5-c372e11c9ac2', N'cuonghx@gmail.com', N'abea1c79-13d5-4d74-b60c-4d55edf2fc9b', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'e36d0d0a-8ebd-4de3-bde7-1812be841795', N'anhnd16091998@gmail.com', N'd3fbb586-9ac1-4dbf-bd4e-fd0e6384087f', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'e640ca3f-3861-405a-8318-cfce0ec265e7', N'cuonghx@gmail.com', N'e3134a69-d22e-442b-8bdc-785a9d700266', CAST(N'2021-11-30' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'f4caab0f-2e43-468d-905a-267f4b93d66a', N'anhnd16091998@gmail.com', N'e3134a69-d22e-442b-8bdc-785a9d700266', CAST(N'2020-10-14' AS Date))
INSERT [dbo].[UpdateRecord] ([updateId], [email], [cakeId], [updateDate]) VALUES (N'f76d76da-ea2a-430f-a695-3a98af22c074', N'cuonghx@gmail.com', N'd8ff2b13-3636-4598-8dd2-9bf96a32256b', CAST(N'2021-11-30' AS Date))
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Cake]  WITH CHECK ADD  CONSTRAINT [FK_Cake_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Cake] CHECK CONSTRAINT [FK_Cake_Category]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Cake] FOREIGN KEY([cakeId])
REFERENCES [dbo].[Cake] ([cakeId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Cake]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[OrderCake] ([orderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[OrderCake] ([orderId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Order]
GO
ALTER TABLE [dbo].[UpdateRecord]  WITH CHECK ADD  CONSTRAINT [FK_UpdateRecord_Cake] FOREIGN KEY([cakeId])
REFERENCES [dbo].[Cake] ([cakeId])
GO
ALTER TABLE [dbo].[UpdateRecord] CHECK CONSTRAINT [FK_UpdateRecord_Cake]
GO
USE [master]
GO
ALTER DATABASE [YellowMoon] SET  READ_WRITE 
GO
