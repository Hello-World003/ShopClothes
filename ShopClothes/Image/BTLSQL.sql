create DATABASE QLcuahangDienThoai;
 use QLcuahangDienThoai
 create table tblNHANVIEN
 (sMaNV NVARCHAR(5)NOT NULL primary key,
 sTenNV NVARCHAR(30)NOT NULL,
 sDiaChi NVARCHAR(30)  NULL,
 dNgaySinh DATETIME,
 dNgayVaoLam DATETIME,
 sQueQuan NVARCHAR(30) NULL,
 sSDT NVARCHAR(10) UNIQUE,
sCMND NVARCHAR(12) UNIQUE)

alter table tblNHANVIEN
ADD CONSTRAINT CK_LamViec CHECK (DATEDIFF (DAY,dNgaySinh,dNgayVaoLam)/365 >=18);


CREATE TABLE tblLOAIMATHANG
(sMaLoai NVARCHAR(5) PRIMARY KEY NOT NULL,
sTenLoaiHang NVARCHAR(30))

CREATE TABLE tblNHACUNGCAP
(sMaNCC NVARCHAR(5) PRIMARY KEY NOT NULL,
sTenNCC NVARCHAR(30)NOT NULL,
sDiaChi NVARCHAR(30)  NULL,
 sSDT NVARCHAR(10) UNIQUE
)

CREATE TABLE tblMATHANG
(sMaMH NVARCHAR(5) PRIMARY KEY NOT NULL,
sTenMH NVARCHAR(50)NOT NULL,
sMaLoai NVARCHAR(5)NOT NULL,
sMaNCC NVARCHAR(5) NOT NULL,
fSoLuong FLOAT
CONSTRAINT FK_MatHang_LoaiHang foreign key(sMaLoai) 
references tblLOAIMATHANG(sMaLoai),
CONSTRAINT FK_MatHang_NCC FOREIGN KEY(sMaNCC)
REFERENCES tblNHACUNGCAP(sMaNCC)
)

CREATE TABLE tblKHACHHANG
(iMaKH int identity(1,1) not null primary key,
sTenKH NVARCHAR(30)NOT NULL,
bGT bit NOT NULL,
sDiaChi NVARCHAR(30)NULL,
sSDT NVARCHAR(10)UNIQUE
)
----giới tính --nam=1-----nữ=0-----

CREATE TABLE tblHOADON
(iMaHD int PRIMARY KEY not null,
dNgayLap Datetime ,
sMaNV NVARCHAR(5)NOT NULL,
iMaKH INT,
sHTThanhToan NVARCHAR(20)NOT null,
fDaTra float,
fConNo float,
CONSTRAINT FK_HoaDon_Nhanvien FOREIGN KEY(sMaNV)
REFERENCES tblNHANVIEN(sMaNV),
CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY(iMaKH)
REFERENCES tblKHACHHANG(iMaKH)
)

CREATE TABLE tblHOADONCHITIET
(iMaHD int NOT NULL,
sMaMH NVARCHAR(5)NOT NULL,
iSoLuong int NOT NULL,
fGiaBan FLOAT,
fGiamGia FLOAT,
constraint PK_maHD_maMH primary key (iMaHD, sMaMH),
CONSTRAINT FK_HoaDonChiTiet_MatHang FOREIGN KEY(sMaMH)
REFERENCES tblMATHANG(sMaMH),
CONSTRAINT FK_HoaDonChiTiet_HoaDon FOREIGN KEY(iMaHD)
REFERENCES tblHOADON(iMaHD)
)

CREATE TABLE tblDONNHAPHANG
(iMDN int PRIMARY KEY NOT NULL,
sMaNV NVARCHAR(5)NOT NULL,
dNgayLap DATETIME,
CONSTRAINT FK_DonNhapHang_NhanVien FOREIGN KEY(sMaNV)
references tblNHANVIEN(sMaNV)
)

CREATE TABLE tblDONNHAPCHITIET
(iMDN int NOT NULL ,
sMaMH NVARCHAR(5) NOT NULL,
iSoLuongChungTu int,
iThucNhap int,
fGiaNhap float
)

alter table tblDONNHAPCHITIET
ADD CONSTRAINT PK_DonNhapChiTiet primary key (iMDN,sMaMH),
CONSTRAINT PK_DonNhapChiTiet_NhapHang FOREIGN KEY(iMDN)
references tblDONNHAPHANG(iMDN),
CONSTRAINT PK_DonNhapChiTiet_MatHang FOREIGN KEY(sMaMH)
references tblMATHANG(sMaMH);

---------------------------------------
--nhập dữ liệu vào --------------------

 use QLcuahangDienThoai
 --nhập dữ liệu vào bảng Nhân Viên----------
 insert into tblNHANVIEN(sMaNV,sTenNV,sDiaChi,dNgaySinh,dNgayVaoLam,sQueQuan,sSDT,sCMND)
 values('nv01',N'Trịnh Đình Huy',	N'Thanh Xuân',		'03/05/1992',	'06/04/2017',	N'Hà Nội',		'0331135679',	'100119922587'),
 ('nv02',	N'Phạm Ngọc Tuấn',		N'Hoàng Mai',		'06/09/1992',	'06/04/2017',	N'Quảng Ninh',	'0332220176',	'100119924136'),
