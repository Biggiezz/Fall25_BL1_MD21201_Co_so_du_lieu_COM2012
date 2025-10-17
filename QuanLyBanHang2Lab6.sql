create database QuanLyBanHang2Lab6;

use QuanLyBanHang2Lab6;

create TABLE SANPHAM(
MaSP int Primary key,
MoTa NVARCHAR(50),
TenSP nvarchar(50),
Gia int,
Soluong int
);

insert into SANPHAM (MaSP, MoTa, TenSP, Gia, Soluong) Values
('01','Hảo Hảo',N'Sản Phẩm 01','1000000','2'),
('02','KOKOMI đại',N'Sản Phẩm 02','2000000','5'),
('03','OMACHI',N'Sản Phẩm 03','3000000','4'),
('04','Mì xào',N'Sản Phẩm 04','4000000','3'),
('05','Mì trộn',N'Sản Phẩm 05','500000','6');

select *FROM SANPHAM;

create table KHACHHANG(
MaKH varchar(50) primary key,
HoVaTenLot NVARCHAR(50),
Ten nvarchar(50),
Sodienthoai varchar(50),
Email VARCHAR(50),
Diachi varchar(50)
);

INSERT INTO KHACHHANG (MaKH, HoVaTenLot, Ten, Sodienthoai, Email, Diachi) VALUES
('KH01', N'Nguyễn Thị',' Trang', '0905123456','manhphuc300501@gmail.com', N'Hà Đông'),
('KH02', N'Trần Ngọc ','Mai', '0906234567','manhphuc3005@gmail.com', N'Cầu Giấy'),
('KH03', N'Phạm Bảo','Bình', '0907345678', 'manhphuc300503@gmail.com',N'Thanh Xuân'),
('KH04', N'Lê Thùy',' Dung', '0908456789','manhphuc300504@gmail.com', N'Hoàng Mai'),
('KH05', N'Hoang Văn',' Lợi', '0909567890','manhphuc300505@gmail.com', N'Đống Đa');

create table HOADON(
MaHD int primary key,
Ngaymua date,
MaKH varchar(50),
TrangThai NVARCHAR(50),
FOREIGN KEY (MaKH) references KHACHHANG(MaKH)
);

insert into HOADON(MaHD, Ngaymua, MaKH, TrangThai ) values
('13','2016-12-25','KH01','Chưa thanh toán'),
('22','2015-4-25','KH02','Đã thanh toán'),
('33','2014-12-25','KH03','Chưa thanh toán'),
('44','2020-6-25','KH04','Đã thanh toán'),
('55','2025-7-25','KH05','Chưa thanh toán');

CREATE table HoaDonChiTiet(
MaHoaDonChiTiet int PRIMARY KEY,
MaHD int,
MaSP int,
SoLuong int,
FOREIGN KEY (MaHD) REFERENCES HOADON(MaHD),
FOREIGN KEY (MaSP) REFERENCES SANPHAM(MaSP)
);


INSERT INTO HoaDonChiTiet (MaHoaDonChiTiet, MaHD, MaSP, SoLuong) VALUES
(11, 13, 1, 2),
(12, 22, 3, 1),
(13, 33, 2, 5),
(14, 44, 5, 3),
(15, 55, 1, 1);

-- Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua

select HD.MaHD, HD.MaKH, HD.TrangThai, HD.Ngaymua, HDC.MaSP, HDC.SoLuong
from  HOADON HD
join HoaDonChiTiet HDC on HD.MaHD = HDC.MaHD;

-- Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với điều kiện maKhachHang = ‘KH001’

select HD.MaHD, HD.MaKH, HD.TrangThai, HDC.MaSP, HDC.SoLuong, HD.Ngaymua
from HOADON HD
JOIN HoaDonChiTiet HDC on HD.MaHD = HDC.MaHD
WHERE HD.MaKH = 'KH01';

-- Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành tiền. Với thành tiền= donGia* soLuong

select HD.MaHD, HD.Ngaymua, SP.TenSP, SP.Gia, HDC.Soluong,
(SP.Gia * HDC.Soluong) AS THANHTIEN
from HOADON HD
JOIN HoaDonChiTiet HDC on HD.MaHD = HDC.MaHD
join SANPHAM SP ON HDC.MaSP = SP.MaSP;

-- Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh toán.
-- (concat) là hàm dùng trong SQL dùng để ghép nối 2 hay nhiều chuỗi với nhau
select 
CONCAT(KH.HoVaTenLot, '', KH.Ten) as HoTenKhachHang,
KH.Email, KH.Sodienthoai, HD.MaHD, HD.TrangThai,
Sum(SP.Gia * HDC.Soluong) as ThanhTien
from KHACHHANG KH
JOIN HOADON HD on KH.MaKH = HD.MaKH
JOIN HoaDonChiTiet HDC on HD.MaHD = HDC.MaHD
join SANPHAM SP ON HDC.MaSP = SP.MaSP
WHERE HD.TrangThai = N'Chưa thanh toán'
group by 
HD.MaHD, CONCAT(KH.HoVaTenLot,'', KH.Ten), KH.Email, KH.Sodienthoai,
HD.MaHD, HD.TrangThai;


--  Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần của cột tổng tiền.
select HD.MaHD, HD.Ngaymua,
Sum(SP.Gia * HDC.Soluong) as ThanhTien
from HOADON HD
JOIN HoaDonChiTiet HDC on HD.MaHD = HDC.MaHD
join SANPHAM SP ON HDC.MaSP = SP.MaSP
GROUP BY HD.MaHD, HD.Ngaymua
having Sum(SP.Gia * HDC.Soluong) >= 500000
ORDER BY ThanhTien desc;



