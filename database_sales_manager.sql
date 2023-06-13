drop database if exists Sales_manager;

create  database  Sales_manager;
 use  Sales_manager;

create table customer(
  cID int primary key auto_increment,
  cName varchar(25),
  cAge tinyint
);

create table bill(
  oID int primary key auto_increment,

  oDate datetime,
  oTotalPrice long,

  cID int ,
  foreign key(cID) references customer(cID)
);

create table product(
  pID int primary key auto_increment,
  pName varchar(25),
  pPrice long
  
);

create table orderDetail(
  oID int ,
  pID int,
  odQty int,
  
  primary key(oID,pID),
  
  foreign key(oID) references bill(oID),
  foreign key(pID) references product(pID)
);

insert into customer values
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into bill (oID ,cID,oDate,oTotalPrice) values
(1,1,'2006-03-21',null),
(2,2,'2006-03-23',null),
(3,1,'2006-03-16',null);

insert into product values
(1,'May giat',3),
(2,'Tu lanh',5),
(3,'Dieu hoa',7),
(4,'Quat',1),
(5,'Bep dien',2);

insert into orderDetail values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select oID, oID, oDate,oTotalPrice from bill;

select  customer.cID,customer.cName, product.pName
from customer
join bill on customer.cID = bill.cID
join orderDetail on bill.oId = orderDetail.oID
join product on  orderDetail.pID = product.pID;

select customer.cName
from customer 
left join bill on customer.cID = bill.cID
where bill.cId is null;

select bill.oId,bill.oDate,sum(orderDetail.odQty * product.pPrice)
from bill
join orderDetail on bill.oId = orderDetail.oID
join product on  orderDetail.pID = product.pID
group by bill.oId;





