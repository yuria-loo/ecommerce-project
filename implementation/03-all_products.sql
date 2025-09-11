/*
E-Commerce Project: Implementation
This script implements the product_category, product, and inventory tables and insert data into
each table for the E-Commerce project
Class: AD 350
Name: Yuria Loo
*/

-- Specify a database to use
USE marketplace;

/************************************************************************************/
/*------------------- Create the product_category table ----------------------------*/
/************************************************************************************/
CREATE TABLE product_category (
	category_id       INT              UNSIGNED AUTO_INCREMENT,
    category_name     VARCHAR(50)      NOT NULL UNIQUE,
    
    CONSTRAINT        categoryPK       PRIMARY KEY (category_id)         -- a primary key
);

/*--- Populate product_category data ---*/
INSERT INTO product_category (category_name)
VALUES
	('Electronics'),             -- id = 1
    ('Clothing'),                -- id = 2
    ('Home & Kitchen'),          -- id = 3
    ('Health & Beauty'),         -- id = 4
    ('Sports & Outdoors'),       -- id = 5
    ('Jewelry'),                 -- id = 6
    ('Office Supplies'),         -- id = 7
    ('Pets'),                    -- id = 8
    ('Music, video & Gaming');   -- id = 9
    
SELECT *
FROM product_category
ORDER BY category_id;

/************************************************************************************/
/*----------------------- Create the product table ---------------------------------*/
/************************************************************************************/
CREATE TABLE product (
	product_id        INT UNSIGNED    AUTO_INCREMENT,
    category_id       INT UNSIGNED    NOT NULL,
    product_name      VARCHAR(100)    NOT NULL,
    product_descript  TEXT,
    price             DECIMAL(10, 2)  NOT NULL,
    
    CONSTRAINT        productPK       PRIMARY KEY (product_id),         -- a primary key
     
	CONSTRAINT        categoryFK      FOREIGN KEY (category_id)         -- a categoryFK
							REFERENCES product_category(category_id)
								ON DELETE CASCADE ON UPDATE CASCADE
);

/*--- Populate product data ---*/

-- Electronics (category_id = 1)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(1, 'TV', '42-inch smart LED TV', 299.99),
	(1, 'Headphones', 'Wireless over-ear headphones', 59.99),
	(1, 'Camera', 'Digital compact camera', 129.99),
    (1, 'Tablet', '10-inch touchscreen tablet', 199.99),
	(1, 'Smartphone', '5G Android phone', 499.00),
	(1, 'Smartwatch', 'Fitness tracking smartwatch', 129.00);

-- Clothing (category_id = 2)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(2, 'T-shirt', 'Cotton crew neck t-shirt', 15.99),
	(2, 'Jeans', 'Slim fit denim jeans', 39.99),
    (2, 'Jacket', 'Lightweight windbreaker jacket', 49.99),
	(2, 'Sneakers', 'Running sneakers for men', 59.99),
	(2, 'Dress', 'Casual cotton dress', 39.50);
    
-- Home & Kitchen (category_id = 3)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(3, 'Cookware Set', '5-piece non-stick cookware', 79.99),
	(3, 'Pillow', 'Memory foam pillow', 19.99),
	(3, 'Blender', 'Compact countertop blender', 34.99),
	(3, 'Mug Set', 'Set of 4 ceramic mugs', 18.99),
	(3, 'Knife Set', '5-piece stainless knife set', 29.99);
    
-- Health & Beauty (category_id = 4)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(4, 'Toner', 'Skin hydration toner', 12.50),
	(4, 'Toothbrush', 'Electric rechargeable toothbrush', 34.99),
    (4, 'Face Mask', 'Pack of 5 hydrating masks', 14.99),
	(4, 'Hair Brush', 'Detangling hair brush', 9.50),
	(4, 'Lip Balm', 'Organic moisturizing lip balm', 4.75);

-- Sports & Outdoors (category_id = 5)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(5, 'Yoga Mat', 'Non-slip exercise mat', 25.00),
	(5, 'Water Bottle', 'Insulated stainless steel bottle', 18.50),
    (5, 'Tennis Ball Pack', 'Pack of 3 tennis balls', 7.99),
	(5, 'Jump Rope', 'Adjustable speed rope', 12.99),
	(5, 'Camping Lantern', 'Battery-powered LED lantern', 22.00);

