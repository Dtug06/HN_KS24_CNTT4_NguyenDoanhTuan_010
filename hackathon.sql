create database hackathon_csdl;
use hackathon_csdl;
-- Tao bang Department
create table Department (
 dept_id varchar(5) primary key,
 dept_name varchar(100) not null unique,
 location varchar(100) not null,
 manager_name varchar(50) not null
 );
 -- Tao bang Employee
 create table  Employee (
 emp_id varchar(5) primary key not null ,
 emp_name varchar(50) not null,
 dob date not null,
 email varchar(100) not null unique,
 phone varchar(15) not null unique,
 dept_id varchar(5) not null,
 foreign key (dept_id) references Department(dept_id)
 );
 -- Tao bang Project
 create table Project (
 project_id varchar(5) not null primary key,
 project_name varchar(20)  not null unique,
 start_date date not null,
 end_date date not null,
 budget decimal(10,2) not null
 );  
 -- Tao bang Assigment
 create table Assigment (
 assigment_id int primary key not null,
 emp_id varchar(5) not null,
 project_id varchar(5) not null,
 foreign key (emp_id) references Employee(emp_id),
 foreign key (project_id) references Project(project_id),
 role varchar(20) not null,
 hours_worked int not null
 );
 -- Them du lieu vao Department
 insert into Department 
 values
('D01','IT','floor 5','Nguyen Van A'),
('D02','HR','floor 2','Tran Thi Binh'),
('D03','Sales','floor 1','Le Van Cuong'),
('D04','Marketing','floor 3','Pham Thi Duong'),
('D05','Finance','floor 4','Hoang Van Tu');

-- Them du lieu vao Employee
insert into Employee
values 
('E001','Nguyen Van Tuan','1990-01-01','tuan@mail.com','0901234567','D01'),
('E002','Tran Thi Lan','1995-05-05','lan@mail.com','0902345678','D02'),
('E003','Le Minh Khoi','1992-10-10','khoi@mail.com ','0903456789','D01'),
('E004','Pham Hoang Nam', '1998-12-12','nam@mail.com','0904567890','D03'),
('E005','Vu Minh Ha','1996-07-07','ha@mail.com','0905678901','D01');

-- Them du lieu vao Project 
insert into Project 
values
('P001','Website Redesign','2025-01-01','2025-06-01',50000.00),
('P002','Mobile App Dev','2025-02-01','2025-08-01',80000.00),
('P003','HR System','2025-03-01','2025-09-01',30000.00),
('P004','Marketing Campaign','2025-04-01','2025-05-01',10000.00),
('P005','AI Research','2025-05-01','2025-12-31',100000.00);
-- Them du lieu vao Assigment
insert into Assigment
values 
(1,'E001','P001','Developer',150),
(2,'E003','P001','Tester',100),
(3,'E001','P002','Tech Lead',200),
(4,'E005','P005','Data Scientist',180),
(5,'E004','P004','Content Creator',50);
-- 3. Cập nhật thông tin phòng ban. Hãy viết câu lệnh thay đổi địa điểm của phòng ban có dept_id = 'C001' thành "Floor 10".(5 điểm)
update Department
set location = 'Floor 10'
where dept_id = 'D01';
-- 4. Thay đổi ngân sách. Do dự án có mã P005 có độ phức tạp cao, hãy tăng budget thêm 10% đơn vị và cập nhật end_date lùi lại 1 tháng.(5 điểm)
update Project
set budget = budget * 1.1,
end_date = DATE_ADD(end_date, interval 1 month)
where project_id = 'P005';
-- 5. Viết câu lệnh xóa tất cả các bản ghi trong bảng Assignment có hours_worked bằng 0 hoặc role là "Intern".(5 điểm)
delete from Assigment 
where hours_worked = 0 or role='Intern';
-- 7. Lấy thông tin project_name, start_date, budget của những dự án có tên chứa từ khóa là 'System'.(5 điểm) 
select project_name, start_date, budget
from Project
where project_name like '%System%';
-- 6. Liệt kê danh sách nhân viên gồm các cột: emp_id, emp_name, email thuộc phòng ban có mã  'D01'. (5 điểm)	 
select emp_id, emp_name, email from Employee
where dept_id='D01';
-- 8. Hiển thị danh sách tất cả các dự án gồm: project_id, project_name, budget. Kết quả sắp xếp theo budget giảm dần.(5 điểm) 
select project_id, project_name, budget from Project
order by budget desc;
-- 9. Lấy thông tin 3 nhân viên lớn tuổi nhất theo dob trong bảng Employee.(5 điểm)
select *from Employee
order by dob asc
limit 3;
-- 10. Hiển thị thông tin các sản phẩm (project_id, project_name) từ bảng Project, bỏ qua 1 bản ghi đầu tiên và lấy 3 bản ghi tiếp theo .(5 điểm)
select project_id, project_name from Project 
limit 3 offset 1;
-- 12. Liệt kê tất cả các phòng ban trong hệ thống gồm: dept_id, dept_name và emp_name tương ứng (nếu có). Kết quả phải bao gồm cả những phòng ban chưa có nhan viên nào. (5 điểm)
select d.dept_id,d.dept_name,e.emp_name
from Department d
left join Employee e on d.dept_id = e.dept_id;
-- 13. Tính tổng số giờ làm việc cho từng dự án. Kết quả hiển thị 2 cột: project_name và Total_Hours. (5 điểm)
select p.project_name,sum(a.hours_worked) as Total_Hours
from Project p
join Assigment a on p.project_id = a.project_id
group by p.project_name;




select *from Employee;
select*from Assigment;
select*from Department;
select*from Project;


 