('nv03',	N'Lương Ngọc Tuấn',		N'Nam Từ Liêm',		'11/10/1993',	'06/04/2017',	N'Bắc Ninh',	'0333983412',	'100119936292'),
('nv04',	N'Nguyễn Trọng Cử',		N'Hoàng Mai',		'07/08/1991',	'12/12/2017',	N'Thái Nguyên',	'0334865927',	'100119913279'),
('nv05',	N'Vũ Minh Lượng',		N'Hoàn Kiếm',		'09/27/1991',	'12/27/2017',	N'Hải Phòng',	'0335996512',	'100119914594'),
('nv06',	N'Mai Quốc Anh',		N'Hoàn Kiếm',		'10/14/1993',	'06/19/2019',	N'Bắc Ninh',	'0336597402',	'100119936751'),
('nv07',	N'Kiều Bảo Chi',		N'Long Biên',		'03/05/1995',	'06/16/2019',	N'Ninh Bình',	'0337423591',	'100119950893'),
('nv08',	N'Nguyễn Mai Anh',		N'Thanh Xuân',		'12/04/1995',	'12/14/2019',	N'Hà Nội',		'0338345789',	'100119951724'),
('nv09',	N'Phạm Hải Nam',		N'Tây Hồ',			'04/04/1992',	'09/01/2020',	N'Hà Nam',		'0339172394',	'100119921171'),
('nv10',	N'Nguyễn Thu Phương',	N'Cầu Giấy',		'01/07/1995',	'09/01/2020',	N'Hải Phòng',	'0334674235',	'100119952986'),
('nv11',	N'Phạm Hà Trang',		N'Đống Đa',			'10/07/1996',	'09/01/2020',	N'Bình Dương',	'0334764528',	'100119964774'),
('nv12',	N'Nguyễn Thu Hương',	N'Cầu Giấy',		'12/06/1997',	'05/05/2020',	N'Hải Dương',	'0334169372',	'100119975429')



---nhập dữ liệu vào bảng Nhà Cung Cấp----------
insert into tblNHACUNGCAP(sMaNCC,sTenNCC,sDiaChi,sSDT)
values('Sp01',		'Apple',	'America',	'024-010101'),
(		'Sp02',		'Samsung',	'Korea',	'024-020202'),
(		'Sp03',		'Oppo',		'China',	'024-030303'),
(		'Sp05',		'Asus',		'Taiwan',	'024-050505'),
(		'Sp06',		'Anker',	'China',	'024-060606'),
(		'Sp07',		'Ugreen',	'China',	'024-070707')



---nhập dữ liệu vào bảng Loại Mặt Hàng----------
insert into tblLOAIMATHANG(sMaLoai,sTenLoaiHang)
values('lh1',	N'Điện thoại'),
('lh2',	N'Sạc'),
('lh3',	N'Cáp'),
('lh4',	N'Tai nghe')


 ---nhập dữ liệu vào bảng Mặt Hàng----------
 insert into tblMATHANG(sMaMH,sTenMH,sMaLoai,sMaNCC,fSoLuong)
 values('as01', 	'ASUS ROG Phone 6', 				'lh1',	'Sp05',	5),
('as02',	'ASUS ROG Phone 5',							'lh1',	'Sp05',	10),
('as03',	'ASUS ROG Phone 5s',						'lh1',	'Sp05',	5),
('ip01',	'Iphone 13 Pro Max',						'lh1',	'Sp01',	15),
('ip02',	'Iphone 14 Plus',							'lh1',	'Sp01',	15),
('op01',	'Oppo Reno8',								'lh2',	'Sp03',	20),
('pk01',	'Apple AirPods 3',							'lh3',	'Sp01',	20),
('pk02',	'Samsung Galaxy Buds2',						'lh4',	'Sp02',	20),
('op02',	'Oppo Find X3 Pro 5G',						'lh1',	'Sp03',	10),
('pk04',	'Oppo Enco Air',							'lh4',	'Sp03',	20),
('pk06',	'Anker PowerPort III 65W', 					'lh2',	'Sp06',	10),
('pk07',	'Anker PowerPort 3 36W',					'lh2',	'Sp06',	10),
('pk08',	'Anker PowerPort 2 24W',					'lh2',	'Sp06',	10),
('pk09',	'Type-C Ugreen US286 60W',					'lh3',	'Sp07',	15),
('pk10',	'Anker Powerline III USB-C to Lightning',	'lh3',	'Sp06',	15),
('pk11',	'Anker Powerline A8133 Micro USB',			'lh3',	'Sp06',	15),
('ss01',	'Samsung Z Flip 3',							'lh1',	'Sp02',	10),
('ss02',	'Samsung Z Flip 4',						 	'lh1',	'Sp02',	15)



 ---nhập dữ liệu vào bảng Khách Hàng---------
 insert into tblKHACHHANG(sTenKH,bGT,sDiaChi,sSDT)
 values(		N'Lưu Quốc Tuấn',		1,		N'Thanh Xuân',	'0331883271'),
		(		N'Bạch Thanh Vân',		0,		N'Hà Đông',		'0332161123'),
		(		N'Phan Văn Hải',		1,		N'Cầu Giấy',	'0333235907'),
		(		N'Nhữ Quỳnh Phương',	0,		N'Đống Đa',		'0334954760'),
		(		N'Thiều Bảo Ngọc',		0,		N'Hoàng Mai',	'0335523884'),
		(		N'Nguyễn Bảo Châu',		0,		N'Hà Đông',		'0336341974'),
		(		N'Lê Viết Tuấn',		1,		N'Hà Đông',		'0337658078'),
		(		N'Lê Thiều Quyên',		0,		N'Hoàn Kiếm',	'0338897643'),
		(		N'Phạm Hải Nam',		1,		N'Cầu Giấy',	'0339552934'),
		(		N'Đặng Ngọc Tân',		1,		N'Hà Đông',		'0334668888'),
		(		N'Chu Quỳnh Mai',		0,		N'Hà Đông',		'0338881234')

 


 ---nhập dữ liệu vào bảng Hóa Đơn-----------
 insert into tblHOADON(iMaHD,dNgayLap,sMaNV,iMaKH,sHTThanhToan,fDaTra,fConNo)
