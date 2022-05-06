Create Table Student(
	Rno Int,
	Name Varchar(50),
	City Varchar(50),
	DID int
)
Create Table Academic 
(
	RNo int,
	SPI Decimal(4,2),
	Bklog Int
)
Create Table Department
(
	DID int,
	DName Varchar(50)
)
Insert Into Student Select 101,'Raju','Rajkot',10
Insert Into Student Select 102,'Amit','Ahmedabad',20
Insert Into Student Select 103,'Sanjay','Baroda',40
Insert Into Student Select 104,'Neha','Rajkot',20
Insert Into Student Select 105,'Meera','Ahmedabad',30
Insert Into Student Select 106,'Mahesh','Baroda',10

Insert Into Academic Select 101,8.8,0
Insert Into Academic Select 102,9.2,2
Insert Into Academic Select 103,7.6,1
Insert Into Academic Select 104,8.2,4
Insert Into Academic Select 105,7.0,2
Insert Into Academic Select 106,8.9,3

Insert Into Department Select 10,'Computer'
Insert Into Department Select 20,'Electrical'
Insert Into Department Select 30,'Mechanical'
Insert Into Department Select 40,'Civil'

--1
Select *From Student
Where DID=(
Select DID From Department
Where DName = 'Computer'
)

--2

Select Name  From Student
Where Rno IN(
Select Rno From Academic 
Where SPI>8
)

--3
Select *From Student Where City='Rajkot'
AND DID IN
(
	Select DID From Department
	Where DName ='Computer'
)
--4
Select COUNT(*) From Student
Where DID =
(
	Select DID From Department
	Where DName ='Electrical'
)

--5

Select Name From Student
Where Rno In(
	Select Rno From Academic
	Where SPI = 
	(
		Select MAX(SPI) From Academic
	)
)

--6

Select *From Student
Where Rno IN(
	Select Rno From Academic
	Where Bklog>1
)


--7

Select Name From Student 
Where Rno IN
(
	Select Rno From Academic
	Where SPI = (
		Select MAX(Spi) From Academic
		Where SPI <
		(
		Select MAX(SPI) From Academic
		)
	)
)

--8
Select Name From Student
Where Did IN(
	Select DID From Department
	Where DName IN('Computer','Mechanical')
)

--9

Select Name From Student
Where DID = (
	Select DID From Student
	Where Rno=102
)

--10
Select  Name From Student
Where Rno IN(
	Select Rno From Academic
	Where SPI>9
)
And DID= (
	Select DID From Department
	Where  DName='Electrical'
)
