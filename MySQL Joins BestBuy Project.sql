/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT products.Name "Product Name", categories.Name "Categorie Name"
/* SELECT products.Name as "Product Name", categories.Name as "Categorie Name" */
FROM products
INNER JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE categories.Name="computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, Sum(sales.Quantity) as Total
FROM employees
INNER JOIN sales
on employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
/*-- ORDER BY DESC*/
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name as "Department Name", categories.Name as "Category Name"
-- SELECT * this would mean all the columns from all the tables
FROM categories
-- INNER JOIN department
INNER JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = "appliances" OR  categories.Name = "games";



/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%visio%";

/* joins: find the product name, total # sold, and total price sold, for Eagles: Hotel California --You may need to use SUM() */
/*SELECT products.Name,  Sum(sales.Quantity) as "Total Units Sold",  Sum(sales.PricePerUnit * sales.Quantity) as "Total Price Sold" - This statement does not workk. Sum does not work in my compiler */  
SELECT products.Name,  sales.Quantity as "Total Units Sold", sales.PricePerUnit * sales.Quantity as "Total Price Sold" 
FROM products
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name LIKE "%hotel%california%" 
GROUP BY products.Name, sales.Quantity, sales.PricePerUnit;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
/* This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

