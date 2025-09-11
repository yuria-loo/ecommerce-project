/*
E-Commerce Project: Implementation
This script implements the customer_order, oder_line, and review tables and insert data into
each table for the E-Commerce project
Class: AD 350
Name: Yuria Loo
*/

-- Specify a database to use
USE marketplace;


/************************************************************************************/
/*-----------------------  Create the customer_order table ------------------------ */
/************************************************************************************/
CREATE TABLE customer_order (
	order_id         INT              UNSIGNED AUTO_INCREMENT,
    user_id          INT              UNSIGNED NOT NULL,
    order_date       DATETIME         NOT NULL,
    shipping_addr    INT              UNSIGNED NOT NULL,
    
    CONSTRAINT     cust_orderPK       PRIMARY KEY (order_id),         -- a primary key
    
    CONSTRAINT     user_idFK          FOREIGN KEY (user_id)           -- a user id FK
					  REFERENCES  user(user_id)
						ON DELETE CASCADE ON UPDATE CASCADE,
                        
    CONSTRAINT     shipping_addrFK    FOREIGN KEY (shipping_addr)     -- an address FK
					  REFERENCES address(address_id)
						  ON DELETE CASCADE ON UPDATE CASCADE
);

/*--- Populate customer_order data ---*/

-- Customer 1: Acton
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (1, '2025-01-01', 1);

-- Customer 2: Aidan    
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (2, '2025-01-10', 2);

-- Customer 3: Alisa
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (3, '2025-01-15', 3);

-- Customer 4: Baker
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (4, '2025-01-15', 4);

-- Customer 5: Brielle
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (5, '2025-01-25', 5);

-- Customer 6: Blossom
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (6, '2025-01-27', 6);

-- Customer 7: Dalton
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (7, '2025-02-01', 7);

-- Customer 8: Deacon
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (8, '2025-02-10', 8);

-- Customer 9: Eagan
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (9, '2025-02-14', 9);
    
-- Customer 10: Ezra
INSERT INTO customer_order (user_id, order_date, shipping_addr)
VALUES
    (10, '2025-02-15', 10);
    
SELECT *
FROM customer_order;

/************************************************************************************/
/* ----------------------- Create the order_line table -----------------------------*/
/************************************************************************************/
CREATE TABLE order_line (
	order_line_id         INT                UNSIGNED AUTO_INCREMENT,
    order_id              INT                UNSIGNED NOT NULL,
    product_id            INT                UNSIGNED NOT NULL,
    quantity              INT                NOT NULL,
    
    CONSTRAINT             order_linePK      PRIMARY KEY (order_line_id),        -- a primary key
    
    CONSTRAINT             orderFK           FOREIGN KEY (order_id)              -- an order FK
								REFERENCES customer_order(order_id)
									ON DELETE CASCADE ON UPDATE CASCADE,
                                    
	CONSTRAINT             order_productFK   FOREIGN KEY (product_id)            -- an product FK
								REFERENCES product(product_id)
									ON DELETE CASCADE ON UPDATE CASCADE
);

/*--- Populate order_line data ---*/

-- order_id = 1 (Acton)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(1, 1, 1), 
	(1, 2, 1);
    
-- order_id = 2 (Aidan)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(2, 3, 1),
	(2, 4, 1);
    
-- order_id = 3 (Alisa)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(3, 5, 1),
	(3, 6, 1);
    
-- order_id = 4 (Baker)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(4, 7, 1),
	(4, 8, 1);
    
-- order_id = 5 (Brielle)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(5, 9, 1),
	(5, 10, 1);
    
-- order_id = 6 (Blossom)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(6, 11, 1),
	(6, 12, 1);
    
-- order_id = 7 (Dalton)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(7, 13, 1),
	(7, 14, 1);
    
-- order_id = 8 (Deacon)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(8, 15, 1),
	(8, 16, 1);
    
-- order_id = 9 (Eagan)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(9, 17, 1),
	(9, 18, 1);
    
-- order_id = 10 (Ezra)
INSERT INTO order_line (order_id, product_id, quantity)
VALUES
	(10, 19, 1),
	(10, 20, 1);
    
SELECT *
FROM order_line;

/************************************************************************************/
/* ------------------------- Create the review table -------------------------------*/
/************************************************************************************/

CREATE TABLE review (
	review_id            INT            UNSIGNED AUTO_INCREMENT,
    order_line_id        INT            UNSIGNED NOT NULL UNIQUE,
    rating               INT            NOT NULL,
    review_text          TEXT,
    
    CONSTRAINT           reviewPK      PRIMARY KEY (review_id),         -- a primary key
    
    CONSTRAINT           order_lineFK  FOREIGN KEY (order_line_id)      -- a order_lineFK
								REFERENCES order_line(order_line_id)
									ON DELETE CASCADE ON UPDATE CASCADE,
                                    
	CONSTRAINT           ratingRange    CHECK(rating BETWEEN 1 AND 5)     -- rating range constraint 
);

/*--- Populate review data ---*/

-- order_line =	1 (product_id = 1)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(1, 5, 'It is a great product.');

-- order_line =	2 (product_id = 2)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(2, 4, 'I love it.');

-- order_line = 3 (product_id = 3)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(3, 5, 'it has a lot of features.');

-- order_line =	4 (product_id = 4)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(4, 5, 'Easy to use.');

-- order_line =	5 (product_id = 5)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(5, 2, 'It is a little too heavy.');

-- order_line =	6 (product_id = 6)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(6, 1, 'The battery dies too fast.');

-- order_line =	7 (product_id = 7)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(7, 5, 'I liked it.');

-- order_line =	8 (product_id = 8)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(8, 3, 'It is okay.');

-- order_line =	9 (product_id = 9)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(9, 2, 'It is very uncomfortable. I liked the design tho.');

-- order_line =	10 (product_id = 10)
INSERT INTO review (order_line_id, rating, review_text)
VALUES
	(10, 5, 'They are so comfy.');

SELECT *
FROM review;