VALUES   ( 146,	'01/11/2020',	'nv07',		11,	N'Trả góp',			2000000,	990000		),
		( 147,	'08/25/2022',	'nv11',		1,	N'Thẻ tín dụng',	20590000,	0			),
		( 148,	'08/31/2022',	'nv04',		2,	N'Trả góp',			12400000,	5290000		),
		( 149,	'05/09/2022',	'nv07',		3,	N'Tiền mặt',		3220000,	0			),
		( 150,	'11/09/2022',	'nv04',		4,	N'Trả góp',			4997000,	9993000		),
		( 151,	'09/19/2022',	'nv05',		5,	N'Thẻ tín dụng',	22950000,	0			),
		( 152,	'07/10/2022',	'nv08',		6,	N'Thẻ tín dụng',	19980000,	0			),
		( 153,	'10/10/2022',	'nv11',		7,	N'Tiền mặt',		24240000,	0			),
		( 154,	'10/10/2022',	'nv11',		8,	N'Tiền mặt',		8690000,	0			),
		( 155,	'12/10/2022',	'nv07',		9,	N'Trả góp',			25000000,	12490000	),
		( 156,	'11/19/2022',	'nv05',		10,	N'Thẻ tín dụng',	48780000,	0			),
		( 157,	'01/11/2022',	'nv07',		11,	N'Trả góp',			2000000,	990000		)




 ---nhập dữ liệu vào bảng Hóa Đơn Chi Tiết-----------
 INSERT INTO tblHOADONCHITIET(iMaHD,sMaMH,iSoLuong,fGiaBan,fGiamGia)
 VALUES (146,	'pk01',		3,	4590000,	0),
		(147,	'ss02',		1,	20590000,	0),
		( 148,	'as03',		1,	17690000,	0),
		( 149,	'pk06',		2,	1030000,	0),
		( 150,	'ss01',		1,	14990000,	0),
		( 151,	'pk01',		5,	4590000,	0),
		( 152,	'op02',		1,	18790000,	0),
		( 153,	'as01',		1,	24240000,	0),
		( 154,	'op01',		1,	8690000,	0),
		( 155,	'ip01',		1,	37490000,	0),
		( 156,	'ip02',		2,	24390000,	0),
		( 157,	'pk02',		1,	2990000,	0)
 INSERT INTO tblHOADONCHITIET(iMaHD,sMaMH,iSoLuong,fGiaBan,fGiamGia)
 values(149,	'pk09',		2,	580000,	0),
 		( 152,	'pk04',		1,	1190000,	0)


 ---nhập dữ liệu vào bảng Đơn Nhập Hàng-----------
 insert into tblDONNHAPHANG(iMDN,dNgayLap,sMaNV)
 values(127,		'08/22/2020',	'nv02'),
		(128,		'11/20/2020',	'nv01'),
		(129,		'02/18/2021',	'nv03'),
		(130,		'05/19/2021',	'nv01'),
		(131,		'08/17/2021',	'nv02'),
		(132,		'11/15/2021',	'nv12'),
		(133,		'02/13/2022',	'nv12')
