
-- PARENT TABLE 

CREATE TABLE CUSTOMERS 
(
CUSTOMER_ID INT PRIMARY KEY ,
FNAME VARCHAR(20) NOT NULL , 
LNAME VARCHAR(20) NOT NULL ,
PHONE VARCHAR(15),
EMAIL VARCHAR(30) NOT NULL , 
CITY VARCHAR(10) CHECK (CITY IN ('MUSCAT','NIZWA','QURUM')),
ZIPCODE INT
);
--IDENTITY(1,1) 1 ORDER GOES 2 .. // TINYINT (DONE..ETC)
--CHILD
 CREATE TABLE ORDERS (
 ORDER_ID INT IDENTITY (1,1), 
 CUSTOMER_ID INT , 
 ORDER_STATUS TINYINT NOT NULL, 
 ORDER_DATE DATE NOT NULL,
 REQUIRED_DATE DATE NOT NULL,
 SHIPPED_DATE DATE,
 STORE_ID INT NOT NULL,
 STAFF_ID INT NOT NULL,
 CONSTRAINT ORDERS_PK PRIMARY KEY (ORDER_ID),
 CONSTRAINT CUSTOMER_ORDERS_FK FOREIGN KEY (CUSTOMER_ID)
 REFERENCES CUSTOMERS (CUSTOMER_ID),
 ); 
 --CONNECT STORES  WITH ORDERS 1-M
 CREATE TABLE STORES 
 (
 STORE_ID INT IDENTITY (1,1) PRIMARY KEY,
 STORE_NAME VARCHAR(255) NOT NULL,
 PHONE VARCHAR(25),
 );


 ALTER TABLE ORDERS
 ADD CONSTRAINT STORE_ORDERS_FK FOREIGN KEY (STORE_ID)
 REFERENCES STORES ( STORE_ID);

 CREATE TABLE STAFF (
    STAFF_ID INT PRIMARY KEY,
    FNAME VARCHAR(50) NOT NULL,
    LNAME VARCHAR(50) NOT NULL,
    SALARY NUMERIC(10,2) CHECK (SALARY BETWEEN 3000 AND 15000),
    HIRE_DATE DATE,
    STORE_ID INT,  -- Foreign key to STORES table
    CONSTRAINT FK_STAFF_STORE FOREIGN KEY (STORE_ID)
        REFERENCES STORES (STORE_ID)
);
 ALTER TABLE CUSTOMERS 
 ADD STREET VARCHAR(50) NOT NULL;

 ALTER TABLE CUSTOMERS 
 ALTER COLUMN STREET VARCHAR(30);
