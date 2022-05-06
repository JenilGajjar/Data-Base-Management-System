Create Table StudentDemo(

Rno Int Primary key,
Name Varchar(50),
Branch Varchar(50),
SPI Decimal(4,2)
)

Insert Into StudentDemo Values(101,'Raju','CE',8.8,0)
Insert Into StudentDemo Values(102,'Amit','CE',2.2,3)
Insert Into StudentDemo Values(103,'Sanjay','ME',1.5,6)
Insert Into StudentDemo Values(104,'Neha','EC',7.65,1)
Insert Into StudentDemo Values(105,'Meera','EE',5.52,2)
Insert Into StudentDemo Values(106,'Mahesh','EC',4.50,3)
Select *From StudentDemo

Select *From StudentDemo
--1

Create View vwPersonal
AS
Select *From StudentDemo
Select *From vwPersonal

--2

Create View vwStudent_Details
AS
Select Name,Branch,SPi From StudentDemo
Select *From vwStudent_Details

--3
Create View vwAcademic
AS
Select Rno,Name,Branch From StudentDemo
Select *From vwAcademic

--4
Create View vwStudent_Date
AS 
Select *From StudentDemo
Where Bklog >2
Select *From vwStudent_Data

--5
Create View vwStudent_Pattern
AS
Select Rno,Name,Branch From StudentDemo
Where Name Like '____'
Select * From vwStudent_Pattern

--6
Insert Into vwAcademic 
Values (107,'Meet','Me')
Select *From vwAcademic

--7
Update vwStudent_Details  set Branch='ME' 
Where Branch='CE' AND Name='Amit'
Select *From vwStudent_Details
Select *From StudentDemo

--8
Delete From vwAcademic Where Rno=104
Select *From vwAcademic

--9
Create View vwSpiAboveNineFive
AS 
Select * From StudentDemo
Where SPI>9.5
Select *From vwSpiAboveNineFive

--10
Create View vwBacklogZero
AS
Select *From StudentDemo
Where Bklog=0