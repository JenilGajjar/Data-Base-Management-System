Create Database Student_info
Create Table Student(
	StuId Int,
	Name Varchar(100),
	EnrollmentNo Varchar(12),
	Division Varchar(50),
	Sem Int,
	Birthdate DateTime,
	Email Varchar(100),
	ContactNo Varchar(50)
)

--1. Display Name of Student who belongs to either Semester 3 or 5. (Use IN & OR)
	Select Name From Student where SEM in(3,5);

--2. Find Student Name & Enrollment No in which Student Id between 103 to 105.
	Select Name ,EnrollmentNo From Student where StuId>103 and StuId<105;

--3. Find Student Name & Enrollment No with their Email Who belongs to 5th Semester.
	Select Name,EnrollmentNo,Email From Student Where Sem=5;

--4. Display All the Details of first three students.
	Select Top 3 *From Student;

--5. Display Name & Enrollment no of first 30% Students who’s contact number ends with 7.
	Select Name,EnrollmentNo From Student where ContactNo like '%7'

--6. Display Unique Semesters.
	Select Distinct Sem From Student;

--7. Retrieve All the Students who have no Enrollment.
	Select *From Student Where EnrollmentNo is NULL;

--8. Find All Students whose Name does not start with ‘V’.
	Select * From Student where Name not like 'V%'

--9. Find All Students in which Email Contains ‘3@G’ & Only Six Characters.
	Select *From Student where  Email like '%3@G%' and Name like '______';

--10. Find Out All the Students whose First Name Starts with F And third character must be R.
	Select * From Student Where Name like 'F_R%';

--11. Find All the Student Details whose Contact No contains 877.
	Select * From Student where ContactNo like '%877%';

--12. Display Student Name in Which Student belongs to Semester 3 & Contact Number Does Not Contains 8 & 9.
	Select Name From Student where Sem = 3 and ContactNo not like '%[8,9]%';

--13. Find  Students who born after date 01-01-1990.
	Select *From Student where Birthdate>'01-01-1990';

--14. Update Division to BCX-5 & Semester 5 whose Student Id Is 102.
	Update Student Set Division='BCX-5',Sem=5 where StuId=102;

--15. Change the Student’s Name to Firoz Sherasiya in which Email is Firoz.Me@Gmail.Com & Contact No is 8885999922.
	Update Student set Name='Firoz Sherasiya' where Email ='Firoz.Me@Gmail.Com' and ContactNo ='8885999922';

--16. Add one more Column City Varchar (50) in Student Table.
	Alter Table Student add City Varchar(50);

--17. Remove All BCX-3 Division Students.
	Delete From Student where Division='BCX-3';

--18. Change Column Name Email to EmailAddress.
	Sp_Rename 'Student.Email','EmailAddress','column';

--19. Write an SQL query to clone a new table Student_New from Student table with all data.
	Select * into Student_New From Student;

--20. Remove All the Data from Student Table Using Truncate.
	Truncate Table Student; 