insert into tblDONNHAPHANG(iMDN,dNgayLap,sMaNV)
values(134,	'05/14/2022',	'nv01'),
	(135,	'08/12/2022',	'nv02'),
	(136,	'11/10/2022',	'nv12')




 ---nhập dữ liệu vào bảng Đơn Nhập Chi Tiết-----------
 insert into tblDONNHAPCHITIET(iMDN,sMaMH,iSoLuongChungTu,iThucNhap,fGiaNhap)
 values(127,	'op01',	30,		25,		100000000),
		(128,	'pk06',	200,	180,	81000000),
		(129,	'pk09',	300,	290,	116000000),
		(130,	'op02',	40,		35,		385000000),
		(131,	'ss01',	50,		35,		420000000),
		(132,	'pk01',	70,		65,		136500000),
		(133,	'ip01',	30,		25,		600000000),
		(134,	'ss02',	40,		35,		595000000),
		(135,	'as01',	20,		20,		260000000),
		(136,	'ip02',	30,		20,		300000000)


 ----------------------------------------------------------------
 use QLcuahangDienThoai
 --Họ tên, quê quán, ngày sinh  của nhân viên có mã 'nv01'-Nhung
Select sTenNV, sQueQuan, dNgaySinh 
from tblNHANVIEN
where sMaNV='nv01';
--Danh sách nhân viên sinh trước năm 1995-Nhung
Select * from tblNHANVIEN
where year(dNgaySinh)<1995;
--Hóa đơn 153 có những mã mặt hàng nào và số lượng của chúng-Nhung
select sMaMH, iSoLuong from tblHOADONCHITIET
where iMaHD=153 ;
--Khách hàng nữ của cửa hàng-Nhung
SELECT * FROM tblKHACHHANG
WHERE bGT=0;
--Nhà cung cấp có địa chỉ ở Trung Quốc
SELECT * FROM tblNHACUNGCAP
WHERE sDiaChi='China';
--các đơn do nhân viên Phạm Hà Trang lập
SELECT iMaHD
FROM tblHOADON
WHERE sMaNV=
(SELECT sMaNV
FROM tblNHANVIEN
WHERE sTenNV= N'Phạm Hà Trang'
)
--tên và sdt của khách hàng đã mua hàng vào tháng 8 năm 2022
SELECT sTenKH,sSDT
FROM tblKHACHHANG A, tblHOADON B
WHERE A.iMaKH=B.iMaKH AND MONTH(dNgayLap)=8 AND YEAR(dNgayLap)=2022

--thông tin những nhân viên từng phụ trách nhập hàng 
SELECT *
FROM tblNHANVIEN
WHERE sMaNV IN
(SELECT sMaNV
FROM tblDONNHAPHANG)

--các nhà cung cấp của đơn nhập hàng tháng này
SELECT a.sMaNCC,a.sTenNCC
FROM tblNHACUNGCAP a,tblDONNHAPHANG b,tblDONNHAPCHITIET c,tblMATHANG d
WHERE MONTH(dNgayLap)=MONTH(GETDATE()) AND YEAR(dNgayLap)= YEAR(GETDATE())
AND a.sMaNCC=d.sMaNCC AND d.sMaMH=c.sMaMH AND c.iMDN=b.iMDN

--top 3 khách hàng nam mua nhiều nhất kềm số lần mua hàng của họ
SELECT TOP 3 a.iMaKH,sTenKH,COUNT(b.iMaHD) AS N'Số lần mua'
FROM tblKHACHHANG a,tblHOADON b,tblHOADONCHITIET c
WHERE a.iMaKH=b.iMaKH AND b.iMaHD=c.iMaHD 
GROUP BY a.iMaKH,sTenKH
ORDER BY COUNT(b.iMaHD) DESC


SELECT*FROM tblKHACHHANG
SELECT*FROM tblHOADON
SELECT*FROM tblHOADONCHITIET




---------------------------------------------------VIEW------------------------------------------------------------



--Cho tên, địa chỉ các nhà cung cấp của từng mặt hàng
CREATE VIEW VNhaCungCapMatHang
AS 
SELECT tblMATHANG.sMaMH, tblNHACUNGCAP.sTenNCC, tblNHACUNGCAP.sDiaChi
FROM dbo.tblMATHANG INNER JOIN dbo.tblNHACUNGCAP
ON tblNHACUNGCAP.sMaNCC = tblMATHANG.sMaNCC


--CheckView--
SELECT * FROM dbo.VNhaCungCapMatHang


--Bảng gồm mã mặt hàng, tên mặt hàng, thành tiền của từ mặt hàng của từ mặt hàng trong hóa đơn số 149
ALTER VIEW VMatHangHoaDon_149
AS 
SELECT tblHOADONCHITIET.sMaMH, tblMATHANG.sTenMH, (tblHOADONCHITIET.iSoLuong * tblHOADONCHITIET.fGiaBan)-((tblHOADONCHITIET.fGiamGia/100)*tblHOADONCHITIET.fGiaBan) AS ThanhTien
FROM dbo.tblHOADONCHITIET INNER JOIN dbo.tblMATHANG
ON tblMATHANG.sMaMH = tblHOADONCHITIET.sMaMH
WHERE tblHOADONCHITIET.iMaHD=149

--CheckView--
SELECT * FROM dbo.VMatHangHoaDon_149



--Bảng gồm số hóa đơn, ngày lập, tên người lập, tổng số mặt hàng và giá trị hóa đơn của năm 2020

