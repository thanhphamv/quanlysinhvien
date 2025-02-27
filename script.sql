USE [QuanLySinhVien]
GO
/****** Object:  Table [dbo].[DiemThi]    Script Date: 11/2/2024 5:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemThi](
	[maSV] [varchar](20) NOT NULL,
	[maMH] [varchar](20) NOT NULL,
	[lanThi] [int] NULL,
	[diemThi] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 11/2/2024 5:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[maGV] [varchar](20) NOT NULL,
	[tenGV] [nvarchar](50) NULL,
	[chuyenNganh] [nvarchar](50) NULL,
	[maKhoa] [varchar](20) NOT NULL,
 CONSTRAINT [PK__GiangVie__7A3E2D75033BB777] PRIMARY KEY CLUSTERED 
(
	[maGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 11/2/2024 5:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[maKhoa] [varchar](20) NOT NULL,
	[tenKhoa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Khoa__C79B8C22D2DF3C5A] PRIMARY KEY CLUSTERED 
(
	[maKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 11/2/2024 5:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[maLop] [varchar](20) NOT NULL,
	[tenLop] [nvarchar](50) NOT NULL,
	[maKhoa] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Lop__261ECAE33EEF7EC3] PRIMARY KEY CLUSTERED 
(
	[maLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonCuaKhoa]    Script Date: 11/2/2024 5:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonCuaKhoa](
	[maKhoa] [varchar](20) NOT NULL,
	[maMH] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 11/2/2024 5:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[maMH] [varchar](20) NOT NULL,
	[tenMH] [nvarchar](50) NULL,
	[soTiet] [int] NULL,
 CONSTRAINT [PK__MonHoc__7A3EDFA686EC8CE4] PRIMARY KEY CLUSTERED 
(
	[maMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 11/2/2024 5:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[maSV] [varchar](20) NOT NULL,
	[tenSV] [nvarchar](50) NULL,
	[gioiTinh] [nvarchar](10) NULL,
	[ngaySinh] [date] NULL,
	[noiSinh] [nvarchar](50) NULL,
	[maLop] [varchar](20) NOT NULL,
 CONSTRAINT [PK__SinhVien__7A227A6403DFFC40] PRIMARY KEY CLUSTERED 
(
	[maSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/2/2024 5:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tenDangNhap] [varchar](30) NOT NULL,
	[matKhau] [varchar](30) NOT NULL,
	[VaiTro] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiemThi]  WITH CHECK ADD  CONSTRAINT [FK__DiemThi__maMH__4316F928] FOREIGN KEY([maMH])
REFERENCES [dbo].[MonHoc] ([maMH])
GO
ALTER TABLE [dbo].[DiemThi] CHECK CONSTRAINT [FK__DiemThi__maMH__4316F928]
GO
ALTER TABLE [dbo].[GiangVien]  WITH CHECK ADD  CONSTRAINT [FK__GiangVien__maKho__44FF419A] FOREIGN KEY([maKhoa])
REFERENCES [dbo].[Khoa] ([maKhoa])
GO
ALTER TABLE [dbo].[GiangVien] CHECK CONSTRAINT [FK__GiangVien__maKho__44FF419A]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_Khoa] FOREIGN KEY([maKhoa])
REFERENCES [dbo].[Khoa] ([maKhoa])
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_Khoa]
GO
ALTER TABLE [dbo].[MonCuaKhoa]  WITH CHECK ADD  CONSTRAINT [FK__MonCuaKho__maKho__46E78A0C] FOREIGN KEY([maKhoa])
REFERENCES [dbo].[Khoa] ([maKhoa])
GO
ALTER TABLE [dbo].[MonCuaKhoa] CHECK CONSTRAINT [FK__MonCuaKho__maKho__46E78A0C]
GO
ALTER TABLE [dbo].[MonCuaKhoa]  WITH CHECK ADD  CONSTRAINT [FK__MonCuaKhoa__maMH__47DBAE45] FOREIGN KEY([maMH])
REFERENCES [dbo].[MonHoc] ([maMH])
GO
ALTER TABLE [dbo].[MonCuaKhoa] CHECK CONSTRAINT [FK__MonCuaKhoa__maMH__47DBAE45]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK__SinhVien__maLop__48CFD27E] FOREIGN KEY([maLop])
REFERENCES [dbo].[Lop] ([maLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK__SinhVien__maLop__48CFD27E]
GO
