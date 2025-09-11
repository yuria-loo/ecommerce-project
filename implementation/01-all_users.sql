/*
E-Commerce Project: Implementation
This script implements the user, admin, and customer tables and insert data into
each table for the E-Commerce project
Class: AD 350
Name: Yuria Loo
*/

/*--- Crete the online marketplace database: marketplace */
CREATE DATABASE IF NOT EXISTS marketplace;
USE marketplace;

/************************************************************************************/
/*------------------------- Create the user table ----------------------------------*/
/************************************************************************************/
CREATE TABLE user (
	user_id         INT UNSIGNED     AUTO_INCREMENT,
    first_name      VARCHAR(100)      NOT NULL,
    last_name       VARCHAR(100)      NOT NULL,
    email           VARCHAR(250)      UNIQUE NOT NULL,
    user_password   VARCHAR(100)     NOT NULL,
    phone_number    VARCHAR(15),
    user_type       VARCHAR(15)      NOT NULL,
    
    CONSTRAINT      userPK           PRIMARY KEY (user_id),
    
    CONSTRAINT      user_type_check  CHECK (user_type IN ('Admin', 'Customer'))
);

/*--- Populate data (20 customers)---*/
INSERT INTO user (first_name, last_name, email, user_password, phone_number, user_type)
VALUES
	("Acton", "Henderson", "actonhenderson@protonmail.com", "565IOB", "875-7647", "Customer"),
	("Aidan","Caldwell","aidan.caldwell@google.com","642QSO","651-7964","Customer"),
    ("Alisa","Flores","alisa_flores9724@icloud.com","256OWN","184-2318","Customer"),
	("Baker", "Pratt", "prattbaker4215@hotmail.com", "512OGX", "567-1173", "Customer"),
    ("Brielle","Bowen","bowen_brielle1537@protonmail.com","821KKO","423-3836","Customer"),
    ("Blossom","Gibbs","blossom-gibbs494@google.net","758YQD","903-4569","Customer"),
	("Dalton", "Weaver", "w_dalton@google.com", "817YVU", "269-0391", "Customer"),
	("Deacon", "Swanson", "swanson.deacon7203@protonmail.net", "696HRM", "914-5614", "Customer"),
    ("Eagan", "Hurley", "h-eagan@hotmail.com", "286BHD", "725-8538", "Customer"),
    ("Ezra","Holt","eholt@outlook.com","163DZJ","742-1979","Customer"),
    
    ("Ferdinand", "Chaney", "chaney.ferdinand@hotmail.net", "603NZC", "854-4441", "Customer"),
    ("Ignacia", "Marshall", "marshall.ignacia7042@hotmail.net", "699WJE", "576-6481", "Customer"),
    ("Lawrence","Stewart","stewart-lawrence@aol.com","877BDZ","747-0126","Customer"),
    ("Merrill","Blackwell","blackwell.merrill@hotmail.net","739COJ","733-4551","Customer"),
    ("Nasim","Mooney","m-nasim8143@protonmail.net","996CLV","556-7468","Customer"),
    ("Prescott", "Poole", "prescott_poole1836@aol.com", "854IWF", "414-6529", "Customer"),
	("Rebecca", "Bates", "rbates7760@icloud.com", "266QEF", "613-9345", "Customer"),
	("Reese","Morse","r-morse7003@hotmail.com","604QFU","538-8620","Customer"),
	("Whilemina", "Glover", "w-glover696@outlook.com", "479EKT", "659-7561", "Customer"),
	("Xantha","Cantrell","cantrell-xantha1095@aol.com","232MNX","746-3167","Customer");
	
	
