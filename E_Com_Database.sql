create database if not exists E_Com_Database;
use E_Com_Database;

/* Q1:  creating table for 'Category' to store the data for the E-commerce   */
create table Category(
                      CAT_ID int primary key,
                      CAT_NAME varchar(30) not null
                      );

/* Q2:  Inserting  the following data in the table created above  */
insert into Category values(1, "BOOKS"),
			   (2, "GAMES"),
                           (3, "GROCERIES"),
                           (4, "ELECTRONICS"),
                           (5, "CLOTHES");

/* Q1:  creating table for 'Product' to store the data for the E-commerce   */
create table Product(
                     PRO_ID int primary key,
                     PRO_NAME varchar(50)not null default "Dummy",
                     PRO_DESC varchar(50),
                     CAT_ID int,
                     foreign key(CAT_ID)
                     references Category(CAT_ID)
                     );
  
/* Q2:  Inserting  the following data in the table created above  */
insert into  Product values(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2),
			   (2, "TSHIRT","SIZE-L with Black, Blue and White variations", 5),
                           (3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7, 1TB SSD", 4),
                           (4, "OATS", "Highly Nutritious from Nestle", 3),
                           (5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1),
                           (6, "MILK", "1L Toned MIlk",	3),
			   (7, "Boat Earphones", "1.5Meter long Dolby Atmos", 4),
                           (8, "Jeans", "Denim Jeans with various sizes and color", 5),
			   (9,"Project IGI", "compatible with windows 7 and above", 2),
                           (10, "Hoodie", "Black GUCCI for 13 yrs and above", 5),
                           (11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1),
			   (12 ,"Train Your Brain", "By Shireen Stephen", 1);
                           

/* Q1:  creating table for 'Supplier' to store the data for the E-commerce   */                           
create table Supplier(
		      SUPP_ID int primary key,
                      SUPP_NAME varchar(50) not null,
                      SUPP_CITY varchar(50)not null,
                      SUPP_PHONE varchar(50)not null
                      );
                      
/* Q2:  Inserting  the following data in the table created above  */                      
insert into Supplier values(1, "Rajesh Retails", "Delhi", "1234567890"),
			   (2, "Appario Ltd.", "Mumbai", "2589631470"),
			   (3, "Knome products", "Banglore", "9785462315"),
                           (4, "Bansal Retails", "Kochi", "8975463285"),
                           (5, "Mittal Ltd.", "Lucknow", "7898456532");                          
                           
                           
                           
 /* Q1:  creating table for 'Supplier_Pricing' to store the data for the E-commerce   */                            
create table Supplier_Pricing(
                              PRICING_ID int primary key,
                              PRO_ID int,
                              SUPP_ID int,
                              SUPP_PRICE int default 0,
                              foreign key(PRO_ID)
                              references Product(PRO_ID),
                              foreign key(SUPP_ID)
                              references Supplier(SUPP_ID)
                              );
                              
/* Q2:  Inserting  the following data in the table created above  */
insert into Supplier_Pricing values(1, 1, 2, 1500),
				   (2, 3, 5, 30000),
                                   (3, 5, 1, 3000),
                                   (4, 2, 3, 2500),
                                   (5, 4, 1, 1000),
                                   (6, 12, 2, 780),
				   (7, 12, 4, 789),
                                   (8, 3, 1, 31000),
                                   (9, 1, 5, 1450),
                                   (10, 4, 1, 999),
                                   (11, 7, 3, 549),
				   (12, 7, 4, 529),
                                   (13, 6, 2, 105),
                                   (14, 6, 1, 99),
                                   (15, 2, 5, 2999),
                                   (16, 5, 2, 2999);



 /* Q1:  creating table for 'Customers' to store the data for the E-commerce   */                              
create table Customers(
                       CUS_ID int primary key,
                       CUS_NAME varchar(20)not null,
                       CUS_PHONE varchar(10) not null,
                       CUS_CITY varchar(30) not null,
                       CUS_GENDER char
                       );
                       

/* Q2:  Inserting  the following data in the table created above  */
insert into Customers values(1, "AAKASH", "9999999999", "DELHI", 'M'),
							(2, "AMAN", "9785463215", "NOIDA", 'M'),
                            (3,	"NEHA", "9999619999", "MUMBAI", 'F'),
                            (4,	"MEGHA", "9994562399", "KOLKATA", 'F'),
							(5,	"PULKIT", "7895999999",	"LUCKNOW", 'M'),
                            (6, "VIRAT", "9890989065", "DELHI", 'M'),
                            (7, "ROHIT", "8888111222", "MUMBIA", 'M');
                            
                            
                            
 /* Q1:  creating table for 'Orders' to store the data for the E-commerce   */  
create table Orders(
		    ORD_ID int primary key,
                    ORD_DATE date not null,
                    CUS_ID int,
                    PRICING_ID int,
                    foreign key(CUS_ID)
	    	    references Customers(CUS_ID),
     		    foreign key(PRICING_ID)
		    references Supplier_Pricing(PRICING_ID)
		    );
                    
 /* Q2:  Inserting  the following data in the table created above  */
insert into Orders values
(101, "2021-10-06", 2, 1),
(102, "2021-10-12", 3, 5),
(103, "2021-09-16", 5, 2),
(104, "2021-10-05", 1, 1),
(105, "2021-08-16", 4, 3),
(106, "2021-08-18", 1, 9), 
(107, "2021-09-01", 3, 7),
(108, "2021-09-07", 5, 6),
(109, "2021-09-10", 5, 3),
(110, "2021-09-10", 2, 4),
(111, "2021-09-15", 4, 5),
(112, "2021-09-16", 4, 7),
(113, "2021-09-16", 1, 8),
(114, "2021-09-16", 3, 5),
(115, "2021-09-16", 5, 3),
(116, "2021-09-17", 2, 14);


 /* Q1:  creating table for 'Ratings' to store the data for the E-commerce   */  
create table Ratings(
                     RAT_ID int primary key,
                     ORD_ID int,
                     RAT_RATSTARS int not null
                     );

/* Q2:  Inserting  the following data in the table created above  */
INSERT INTO Ratings VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);                           
												


