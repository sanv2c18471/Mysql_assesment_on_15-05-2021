create database test1;
use test1;

--question 1
create table  jobs(
job_id int primary key not null,
job_title varchar(20),
job_duration int);

--question 2
create table countries(
country_id int(10),
country_name varchar(20),
check (country_name in('Italy','India','China')),
region_id int(10)
);


--question 3
Create Table employees ( 
employee_id decimal(6,0) NOT NULL PRIMARY KEY, 
first_name varchar(20), 
last_name varchar(25), 
email varchar(25), 
phone_number varchar(20), 
hire_date date, 
job_id varchar(10), 
salary decimal(8,2) , 
commission decimal(2,2) , 
manager_id decimal(6,0), 
department_id decimal(4,0) , 
foreign key (department_id) references  departments(department_id),
foreign key (manager_id) references  departments(manager_id)
);




create table departments(
department_id decimal(4,0) primary key not null, 
department_name varchar(30),
manager_id decimal(6,0) not null, 
location_id decimal(4,0) );


--question 4
create table employee_detail(
ID int auto_increment,
Name varchar(20),
Email varchar(50),
Phone varchar(20),
City varchar(20),
Working_hours int,
primary key(ID)
)

insert into employee_detail(Name,Email,Phone,City,Working_hours) values
('Peter','peter@javatpoint.com',49562959223,'Texas',12),
('Suzi','suzi@javatpoint.com',70679834522,'California',10),
('Joseph','joseph@javatpoint.com',09896765374,'Alaska',14),
('Alex','alex@javatpoint.com',97335737548,'Los Angeles',9),
('Mark','mark@javatpoint.com',78765645643,'Washington',12),
('Stephen','stephen@javatpoint.com',986345793248,'New York',10);

select * from employee_detail;


--procedure
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_excellent_employee`()
BEGIN
	select * from employee_detail where Working_hours > 10;
    select count(ID) AS Total_Employee from employee_detail;
END



--question 5
create table school_grade(
id int,
name varchar(20),
grade int);

insert into school_grade values(1,'ram',10);
insert into school_grade values (2,'sam',9);
insert into school_grade values (3,'jam',12);
insert into school_grade values (4,'sam',15);

select * from school_grade;

update school_grade set grade=13 where id = 3;

--trigger
CREATE DEFINER=`root`@`localhost` TRIGGER `test1`.`kids_AFTER_UPDATE` AFTER UPDATE ON `kids` FOR EACH ROW
BEGIN
	delete from kids where new.kid_age>18;
END