/*--- Populate data (10 admins)---*/    
INSERT INTO user (first_name, last_name, email, user_password, phone_number, user_type)
VALUES
	("Stephen", "West", "curabitur.consequat@aol.net", "157DSO", "385-846-979", "Admin"),
    ("Todd", "Rivas", "vel@aol.net", "615QKD", "455-216-718", "Admin"),
	("Olympia", "Fry", "nunc.ullamcorper@outlook.com", "744HTD", "912-491-737", "Admin"),
	("Sade", "Harrison", "vel.faucibus.id@aol.com", "032SDX", "620-571-824", "Admin"),
	("Zoe", "Moore", "blandit.viverra.donec@icloud.com", "819ODT", "469-864-261", "Admin"),
	("Isabelle", "Wyatt", "eu@outlook.com", "926NHX","845-871-326", "Admin"),
	("Stephanie", "Baird", "faucibus.morbi.vehicula@outlook.net", "617XHL", "415-579-570", "Admin"),
	("Karina", "Estrada", "mus.donec@outlook.com", "874JEY", "666-851-448", "Admin"),
	("Risa", "Hooper", "lacus@hotmail.com", "924DEW", "365-416-562", "Admin"),
	("Nevada", "Blankenship", "ipsum.curabitur@yahoo.net", "898MWR", "354-496-935", "Admin");
        
SELECT *
FROM user;

/************************************************************************************/
/*------------------ Create the customer table (subtype of user) ------------------*/
/************************************************************************************/
CREATE TABLE customer (
	user_id      INT            UNSIGNED NOT NULL,
    loyalty      INT            DEFAULT 0,
    CONSTRAINT   customerPK     PRIMARY KEY (user_id),
    
    CONSTRAINT   customerFK     FOREIGN KEY (user_id) 
					REFERENCES user(user_id)
						ON DELETE CASCADE ON UPDATE CASCADE
);

/*--- Populate data (20 customers)---*/
-- loyalty set to zero
INSERT INTO customer (user_id, loyalty) 
VALUES
	(1, 0), (2, 0), (3, 0), (4, 0), (5, 0),       -- user_id = 1 ~ 5
    (6, 0), (7, 0), (8, 0), (9, 0), (10, 0),      -- user_id = 6 ~ 10
	(11, 0), (12, 0), (13, 0), (14, 0), (15, 0),  -- user_id = 11 ~ 15
    (16, 0), (17, 0), (18, 0), (19, 0), (20, 0);  -- user_id = 16 ~ 20
    
SELECT *
FROM customer;

/************************************************************************************/
/*-------------------- Create the admin table (subtype of user) -------------------*/
/************************************************************************************/
CREATE TABLE admin (
	user_id        INT           UNSIGNED NOT NULL, 
    admin_role     VARCHAR(30)   NOT NULL,
    permissions    TEXT,
    CONSTRAINT     adminPK       PRIMARY KEY (user_id),
    
    CONSTRAINT     adminFK       FOREIGN KEY (user_id) 
					REFERENCES user(user_id)
						ON DELETE CASCADE ON UPDATE CASCADE
);

/*--- Populate data (10 admins)---*/
INSERT INTO admin (user_id, admin_role, permissions) 
VALUES
	(21, 'Inventory Manager', 'Can manage products, inventory, and categories'),          -- "Stephen West"
    (22, 'Support Admin', 'Can view orders, manage users, and handle support tickets'),   -- "Todd Rivas"
    (23, 'Support Admin', 'Can view orders, manage users, and handle support tickets'),   -- "Olympia Fry"
    (24, 'Support Admin', 'Can view orders, manage users, and handle support tickets'),   -- "Sade Harrison"
    (25, 'Support Admin', 'Can view orders, manage users, and handle support tickets'),   -- "Zoe Moore"
    (26, 'Support Admin', 'Can view orders, manage users, and handle support tickets'),   -- "Isabelle Wyatt"
    (27, 'Customer Support', 'Can view orders and respond to customer inqueries'),        -- "Stephanie Baird"
    (28, 'Customer Support', 'Can view orders and respond to customer inqueries'),        -- "Karina Estrada"
    (29, 'System Support', 'Can manage system, and handle support tickets'),              -- "Risa Hooper"
    (30, 'System Support', 'Can manage system, and handle support tickets');              -- "Nevada Blankenship"
        
SELECT *
FROM admin;