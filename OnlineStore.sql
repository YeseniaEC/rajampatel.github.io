--drop table customer
CREATE TABLE Customer
(
ID int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(25),
LastName nvarchar(25) ,
Phone nvarchar(10)
)

create table addresstype
(ID int IDENTITY(1,1) PRIMARY KEY,
addtype nvarchar(10), --business,home,work,mailbox
addtype_desc nvarchar(50))

CREATE TABLE Address
( ID int IDENTITY(1,1) PRIMARY KEY,
Add1 nvarchar(50),
Add2 nvarchar(50),
City nvarchar(50),
State nvarchar(2),
addtypeid int,
effective_begin datetime,
effective_end datetime
constraint addtypeid_fk foreign key (addtypeid) references addresstype(id))

CREATE TABLE Supplier
(
ID int IDENTITY(1,1) PRIMARY KEY,
Name nvarchar(255) NOT NULL,
address nvarchar(255),
city nvarchar(50),
state nvarchar(2),
Phone nvarchar(10)
)


create table customeraddress
(ID int IDENTITY(1,1) PRIMARY KEY,
customerid int constraint customerid_fk foreign key references customer(id),
addressid int constraint addressid_fk foreign key  references address(id)
)



create table item
(ID int IDENTITY(1,1) PRIMARY KEY,
name nvarchar(30),
description nvarchar(50),
price numeric(5,2),
supplierid int constraint supplierid_fk foreign key  references supplier(id)
)

create table customerorder
(ID int IDENTITY(1,1) PRIMARY KEY,
customerid int constraint customerid1_fk foreign key  references customer(id),
datecreated datetime,
ordertotal numeric(9,3))

create table orderdetail
(ID int IDENTITY(1,1) PRIMARY KEY,
customerorderid int constraint customerorderid_fk foreign key  references customerorder(id),
itemid int constraint itemid_fk foreign key  references item(id),
qty int)
