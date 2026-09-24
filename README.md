<img width="1920" height="1021" alt="2026-09-24_13-51-24" src="https://github.com/user-attachments/assets/dc76dff7-2229-4d57-aff5-a9e73ee8f810" />
# Zara Bike Rentals Database System

A relational database project designed in MySQL to manage inventory, customer details, and rental operations for a bike rental business. This project covers database schema definition (DDL), data manipulation operations (DML), and external data ingestion from a CSV file using MySQL Workbench.

---

## 🛠️ Project Architecture & Schema

The database consists of three relational tables enforcing referential integrity via Foreign Keys:

1. **`bikes`**: Stores bike inventory details including brand, type, rental rates, and availability.
2. **`customers`**: Stores customer personal profiles and contact information.
3. **`rentals`**: Logs active and historical rental transactions linking customers to specific bikes.

---

## 💻 SQL Scripts

### 1. Data Definition Language (DDL) — Schema Setup

```sql

-- Create inventory table
CREATE TABLE bikes (
    bike_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50),
    type VARCHAR(30),
    daily_rental_rate DECIMAL(6, 2),
    availability_status VARCHAR(20)
);

-- Create customer table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email_address VARCHAR(255),
    date_of_birth DATE
);

-- Create rentals table with foreign key relationships
CREATE TABLE rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    bike_id INT,
    start_date DATE,
    expected_return_date DATE,
    actual_return_date DATE,
    total_amount_charged DECIMAL(8, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)
);

-- Insert new customer records
INSERT INTO customers (full_name, email_address, date_of_birth) 
VALUES 
    ('Fredrick Abbey Ipadeola', 'fredrick.ipadeola@gmail.com', '1994-05-14'),
    ('Fatodu Oluwatimilehin', 'elizabethfatodu2@gmail.com', '1993-05-01');

-- Update rental return status and calculate total charges
UPDATE rentals 
SET actual_return_date = CURRENT_DATE, 
    total_amount_charged = 37.50 
WHERE rental_id = 3;

-- Remove rental history for a specific closed customer account
DELETE FROM rentals 
WHERE customer_id = 7 
  AND customer_id IS NOT NULL;
