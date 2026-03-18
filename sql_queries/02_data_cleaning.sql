
--Data cleaning - members table

--1. Find all members whose join_date is NULL.

SELECT * FROM members
WHERE join_date IS NULL;

DELETE FROM members
WHERE join_date IS NULL;

--2. Identify inconsistent values in membership_type such as monthly, Monthly, yearly, and Yearly.

SELECT DISTINCT membership_type FROM members;

UPDATE members
SET membership_type = 'Monthly'
WHERE membership_type = 'monthly';

UPDATE members
SET membership_type = 'Yearly'
WHERE membership_type = 'yearly';

--3. Find members whose age is less than 18 or greater than 60.

SELECT * FROM members;
WHERE age<18 OR age>60;

--4. Find duplicate members where the same name and city combination appears more than once.

SELECT name,city, COUNT(*) FROM members
GROUP BY name,city
HAVING COUNT(*)>1;

DELETE FROM members
WHERE member_id NOT IN (
SELECT MIN(member_id)
FROM members
GROUP BY name,city
);

--Data Cleaning - Trainers table

--5. Identify trainers whose experience_years is negative or greater than 25, indicating unrealistic values

SELECT * FROM trainers
WHERE experience_years <0  OR experience_years > 25;

--6. Find trainers whose specialization field is NULL or empty.

SELECT * FROM trainers
WHERE specialization IS NULL;

--Data Cleaning - Classes table

--7. Detect classes where duration_minutes is less than 30 or greater than 120, which may indicate incorrect data entry.

SELECT * FROM classes
WHERE duration_minutes<30 OR duration_minutes>120;

--8. Identify classes where trainer_id does not exist in the trainers table.

SELECT * FROM classes
WHERE trainer_id NOT IN (
SELECT trainer_id 
FROM trainers
);

--Data Cleaning - Payments table

--9. Identify payments where amount is NULL, zero, or negative, indicating incorrect transaction data.

	SELECT * FROM payments
	WHERE amount IS NULL OR amount<=0;

	DELETE FROM payments
	WHERE amount IS NULL;

--10. Detect payments where member_id does not exist in the members table.

SELECT * FROM payments
WHERE member_id NOT IN (
SELECT member_id FROM members
);

DELETE FROM payments
WHERE member_id NOT IN (
SELECT member_id FROM members
);

 --11. Null values payment_date

SELECT * FROM payments 
WHERE payment_date IS NULL;

DELETE FROM payments 
WHERE payment_date IS NULL;