/*Ans of Q3:- Displaying the total number of customers based on gender who have placed orders of worth at least Rs.3000 */
--------------------------------------------------------------------------------------------------------------------------------
select count(Customers.CUS_ID) AS TOTAL_CUSTOMERS, Customers.CUS_GENDER AS CUSTOMERS_GENDER
from Customers
 inner join orders 
 USING(CUS_ID)  
 inner join Supplier_Pricing 
USING(PRICING_ID)
 where Supplier_Pricing.SUPP_PRICE>3000  group by Customers.CUS_GENDER ;
 


/* Ans of Q4:-	Displaying all the orders along with product name ordered by a customer having Customer_Id=2 */
--------------------------------------------------------------------------------------------------------------------
select Product.PRO_ID, Product.PRO_NAME AS PRODUCTS, Product.PRO_DESC, Orders.* FROM Product 
INNER JOIN Supplier_Pricing USING (PRO_ID)
INNER JOIN ORDERS USING(PRICING_ID)
INNER JOIN Customers USING(CUS_ID) WHERE Customers.CUS_ID=2;


/* Ans of Q5:-	Displaying the Supplier details who can supply more than one product */
----------------------------------------------------------------------------------------------
select SUPP_NAME, count(SUPP_ID) as Total_No_of_Products, SUPP_CITY, SUPP_PHONE
from Supplier 
inner join Supplier_Pricing
using(SUPP_ID) 
INNER JOIN PRODUCT USING (PRO_ID) group by supp_id having count(pro_ID)>1;


/* Ans of Q6:-	Displaying the least expensive product from each category and print the table with category id, name, product name and price of the product */
----------------------------------------------------------------------------------------------------------------------------------------------------------------
select Category.CAT_ID,Category.CAT_NAME, MIN(SubQuery1.Min_Price) as Min_Price from Category inner join
(select Product.CAT_ID, Product.PRO_NAME, SubQuery2.* from Product inner join  
(select PRO_ID, MIN(SUPP_PRICE) as Min_Price from Supplier_Pricing group by PRO_ID) 
as SubQuery2 where SubQuery2.PRO_ID = Product.PRO_ID)
as SubQuery1 where SubQuery1.CAT_ID = Category.CAT_ID group by SubQuery1.CAT_ID;



/* Ans of Q7:-  Displaying the Id and Name of the Product ordered after “2021-10-05” */
-------------------------------------------------------------------------------------------

select PRO_ID, PRO_NAME from Product
inner join Supplier_Pricing using(PRO_ID)
inner join Orders using(PRICING_ID) where Orders.ORD_DATE> '2021-10-05';
 /*OR*/
select PRO_ID, PRO_NAME from Product
where PRO_ID in 
(select PRO_ID from Supplier_Pricing where PRICING_ID in 
(select PRICING_ID from ORDERS where ORD_DATE>'2021-10-05'));


/* Ans of Q8:-  Displaying customer name and gender whose names start or end with character 'A' */
------------------------------------------------------------------------------------------------------
select CUS_NAME, CUS_GENDER from Customers where CUS_NAME like '%A' or CUS_NAME like 'A%';



/* Ans of Q9:-  Creating a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, 
If rating =5, print “Excellent Service”,
If rating >4 print “Good Service”,
If rating >2 print “Average Service” 
else print “Poor Service” */
----------------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE `ServiceFeedback` ()
BEGIN
select Supplier.SUPP_ID, Supplier.SUPP_NAME, AVG(Ratings.RAT_RATSTARS) as Average_Rating, 
case
when AVG(Ratings.RAT_RATSTARS)= 5 then 'Excellent Service'
when AVG(Ratings.RAT_RATSTARS)> 4 then 'Good Service'
when AVG(Ratings.RAT_RATSTARS)> 2 then 'Average Service'
else 'Poor Service'
End As Type_of_Service from Ratings 
inner join Orders using(ORD_ID)
inner join Supplier_Pricing using(PRICING_ID)
inner join Supplier using(SUPP_ID) group by SUPP_ID; 
END //
DELIMITER ;
call ServiceFeedback();
