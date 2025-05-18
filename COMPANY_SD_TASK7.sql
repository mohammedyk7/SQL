SELECT * FROM Employee;
SELECT Fname, Lname, Salary, Dno
FROM Employee;
SELECT Pname, Plocation, Dnum
FROM Project;
SELECT Fname + ' ' + Lname AS FullName,
       Salary * 0.10 * 12 AS ANNUAL_COMM
FROM Employee;
SELECT Ssn, Fname + ' ' + Lname AS FullName
FROM Employee
WHERE Salary > 1000;
SELECT Ssn, Fname + ' ' + Lname AS FullName
FROM Employee
WHERE Salary * 12 > 10000;
SELECT Fname + ' ' + Lname AS FullName, Salary
FROM Employee
WHERE Sex = 'F';
SELECT Dnum, Dname
FROM Departments
WHERE MGRSSN = 968574;
SELECT Pnumber, Pname, Plocation
FROM Project
WHERE Dnum = 10;
INSERT INTO Employee (Ssn, Fname, Lname, Dno, Superssn, Salary)
VALUES (102672, 'YourFirst', 'YourLast', 30, 112233, 3000);
INSERT INTO Employee (Ssn, Fname, Lname, Dno)
VALUES (102660, 'FriendFirst', 'FriendLast', 30);
UPDATE Employee
SET Salary = Salary * 1.2
WHERE Ssn = 102672;