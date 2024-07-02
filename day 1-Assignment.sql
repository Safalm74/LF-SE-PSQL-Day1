--creating sale schema
create schema sale_Schema;

--creating products table
create table if not exists 
	sale_Schema.Products(
		product_id serial primary key,
		product_name varchar(50),
		category varchar(20),
		price int
);

--creating orders table
create table if not exists 
	sale_Schema.orders(
		order_id serial primary key,
		customer_name varchar(50),
		product_id int,
		quantity int,
		order_date timestamp default current_timestamp,
		foreign key(product_id)
			references sale_Schema.Products(product_id)
);

--inserting data on products
insert into 
	sale_schema.products 
		(product_name,category ,price)
	values
		('core i7','cpu',35000),
		('core i5','cpu',25000),
		('core i3','cpu',15000),
		('gtx 1080','gpu',150000),
		('gtx 1660','gpu',80000),
		('gtx 1650','gpu',60000),
		('gtx 1050ti','gpu',50000),
		('512GB SSD','storage',5000);
insert into 
	sale_Schema.orders
		(customer_name ,product_id ,quantity ,order_date )
	 values 
	 	('A',1,10,'2017-03-14'),
	 	('A',2,1,'2017-03-14'),
	 	('B',1,30,'2017-03-14'),
	 	('A',3,14,'2017-03-14'),
	 	('A',5,13,'2017-03-14'),
	 	('B',6,3,'2017-03-14'),
	 	('C',7,32,'2017-03-14'),
	 	('C',4,112,'2017-03-14'),
	 	('C',4,101,'2017-03-14'),
	 	('A',1,10,'2017-03-14'),
	 	('A',1,1,'2017-03-14'),
	 	('B',1,30,'2017-03-14'),
	 	('A',3,14,'2017-03-14'),
	 	('A',5,13,'2017-03-14'),
	 	('B',6,3,'2017-03-14'),
	 	('C',7,32,'2017-03-14'),
	 	('C',4,112,'2017-03-14'),
	 	('C',4,101,'2017-03-14');
--deleting
delete  from sale_schema.orders o
	where o.product_id=6;
--updating
update sale_schema.products 
	set price=55000
	where product_name='gtx 1050ti';
--Question: Calculate the total quantity ordered for each product category in the orders table.
select  
	p.category as category ,
	sum(o.quantity) as total_quantity
	from sale_Schema.orders o  
	join sale_Schema.products p 
	on o.product_id =p.product_id 
	group by p.category;

--Question: Find categories where the total number of products ordered is greater than 5.
select  
	p.category as category,
	count(o.product_id) as order_count
	from sale_Schema.orders o
	join sale_Schema.products p 
	on p.product_id =o.product_id 
	group by p.category 
	having count(o.product_id)>5;

	
	


	 
	
	
	
	
	