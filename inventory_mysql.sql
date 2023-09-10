-- CREATE database inventory_mgt_database;
CREATE database inventory_mgt_db;
USE inventory_mgt_db;

-- creating entities
CREATE TABLE  user (
  id int NOT NULL, 
  name varchar(255) NOT NULL, 
  email varchar(255),
  password varchar(255),
  contact varchar(255),
  user_type ENUM("Admin", "Customer"),
  createdAt datetime DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (id)
);

CREATE TABLE category (
  id int NOT NULL,
  name varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE supplier (
  id int NOT NULL,
  name varchar(255),
  email varchar(255),
  address varchar(255),
  phone_number varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE product (
  id int NOT NULL,
  name varchar(255),
  price int NOT NULL,
  size ENUM("s", "m", "l"),
  description varchar(255),
  category_id int,
  supplier_id int,
  FOREIGN KEY (category_id) REFERENCES category(id),
  FOREIGN KEY (supplier_id) REFERENCES supplier(id),
  PRIMARY KEY (id)
);

CREATE TABLE admin (
  id int,
  name varchar(255),
  user_id int,
  FOREIGN KEY (user_id) REFERENCES user(id),
  PRIMARY KEY (id)
);

CREATE TABLE customer (
  id int,
  name varchar(255),
  address varchar(255),
  phone_number varchar(255),
  user_id int,
  FOREIGN KEY (user_id) REFERENCES user(id),
  PRIMARY KEY (id)
);

CREATE TABLE inventory_item (
  id int,
  quantityInStock int,
  dateRestocked datetime,
  product_id int,
  FOREIGN KEY (product_id) REFERENCES product(id),
  PRIMARY KEY (id)
);

CREATE TABLE orders (
  id int NOT NULL,
  date datetime,
  status varchar(255),
  customer_id int,
  FOREIGN KEY (customer_id) REFERENCES customer(id),
  PRIMARY KEY (id)
);

CREATE TABLE order_item (
  id int NOT NULL,
  quantityOrdered int,
  price int,
  orders_id int,
  product_id int,
  FOREIGN KEY (orders_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES product(id),
  PRIMARY KEY (id)
);

USE inventory_mgt_db;
-- inserting into tables
insert into user 
(id, name, email, password, contact, user_type) 
values (1, 'Jane Doe', 'janedoe@example.com', "jadoe321", "+256780273662", "customer");

insert into user 
(id, name, email, password, contact, user_type) 
values (2, 'Rob Smith', 'jrobsmith@example.com', "rob12bie", "+24376376632", "Admin");

insert into category 
(id, name) 
values (1, "electronics");

insert into category 
(id, name) 
values (2, "skincare");

insert into supplier
(id, name, email, address, phone_number) 
values (1, 'The ordinary', 'deceim@example.com', "Texas", "+24673552638");

insert into supplier
(id, name, email, address, phone_number) 
values (2, 'DEO ltd', 'deo@example.com', "Uganda", "+226536813637");

insert into product
(id, name, price, size, description, category_id, supplier_id) 
values (1, 'lactic acid', 10.5, "m", "for skin brightening", 2,  1);

insert into product
(id, name, price, size, description, category_id, supplier_id) 
values (2, 'LED TV', 130, "l", "television", 1,  2);

-- getting records

select * from product;
select * from category;

-- updating records
update product
set name = "mandelic acid"
where id = 1;

update supplier
set name = "good molecules"
where id = 1;

-- deleting records
delete from product
where id = 2;