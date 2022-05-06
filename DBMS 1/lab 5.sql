create table students
(
	stuid int,
	firstname varchar(25),
	lastname varchar(25),
	website varchar(50),
	city varchar(50),
	division varchar(20)
)
insert into students values(1011,'keyur','patel','techonthenet.com','rajkot','ii-bcx')
insert into students values(1022,'hardik','shah','digminecraft.com','ahmedabad','i-bcy')
insert into students values(1033,'kajal','trivedi','bigactivities.com','baroda','iv-dcx')
insert into students values(1044,'bhoomi','gajera','checkyourmath.com','ahmedabad','iii-dcw')
insert into students values(1055,'harmit','mitel',null,'rajkot','ii-bcy')
insert into students values(1066,'ashok','jani',null,'baroda','ii-bcz')

select firstname from  students where firstname like 'k%'
select firstname from students where firstname like '_____'
select firstname , lastname from students where city like '_____a'
select firstname from students where lastname like '%tel'
select *from students where firstname like 'ha%t'
select *from students where firstname like 'k_y%'
select firstname from students where website is null and firstname like '_____'
select *from students where lastname like '%jer%'
select *from students where city like '[r,b]%' 
select firstname from students where website is not null
select *from students where firstname like '[a-h]%'
select *from students where firstname like '_[a,e,i,o,u]%'
select firstname from students where city like '%rod%'
select firstname,lastname from students where website like 'bi%'
select city from students where lastname like '______'
select *from students where city like '_____' and city not like 'ba%'
select *from students where division like 'ii%'
select firstname from students where division like '%bc%'
select stuid ,city from students where division like '______' and website is not null 
select *from students where firstname not like '__[a,e,i,o,u]%'