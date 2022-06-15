USE [master]
GO
/****** Object:  Database [WebBanHang]    Script Date: 16/6/2022 2:58:05 am ******/
CREATE DATABASE [WebBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebBanHang.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebBanHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebBanHang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebBanHang] SET RECOVERY FULL 
GO
ALTER DATABASE [WebBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [WebBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebBanHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebBanHang', N'ON'
GO
USE [WebBanHang]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 16/6/2022 2:58:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[accountid] [bigint] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[status] [int] NOT NULL,
	[ngaytao] [date] NOT NULL,
	[type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__ACCOUNT__349DA5A67D8FA49A] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 16/6/2022 2:58:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[accountid] [bigint] NOT NULL,
	[productid] [bigint] NOT NULL,
	[quantity] [bigint] NOT NULL,
 CONSTRAINT [PK_CART] PRIMARY KEY CLUSTERED 
(
	[accountid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 16/6/2022 2:58:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[categoryid] [bigint] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__CATEGORY__19093A0B17611E8D] PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_DETAIL]    Script Date: 16/6/2022 2:58:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_DETAIL](
	[ordersid] [bigint] NOT NULL,
	[productid] [bigint] NOT NULL,
	[quantity] [bigint] NULL,
	[price] [bigint] NULL,
 CONSTRAINT [PK_ORDER_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ordersid] ASC,
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 16/6/2022 2:58:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ordersid] [bigint] IDENTITY(1,1) NOT NULL,
	[accountid] [bigint] NOT NULL,
	[order_time] [datetime] NOT NULL,
	[delivery_time] [datetime] NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__ORDERS__5F11BFF57546B500] PRIMARY KEY CLUSTERED 
(
	[ordersid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 16/6/2022 2:58:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[productid] [bigint] IDENTITY(1,1) NOT NULL,
	[productname] [nvarchar](50) NULL,
	[price] [money] NOT NULL,
	[discount] [int] NOT NULL,
	[review] [ntext] NULL,
	[categoryid] [bigint] NULL,
	[status] [int] NULL,
	[available] [int] NULL,
	[images] [text] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK__PRODUCT__2D172D32D8A4C60E] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACCOUNT] ON 

INSERT [dbo].[ACCOUNT] ([accountid], [fullname], [password], [phone], [email], [address], [status], [ngaytao], [type]) VALUES (4, N'Lê Hoàng Anh', N'202cb962ac59075b964b07152d234b70', N'0333333333', N'quangtuong6687@gmail.com', N'277 Bưng Ông Thoàn', 0, CAST(N'2022-05-17' AS Date), N'normal')
INSERT [dbo].[ACCOUNT] ([accountid], [fullname], [password], [phone], [email], [address], [status], [ngaytao], [type]) VALUES (12, N'Võ Quang Tường', N'202cb962ac59075b964b07152d234b70', N'0339518617', N'quangtuong100@gmail.com', N'277, Bung Ông Thoàn, TĂNG NHƠN PHÚ B, QUẬN 9', 0, CAST(N'2022-05-17' AS Date), N'admin')
INSERT [dbo].[ACCOUNT] ([accountid], [fullname], [password], [phone], [email], [address], [status], [ngaytao], [type]) VALUES (13, N'Thẩm Ngọc Ánh', N'202cb962ac59075b964b07152d234b70', N'0123456789', N'quangtuong102@gmail.com', N'97 Man Thiện', 0, CAST(N'2022-05-17' AS Date), N'normal')
INSERT [dbo].[ACCOUNT] ([accountid], [fullname], [password], [phone], [email], [address], [status], [ngaytao], [type]) VALUES (17, N'na', N'202cb962ac59075b964b07152d234b70', N'045763703', N'thamngocanh2441@gmail.com', N'277 Bưng Ông Thoàn', 0, CAST(N'2022-05-27' AS Date), N'normal')
SET IDENTITY_INSERT [dbo].[ACCOUNT] OFF
GO
INSERT [dbo].[CART] ([accountid], [productid], [quantity]) VALUES (12, 5, 2)
INSERT [dbo].[CART] ([accountid], [productid], [quantity]) VALUES (12, 12, 1)
INSERT [dbo].[CART] ([accountid], [productid], [quantity]) VALUES (12, 13, 1)
INSERT [dbo].[CART] ([accountid], [productid], [quantity]) VALUES (17, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] ON 

INSERT [dbo].[CATEGORY] ([categoryid], [categoryname]) VALUES (1, N'Nam')
INSERT [dbo].[CATEGORY] ([categoryid], [categoryname]) VALUES (2, N'Nữ')
INSERT [dbo].[CATEGORY] ([categoryid], [categoryname]) VALUES (3, N'Phụ Kiện')
SET IDENTITY_INSERT [dbo].[CATEGORY] OFF
GO
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (16, 6, 1, 410)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (17, 1, 1, 399)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (18, 9, 1, 729)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (19, 5, 0, 120)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (20, 9, 2, 729)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (20, 12, 1, 410)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (21, 6, 3, 410)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (22, 5, 2, 120)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (22, 44, 3, 499)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (23, 5, 1, 120)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (24, 1, 1, 399)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (24, 5, 1, 120)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (24, 9, 1, 729)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (25, 8, 2, 180)
INSERT [dbo].[ORDER_DETAIL] ([ordersid], [productid], [quantity], [price]) VALUES (25, 44, 2, 499)
GO
SET IDENTITY_INSERT [dbo].[ORDERS] ON 

INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (16, 4, CAST(N'2022-05-23T07:01:21.360' AS DateTime), CAST(N'2022-05-23T07:31:21.360' AS DateTime), 0)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (17, 4, CAST(N'2022-05-23T07:05:53.023' AS DateTime), CAST(N'2022-05-23T07:35:53.023' AS DateTime), 3)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (18, 4, CAST(N'2022-05-23T13:10:39.897' AS DateTime), CAST(N'2022-05-23T13:40:39.897' AS DateTime), 2)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (19, 4, CAST(N'2022-05-25T21:21:37.823' AS DateTime), CAST(N'2022-05-25T21:51:37.823' AS DateTime), 1)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (20, 4, CAST(N'2022-05-25T22:32:06.977' AS DateTime), CAST(N'2022-05-25T23:02:06.977' AS DateTime), 2)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (21, 4, CAST(N'2022-05-27T23:22:43.207' AS DateTime), CAST(N'2022-05-27T23:52:43.207' AS DateTime), 2)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (22, 17, CAST(N'2022-05-28T01:33:20.670' AS DateTime), CAST(N'2022-05-28T02:03:20.670' AS DateTime), 3)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (23, 17, CAST(N'2022-05-28T01:44:59.373' AS DateTime), CAST(N'2022-05-28T02:14:59.373' AS DateTime), 3)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (24, 17, CAST(N'2022-05-28T01:47:28.823' AS DateTime), CAST(N'2022-05-28T02:17:28.823' AS DateTime), 0)
INSERT [dbo].[ORDERS] ([ordersid], [accountid], [order_time], [delivery_time], [status]) VALUES (25, 17, CAST(N'2022-05-28T01:49:33.313' AS DateTime), CAST(N'2022-05-28T02:19:33.313' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[ORDERS] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (1, N'Quần short tennis nữ', 399.0000, 20, N'ok', 2, 0, 0, N'1-0.jpeg 1-1.jpeg 1-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (2, N'Túi xác thời trang - tiện lợi', 610.0000, 25, N'kaka', 3, 0, 0, N'2-0.jpeg 2-1.jpeg 2-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (5, N'Váy trẻ trung mới nhất', 120.0000, 10, N'Áo khoác Hoodie Zipper Linh Vật Animal Ver1
, Chất liệu French Terry
, thành phần 100% Cotton
, thấm hút thoát ẩm,  mềm mại, ít nhăn
, Co giãn tối ưu
, Thân thiện môi trường
, Họa tiết in dẻo', 2, 0, 0, N'5-0.jpeg 5-1.jpeg 5-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (6, N'Túi xách tiện lợi, nhỏ gọn', 410.0000, 15, N'tốt', 2, 0, 0, N'6-0.jpeg 6-1.jpeg 6-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (8, N'Giày thể thao adidas ', 180.0000, 10, N'tốt', 3, 0, 0, N'8-0.jpeg 8-1.jpeg 8-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (9, N'Kính mát sành điệu unisex', 729.0000, 0, N'tốt', 3, 0, 0, N'9-0.jpeg 9-1.jpeg 9-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (10, N'Quần váy xếp ly', 899.0000, 10, N'tốt', 2, 0, 0, N'10-0.jpeg 10-1.jpeg 10-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (11, N'Áo sơ mi trắng dành cho nam', 120.0000, 0, N'tốt', 1, 0, 0, N'11-0.jpeg 11-1.jpeg 11-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (12, N'Áo ấm màu đông dành cho nam', 410.0000, 0, N'Áo ấm chất liệu len, nhập khẩu từ Anh Quốc. Kiểu dáng thời trang mới nhất', 1, 0, 0, N'12-0.jpeg 12-1.jpeg 12-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (13, N'Áo thun cổ tròn dài tay', 185.0000, 15, N'tốt', 1, 0, 0, N'13-0.jpeg 13-1.jpeg 13-2.jpeg', NULL)
INSERT [dbo].[PRODUCT] ([productid], [productname], [price], [discount], [review], [categoryid], [status], [available], [images], [quantity]) VALUES (44, N'sản phẩm dùng để test chức năng thêm sản phẩm', 499.0000, 15, N'balo', 3, 0, 0, N'20220528_001902_111.jpg 20220528_001902_222.jpg 20220528_001903_333.jpg', NULL)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD  CONSTRAINT [FK_CART_ACCOUNT] FOREIGN KEY([accountid])
REFERENCES [dbo].[ACCOUNT] ([accountid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CART] CHECK CONSTRAINT [FK_CART_ACCOUNT]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD  CONSTRAINT [FK_CART_PRODUCT] FOREIGN KEY([productid])
REFERENCES [dbo].[PRODUCT] ([productid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CART] CHECK CONSTRAINT [FK_CART_PRODUCT]
GO
ALTER TABLE [dbo].[ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAIL_ORDERS] FOREIGN KEY([ordersid])
REFERENCES [dbo].[ORDERS] ([ordersid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ORDER_DETAIL] CHECK CONSTRAINT [FK_ORDER_DETAIL_ORDERS]
GO
ALTER TABLE [dbo].[ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAIL_PRODUCT] FOREIGN KEY([productid])
REFERENCES [dbo].[PRODUCT] ([productid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ORDER_DETAIL] CHECK CONSTRAINT [FK_ORDER_DETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_ACCOUNT] FOREIGN KEY([accountid])
REFERENCES [dbo].[ACCOUNT] ([accountid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_ACCOUNT]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_CATEGORY] FOREIGN KEY([categoryid])
REFERENCES [dbo].[CATEGORY] ([categoryid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_CATEGORY]
GO
USE [master]
GO
ALTER DATABASE [WebBanHang] SET  READ_WRITE 
GO
