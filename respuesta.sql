SELECT p.productname
FROM products p
JOIN orderdetails od ON p.productid = od.productid
JOIN orders o ON od.orderid = o.orderid
GROUP BY p.productid, p.productname
HAVING COUNT(DISTINCT o.employeeid) = (
    SELECT COUNT(*)
    FROM employees
);
SELECT c.contactname
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN orderdetails od ON o.orderid = od.orderid
GROUP BY c.customerid, c.companyname
HAVING MAX(od.unitprice) < 50;
SELECT DISTINCT e.title, e.firstname, e.lastname
FROM employees e
JOIN orders o ON e.employeeid = o.employeeid
JOIN orderdetails od ON o.orderid = od.orderid
JOIN products p ON od.productid = p.productid
WHERE p.productname IN ('Gravad lax', 'Mishi Kobe Niku');
SELECT e.firstname, e.lastname, c.companyname
FROM orders o
JOIN employees e ON o.employeeid = e.employeeid
JOIN customers c ON o.customerid = c.customerid
JOIN shippers s ON o.shipvia = s.shipperid
WHERE s.companyname = 'Speedy Express'
  AND c.city = 'Bruxelles';
 SELECT DISTINCT
    e.firstname  AS nombre,
    e.address AS direccion,
    e.city AS ciudad,
    e.region AS region
FROM employees e
JOIN orders o
    ON e.employeeid = o.employeeid
WHERE o.shipcountry = 'Belgium';