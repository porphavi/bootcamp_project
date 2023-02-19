## replit link -> https://replit.com/@aphavika/SQLrestaurant-data?v=1

-- create DIM table 1 lunch_set
create table lunch_set (
  setid int primary key,
  menu text,
  price real
);

-- insert value to table 1 lunch_set
insert into lunch_set values
(1, 'Tomyum', 20),
(2, 'Kaprao', 15),
(3, 'Noodles',15);

-- create DIM table 2 customer
create table customer (
  customerid int primary key,
  firstname text,
  lastname text
);

-- insert value to table 2 customer
insert into customer values
(1, 'Tony',  'Lee'),
(2, 'Amber', 'Choi'),
(3, 'Paul',  'Zhang'),
(4, 'Jeff',  'Chang'),
(5, 'Jenny', 'Song');

-- create DIM table 3 waiter
create table waiter (
  waiterid int primary key,
  firstname text,
  lastname text 
);

-- insert value into table 3 waiter
insert into waiter values
(1, 'Emma', 'Oh'),
(2, 'Lary', 'Yu'),
(3, 'Dan',  'Chen');

-- create DIM table 4 orders
create table orders (
  orderid int primary key,
  orderdate int,
  customerid int,
  waiterid int,
  foreign key (customerid) references customer(customerid),
  foreign key (waiterid) references waiter(waiterid)
);

-- insert value into table 4 orders
insert into orders values
(1, 20220830, 1, 1),
(2, 20220830, 2, 3),
(3, 20220831, 3, 2),
(4, 20220831, 4, 1),
(5, 20220831, 5, 2),
(6, 20220901, 2, 2);

-- create FACT table order_detail
create table order_detail (
  itemid int primary key,
  orderid int,
  setid int,
  quantity int,
  foreign key (orderid) references orders(orderid),
  foreign key (setid) references lunch_set(setid)
);

--insert value into table order_detail
insert into order_detail values
(1,1,1,2),
(2,2,1,1),
(3,2,1,1),
(4,3,3,1),
(5,3,2,2),
(6,4,1,3),
(7,5,1,3),
(8,6,2,2),
(9,6,1,1);

.mode markdown
.header on

  
--(1) Find Total Price per orderid and use Subquery/with
     --1st find price per itemid 
    With total_price_per_itemid as (
      select 
        orderid,
        lunch_set.setid,
        quantity,
        price as unit_price,
        (quantity)*(price) as total_price
      from order_detail
      join lunch_set
        on lunch_set.setid = order_detail.setid  
    )
      --2nd find price per orderid
    select 
      orderid,
      sum(total_price) as total
    from total_price_per_itemid
    group by orderid;


--(2) Find the most popular lunch_set
    WITH order_per_setid as(
      select 
          setid,
          (setid)*(quantity) As order_amount   
      from order_detail
    )
    SELECT 
    	setid,
      sum(order_amount) as total_order
    FROM order_per_setid
    GROUP by setid
    order by total_order desc; 


--(3) Find repurchased customer
  --1st find frequency of all customer
    with customer_purchase_time as(
    SELECT 
    	customerid,
    	count(customerid) as frequency
    FROM orders
    group by customerid)
    
      --2nd filter for repurchased one
    Select 
    	customer.customerid,
        customer.firstname,
        customer.lastname,
        customer_purchase_time.frequency
    from customer
    join customer_purchase_time
    	on customer_purchase_time.customerid = customer.customerid
    where frequency >1;   
  

--(4) query promotion informarion
--promotion: If total price per orderid >= 50, give away 1 cola.
      --reuse the code from (1)
    With total_price_per_itemid as (
      select 
        orderid,
        lunch_set.setid,
        quantity,
        price as unit_price,
        (quantity)*(price) as total_price
      from order_detail
      join lunch_set
        on lunch_set.setid = order_detail.setid  
    )
      --2nd find price per orderid and add free cola info
    select 
      orderid,
      sum(total_price) as total,
      case when (sum(total_price))>=50 then 'free cola'
        ELSE 'no'
        end as promotion
    from total_price_per_itemid
    group by orderid;
