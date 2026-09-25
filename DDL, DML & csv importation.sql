-- 1. DDL: SCHEMA CREATION
CREATE TABLE zara_bike_rentals.bikes (
	bike_id int AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
	type VARCHAR(30) NOT NULL,
    daily_rental_rate DECIMAL(6, 2) NOT NULL,
    availability_status VARCHAR(20) NOT NULL
);
CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email_address VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);
CREATE TABLE rentals (
	rental_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT NOT NULL,
    bike_id INT NOT NULL,
    start_date DATE NOT NULL,
    expected_return_date DATE NOT NULL,
    actual_return_date DATE,
    total_amount_charged DECIMAL(8, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)
);

-- 2. DML: DATA INSERTION & UPDATES
-- Insert two new customer records
INSERT INTO customers (full_name, email_address, date_of_birth) 
VALUES 
	('Fredrick Abbey Ipadeola', 'fredrick.ipadeola@gmail.com', '1994-05-14'),
    ('Fatodu Oluwatimilehin', 'elizabethfatodu2@gmail.com', '1993-05-01');
    
-- Update rental_id = 3 with return date and charge
UPDATE rentals
SET actual_return_date = CURRENT_DATE,
	total_amount_charged = 37.50
WHERE rental_id = 3;

-- Delete rental records for customer_id = 7
DELETE FROM rentals
WHERE customer_id = 7
AND customer_id IS NOT NULL;