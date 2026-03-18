
--ADD FORIEGN KEY

--Classes - trainer

ALTER TABLE classes
ADD CONSTRAINT fk_trainer
FOREIGN KEY (trainer_id)
REFERENCES trainers(trainer_id);

--attendance - members

ALTER TABLE attendance
ADD CONSTRAINT fk_member
FOREIGN KEY (member_id)
REFERENCES members(member_id);

SELECT * FROM attendance
WHERE member_id NOT IN (
SELECT member_id FROM members
);

DELETE FROM attendance
WHERE member_id NOT IN (
SELECT member_id FROM members
);

--Attendance to classes

ALTER TABLE attendance
ADD CONSTRAINT fk_classes
FOREIGN KEY (class_id)
REFERENCES classes(class_id);

--Payments - members

ALTER TABLE payments
ADD CONSTRAINT fk_member
FOREIGN KEY (member_id)
REFERENCES members(member_id);
