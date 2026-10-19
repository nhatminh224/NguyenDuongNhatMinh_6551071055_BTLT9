IF DB_ID(N'QL_ChiTieu') IS NULL CREATE DATABASE [QL_ChiTieu];
GO
USE [QL_ChiTieu];
CREATE TABLE dbo.ChiTieu(MaCT int IDENTITY PRIMARY KEY,NgayChi date NOT NULL,NoiDung nvarchar(100) NOT NULL,LoaiChi nvarchar(30) NOT NULL,SoTien decimal(18,0) NOT NULL,GhiChu nvarchar(200) NULL); INSERT dbo.ChiTieu VALUES (GETDATE(),N'Ăn sáng',N'Ăn uống',35000,NULL),(GETDATE(),N'Xe buýt',N'Đi lại',10000,NULL),(GETDATE(),N'Sách',N'Học tập',180000,NULL),(GETDATE(),N'Phim',N'Giải trí',120000,NULL),(DATEADD(day,-1,GETDATE()),N'Ăn trưa',N'Ăn uống',65000,NULL),(DATEADD(day,-2,GETDATE()),N'Gửi xe',N'Đi lại',15000,NULL),(DATEADD(day,-3,GETDATE()),N'Vở',N'Học tập',30000,NULL),(DATEADD(day,-4,GETDATE()),N'Ăn tối',N'Ăn uống',80000,NULL),(DATEADD(day,-5,GETDATE()),N'Khác',N'Khác',50000,NULL),(DATEADD(day,-6,GETDATE()),N'Cà phê',N'Ăn uống',45000,NULL);

