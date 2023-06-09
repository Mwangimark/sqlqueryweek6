
use BikeStores;

--retreieve list of orders, first name of customers and first name of staff
SELECT o.order_id, c.first_name, s.first_name
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
JOIN sales.staffs s ON o.staff_id = s.staff_id;


-- view that returns total quantity and sales amount of each products
CREATE VIEW product_sales AS
SELECT p.product_id, p.product_name, SUM(od.quantity) AS total_quantity, SUM(od.quantity * od.list_price) AS sales_amount
FROM production.products p
JOIN sales.order_items od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name;


--Sp that accepts customer id and returns total number of orders placed by the customers
CREATE PROCEDURE GetTotalOrdersByCustomer(IN customerID INT, OUT totalOrders INT)
BEGIN
    SELECT COUNT(*) INTO sales.order_status
    FROM sales.orders
    WHERE customer_id = customer_id;
END;

--Top 5 customers to place the orders
SELECT c.customer_id, c.first_name, COUNT(*) AS total_orders
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_orders DESC
LIMIT 5;






