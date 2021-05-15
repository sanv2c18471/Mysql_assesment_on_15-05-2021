create database Test;
use Test;

--question 1
create table  Counties(
country_id int primary key auto_increment,
country_name varchar(50),
region_id int);

--question 2
create table Jobs(
job_id varchar(10) not null primary key,
job_title varchar(35) not null,
min_salary decimal(6,0),
max_salary decimal(6,0)
check (max_salary<25000)
);
 insert into Jobs values(1,'it',10000,28000);
 select * from Jobs;
 drop table Jobs;
 
 --Question 3
 Create table job_history(
 employee_id int primary key not null,
 Start_date date,
 end_date date,
 job_id varchar(10) not null,
 foreign key (job_id) references Jobs(job_id),
 department_id int);
 
 
 
 --Question 4
 create  table Student_info(
 stud_id int auto_increment,
 stud_code int(10),
 stud_name varchar(20),
 subject varchar(40),
 marks int,
 phone varchar(20),
 primary key (stud_id)
 );
select* from Student_info;
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(101,'Mark','English',68,'53545693537');
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(102,'Johseph','Physics',70,'5354564789');
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(103,'Jhon','Maths',70,'53545694568237');
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(104,'Barack','Maths',90,'535558222537');
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(105,'Rinky','Maths',85,'53544455557');
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(106,'Adam','Science',92,'778894445637');
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(107,'Andrew','Science',83,'53541113335557');
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(108,'Brayan','Science',85,'5354477885522');
 insert into Student_info(stud_code,stud_name,subject,marks,phone) values(110,'alexander','Biology',67,'5354445569937');
 
 
 
 --procedure
 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_merit_student`()
BEGIN
select * from Student_info where marks >70;
select count(stud_code) as total from Student_info;
END




 --question 5
 create table kids(
 id int,
 name varchar(20),
 age int);
 insert into kids values(1,'jonny',12);
 insert into kids values(2,'samu',15);
 insert into kids values(3,'dinku',19);
 select * from kids;
 update kids set age=19 where id=2;
 
 
 --trigger
 CREATE DEFINER=`root`@`localhost` TRIGGER `test1`.`school_AFTER_UPDATE` AFTER UPDATE ON `school` FOR EACH ROW
BEGIN
	delete from school where new.grade>12;
END