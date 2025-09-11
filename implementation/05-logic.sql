/*
E-Commerce Project: Implementation
This will store stored procedures and functions, and a trigger for the marketplace database.alter
Class: AD 350
Name: Yuria Loo
*/

-- Specify a table to use
USE marketplace;

/*
*************** Stored Procedure: GetMostPopularProducts ***************
*/
DELIMITER //
CREATE PROCEDURE GetMostPopularProducts(IN start_date DATE, IN end_date DATE)
BEGIN
	SELECT
		p.product_id,
        p.product_name,
        SUM(ol.quantity) AS total_sold
	FROM product p
    JOIN order_line ol ON p.product_id = ol.product_id
    JOIN customer_order o ON ol.order_id = o.order_id
    WHERE o.order_date BETWEEN start_date AND end_date
    GROUP BY p.product_id
    ORDER BY total_sold DESC;
END //
DELIMITER ;

-- Call the procedure
-- CALL GetMostPopularProducts('2025-01-01', '2025-01-30');

/*
*************** Stored Procedure: GetLeastPopularProducts ***************
*/
DELIMITER //
CREATE PROCEDURE GetLeastPopularProducts (IN start_date DATE, IN end_date DATE)
BEGIN 
	SELECT
		p.product_id,
        p.product_name,
        IFNULL(SUM(ol.quantity), 0) AS total_sold
	FROM product p
    LEFT JOIN order_line ol ON p.product_id = ol.product_id
    LEFT JOIN customer_order o ON ol.order_id = o.order_id
		AND o.order_date BETWEEN start_date AND end_date
	GROUP BY p.product_id
    ORDER BY total_sold ASC;
END //
DELIMITER ;

-- CALL GetLeastPopularProducts('2025-01-01', '2025-01-30');

    
/*
*************** Function: GetProductStock ***************
*/
DELIMITER //
CREATE FUNCTION GetProductStock(prod_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE stock INT;
    SELECT quantity_available INTO stock
    FROM inventory
    WHERE product_id = prod_id;
    RETURN stock;
END //
DELIMITER ;

-- Call the function
-- SELECT GetProductStock(1);

/*
*************** Trigger: Update the invetory after customer order/order_line ***************
---------------- when a customer purchased a product, update the inventory ----------------
*/
DELIMITER //
CREATE TRIGGER UpdateInventoryAfterOrderLine
AFTER INSERT ON order_line
FOR EACH ROW
BEGIN
	UPDATE inventory
    SET quantity_available = quantity_available - NEW.quantity
    WHERE product_id = NEW.product_id;
END//
DELIMITER ;


-- test for geeting inactive users

SELECT DISTINCT 
    u.user_id,
    u.first_name,
    u.last_name,
    p.product_name,
    o.order_date
FROM user u
JOIN customer_order o ON u.user_id = o.user_id
JOIN order_line ol ON o.order_id = ol.order_id
JOIN product p ON ol.product_id = p.product_id
WHERE u.user_id NOT IN (
    SELECT user_id
    FROM customer_order
    WHERE order_date >= CURDATE() - INTERVAL 3 MONTH
)
ORDER BY u.user_id, p.product_name;

-- test to insert a new product to see the update in inventory
