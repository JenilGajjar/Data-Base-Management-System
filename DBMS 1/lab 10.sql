Create Table Student(
	Rno int,
	Name Varchar(50),
	Branch Varchar(50)
)

Create Table Result(
	Rno int,
	SPI Decimal(4,2)
)
Create Table Employee(
	EmployeeNo Varchar(50),
	Name Varchar(50),
	ManagerNo Varchar(50)
)
Drop table EMPLOYEE
Insert Into Student Values(101,'Raju','CE'),
						  (102,'Amit','CE'),
						  (103,'Sanjay','ME'),
						  (104,'Neha','EC'),
						  (105,'Meera','Me'),
						  (106,'Mahesh','Me')

Insert Into Result Values(101,8.8),
						 (102,9.2),
						 (103,7.6),
						 (104,8.2),
						 (105,7.0),
						 (107,8.9)


Insert Into EMPLOYEE Values ('E01','Tarun',NULL),
							('E02','Rohan','E02'),
							('E03','Priya','E01'),
							('E04','Milan','E03'),
							('E05','Jay','E01'),
							('E06','Anjana','E04')


--1
Select * From Student,Result
Select *From Student
Cross Join Result

--2
Select Student.Rno,Name,Branch,Spi From Student
Left Outer Join Result
On Student.Rno=Result.Rno
Where Branch='CE'

--3
Select Student.Rno,Name,Branch From Student
Left Outer Join Result
On Student.Rno=Result.Rno
Where Branch<> 'EC'

--4
Select Branch,Avg(Spi) From Student
Inner Join Result
On Student.Rno=Result.Rno
Group By Branch

--5
Select Branch, AVG(SPI) From Student
Inner Join Result
On Student.Rno=Result.Rno
Group By Branch
Order By AVG(Spi)

--6
Select Branch,AVG(Spi) From Student
Inner Join Result
On Student.Rno=Result.Rno
Where Branch in ('CE','ME')
Group By Branch

--7
Select *From Student 
Left Outer Join Result
On Student.Rno=Result.Rno

--8
Select *From Student 
Right  Join Result 
On Student.Rno= Result.Rno

--9
Select *From Student
Full Join Result
On Student.Rno=Result.Rno

--10
Select E.Name,M.Name From Employee E
Left Outer Join Employee M
On E.ManagerNo=M.EmployeeNo


Create Table City(
	CityId Int Primary Key,
	CityName Varchar(50) Unique,
	Pincode Varchar(50),
	Remarks varchar(250)
)
Insert Into City Values(1,'Rajkot','360005','Good')
Insert Into City Values(2,'Surat','335009','Very Good')
Insert Into City Values(3,'Baroda','390001','Awesome')
Insert Into City Values(4,'Jamnagar','361003','Smart')
Insert Into City Values(5,'Junagadh','362229','Historic')
Insert Into City Values(6,'Morvi','363641','Ceramic')
Select *From City

Insert Into  Village Values(101,'Raiya',1)
Insert Into  Village Values(102,'Madhapar',1)
Insert Into  Village Values(103,'Dodka',3)
Insert Into  Village Values(104,'Falla',4)
Insert Into  Village Values(105,'Bhesan',5)
Insert Into  Village Values(106,'Dhoraji',5)


Create Table Village(
	VillageId Int Primary Key,
	VillageName Varchar(50),
	CityId int Foreign Key References City(CityId)
)
Select *From Village


--1

Select VillageName From City
Inner Join Village
On Village.CityId=City.CityId
Where CityName='Rajkot'


--2
Select CityName,Pincode,VillageName From City
left Join Village
On City.CityId=Village.CityId

--3
Select CityName,COUNT(Village.CityID) From City
Left Outer Join Village
On City.CityId=Village.CityId
Group By CityName
Having COUNT(Village.CityId)>1

--4
Select CityName From City
left Outer Join Village
On City.CityId=Village.CityId
Group By City.CityName
Having COUNT(Village.VillageId)=0

--5
Select CityName ,COUNT(VillageName) From City
Left Outer Join Village
On City.CityId=Village.CityId
Group By CityName

--6

Select COUNT(*)
From(
		SELECT CITY.[CityName],COUNT(Village.VillageId) AS Total
		FROM
		CITY
		left JOIN
		VILLAGE
		ON CITY.CITYID=VILLAGE.CITYID
		GROUP BY CITYNAME
)
As T
Where Total>1