CREATE VIEW VHoaDonNam_2020
AS 
SELECT tblHOADON.iMaHD, tblHOADON.dNgayLap, tblNHANVIEN.sTenNV, SUM(tblHOADONCHITIET.iSoLuong) AS TongSoMatHang, SUM( (tblHOADONCHITIET.iSoLuong * tblHOADONCHITIET.fGiaBan)-((tblHOADONCHITIET.fGiamGia/100)*tblHOADONCHITIET.fGiaBan)) AS GiaTri
FROM dbo.tblHOADON INNER JOIN dbo.tblHOADONCHITIET
ON tblHOADONCHITIET.iMaHD = tblHOADON.iMaHD INNER JOIN dbo.tblNHANVIEN
ON tblNHANVIEN.sMaNV = tblHOADON.sMaNV
WHERE YEAR(tblHOADON.dNgayLap)=2020
GROUP BY tblHOADON.iMaHD ,tblHOADON.dNgayLap,tblNHANVIEN.sTenNV

--CheckView--
SELECT * FROM dbo.VHoaDonNam_2020





---------------------------------------------PROCEDURE-------------------------------------------------------------




--Hiện tên , địa chỉ và số điện thoại của khách hàng còn nợ tiền của số năm được truyền vào

CREATE PROCEDURE sp_KH_ConNo_Year(@Year int)
AS
BEGIN 
	SELECT tblKHACHHANG.sTenKH,tblKHACHHANG.sDiaChi, tblKHACHHANG.sSDT, SUM(tblHOADON.fConNo) AS ConNo
	FROM dbo.tblHOADON INNER JOIN dbo.tblHOADONCHITIET 
	ON tblHOADONCHITIET.iMaHD = tblHOADON.iMaHD INNER JOIN dbo.tblKHACHHANG
	ON tblKHACHHANG.iMaKH = tblHOADON.iMaKH
	WHERE YEAR(tblHOADON.dNgayLap)=@Year AND tblHOADON.fConNo!=0
	GROUP BY tblKHACHHANG.sTenKH,tblKHACHHANG.sDiaChi, tblKHACHHANG.sSDT
END

			--CheckProcedure--
			EXECUTE dbo.sp_KH_ConNo_Year @Year = 2022 -- int



--Thông tin hóa đơn do khách hàng đã mua (INPUT: tên)

ALTER PROCEDURE sp_Tim_Hoa_Don_Theo_Ten_KH(@Name nvarchar(100))
AS
BEGIN 
  SELECT * FROM dbo.tblHOADON INNER JOIN dbo.tblHOADONCHITIET
	ON tblHOADONCHITIET.iMaHD = tblHOADON.iMaHD INNER JOIN dbo.tblKHACHHANG
	ON tblKHACHHANG.iMaKH = tblHOADON.iMaKH
	WHERE tblKHACHHANG.sTenKH LIKE CONCAT(N'%',@Name)
	PRINT CONCAT(N'%',@Name)
END

			--CheckProcedure--
			EXECUTE dbo.sp_Tim_Hoa_Don_Theo_Ten_KH @Name = N'Tuấn' -- nvarchar(1)





--Viết thủ tục thêm một hóa đơn

SELECT * FROM dbo.tblHOADON

ALTER PROCEDURE sp_Them_Hoa_Don(@iMaHD int, 
								 @dNgayLap datetime,
								 @sMaNV nvarchar(5),
								 @iMaKH int,
								 @sHTThanhToan nvarchar(50),
								 @fDaTra float,
								 @fConNo float)
AS 
BEGIN 
    IF EXISTS(SELECT * FROM dbo.tblHOADON WHERE tblHOADON.iMaHD=@iMaHD)
		BEGIN 
		   PRINT( N'Đã tồn tại hóa đơn có mã ' + CAST(@iMaHD AS NVARCHAR(10)))
		   RETURN 
		END
	ELSE IF NOT EXISTS(SELECT * FROM dbo.tblNHANVIEN WHERE tblNHANVIEN.sMaNV=@sMaNV)
		BEGIN
			PRINT(N'Không tồn tại nhân viên có mã '+ @sMaNV +N' trong hệ thống !')
			RETURN
		END 
	ELSE IF NOT EXISTS(SELECT * FROM dbo.tblKHACHHANG WHERE tblKHACHHANG.iMaKH=@iMaKH)
		BEGIN
			PRINT(N'Không tồn tại khách hàng có mã '+ CAST(@iMaKH AS NVARCHAR(10)) +N' trong hệ thống !')
			RETURN
		END 
	ELSE IF(DATEDIFF(DAY,@dNgayLap,GETDATE())<0)
		BEGIN
			PRINT(N'Ngày lập phải nhỏ hơn hoặc bằng ngày hiện tại !')
			RETURN 
		END
	ELSE
		BEGIN
		    INSERT INTO dbo.tblHOADON
		    (
		        iMaHD,
		        dNgayLap,
		        sMaNV,
		        iMaKH,
		        sHTThanhToan,
		        fDaTra,
		        fConNo
		    )
		    VALUES
		    (   @iMaHD ,    -- iMaHD - int
		        @dNgayLap, -- dNgayLap - datetime
		        @sMaNV,  -- sMaNV - nvarchar(5)
		        @iMaKH, -- iMaKH - int
		        @sHTThanhToan,  -- sHTThanhToan - nvarchar(20)
		        @fDaTra, -- fDaTra - float
		        @fConNo  -- fConNo - float
		        )
		END

