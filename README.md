# E-Commerce Marketplace Database & CLI App

## Overview

This project is a class project developed to demonstrate a complete database-driven application for an e-commerce platform. It includes a fully normalized MySQL ddatabase schema and a Python command-line interface to interact with it.

## Features
- Track and manage users (admin and customer roles)
- Inventory management system
- Product and category management
- Review system for verified purchases
- Stored procedures, functions, and triggers for advanced logic

## Technologies Used
- MySQL (SQL for DDL, DML, triggers, procedures)
- Python (with `mysql-connector-python`)
- Lucidchart (for ERD design)
- .env file for password security

## Diagrams


## Directory Structure
```
├── ecommerce_app/
│ ├── db_config.py # DB connection settings
│ ├── queries.py # All SQL-related logic
│ ├── menu.py # Main menu logic for CLI
│ └── main.py # Entry point of the CLI app
├── implementation/
│ ├── 01-all_users.sql # SQL script
│ ├── 02-all_addresses.sql 
│ ├── 03-all_products.sql
│ ├── 04-all_orders.sql
│ └── 05-logic.sql
├── .env
```

## Getting Started

1. Clone the Repository

2. Install Requirements
```
pip install -r requirements.txt
```

3. Set Up `.env` File  
Create a `.env` file in the root of the project directory:
```
DB_HOST=localhost
DB_USER=your_mysql_username
DB_PASSWORD=your_mysql_password
DB_NAME=marketplace
```
> Make sure to include `.env` in your `.gitignore` file to avoid exposing credentials.

The app uses Python's `dotenv` library to securely load your credential from `.env`.

4. Run SQL Scripts  
Use MySQL workbench or terminal to run the scripts in `/implementation` directory to setup the database schema.  

5. Launch the App  
```
python main.py
```
Follow the menu to perform database operations interactively.  
