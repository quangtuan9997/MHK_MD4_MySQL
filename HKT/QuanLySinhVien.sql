create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;
create table STUDENT(
studentId varchar(4) primary key,
studentName varchar(100) not null,
birthday date not null,
gender bit not null,
address text not null,
phoneNumber varchar(45)
);
create table SUBJECT(
subjectId varchar(4) primary key,
subjectName varchar(45) not null,
priority int(11) not null
);
create table MARK (
subjectId varchar(4) not null,
studentId varchar(4) not null,
point double not null,
foreign key(subjectId) references subject(subjectId),
foreign key(studentID) references student(studentId)
);
-- 2.1 thêm dữ liệu vào bảng
insert into student values
('S001','Nguyễn Thế Anh','1999-1-11',1,'Hà Nội','984678082'),
('S002','Đặng Bảo Trâm','1998-12-22',0,'Lào Cai','904982654'),
('S003','Trần Hà Phương','2000-5-5',0,'Nghệ An','947645363'),
('S004','Đỗ Tiến Mạnh','1999-3-26',1,'Hà Nội','983665353'),
('S005','Phạm Duy Nhất','1998-10-4',1,'Tuyên Quang','987242678'),
('S006','Mai Văn Thái','2002-6-22',1,'Nam Định','982654268'),
('S007','Giang Gia Hân','1996-11-10',0,'Phú Thọ','982364753'),
('S008','Nguyễn Ngọc Bảo My','1999-1-22',0,'Hà Nam','927867453'),
('S009','Nguyễn Tiến Đạt','1998-8-7',1,'Tuyên Quang','989274673'),
('S010','Nguyễn Thiều Quang','1999-9-18',1,'Hà Nội','984378291');
insert into subject values
('MH01','Toán',2),
('MH02','Vật Lý',2),
('MH03','Hóa Học',1),
('MH04','Ngữ Văn',1),
('MH05','Tiếng Anh',2);
insert into mark values
('MH01','S001',8.5),
('MH01','S002',9),
('MH01','S003',7.5),
('MH01','S004',6),
('MH01','S005',5.5),
('MH01','S006',8),
('MH01','S007',9.5),
('MH01','S008',10),
('MH01','S009',7.5),
('MH01','S010',6.5),
('MH02','S001',7),
('MH02','S002',8),
('MH02','S003',6.5),
('MH02','S004',7),
('MH02','S005',8),
('MH02','S006',10),
('MH02','S007',9),
('MH02','S008',8.5),
('MH02','S009',7),
('MH02','S010',8),
('MH03','S001',9),
('MH03','S002',6.5),
('MH03','S003',8),
('MH03','S004',5),
('MH03','S005',7.5),
('MH03','S006',9),
('MH03','S007',6),
('MH03','S008',8.5),
('MH03','S009',9),
('MH03','S010',5.5),
('MH04','S001',9),
('MH04','S002',8),
('MH04','S003',7),
('MH04','S004',6.5),
('MH04','S005',8.5),
('MH04','S006',7.5),
('MH04','S007',9),
('MH04','S008',6),
('MH04','S009',5),
('MH04','S010',4),
('MH05','S001',5),
('MH05','S002',6),
('MH05','S003',7),
('MH05','S004',8),
('MH05','S005',9),
('MH05','S006',6.5),
('MH05','S007',4),
('MH05','S008',9.5),
('MH05','S009',10),
('MH05','S010',7);
-- 2.2 Cập nhập dữ liệu
update student set studentName = 'Đỗ Đức Mạnh' where studentId ='S004';
update subject set subjectName ='Ngoại Ngữ' and priority = 1 where subjectId=MH05;
update mark set point = CASE
    WHEN subjectId = 'MH01' THEN 8.5
    WHEN subjectId = 'MH02' THEN 7
    WHEN subjectId = 'MH03' THEN 5.5
    WHEN subjectId = 'MH04' THEN 6
    WHEN subjectId = 'MH05' THEN 9
END
WHERE studentId = 'S009' AND subjectId IN ('MH01', 'MH02', 'MH03', 'MH04', 'MH05');
-- 2.3 Xóa dữ liệu
delete m,s from mark m join students on m.studentId= s.studentId where studentId='S001';
-- 3.1 lấy ra tât cả thông tin sinh viên trong bảng Student
select * from student;
-- 3.2 
select sbjectName,sbjectId from subject where priority = 1;
-- 3.3
select studentId as'mã sinh viên' ,studentName as 'tên sinh viên',(YEAR(CURRENT_DATE)- year(birthday)) as 'tuổi',(CASE WHEN gender = 1 THEN 'nam' ELSE 'nữ' END) as 'giới tính',address as 'quê quán'from student;
-- 3.4
select s.studentName,sub.subjectName,m.point from mark m 
join student s on m.studentId = s.studentId  
join subject sub on sub.subjectId = m.subjectId where m.subjectId = 'MH01' order by m.point desc ;
-- 3.5
SELECT if(gender=1,'nam','nu'), COUNT(*) AS quantity
FROM student
GROUP BY gender;
-- 3.6
SELECT s.studentId, s.studentName, SUM(m.point) AS total, AVG(m.point) AS average
FROM student s join mark m on m.studentId = s.studentId
GROUP BY s.studentId, s.studentName;
-- 4.1
CREATE VIEW STUDENT_VIEW AS
SELECT studentId, studentName, gender, address
FROM student;


