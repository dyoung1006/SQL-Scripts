-- find all products
SELECT * FROM bestbuy.products;
-- find all products that cost $1400
SELECT * FROM bestbuy.products WHERE Price >= 1400;
-- find all products that cost $11.99 or $13.99
SELECT * FROM bestbuy.products WHERE Price IN (11.99,13.99) ORDER BY 3;
-- find all products that do NOT cost 11.99 - using NOT
SELECT * FROM bestbuy.products WHERE Price NOT IN (11.99) ORDER BY 3;
-- find all products and sort them by price from greatest to least
SELECT * FROM bestbuy.products ORDER BY 3 DESC;
-- find all employees who don't have a middle initial
SELECT * FROM bestbuy.employees WHERE MiddleInitial IS NULL;
-- find distinct product prices
SELECT DISTINCT p.price from bestbuy.products AS p ORDER BY 1;
-- find all employees whose first name starts with the letter ‘j’
SELECT * FROM bestbuy.employees WHERE FirstName like 'j%';
-- find all Macbooks
SELECT * FROM bestbuy.products WHERE Name like '%macbook%';
-- find all products that are on sale
SELECT * FROM bestbuy.products WHERE OnSale !=0;
-- find the average price of all products
SELECT AVG(bestbuy.products.Price) AS AveragePriceOfProducts FROM bestbuy.products;
-- find all Geek Squad employees who don't have a middle initial
SELECT * FROM bestbuy.employees WHERE Title like 'Geek Squad' AND MiddleInitial IS NULL;
-- find all products from the products table whose stock level is in the range -- of 500 to 1200. Order by Price from least to greatest. Hint: Use the between keyword
SELECT * FROM bestbuy.products WHERE StockLevel BETWEEN 500 AND 1200;