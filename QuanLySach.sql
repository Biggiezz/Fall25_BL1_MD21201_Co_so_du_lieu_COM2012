CREATE DATABASE SinhVien;
USE SinhVien;
CREATE TABLE ThanhVien(
MaTV VARCHAR(50) PRIMARY KEY,
TenTV NVARCHAR(50) NOT NULL,
NgaySinh DATE,
DiaChi NVARCHAR(50)
);
INSERT INTO ThanhVien(MaTV, TenTV, NgaySinh, DiaChi) VALUES
('TV01', N'Nguyễn Mạnh Phúc','2001-05-30',N'Quảng Ninh'),
('TV02', N'Trần Văn Vĩ','2002-05-21',N'Hà Nội'),
('TV03', N'Đặng Mạnh Hoàng','2003-06-17',N'Quảng Bình'),
('TV04', N'Hoàng Quang Đông','2004-02-19',N'Hà Tĩnh'),
('TV05', N'Bùi Văn Hưng','2005-10-05',N'Hưng Yên');
SELECT *FROM ThanhVien;
CREATE TABLE Sach(
MaSach VARCHAR(50) PRIMARY KEY,
TenSach NVARCHAR(50),
TacGia NVARCHAR(50),
SoLuongBan INT
);
INSERT Into Sach(MaSach,TenSach,TacGia,SoLuongBan) VALUES
('SO1',N'Lập trình C',N'Phạm Trang','10'),
('SO2',N'Lập trình Flutter',N'Bùi Bình','20'),
('SO3',N'Lập trình hướng đối tượng',N'Mạnh Phúc','5'),
('SO4',N'Lập trình Java',N'Trần Yến','10'),
('SO5',N'Lập trình C++',N'Thùy Linh','15');
SELECT *FROM Sach;

CREATE TABLE MuonSach(
MaMuon VARCHAR(50) PRIMARY KEY,
NgayMuon DATE,
NgayTra DATE,
MaTV VARCHAR(50),
MaSach VARCHAR(50),
FOREIGN KEY (MaTV) REFERENCES ThanhVien(maTV),
FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);
-- Thêm cột số điện thoại vào bảng thành viên

ALTER TABLE ThanhVien
ADD COLUMN SoDienThoai VARCHAR(15);

SELECT *FROM ThanhVien;

-- Xóa cột số diện thoại trong bảng thành viên
ALTER TABLE ThanhVien
DROP COLUMN SoDienThoai;

-- Thêm ràng buộc số lượng bản > 0

ALTER TABLE Sach
ADD CONSTRAINT
CK_Sach_SoLuongBan CHECK (SoLuongBan > 0);

-- Xóa ràng buộc CHECK(SoLuongBan > 0)
ALTER TABLE Sach
DROP CONSTRAINT
CK_Sach_SoLuongBan;
