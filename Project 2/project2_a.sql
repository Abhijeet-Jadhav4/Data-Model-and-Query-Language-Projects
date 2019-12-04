
/*----------- Solution for Question 1.1 ---------------------*/

SELECT eName FROM Employee, worksIn
WHERE Employee.eId = worksIn.emp
GROUP BY Employee.eName
HAVING COUNT(worksIn.dept) <=2 ;


/*----------- Solution for Question 1.2 ---------------------*/

SELECT eId, eName FROM Employee, Payroll
WHERE Employee.eId = Payroll.emp
GROUP BY Employee.eId, Employee.eName
HAVING COUNT(Payroll.year) >= 3 ;


/*----------Solution for Question 1.3 -----------------------*/

SELECT Employee.eName as Name, SUM (amount) as Income 
FROM employee 
LEFT OUTER JOIN Payroll on Employee.eId = Payroll.emp and year=2016
GROUP BY Employee.ename;


/*---------- Solution for Question 1.4 ----------------------*/

GO
CREATE VIEW [Income] AS
SELECT  worksIn.emp,worksIn.dept, Payroll.amount, payroll.year
FROM worksIn, Payroll
WHERE worksIn.emp = Payroll.emp

GO
SELECT Income.dept Department, count(DISTINCT Income.emp) Total_Employee, SUM(DISTINCT amount) Total_Income, AVG(DISTINCT amount) Average_Income
FROM [Income]
LEFT OUTER JOIN worksIn
ON worksIn.emp = Income.emp
WHERE year = 2016 
GROUP BY Income.dept;


/*-------- Solution for Question 2.1 -------------------------*/

SELECT * from Train;

WITH  Aec(Origin, Destination, Price) AS(
(SELECT * FROM Train)
UNION ALL
(SELECT Train.Origin, Aec.Destination, Train.Price
FROM Train , Aec
WHERE Train.Destination=Aec.Origin and Train.Price = Train.Price + Aec.Price))

SELECT DISTINCT Aec.Destination, MIN(Aec.Price) LeastCost
FROM Aec, Train
WHERE Train.Origin='Buffalo'
GROUP BY Aec.Destination;


/*---------- Solution for Question 2.2 ------------------------

When we run a query on an instance with cycles then the query will stop after 100 iterations as it can not get out of the recursion it exits forefully. As the operation is forcefully stopped so we do not get the desired output. */