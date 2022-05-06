Create Table Computer(
RollNo Int ,
Name Varchar(50),
)
Create Table Electrical(
RollNo Int ,
Name Varchar(50),
)

Insert Into Computer values(101,'Ajay'),(109,'Haresh'),(115,'Manish')
Insert Into Electrical values(105,'Ajay'),(107,'Mahesh'),(115,'Manish')

--1
Select Name From Computer
Union 
Select Name From Electrical

--2
Select Name From Computer
Union All
Select Name From Electrical

--3
Select Name From Computer
Intersect
Select Name From Electrical

--4
Select Name From Computer
Except
Select Name From Electrical

--5
Select Name From Electrical
Except
Select Name From Computer

--6
Select *From Computer
Union 
Select *From Electrical

--7
Select *From Computer
Intersect
Select *From Electrical


Create Table Cricket(
Name Varchar(50),
City Varchar(50),
Age Int
)
Insert Into Cricket Values('Sachin Tendulkar','Mumbai',30),
						  ('Rahul Dravid','Bombay',35),
						  ('M.S.Dhoni','Jharkhand',31),
						  ('Suresh Raina','Gujarat',30)



--1
Select * Into WorldCup From Cricket

--2 
Select Name,City Into T20 From Cricket Where 1=0

--3
Select * Into IPL From Cricket Where 1=0

--4
Insert Into Ipl Select * From Cricket Where Name Like '_A_____%'

Select *From IPL
--5
Delete From IPL
Truncate Table IPL

--6
Delete From Cricket Where City='Jharkhand'

--7
Sp_Rename 'IPL','IPL2018'

--8
Drop Table T20