END
									
						

			--CheckProcedure--
			EXECUTE dbo.sp_Them_Hoa_Don @iMaHD = 158,                        -- int
										@dNgayLap = '2022-11-20 08:44:16', -- datetime
										@sMaNV = N'nv01',                      -- nvarchar(5)
										@iMaKH = 6,                        -- int
										@sHTThanhToan = N'Tiền mặt',               -- nvarchar(50)
										@fDaTra = 0.0,                     -- float
										@fConNo = 0.0                      -- float



--Nhận vào là các thông tin của đơn nhập, chi tiết đơn nhập, một xâu 'mã hàng 1, số lượng 1, giá hàng 1, mã hàng 2, 
--số lượng 2, giá hàng 2...' Tạo thủ tục thêm một đơn nhập hàng, chi tiết nhập hàng với(số lượng chứng từ
--=số lượng thực nhập) lấy ra từ xâu

--INPUT: đơn nhập, chi tiết đơn nhập, string


ALTER PROCEDURE sp_Tao_Don_Nhap_Hang_Chi_Tiet(@iMDN int,
											   @sMaNV nvarchar(5),
											   @dNgayLap datetime,
											   @string nvarchar(1000))
AS 
BEGIN 
	IF NOT EXISTS (SELECT * FROM dbo.tblDONNHAPHANG WHERE dbo.tblDONNHAPHANG.iMDN=@iMDN)
		 BEGIN
			  INSERT INTO dbo.tblDONNHAPHANG
			(
				iMDN,
				sMaNV,
				dNgayLap
			)
			VALUES
			(   @iMDN,   -- iMDN - int
				@sMaNV, -- sMaNV - nvarchar(5)
				@dNgayLap -- dNgayLap - datetime
				)
			PRINT(N'Đã thêm đơn nhập hàng '+ CAST(@iMDN AS NVARCHAR(10)))
		 END
	IF NOT EXISTS(SELECT * FROM dbo.tblNHANVIEN WHERE tblNHANVIEN.sMaNV=@sMaNV)
		BEGIN
			PRINT(N'Không tồn tại nhân viên có mã '+ @sMaNV +N' trong hệ thống !')
			RETURN 
		END
    IF(DATEDIFF(DAY,@dNgayLap,GETDATE())<0)
		BEGIN
			PRINT(N'Ngày lập phải nhỏ hơn hoặc bằng ngày hiện tại !')
			RETURN 
		END

