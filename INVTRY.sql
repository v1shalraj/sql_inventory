CREATE DATABASE inventory;
CREATE TABLE supplier(sid char(6)PRIMARY KEY,
 sname varchar(30) NOT NULL,
 sadress varchar(99) NOT NULL,
 scity varchar(25) DEFAULT 'delhi',
 sphone_number char(13),semail varchar(30) );
 INSERT INTO supplier (sid, sname, sadress, scity, sphone_number, semail)
VALUES 
  ('S0001', 'shiva kumar', 'shiva temple', 'kozhikode', '+91945871999', 'shiva@gmail.com'),
  ('S0002', 'ram kapoor', 'ram temple', 'delhi', '+91934599339', 'ram@gmail.com'),
  ('S0003', 'sam raj', 'near ram temple', 'gokarna', '+91992931139', 'sam@gmail.com'),
 ('S0004', 'shyam sharma', 'opposite to ram temple', 'kochi', '+91944993319', 'shyam@gmail.com'),
 ('S0005', 'raj kapoor', 'in ram temple road', 'kozhikode', '+91993444539', 'raj@gmail.com'),
('S0006', 'george p', '12A MG Road', 'Mumbai', '+919876543210', 'george_new@gmail.com'),
('S0007', 'abhisheka', '34B Brigade Road', 'Bangalore', '+919012345678', 'abhisheka_new@gmail.com'),
('S0008', 'aswin', '56C Residency Road', 'Chennai', '+919234567890', 'sam@gmail.com'),
('S0009', 'amal p', '78D Park Street', 'Kolkata', '+919345678901', 'shyam@gmail.com'),
('S0010', 'ranbir kapoor', '90E Sector 17', 'Delhi', '+919456789012', 'raj@gmail.com');

 CREATE TABLE product (
    pid char(6) PRIMARY KEY,
    pdescrptn varchar(70) NOT NULL,
    price int DEFAULT 1,
    pcity varchar(25),
    category varchar(30),
    supid char(6) REFERENCES supplier(sid)
);
INSERT INTO product (pid, pdescrptn, price, pcity, category, supid)
VALUES
('P0001', 'High-performance blender for smoothies and shakes', 89, 'Mumbai', 'Appliances', 'S0001'),
('P0002', 'Voice-controlled smart speaker with virtual assistant', 129, 'Delhi', 'Electronics', 'S0002'),
('P0003', 'Vintage-inspired desk lamp for ambient lighting', 39, 'Bangalore', 'Home Decor', 'S0003'),
('P0004', 'Sustainable and durable bamboo cutting board', 19, 'Kochi', 'Kitchen', 'S0004'),
('P0005', 'Hand-poured candle with soothing lavender fragrance', 15, 'Kozhikode', 'Home Decor', 'S0005'),
('P0006', 'Spacious backpack designed for camera gear and accessories', 89, 'Mumbai', 'Photography', 'S0006'),
('P0007', 'Qi-enabled wireless charging pad for smartphones', 49, 'Bangalore', 'Electronics', 'S0007'),
('P0008', 'Fashionable and functional backpack for travel', 69, 'Chennai', 'Fashion', 'S0008'),
('P0009', 'Insulated stainless steel water bottle for on-the-go hydration', 24, 'Kolkata', 'Kitchen', 'S0009'),
('P0010', 'Portable and lightweight umbrella for rainy days', 14, 'Delhi', 'Fashion', 'S0010'),
('P0011', 'Immersive audio experience with noise-canceling technology', 199, 'Mumbai', 'Electronics', 'S0001'),
('P0012', 'Contemporary wall clock for stylish timekeeping', 29, 'Bangalore', 'Home Decor', 'S0002'),
('P0013', 'Ergonomic laptop stand for comfortable workspace setup', 34, 'Chennai', 'Office', 'S0003'),
('P0014', 'Environmentally friendly mesh bags for grocery shopping', 12, 'Kolkata', 'Eco-Friendly', 'S0004'),
('P0015', 'Performance-oriented running shoes for athletes', 89, 'Delhi', 'Sports', 'S0005'),
('P0016', 'Compact speaker with Bluetooth connectivity for music on the go', 59, 'Mumbai', 'Electronics', 'S0006'),
('P0017', 'Supportive memory foam pillow for lower back comfort', 27, 'Bangalore', 'Home Decor', 'S0007'),
('P0018', 'Space-saving folding table for versatile use', 49, 'Chennai', 'Furniture', 'S0008'),
('P0019', 'Complete set of kitchen utensils made from bamboo', 18, 'Kolkata', 'Kitchen', 'S0009'),
('P0020', 'Precision gaming mouse for enhanced gaming experience', 79, 'Delhi', 'Gaming', 'S0010');

