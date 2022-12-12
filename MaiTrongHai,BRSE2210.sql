set sql_safe_updates = 0;
drop database if exists ThucTap ;
create database if not exists ThucTap ;
use ThucTap ;

drop table if exists GiangVien ;
create table GiangVien(
magv int primary key auto_increment,
hoten varchar(50),
luong int 
);

drop table if exists SinhVien;
create table SinhVien(
masv int primary key auto_increment,
hoten varchar(50),
namsinh date,
quequan varchar(50)
);

drop table if exists DeTai;
create table DeTai(
madt int primary key auto_increment,
tendt varchar(50),
kinhphi int,
NoiThucTap varchar(50)
);

drop table if exists HuongDan;
create table HuongDan(
id int primary key auto_increment,
masv int,
madt int,
magv int,
ketqua varchar(50)
);

alter table HuongDan add constraint foreign key fk_HuongDan_GiangVien(magv)  references GiangVien(magv) ;
alter table HuongDan add constraint foreign key fk_HuongDan_SinhVien (masv)  references SinhVien(masv);
alter table HuongDan add constraint foreign key fk_HuongDan_DeTai(madt)  references DeTai(madt);

insert into GiangVien(magv,hoten,luong)
Values(1,'NguyenThiA','5000000'),
(2,'NguyenThiB','6000000'),
(3,'NguyenThiC','7000000');

insert into SinhVien(masv,hoten,namsinh,quequan)
Values(1,'NguyenA','2000/1/1','HaNoi'),
(2,'NguyenB','2000/2/2','HaTinh'),
(3,'NguyenC','2000/3/3','NgheAn'),
(4,'NguyenD','2000/4/4','ThanhHoa');

insert into DeTai(madt,tendt,kinhphi,NoiThucTap)
Values(1,'Cong Nghe Sinh Hoc','2000000','HaNoi'),
(2,'Ung Dung Toan','3000000','HaNoi'),
(3,'Moi Truong','4000000','HaNoi');

insert into HuongDan(id,masv,madt,magv,ketqua)
Values(1,1,1,1,'Dat'),
(2,2,2,2,'Dat'),
(3,3,3,3,'Truot');

-----
select *
from SinhVien sv
left join HuongDan hd on hd.masv = sv.masv
where hd.madt is null;
----
select *
from SinhVien sv
join HuongDan hd on hd.masv=sv.masv
join DeTai dt on dt.madt=hd.madt
where dt.tendt like '%Cong Nghe Sinh Hoc';
-----
select sv.masv,sv.hoten,
if (tendt is null ,'Chưa Có',tendt) as tendt
from SinhVien sv
left join HuongDan hd on hd.masv=sv.masv
left join DeTai dt on dt.madt=hd.madt;

----
alter table HuongDan add constraint foreign key fk_HuongDan_GiangVien(magv)  references GiangVien(magv) on delete cascade;
alter table HuongDan add constraint foreign key fk_HuongDan_SinhVien (masv)  references SinhVien(masv) on delete cascade;
alter table HuongDan add constraint foreign key fk_HuongDan_DeTai(madt)  references DeTai(madt) on delete cascade;




