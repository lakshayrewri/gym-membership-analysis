
CREATE TABLE members (
member_id INT PRIMARY KEY,
name VARCHAR(100),
gender VARCHAR(10),
age INT,
city VARCHAR(50),
join_date DATE,
membership_type VARCHAR(20),
membership_status VARCHAR(20)
);

SELECT * FROM members;

CREATE TABLE trainers (
trainer_id INT PRIMARY KEY,
trainer_name VARCHAR(100),
specialization VARCHAR(50),
experience_years INT
);

SELECT * FROM trainers;

CREATE TABLE classes (
class_id INT PRIMARY KEY,
class_name VARCHAR(100),
trainer_id INT,
duration_minutes INT,
difficulty VARCHAR(20)
);

SELECT * FROM classes;

CREATE TABLE attendance (
attendance_id INT PRIMARY KEY,
member_id INT,
class_id INT,
attendance_date DATE
);

SELECT * FROM attendance;

CREATE TABLE payments (
payment_id INT PRIMARY KEY,
member_id INT,
amount NUMERIC(10,2),
payment_date DATE,
payment_method VARCHAR(20)
);

SELECT * FROM payments;

