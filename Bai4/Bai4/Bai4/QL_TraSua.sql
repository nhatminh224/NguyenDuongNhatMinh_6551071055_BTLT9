CREATE DATABASE QL_TraSua;
GO
USE QL_TraSua;
GO
-- Bảng DanhMucMon
CREATE TABLE DanhMucMon (
    MaDM INT IDENTITY(1,1) PRIMARY KEY,
    TenDM NVARCHAR(50) NOT NULL
);
-- Bảng MonUong
CREATE TABLE MonUong (
    MaMon INT IDENTITY(1,1) PRIMARY KEY,
    TenMon NVARCHAR(100) NOT NULL,
    GiaBan DECIMAL(18,0) NOT NULL,
    DangBan BIT NOT NULL DEFAULT 1,
    MaDM INT NOT NULL,
    FOREIGN KEY (MaDM) REFERENCES DanhMucMon(MaDM)
);
-- Bảng HoaDon
CREATE TABLE HoaDon (
    MaHD INT IDENTITY(1,1) PRIMARY KEY,
    NgayLap DATETIME NOT NULL DEFAULT GETDATE(),
    TongTien DECIMAL(18,0) NOT NULL,
    HinhThucTT NVARCHAR(20) NOT NULL, 
    DaThanhToan BIT NOT NULL DEFAULT 0
);

-- Bảng ChiTietHoaDon
CREATE TABLE ChiTietHoaDon (
    MaHD INT NOT NULL,
    MaMon INT NOT NULL,
    SoLy INT NOT NULL,
    DonGia DECIMAL(18,0) NOT NULL,
    PRIMARY KEY (MaHD, MaMon),
    FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
    FOREIGN KEY (MaMon) REFERENCES MonUong(MaMon)
);

-- Chèn 4 Danh mục
INSERT INTO DanhMucMon (TenDM) VALUES 
(N'Trà sữa'), 
(N'Trà trái cây'), 
(N'Topping'), 
(N'Đồ ăn vặt');

-- Chèn 12 món
INSERT INTO MonUong (TenMon, GiaBan, DangBan, MaDM) VALUES 
(N'Trà sữa trân châu', 35000, 1, 1),
(N'Trà sữa matcha', 40000, 1, 1),
(N'Hồng trà sữa', 32000, 1, 1),
(N'Trà sữa khoai môn', 38000, 1, 1),
(N'Trà đào cam sả', 35000, 1, 2),
(N'Trà vải nhãn', 38000, 1, 2),
(N'Trà xoài mông cổ', 40000, 1, 2),
(N'Trân châu trắng', 5000, 1, 3),
(N'Pudding trứng', 8000, 1, 3),
(N'Thạch trái cây', 5000, 1, 3),
(N'Bánh tráng trộn', 20000, 1, 4),
(N'Cá viên chiên', 25000, 1, 4);