DECLARE @index INT = CHARINDEX(',',@string)
WHILE(30=30)
	BEGIN
		DECLARE @s1 NVARCHAR(100);
		DECLARE @s2 NVARCHAR(100);
		DECLARE @s3 NVARCHAR(100);
		SET  @s1=SUBSTRING(@string,0,@index)
		SET @s1=LTRIM(@s1);
		SET @s1=RTRIM(@s1);
		IF not EXISTS (SELECT * FROM dbo.tblMATHANG WHERE tblMATHANG.sMaMH=@s1)
			BEGIN
				PRINT(N'Không tồn tại mặt hàng '+ @s1 +N' trong hệ thống !')
				RETURN 
			END
		ELSE IF EXISTS(SELECT * FROM dbo.tblDONNHAPCHITIET WHERE tblDONNHAPCHITIET.iMDN=@iMDN
						AND tblDONNHAPCHITIET.sMaMH=@s1)
					BEGIN 
						PRINT(N'Đã tồn tại mã đơn nhập '+ CAST(@iMDN AS NVARCHAR(10)) +N' và 
						mặt hàng '+ @s1 +N' trong hệ thống !')
						RETURN 
					END
		
		SET @string=SUBSTRING(@string,@index+1,LEN(@string))
		SET @index=CHARINDEX(',',@string)
	    SET  @s2=SUBSTRING(@string,0,@index)
		SET @s2=LTRIM(@s2)
		SET @s2=RTRIM(@s2)
		SET @s2 =CAST(@s2 AS int) 

		  SET @string=SUBSTRING(@string,@index+1,LEN(@string))
		  SET @index=CHARINDEX(',',@string)
		  IF(@index=0)
					  BEGIN
						 SET @s3=@string
						 SET @s3=LTRIM(@s3)
						 SET @s3=RTRIM(@s3)
						 SET @s3=CAST(@s3 AS int)
							INSERT INTO dbo.tblDONNHAPCHITIET
							(
								iMDN,
								sMaMH,
								iSoLuongChungTu,
								iThucNhap,
								fGiaNhap
							)
							VALUES
							(    @iMDN,    -- iMDN - int
								@s1,  -- sMaMH - nvarchar(5)
								@s2, -- iSoLuongChungTu - int
								@s2, -- iThucNhap - int
								@s3  -- fGiaNhap - float
								)
								BREAK
					  END
		  ELSE 
			  BEGIN 
				  SET  @s3=SUBSTRING(@string,0,@index)
				  SET @string=SUBSTRING(@string,@index+1,LEN(@string))
				  SET @index=CHARINDEX(',',@string)
				  SET @s3=LTRIM(@s3)
				  SET @s3=RTRIM(@s3)
				  SET @s3=CAST(@s3 AS int)
						INSERT INTO dbo.tblDONNHAPCHITIET
						(
							iMDN,
							sMaMH,
							iSoLuongChungTu,
							iThucNhap,
							fGiaNhap
						)
						VALUES
						(    @iMDN,    -- iMDN - int
							@s1,  -- sMaMH - nvarchar(5)
							@s2, -- iSoLuongChungTu - int
							@s2, -- iThucNhap - int
							@s3  -- fGiaNhap - float
							)
         
					END
	 END
END

--CheckProcedure--
EXECUTE dbo.sp_Tao_Don_Nhap_Hang_Chi_Tiet @iMDN = 142,                         -- int
                                          @sMaNV = N'nv01',                      -- nvarchar(5)
                                          @dNgayLap = '2022-10-20 10:45:43', -- datetime
                                          @string = N'ip02,50,30000000,ss02,4,4343'                      -- nvarchar(1000)




--Nhập vào một giá trị, mã sản phẩm. Nếu (giá bán * số lượng) < giá trị của mã 
--đó thì set giá sửa (giá bán= giá trị /số lượng)


ALTER PROCEDURE sp_Sua_gia_Ban(@cost int, @sMaSp nvarchar(5))
AS
BEGIN 

	IF EXISTS(SELECT * FROM dbo.tblHOADONCHITIET WHERE dbo.tblHOADONCHITIET.sMaMH=@sMaSp AND @cost> (tblHOADONCHITIET.iSoLuong* tblHOADONCHITIET.fGiaBan)) 
		PRINT N'Đã sửa giá bán của sản phẩm '+ @sMaSp + N' trong chi tiết hóa đơn'

	UPDATE dbo.tblHOADONCHITIET
	SET tblHOADONCHITIET.fGiaBan=@cost/tblHOADONCHITIET.iSoLuong
	WHERE tblHOADONCHITIET.sMaMH=@sMaSp AND @cost> (tblHOADONCHITIET.iSoLuong* tblHOADONCHITIET.fGiaBan)

END


--CheckProcedure--
EXECUTE dbo.sp_Sua_gia_Ban @cost = 15100000,   -- int
                           @sMaSp = N'pk01' -- nvarchar(5)





---------------------------------------------TRIGGER---------------------------------------------------------



--Thêm cột 'SoLanMuaHang' vào bảng khách hàng, tự động cập nhật cột mới mỗi khi thêm một hóa đơn


			--Them Cot 'SoLanMuaHang'--
			ALTER TABLE dbo.tblKHACHHANG
			ADD iSoLanMuaHang INT NOT NULL DEFAULT(0)
			SELECT * FROM dbo.tblKHACHHANG


			--Update Số lần mua hàng trên bảng KHACHHANG--
			DECLARE @iMaKh INT 
			DECLARE @iSolan INT 
			DECLARE duyet CURSOR FOR
				SELECT tblHOADON.iMaKH, COUNT(tblHOADON.iMaHD)
				FROM dbo.tblHOADON
				GROUP BY tblHOADON.iMaKH
			OPEN duyet
			FETCH NEXT FROM duyet
			INTO @iMaKh,@iSolan

			WHILE @@FETCH_STATUS=0
			BEGIN 
				UPDATE dbo.tblKHACHHANG
				SET tblKHACHHANG.iSoLanMuaHang=@iSolan
				WHERE tblKHACHHANG.iMaKH=@iMaKh

				FETCH NEXT FROM duyet
				INTO @iMaKh,@iSolan
			END
			CLOSE duyet
			DEALLOCATE duyet


--Trigger Update số lần mua hàng Auto--
  ALTER TRIGGER trg_Insert_HoaDon
  ON dbo.tblHOADON
  AFTER INSERT
  AS
  BEGIN 
  DECLARE @iMakh INT 
	SELECT @iMaKh=Inserted.iMaKH FROM Inserted
	UPDATE dbo.tblKHACHHANG
	SET tblKHACHHANG.iSoLanMuaHang=tblKHACHHANG.iSoLanMuaHang+1
	WHERE tblKHACHHANG.iMaKH=@iMakh
	PRINT N'Đã tăng số lần mua hàng khách hàng '+ CAST(@iMaKh AS NVARCHAR(5))
  END


								  --Check Trigger--
								  INSERT INTO dbo.tblHOADON
								  (
									  iMaHD,
									  dNgayLap,
									  sMaNV,
									  iMaKH,
									  sHTThanhToan,
									  fDaTra,
									  fConNo
								  )
								  VALUES
								  (   299,    -- iMaHD - int
									  GETDATE(), -- dNgayLap - datetime
									  N'nv07',  -- sMaNV - nvarchar(5)
									  11, -- iMaKH - int
									  N'Tiền mặt',  -- sHTThanhToan - nvarchar(20)
									  0, -- fDaTra - float
									  0  -- fConNo - float
									  )




--Thêm cột 'Thuong' vào bảng nhân viên. Nếu như khi thêm vào bảng hóa đơn chi tiết làm cho 
--hóa đơn thành trên 3 sản phẩm mà không còn nợ tiền thì cập nhật thưởng của nhân viên đó bằng 5%
--giá trị hóa đơn



--Thêm cột 'fThuong' vào bảng nhân viên
ALTER TABLE dbo.tblNHANVIEN
ADD fThuong FLOAT NOT NULL DEFAULT(0.0)





--Cap nhat tien thuong nhan vien--
DECLARE @sMaNV NVARCHAR(5)
DECLARE @iMahd INT 
DECLARE @fConNo FLOAT
DECLARE @soMH INT 
DECLARE @Tong INT 

DECLARE duyetHD CURSOR FOR 
	SELECT tblHOADON.sMaNV, dbo.tblHOADONCHITIET.iMaHD,SUM(tblHOADON.fConNo), COUNT(tblHOADONCHITIET.sMaMH) AS soMh,
SUM((tblHOADONCHITIET.iSoLuong * tblHOADONCHITIET.fGiaBan)-((tblHOADONCHITIET.iSoLuong * tblHOADONCHITIET.fGiaBan*(tblHOADONCHITIET.fGiamGia/100))))
AS Tong
FROM dbo.tblHOADON INNER JOIN dbo.tblHOADONCHITIET
ON tblHOADONCHITIET.iMaHD = tblHOADON.iMaHD
GROUP BY tblHOADON.sMaNV, dbo.tblHOADONCHITIET.iMaHD

OPEN duyetHD
FETCH NEXT FROM duyetHD
INTO @sMaNV,@iMahd,@fConNo, @soMH, @Tong
WHILE @@FETCH_STATUS=0
BEGIN
	IF(@fConNo=0 AND @soMH>=3)
	BEGIN
	    UPDATE dbo.tblNHANVIEN
	SET tblNHANVIEN.fThuong+=@Tong *0.05
	WHERE tblNHANVIEN.sMaNV=@sMaNV
	END

	FETCH NEXT FROM duyetHD
	INTO @sMaNV,@iMahd,@fConNo, @soMH, @Tong
END
CLOSE duyetHD
DEALLOCATE duyetHD

--Test--
INSERT INTO dbo.tblHOADONCHITIET
(
    iMaHD,
    sMaMH,
    iSoLuong,
    fGiaBan,
    fGiamGia
)
VALUES
(   149,    -- iMaHD - int
    N'ip01',  -- sMaMH - nvarchar(5)
    2,    -- iSoLuong - int
    3000000, -- fGiaBan - float
    0  -- fGiamGia - float
    )

	
--Tạo trigger--
CREATE TRIGGER trg_Insert_ChiTietHD
ON dbo.tblHOADONCHITIET
AFTER INSERT
AS 
BEGIN
	DECLARE @iSoHD INT 
	SELECT @iSoHD=Inserted.iMaHD
	FROM Inserted

	DECLARE @soMH INT 
	SELECT @soMH=COUNT(tblHOADONCHITIET.sMaMH) FROM dbo.tblHOADONCHITIET
	WHERE tblHOADONCHITIET.iMaHD=@iSoHD

	SELECT * FROM dbo.tblHOADONCHITIET

	DECLARE @ConNo FLOAT
	SELECT @ConNo=SUM(tblHOADON.fConNo)
	FROM dbo.tblHOADON
	WHERE tblHOADON.iMaHD=@iSoHD

	DECLARE @Tong FLOAT
	SELECT @Tong=SUM((tblHOADONCHITIET.iSoLuong * tblHOADONCHITIET.fGiaBan)-((tblHOADONCHITIET.iSoLuong * tblHOADONCHITIET.fGiaBan*(tblHOADONCHITIET.fGiamGia/100))))
	FROM dbo.tblHOADONCHITIET
	WHERE tblHOADONCHITIET.iMaHD=@iSoHD

	DECLARE @MaNV NVARCHAR(5)
	SELECT @MaNV=tblHOADON.sMaNV
	FROM dbo.tblHOADON
	WHERE tblHOADON.iMaHD=@iSoHD


	IF (@soMH>=3 AND @ConNo=0)
	BEGIN
	    UPDATE dbo.tblNHANVIEN
		SET tblNHANVIEN.fThuong+=@Tong *0.05
		WHERE tblNHANVIEN.sMaNV=@MaNV
		PRINT N'Đã thưởng cho nhân viên '+ @MaNV
	END

END

--Test Trigger--
INSERT INTO dbo.tblHOADONCHITIET
(
    iMaHD,
    sMaMH,
    iSoLuong,
    fGiaBan,
    fGiamGia
)
VALUES
(   152,    -- iMaHD - int
    N'ip01',  -- sMaMH - nvarchar(5)
    1,    -- iSoLuong - int
    3000000, -- fGiaBan - float
    0  -- fGiamGia - float
    )
















