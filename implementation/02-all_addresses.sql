/*
E-Commerce Project: Implementation
This script implements the address, and user_address tables and insert data into
each table for the E-Commerce project
Class: AD 350
Name: Yuria Loo
*/

-- Specify a database to use
USE marketplace;

/************************************************************************************/
/*--------------------- Create the address table -----------------------------------*/
/************************************************************************************/
CREATE TABLE address (
	address_id       INT           UNSIGNED AUTO_INCREMENT,
    street_line1     VARCHAR(100)  NOT NULL,
    street_line2     VARCHAR(100),
    city             VARCHAR(50)   NOT NULL,
    region           VARCHAR(50)   NOT NULL,
    postal_code      VARCHAR(15)   NOT NULL,
    
    CONSTRAINT       addressPK    PRIMARY KEY (address_id)
);

/*--- Populate data (30 addresses)---*/
-- the addresses are randomly generated, so they do not make any sence. 
INSERT INTO address (street_line1, city, region,postal_code)
VALUES
	("9317 Non Street","Lewiston","Illinois","42926"),
	("6249 Et Av.","Springdale","Pennsylvania","35635"),
	("1763 Sociis Av.","San Antonio","Ohio","35297"),
	("6439 A Rd.","Lowell","Wisconsin","71178"),
	("380-5654 Mus. St.","Essex","Georgia","37585"),
	("8728 Arcu. Ave","Aurora","Nebraska","60021"),
	("6699 Amet, Rd.","Kenosha","Montana","50198"),
	("486 Donec Road","Kansas City","Washington","83919"),
	("4497 Mollis Avenue","Vancouver","Arkansas","86679"),
	("605 Odio. Street","Kansas City","Alabama","25127");
    
INSERT INTO address (street_line1, city, region,postal_code)
VALUES
  ("8670 Enim Road","Jefferson City","Nevada","94436"),
  ("142 Etiam Street","Wyoming","Delaware","81142"),
  ("3908 A, Rd.","Baton Rouge","Iowa","32823"),
  ("8831 A Street","Milwaukee","Kentucky","47974"),
  ("8870 Aliquam, St.","Fort Worth","Alabama","36484"),
  ("1752 Eu Avenue","Glendale","Pennsylvania","55173"),
  ("7723 Velit Ave","Butte","Washington","73316"),
  ("7700 Ullamcorper, Rd.","Springfield","Minnesota","20427"),
  ("1667 Tempor Avenue","Cleveland","Michigan","03154"),
  ("2191 Lorem St.","Owensboro","Louisiana","79326");
  
INSERT INTO address (street_line1, city, region,postal_code)
VALUES
  ("4170 Fermentum Ave","Portland","Minnesota","63752"),
  ("1997 Libero. St.","Kapolei","Oklahoma","7550"),
  ("244 Urna. Avenue","Rutland","Missouri","75370"),
  ("1901 Ridiculus Road","Detroit","Michigan","53730"),
  ("1481 Tempus Av.","Cambridge","Michigan","81462"),
  ("9387 Quis, St.","Fort Smith","Idaho","84193"),
  ("4009 Primis Ave","Chesapeake","Colorado","66670"),
  ("4235 Congue, St.","Norman","Wyoming","31401"),
  (" 8407 Nibh. Road","Gulfport","Wyoming","31690"),
  ("7984 Turpis Road","Kapolei","Arkansas","11812");
  
SELECT *
FROM address;

/************************************************************************************/
/*--------------------- Create the user_address table ------------------------------*/
/************************************************************************************/
/* The user_address table serves as a mapping table for the user and the address table 
since those table are many-to-many relationship.
*/
CREATE TABLE user_address (
	user_id        INT               UNSIGNED NOT NULL,
    address_id     INT               UNSIGNED NOT NULL,
    is_default     BOOLEAN           NOT NULL,
    
    CONSTRAINT     user_addressPK    PRIMARY KEY (user_id, address_id),
    
	CONSTRAINT     user_addressFK1   FOREIGN KEY (user_id) 
					REFERENCES user(user_id)
						ON DELETE CASCADE ON UPDATE CASCADE,
                        
	CONSTRAINT     user_addressFK2   FOREIGN KEY (address_id) 
					REFERENCES address(address_id)
						ON DELETE CASCADE ON UPDATE CASCADE
);

/*--- Populate data ---*/

INSERT INTO user_address (user_id, address_id, is_default)
VALUES
	(1, 1, TRUE),  
    (2, 2, TRUE),
    (3, 3, TRUE),
    (4, 4, TRUE),
    (5, 5, TRUE),
    (6, 6, TRUE),
    (7, 7, TRUE),
    (8, 8, TRUE),
    (9, 9, TRUE),
    (10, 10, TRUE);
    
INSERT INTO user_address (user_id, address_id, is_default)
VALUES
	(11, 11, TRUE),
    (12, 12, TRUE),
    (13, 13, TRUE),
    (14, 14, TRUE),
    (15, 15, TRUE),
    (16, 16, TRUE),
    (17, 17, TRUE),
    (18, 18, TRUE),
    (19, 19, TRUE),
    (20, 20, TRUE);

SELECT *
FROM user_address;

