SELECT 
    CUSTOMERS.FNAME, 
    CUSTOMERS.LNAME, 
    ORDERS.ORDER_ID
FROM 
    CUSTOMERS
INNER JOIN 
    ORDERS ON CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID;


	SELECT 
    C.FNAME, 
    C.LNAME, 
    C.EMAIL,
    O.ORDER_ID,
    O.ORDER_DATE,
    O.ORDER_STATUS
FROM 
    CUSTOMERS C
INNER JOIN 
    ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

	--left joint
	SELECT 
    C.FNAME, 
    C.LNAME, 
    O.ORDER_ID
FROM 
    CUSTOMERS C
LEFT JOIN 
    ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;


	--filter by date 
	SELECT 
    C.FNAME, 
    C.LNAME, 
    O.ORDER_ID,
    O.ORDER_DATE
FROM 
    CUSTOMERS C
INNER JOIN 
    ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE 
    O.ORDER_DATE > '2025-01-01';


	--sort 
	ORDER BY O.ORDER_DATE DESC;


	cross join--
	--If you have:

10 customers

5 stores
--You’ll get 50 rows (10 × 5).--

	SELECT 
    C.FNAME, 
    C.LNAME, 
    C.EMAIL, 
    S.STORE_ID
FROM 
    CUSTOMERS C
CROSS JOIN 
    STORES S;


	SELECT 
    C.FNAME, 
    C.LNAME, 
    C.EMAIL, 
    S.STORE_ID
FROM 
    CUSTOMERS C
INNER JOIN 
    ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
INNER JOIN 
    STORES S ON O.STORE_ID = S.STORE_ID;



SELECT 
    O.ORDER_ID, 
    O.STORE_ID, 
    O.ORDER_DATE, 
    C.FNAME, 
    C.EMAIL
FROM 
    ORDERS O
INNER JOIN 
    CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID;

	--ONLY MATCHED RAWS 

	SELECT DISTINCT CUSTOMER_ID FROM ORDERS;
SELECT DISTINCT CUSTOMER_ID FROM CUSTOMERS;


SELECT 
    C.FNAME, 
    C.LNAME, 
    C.EMAIL, 
    O.STORE_ID
FROM 
    CUSTOMERS C
LEFT JOIN 
    ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;



	SELECT 
    C.FNAME, 
    C.LNAME, 
    C.EMAIL, 
    O.ORDER_ID, 
    O.STORE_ID
FROM 
    CUSTOMERS C
FULL OUTER JOIN 
    ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;


	SELECT * FROM ORDERS;
		SELECT * FROM customers;
	
	INSERT INTO ORDERS (
    CUSTOMER_ID, ORDER_STATUS, ORDER_DATE, REQUIRED_DATE, SHIPPED_DATE, STORE_ID, STAFF_ID
)
VALUES (
    1, 1, GETDATE(), GETDATE(), NULL, 8, 1
);


SELECT 
    C.FNAME, 
    C.LNAME, 
    C.EMAIL, 
    O.ORDER_ID, 
    O.STORE_ID
FROM 
    CUSTOMERS C
RIGHT JOIN 
    ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

	SELECT 
    C.FNAME, 
    C.LNAME, 
    C.EMAIL, 
    O.ORDER_ID, 
    O.STORE_ID
FROM 
    CUSTOMERS C
FULL OUTER JOIN 
    ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;


	SELECT 
    E.NAME AS Employee,
    M.NAME AS Manager
FROM 
    EMPLOYEES E
LEFT JOIN 
    EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID;


	


INSERT INTO EMPLOYEES (EMPLOYEE_ID, NAME, MANAGER_ID) VALUES
(1, 'Ali', NULL),      -- CEO, has no manager
(2, 'Salim', 1),        -- Salim reports to Ali
(3, 'Zahra', 1),        -- Zahra reports to Ali
(4, 'Amal', 2),         -- Amal reports to Salim
(5, 'Khalid', 3);       -- Khalid reports to Zahra



	DROP TABLE EMPLOYEES;

	CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    MANAGER_ID INT,  -- foreign key to EMPLOYEE_ID
    FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
);



	SELECT 
    E.NAME AS Employee,
    M.NAME AS Manager
FROM 
    EMPLOYEES E
LEFT JOIN 
    EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID;

	
	SELECT 
    E.NAME AS Employee,
    M.NAME AS Manager
FROM 
    EMPLOYEES E
RIGHT JOIN 
    EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID;

	-- JOIN Type	Includes All	NULLs Appear When...	Use Case
--LEFT JOIN	Employees	Employee has no manager	Show all employees + their boss
--RIGHT JOIN	Managers	Manager has no subordinates (no one reports to them)	Show all managers + subordinates


SELECT 
    E.EMPLOYEE_ID AS EmployeeID,
    E.NAME AS EmployeeName,
    M.EMPLOYEE_ID AS ManagerID,
    M.NAME AS ManagerName
FROM 
    EMPLOYEES E
, EMPLOYEES M WHERE E.MANAGER_ID = M.EMPLOYEE_ID;
