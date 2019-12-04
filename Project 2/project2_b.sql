CREATE TABLE Employee(
eId varchar(10) primary key,
eName varchar(20) not null
);

CREATE TABLE Department(
dId varchar(5) primary key,
dName varchar(20) not null unique
);

CREATE TABLE worksIn(
emp varchar(10) references Employee(eId),
dept varchar(5) references Department(dId),
primary key (emp, dept)
);

CREATE TABLE Payroll(
checkNumber varchar(30) primary key,
emp varchar(10) references Employee(eId) not null,
year char(4) not null,
amount numeric not null
);