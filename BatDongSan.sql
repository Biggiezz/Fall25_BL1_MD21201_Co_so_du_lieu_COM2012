CREATE DATABASE QuanLyBDS;
 
USE QuanLyBDS;

CREATE TABLE VanPhong(
maVanPhong VARCHAR(50) PRIMARY KEY,
diaChi NVARCHAR(50) 
);

CREATE TABLE NhanVien(
maNhanVien VARCHAR(50) PRIMARY KEY,
tenNhanVien NVARCHAR(50),
maVanPhong VARCHAR(50),
truongPhong NVARCHAR(50),
ngaySinh DATE,
FOREIGN KEY (maVanPhong) REFERENCES VanPhong(maVanPhong)
);


CREATE TABLE NguoiThan(
maThanNhan VARCHAR(50) PRIMARY KEY,
ten NVARCHAR(50),
ngaySinh DATE,
moiQuanHe NVARCHAR(50),
maNhanVien VARCHAR(50),
FOREIGN KEY (maNhanVien) REFERENCES NhanVien(maNhanVien)
);

CREATE TABLE ChuSoHuu(
maChuSoHuu VARCHAR(50) PRIMARY KEY,
ten NVARCHAR(50),
diaChi NVARCHAR(50),
soDienThoai INT

);


CREATE TABLE BatDongSan(
maBatDongSan VARCHAR(50) PRIMARY KEY,
diaChi NVARCHAR(50),
tenChuSoHuu NVARCHAR(50),
maVanPhong VARCHAR(50),
maChuSoHuu VARCHAR(50),
FOREIGN KEY (maVanPhong) REFERENCES VanPhong(maVanPhong),
FOREIGN KEY (maChuSoHuu) REFERENCES ChuSoHuu(maChuSoHuu)
);

-- Thêm cột số điện thoại cho bảng nhân viên
ALTER TABLE NhanVien
ADD COLUMN SoDienThoai VARCHAR(50);

-- Thêm ràng buộc cho tên nhân viên không được để trống
ALTER TABLE NhanVien
ADD CONSTRAINT
CK_tenNhanVien_notnull CHECK (tenNhanVien IS NOT NULL);

-- Xóa ràng buộc
ALTER TABLE NhanVien
DROP CONSTRAINT CK_tenNhanVien_notnull;

-- Thêm nội dung cho bảng văn phòng
INSERT INTO VanPhong(maVanPhong, diaChi) VALUES
('VP1','Hà Nội'),
('VP2','Quảng Ninh'),
('VP3','Hải Phòng'
);

-- Kiểm tra bảng văn phòng
SELECT *FROM VanPhong;

-- Thêm cột số điện thoại cho bảng văn phòng
ALTER TABLE VanPhong
ADD COLUMN SoDienThoai VARCHAR(15);

-- Xóa cột số điện thoại khi cần

ALTER TABLE VanPhong
DROP COLUMN SoDienThoai;
