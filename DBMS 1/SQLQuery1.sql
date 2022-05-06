create table deposit
(
	actno int,
	cname varchar(50),
	bname varchar(50),
	amount decimal(8,2),
	adate datetime
)
create table branch
(
	bname varchar(50),
	city varchar(50)
)
create table customers
(
	cname varchar(50),
	city varchar(50)
)
create table borrow
(
	loanno int,
	cname varchar(50),
	bname varchar(50),
	amount decimal(8,2)
)
insert into deposit values(101,'anil','vrce',1000,'1-3-1995')
insert into deposit values(102,'sunil','ajni',5000,'4-1-96')
insert into deposit values(103,'mehul','karolbagh',3500,'1995-11-17')
insert into deposit values(104,'madhuri','chandi',1200,'1995-12-17')
insert into deposit values(105,'prmod','m.g.road',3000,'1996-3-27')
insert into deposit values(106,'sandip','andheri',2000,'1996-3-31')
insert into deposit values(107,'shivani','virar',1000,'5-9-95')
insert into deposit values(108,'kranti','nehru place',5000,'2-7-95')
insert into deposit values(109,'minu','powai',7000,'10-8-95')
select * from deposit


insert into branch values('vrce','nagpur')
insert into branch values('ajni','nagpur')
insert into branch values('karolbagh','delhi')
insert into branch values('chandi','delhi')
insert into branch values('dharampeth','nagpur')
insert into branch values('m.g.road','banglore')
insert into branch values('andheri','bombay')
insert into branch values('virar','bombay')
insert into branch values('nehru place','delhi')
insert into branch values('powai','bombay')
select *from branch

insert into customers values('anil','calcutta')
insert into customers values('sunil','delhi')
insert into customers values('mehul','baroda')
insert into customers values('mandar','patna')
insert into customers values('pramod','nagpur')
insert into customers values('sandip','surat')
insert into customers values('shivani','bombay')
insert into customers values('kranti','bombay')
insert into customers values('naren','bombay')
select *from customers


insert into borrow values(201,'anil','vrce',1000)
insert into borrow values(206,'mehul','ajni',5000)
insert into borrow values(311,'sunil','dharampeth',3000)
insert into borrow values(321,'madhuri','andheri',2000)
insert into borrow values(375,'prmod','virar',8000)
insert into borrow values(481,'kranti','nehru place',3000)
select *from borrow

select actno,cname,amount from deposit
select loanno,amount from borrow
select loanno,cname from borrow where bname='andheri'
select actno,amount from deposit where actno=106
select cname from borrow where amount>5000
select cname from deposit where adate>'1-12-1996'
select cname from deposit where actno<105
select cname from customers where city='nagpur' or city='delhi'
select cname from customers where city in('nagpur','delhi')
select cname,bname from deposit where amount>4000 and actno<105
select cname from borrow where amount>=3000 and amount<=8000
select cname from borrow where amount  between 3000 and 8000
select cname from deposit where bname!='andheri'
select cname from borrow where amount is null
select actno,cname,amount from deposit where bname in('ajni','karolbagh','m.g.road') and actno<104
select top 5 *from deposit
select top 3 *from deposit where  amount>1000
select top 5 loanno,cname from borrow where bname!='andheri'
select distinct city from customers
select distinct bname from branch
select *from customers order by city asc
select *from deposit order by amount desc
select *from customers order by city desc
select cname as UNI_borrowers from borrow


update deposit set amount=5000 where amount=3000
update borrow set bname='c.g.road' where bname='vrce' and cname='anil'
update deposit set actno=111 , amount=5000 where cname='sandip'
update borrow set amount=amount+(0.1*amount) 
update deposit set amount = 5000 where actno between 103 and 107
update borrow set amount= null where loanno=321
update borrow set loanno=401 ,bname='ajni' where  loanno= 201
update borrow set cname='anil jain' where cname='anil'
update deposit set cname='ramesh' ,bname='vrce' , amount = 5500 where actno=102
update borrow set bname= null, amount=null where loanno=481 and cname='kranti'


delete from customers where city='bombay'
delete from deposit where amount<=1000
delete from borrow where bname='ajni'
delete from borrow where loanno>201 and loanno<210
delete from deposit where adate>'1-12-1996'
truncate table customers
delete from deposit where cname='anil' and actno=101
delete from deposit where bname!='andheri'
delete from borrow where amount<2000  and bname!='vrce'
drop table branch