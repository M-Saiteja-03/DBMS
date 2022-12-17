create table test(
eid number(10),
ename varchar2(30),
dept varchar(10),
sal NUMBER(20),
primary key(eid)
);
--insert into test(eid,ename,dept,sal) values (&eid,'&ename','&dept',&sal);
insert into test values (1,'ram','hr',10000);
insert into test values (2,'amrit','hr',20000);
insert into test values (3,'ravi','hr',30000);
insert into test values (4,'nitin','hr',40000);
insert into test values (5,'varun','hr',50000);
drop table test;
drop table project;
create table project(
pid number(10),
pname varchar2(30),
location varchar(10),
eid number(10),
primary key(pid),
FOREIGN KEY (eid) REFERENCES test(eid)
);
insert into project values (101,'IOT','banglore',1);
insert into project values (102,'Data analysis','banglore',2);
insert into project values (103,'IOT','web',3);
insert into project values (104,'IOT','android',4);
select * from project;
select * from test;
--select dept,count(dept) from test where dept = (select distinct(dept) from test);
--select dept from emp where count(dept)<2;
select max(sal) from test where sal<>(select max(sal) from test);
select ename from test where dept=(select dept from test group by dept having count(dept)<2);
select sal,dept,ename from test where sal in (select max(sal) from test group by dept);
select test.ename from test,project where test.eid=project.eid;