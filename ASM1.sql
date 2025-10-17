-- Tạo database 
CREATE DATABASE ThuVien;

-- Sử dụng
use ThuVien;

-- Tạo bảng Sách
Create table Sach(
MaSach VARCHAR(50) PRIMARY KEY,
TieuDe NVARCHAR(50),
NhaXuatBan NVARCHAR(50),
TacGia NVARCHAR(50),
SoTrang int,
SoLuongBanSao int,
GiaTien DOUBLE,
NgayNhapKho DATE,
ViTriDatSach VARCHAR(50),
MaLoaiSach VARCHAR(50),
FOREIGN KEY (MaLoaiSach) REFERENCES LoaiSach(MaLoaiSach)
);

-- Tạo bảng Loại Sach
Create table LoaiSach(
MaLoaiSach VARCHAR(50) PRIMARY KEY,
TenLoaiSach NVARCHAR(50)
); 

-- Tạo bảng Thẻ Sinh Viên 
Create table TheSinhVien(
MaSinhVien VARCHAR(50) PRIMARY KEY,
Ten NVARCHAR(50),
NgayHetHan DATE,
ChuyenNganhHoc NVARCHAR(50),
FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien)
);

-- Tạo bảng Sinh Viên 
CREATE table SinhVien(
MaSinhVien VARCHAR(50 ) PRIMARY KEY,
Ten NVARCHAR(50),
Email VARCHAR(50),
SoDienThoai VARCHAR(50)
);

-- Tạo bảng Phiếu Mượn Sách 
Create table PhieuMuonSach(
MaMuon VARCHAR(50) PRIMARY KEY,
Ten NVARCHAR(50),
NgayMuon date,
NgayTra date,
MaSinhVien VARCHAR(50),
MaSach VARCHAR(50),
FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien),
FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);