-- Jewelry (category_id = 6)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(6, 'Necklace', 'Simple silver chain necklace', 45.00),
	(6, 'Bracelet', 'Adjustable leather bracelet', 22.00),
    (6, 'Earrings', 'Stud earring set', 19.99),
	(6, 'Watch', 'Analog wrist watch', 59.00),
	(6, 'Ring', 'Gold-plated ring', 25.00);

-- Office Supplies (category_id = 7)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(7, 'Notebook', 'A5 spiral notebook', 5.99),
	(7, 'Pen Set', 'Pack of 10 black pens', 4.50),
    (7, 'Stapler', 'Compact desktop stapler', 8.25),
	(7, 'Desk Organizer', '5-compartment organizer', 15.50),
	(7, 'Highlighter Set', 'Assorted color pack of 6', 6.75);

-- Pets (category_id = 8)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(8, 'Dog Toy', 'Chew toy for dogs', 9.99),
	(8, 'Cat Bed', 'Soft round cat bed', 17.99),
    (8, 'Dog Leash', 'Adjustable nylon leash', 11.99),
	(8, 'Cat Toy Pack', 'Pack of 5 assorted toys', 10.50),
	(8, 'Pet Bowl', 'Stainless food/water bowl', 7.00);
    
-- Music, video & Gaming (category_id = 9)
INSERT INTO product (category_id, product_name, product_descript, price) 
VALUES
	(9, 'Gaming Mouse', 'Wired RGB gaming mouse', 24.99),
	(9, 'Guitar', 'Beginner acoustic guitar', 99.00),
    (9, 'Headset Stand', 'RGB stand with USB hub', 19.99),
	(9, 'Sheet Music Stand', 'Foldable music stand', 27.00),
	(9, 'Game Controller', 'Wireless gaming controller', 42.50);

SELECT *
FROM product;

/************************************************************************************/
/*---------------------- Create the inventory table --------------------------------*/
/************************************************************************************/
CREATE TABLE inventory (
	inventory_id           INT              UNSIGNED AUTO_INCREMENT,
    product_id             INT              UNSIGNED NOT NULL UNIQUE,
    quantity_available     INT              NOT NULL,
    
    CONSTRAINT             inventoryPK       PRIMARY KEY (inventory_id),         -- a primary key
    
    CONSTRAINT             productFK         FOREIGN kEY (product_id)            -- a productFK
								REFERENCES product(product_id)
									ON DELETE CASCADE ON UPDATE CASCADE
);

/*--- Populate inventory data ---*/
-- Each product have 50 items available in the inventory
INSERT INTO inventory (product_id, quantity_available) 
VALUES
	(1, 50), (2, 50), (3, 50), (4, 50), (5, 50), (6, 50),  -- Electronics (category_id = 1, product_id = 1 ~ 6)
	(7, 50), (8, 50), (9, 50), (10, 50), (11, 50),         -- Clothing (category_id = 2, product_id = 7 ~ 11)
	(12, 50), (13, 50), (14, 50), (15, 50), (16, 50),      -- Home & Kitchen (category_id = 3, product_id = 12 ~ 16)
	(17, 50), (18, 50), (19, 50), (20, 50), (21, 50),      -- Health & Beauty (category_id = 4, product_id = 17 ~ 21)
	(22, 50), (23, 50), (24, 50), (25, 50), (26, 50),      -- Sports & Outdoors (category_id = 5, product_id = 22 ~ 26)
	(27, 50), (28, 50), (29, 50), (30, 50), (31, 50),      -- Jewelry (category_id = 6, product_id = 27 ~ 31)
	(32, 50), (33, 50), (34, 50), (35, 50), (36, 50),      -- Office Supplies (category_id = 7, product_id = 32 ~ 36)
	(37, 50), (38, 50), (39, 50), (40, 50), (41, 50),      -- Pets (category_id = 8, product_id = 37 ~ 41)
	(42, 50), (43, 50), (44, 50), (45, 50), (46, 50);      -- Music, video & Gaming (category_id = 9, 42 ~ 46)

SELECT *
FROM inventory;