CREATE TABLE customer (
    cid char(6) PRIMARY KEY,
    cname varchar(30) NOT NULL,
    adress varchar(30) NOT NULL,
    city varchar(20) NOT NULL,
    phone char(13) NOT NULL,
    email varchar(30) NOT NULL,
    date_of_birth date CHECK (date_of_birth <= '2000-01-01'),
    UNIQUE (cname, adress, phone) 
);
 INSERT INTO customer (cid, cname, adress, city, phone, email, date_of_birth)
VALUES
('C0001', 'Priya Patel', '302 Gandhi Nagar', 'Mumbai', '+919876543210', 'priya.patel@email.com', '1992-08-18'),
('C0002', 'Rahul Sharma', '404 Krishna Street', 'Delhi', '+919012345678', 'rahul.sharma@email.com', '1997-11-27'),
('C0003', 'Aishwarya Singh', '505 Ganges Road', 'Bangalore', '+918765432109', 'aishwarya.singh@email.com', '1994-04-03'),
('C0004', 'Vikram Kapoor', '606 Himalaya Lane', 'Kolkata', '+917654321098', 'vikram.kapoor@email.com', '1991-12-15'),
('C0005', 'Ananya Das', '707 Yamuna Avenue', 'Chennai', '+916543210987', 'ananya.das@email.com', '1999-02-28'),
('C0006', 'Raj Verma', '808 Taj Road', 'Hyderabad', '+915432109876', 'raj.verma@email.com', '1998-06-07'),
('C0007', 'Shreya Gupta', '909 Lotus Street', 'Ahmedabad', '+914321098765', 'shreya.gupta@email.com', '1993-09-14'),
('C0008', 'Aryan Joshi', '1010 Rose Lane', 'Pune', '+913210987654', 'aryan.joshi@email.com', '1990-01-25'),
('C0009', 'Neha Singhania', '1111 Bengal Road', 'Jaipur', '+912109876543', 'neha.singhania@email.com', '1996-03-12'),
('C0010', 'Kunal Malhotra', '1212 Kashmir Avenue', 'Lucknow', '+911098765432', 'kunal.malhotra@email.com', '1995-07-31');


CREATE TABLE orders (
    oid char(6) PRIMARY KEY,
    odate DATE,
    price int DEFAULT 1,
    ocity varchar(25),
    category varchar(30),
    cusid char(6),
    proid char(6),
    FOREIGN KEY (cusid) REFERENCES customer(cid),
    FOREIGN KEY (proid) REFERENCES product(pid),
    UNIQUE (oid, odate) -- Composite unique constraint
);
 INSERT INTO orders (oid, odate, price, ocity, category, cusid, proid)
VALUES
('O0001', '2023-01-10', 150, 'Mumbai', 'Electronics', 'C0001', 'P0001'),
('O0002', '2023-02-15', 75, 'Delhi', 'Home Decor', 'C0002', 'P0002'),
('O0003', '2023-03-20', 120, 'Bangalore', 'Kitchen', 'C0003', 'P0003'),
('O0004', '2023-04-25', 50, 'Kolkata', 'Fashion', 'C0004', 'P0004'),
('O0005', '2023-05-30', 200, 'Chennai', 'Sports', 'C0005', 'P0005');

 CREATE TABLE stock(minordrqntty INT CHECK (minordrqntty >= 5),
 sqty INT CHECK (sqty >= 0),
 reordrlvl INT CHECK (reordrlvl > 0),
 prdctid char(6)FOREIGN KEY (prdctid) REFERENCES product(pid));
INSERT INTO stock (minordrqntty, sqty, reordrlvl, prdctid)
VALUES
(10, 100, 20, 'P0001'),
(5, 50, 10, 'P0002'),
(8, 80, 15, 'P0003'),
(12, 120, 25, 'P0004'),
(15, 150, 30, 'P0005'),
(7, 70, 14, 'P0006'),
(6, 60, 12, 'P0007'),
(9, 90, 18, 'P0008'),
(6, 30, 6, 'P0009'),
(20, 200, 40, 'P0010');

 SELECT * FROM supplier;
  SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM customer;
  SELECT * FROM stock;

  