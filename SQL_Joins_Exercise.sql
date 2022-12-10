/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT 
	p.Name as 'Product Name', c.Name as 'Category Name'
FROM products AS p 
JOIN categories AS c
	ON c.CategoryID = p.CategoryID
WHERE c.Name like 'computers'
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT 
	p.Name, p.Price
FROM reviews as r
JOIN products as p
	ON p.ProductID = r.ProductID
WHERE r.Rating = 5
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT
	SUM(s.PricePerUnit * s.Quantity) as TotalSales, e.FirstName
FROM sales AS s
JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY 1 DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT 
	d.Name as DepartmentName, c.Name as CategoryName
FROM departments as d
JOIN categories as c
ON c.DepartmentID = d.DepartmentID
WHERE c.Name IN ('Appliances','Games')


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT 
	p.ProductID ,p.Name, SUM(s.Quantity) as 'TotalNumSold', SUM(s.PricePerUnit * s.Quantity) as 'TotalPriceSoldPerUnit'
FROM products as p
JOIN sales as s 
ON s.ProductID = p.ProductID
WHERE p.Name like 'Eagles: Hotel%'
GROUP BY p.ProductID, p.Name
ORDER BY 4

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT 
	p.Name, r.Reviewer, r.Rating, r.Comment
FROM reviews as r
JOIN products as p
ON p.ProductID = r.ProductID
WHERE p.Name like 'vis%'
ORDER BY r.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT 
	e.EmployeeID, 
    CONCAT(e.LastName,', ',e.FirstName) As 'Employee Full Name', 
    p.Name 'Product Name', 
    SUM(s.Quantity) as 'TotalNumSold', 
    SUM(s.PricePerUnit * s.Quantity) as 'TotalPriceSoldPerUnit'
FROM products as p
JOIN sales as s 
ON s.ProductID = p.ProductID
JOIN employees as e
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID, CONCAT(e.LastName,', ',e.FirstName), p.Name
ORDER BY 2, 4 DESC
