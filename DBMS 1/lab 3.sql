
create database jenil
create table student(
	enrollment_no	varchar(20),
	name varchar(25),
	cpi decimal(5,2),
	birthdate datetime
)
alter table student add city varchar(20) null , backlog int not null 
alter table student alter column name varchar(35)
alter table student alter column cpi int
sp_rename 'student.enrollment_no','eno','column'
alter table student drop column city 
sp_rename 'student','student_master'
alter table student_master drop column backlog
alter table student_master alter column name varchar(35) not null
sp_rename 'student_master.birthdate','bdate','column'
alter table student_master alter column eno varchar(12)