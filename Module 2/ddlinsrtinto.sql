create schema practic;


-- customer_dim

CREATE TABLE practic.customer_dim
(
 customer_dim_id serial NOT NULL,
 customer_id     varchar(8) NOT NULL,
 customer_name   varchar(22) NOT NULL,
 segment         varchar(11) NOT NULL,
 CONSTRAINT PK_64 PRIMARY KEY ( customer_dim_id )
);

-- geography_dim

CREATE TABLE practic.geography_dim
(
 geo_dim_id        serial      NOT NULL,
 country           varchar(13) NOT NULL,
 city              varchar(17) NOT NULL,
 state             varchar(20) NOT NULL,
 region            varchar(7)  NOT NULL,
 postal_code       integer     NOT NULL,
 full_name_manager varchar(17) NOT NULL,
 CONSTRAINT PK_31 PRIMARY KEY ( geo_dim_id )
);

-- product_dim

CREATE TABLE practic.product_dim
(
 product_dim_id serial NOT NULL,
 category       varchar(15) NOT NULL,
 subcategory    varchar(11) NOT NULL,
 product_name   varchar(127) NOT NULL,
 product_id     varchar(15) NOT NULL,
 CONSTRAINT PK_49 PRIMARY KEY ( product_dim_id )
);

-- shipping_dim

CREATE TABLE practic.shipping_dim
(
 ship_dim_id serial NOT NULL,
 ship_mode   varchar(14) NOT NULL,
 CONSTRAINT PK_42 PRIMARY KEY ( ship_dim_id )
);

-- order_date_dim

CREATE TABLE practic.order_date_dim
(
 order_date_dim_id serial NOT NULL,
 orders_date       date NOT NULL,
 year              integer NOT NULL,
 quarter           integer NOT NULL,
 month             integer NOT NULL,
 week              integer NOT NULL,
 day               integer NOT NULL,
 CONSTRAINT PK_15 PRIMARY KEY ( order_date_dim_id )
);

-- ship_date_dim

CREATE TABLE practic.ship_date_dim
(
 ship_date_dim_id serial NOT NULL,
 ships_date       date NOT NULL,
 year             integer NOT NULL,
 quarter          integer NOT NULL,
 month            integer NOT NULL,
 week             integer NOT NULL,
 day              integer NOT NULL,
 CONSTRAINT PK_16 PRIMARY KEY ( ship_date_dim_id )
);

-- sales_fact

CREATE TABLE practic.sales_fact
(
 row_id            serial NOT NULL,
 order_id          varchar(25) NOT NULL,
 sales             numeric(9,4) NOT NULL,
 profit            numeric(21,16) NOT NULL,
 quantity          integer NOT NULL,
 discount          numeric(4,2) NOT NULL,
 returned          varchar(3) NULL,
 geo_dim_id        serial NOT NULL,
 customer_dim_id   serial NOT NULL,
 ship_dim_id       serial NOT NULL,
 product_dim_id    serial NOT NULL,
 order_date_dim_id serial NOT NULL,
 ship_date_dim_id  serial NOT NULL,
 CONSTRAINT PK_7 PRIMARY KEY ( row_id ),
 CONSTRAINT FK_120 FOREIGN KEY ( order_date_dim_id ) REFERENCES practic.order_date_dim ( order_date_dim_id ),
 CONSTRAINT FK_123 FOREIGN KEY ( ship_date_dim_id ) REFERENCES practic.ship_date_dim ( ship_date_dim_id ),
 CONSTRAINT FK_37 FOREIGN KEY ( geo_dim_id ) REFERENCES practic.geography_dim ( geo_dim_id ),
 CONSTRAINT FK_44 FOREIGN KEY ( ship_dim_id ) REFERENCES practic.shipping_dim ( ship_dim_id ),
 CONSTRAINT FK_54 FOREIGN KEY ( product_dim_id ) REFERENCES practic.product_dim ( product_dim_id ),
 CONSTRAINT FK_75 FOREIGN KEY ( customer_dim_id ) REFERENCES practic.customer_dim ( customer_dim_id )
);

CREATE INDEX FK_122 ON practic.sales_fact
(
 order_date_dim_id
);

CREATE INDEX FK_125 ON practic.sales_fact
(
 ship_date_dim_id
);

CREATE INDEX FK_39 ON practic.sales_fact
(
 geo_dim_id
);

CREATE INDEX FK_46 ON practic.sales_fact
(
 ship_dim_id
);

CREATE INDEX FK_56 ON practic.sales_fact
(
 product_dim_id
);

CREATE INDEX FK_77 ON practic.sales_fact
(
 customer_dim_id
);

-- ******************* INSERT INTO *****************

-- insert practic.customer_dim

insert into practic.customer_dim(customer_id, customer_name, segment)
     select o.customer_id,
	        o.customer_name,
		    o.segment
       from superstore.orders as o
   group by o.customer_id,
		    o.customer_name,
		    o.segment
   order by o.customer_id,
		    o.customer_name;
	
	
-- checking customer_dim
select *,
		count(*) over() as num
from practic.customer_dim;

-- update orders 05401

update superstore.orders
set postal_code = 05401
where postal_code is null;

-- insert practic.geography_dim

insert into practic.geography_dim(country, city, state, region, postal_code, full_name_manager)
select distinct o.country,
				o.city,
				o.state,
				o.region,
				o.postal_code,
				p.person
from superstore.orders as o
join superstore.people as p 
	on o.region = p.region 
group by o.country,
		o.city,
		o.state,
		o.region,
		o.postal_code,
		p.person;

-- checking geography_dim
select  *,
		count(*) over() as num
from practic.geography_dim;


-- insert practic.product_dim

insert into practic.product_dim(category, subcategory, product_name, product_id)
select  o.category,
		o.subcategory,
		o.product_name,
		o.product_id
from superstore.orders as o
group by o.category,
			o.subcategory,
			o.product_name,
			o.product_id;


-- checking product_dim
select *,
		count(*) over() as num
from practic.product_dim;

-- insert practic.shipping_dim

insert into practic.shipping_dim (ship_mode)
select  o.ship_mode
from superstore.orders as o
group by o.ship_mode;

-- checking shipping_dim
select *,
		count(*) over() as num
from practic.shipping_dim;

-- insert practic.order_date_dim
      
INSERT INTO practic.order_date_dim (orders_date, "year", quarter, "month", week, "day")
select o.order_date, 
		extract (YEAR FROM o.order_date), 
		extract (QUARTER FROM o.order_date),
		extract (MONTH FROM o.order_date),
		extract ( WEEK FROM o.order_date),
		extract (day FROM o.order_date) 
from superstore.orders as o 
group by o.order_date,
		extract (YEAR FROM o.order_date),
		extract (QUARTER FROM o.order_date),
		extract (MONTH FROM o.order_date),
		extract ( WEEK FROM o.order_date),
		extract (day FROM o.order_date) 
order by o.order_date;

-- insert practic.ship_date_dim 

INSERT INTO practic.ship_date_dim (ships_date, "year", quarter, "month", week, "day")
select o.ship_date, 
		extract (YEAR FROM o.ship_date), 
		extract (QUARTER FROM o.ship_date),
		extract (MONTH FROM o.ship_date),
		extract ( WEEK FROM o.ship_date),
		extract (day FROM o.ship_date) 
from superstore.orders as o 
group by o.ship_date, 
		extract (YEAR FROM o.ship_date),
		extract (QUARTER FROM o.ship_date),	
		extract (MONTH FROM o.ship_date), 
		extract ( WEEK FROM o.ship_date),
		extract (day FROM o.ship_date) 
order by o.ship_date;
		