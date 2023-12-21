-- 1. Database Design
-- 1. Create the database named "SISDB"
CREATE DATABASE SISDB;

USE SISDB;

-- 2. Data Definition Language (DDL):
-- 1. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships. 

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Teacher Table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);

-- 3. Data Manipulation Language (DML):
-- a) Insert at least 10 sample records into each of the following tables
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
	(1, 'John', 'Doe', '1995-05-15', 'john.doe@example.com', '1234567890'),
    (2, 'Joey', 'Tribiani', '1998-08-22', 'joey.tribiani@example.com', '9876543210'),
    (3, 'Chandler', 'Bing', '1997-02-28', 'chandler.bing@example.com', '5551234567'),
    (4, 'Ross', 'Geller','1996-10-10', 'ross.geller@example.com', '2223334444'),
    (5, 'Rachel', 'Green', '1999-07-18', 'rachel.green@example.com', '7778889999'),
    (6, 'Monica', 'Geller','1994-12-03', 'monica.geller@example.com', '4445556666'),
    (7, 'Pheobe', 'Buffay', '1998-04-25', 'pheobe.buffay@example.com', '6667778888'),
    (8, 'Taylor', 'Swift', '1996-09-15', 'taylor.swift@example.com', '8889990000'),
    (9, 'Jane', 'Doe', '1997-06-08', 'jane.doe@example.com', '1112223333'),
    (10, 'Vaibhav', 'Sharma','1994-11-20', 'vaibhav.sharma@example.com', '9990001111');

INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
    (1, 'Professor', 'Johnson', 'prof.johnson@example.com'),
    (2, 'Dr.', 'Smith', 'dr.smith@example.com'),
    (3, 'Mrs.', 'Williams', 'mrs.williams@example.com'),
    (4, 'Mr.', 'Davis', 'mr.davis@example.com'),
    (5, 'Professor', 'Anderson', 'prof.anderson@example.com'),
    (6, 'Dr.', 'Taylor', 'dr.taylor@example.com'),
    (7, 'Mrs.', 'Brown', 'mrs.brown@example.com'),
    (8, 'Mr.', 'Clark', 'mr.clark@example.com'),
    (9, 'Professor', 'Moore', 'prof.moore@example.com'),
    (10, 'Dr.', 'White', 'dr.white@example.com');

INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
    (101, 'Introduction to Programming', 3, 1),
    (102, 'Database Management', 4, 2),
    (103, 'Web Development', 3, 3),
    (104, 'Data Structures', 4, 1),
    (105, 'Artificial Intelligence', 4, 2),
    (106, 'Machine Learning', 3, 3),
    (107, 'Software Engineering', 4, 1),
    (108, 'Networking Fundamentals', 3, 2),
    (109, 'Digital Marketing', 3, 4),
    (110, 'Business Ethics', 2, 4);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 101, '2023-01-10'),
    (2, 2, 102, '2023-01-12'),
    (3, 3, 101, '2023-01-15'),
    (4, 4, 103, '2023-02-05'),
    (5, 5, 102, '2023-02-10'),
    (6, 6, 104, '2023-02-15'),
    (7, 7, 103, '2023-03-01'),
    (8, 8, 105, '2023-03-05'),
    (9, 9, 104, '2023-03-10'),
    (10, 10, 106, '2023-03-15');

INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
    (1, 1, 500.00, '2023-02-05'),
    (2, 2, 750.00, '2023-02-08'),
    (3, 3, 600.00, '2023-02-10'),
    (4, 4, 450.00, '2023-02-12'),
    (5, 5, 800.00, '2023-02-15'),
    (6, 6, 700.00, '2023-02-18'),
    (7, 7, 550.00, '2023-02-20'),
    (8, 8, 900.00, '2023-02-22'),
    (9, 9, 650.00, '2023-02-25'),
    (10, 10, 1000.00, '2023-02-28');

-- b) Write SQL queries for the following tasks: 
-- 1. Write an SQL query to insert a new student into the "Students" table with the following details:
-- a. First Name: John
-- b. Last Name: Doe
-- c. Date of Birth: 1995-08-15
-- d. Email: john.doe@example.com
-- e. Phone Number: 1234567890
INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number)
VALUES (11,'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

-- 2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (11, 5, 107, GETDATE());

-- 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.
UPDATE Teacher
SET email = 'clark@example.com'
WHERE teacher_id = 8;

-- 4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on student and course.
DELETE FROM Enrollments
WHERE enrollment_id =11;

-- 5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
UPDATE Courses
SET teacher_id = 6
WHERE course_id = 101;

-- 6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.
DELETE FROM Enrollments
WHERE student_id = 11;

DELETE FROM Students
WHERE student_id = 11;

-- 7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.
UPDATE Payments
SET amount = 350
WHERE payment_id = 3;

-- 4. Joins:
-- 1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.
SELECT student_id, SUM(amount) AS total_payments
FROM Payments
WHERE student_id = 5
GROUP BY student_id;

-- 2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrolled_students_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- 5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id;

-- 6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.
SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 101;

-- 7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL;

-- 8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.
SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

-- 9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
JOIN Enrollments e1 ON s.student_id = e1.student_id
JOIN Enrollments e2 ON s.student_id = e2.student_id AND e1.course_id <> e2.course_id;

-- 10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.
SELECT t.teacher_id, t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;

-- 5. Aggregate Functions and Subqueries:
-- 1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.
SELECT course_id, AVG(enrolled_count) AS average_students_enrolled
FROM (
    SELECT course_id, COUNT(student_id) AS enrolled_count
    FROM Enrollments
    GROUP BY course_id
) AS enrollment_counts
GROUP BY course_id;

-- 2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
SELECT Students.student_id, first_name, last_name, amount
FROM Students
JOIN Payments ON Students.student_id = Payments.student_id
WHERE amount = (SELECT MAX(amount) FROM Payments);

-- 3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.
SELECT
    course_id,
    course_name,
    enrollment_count
FROM
    (
        SELECT
            c.course_id,
            c.course_name,
            COUNT(e.student_id) AS enrollment_count,
            RANK() OVER (ORDER BY COUNT(e.student_id) DESC) AS enrollment_rank
        FROM
            Courses c
        LEFT JOIN
            Enrollments e ON c.course_id = e.course_id
        GROUP BY
            c.course_id, c.course_name
    ) AS ranked_courses
WHERE
    enrollment_rank = 1;

-- 4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
SELECT
    t.teacher_id,
    t.first_name,
    t.last_name,
    SUM(p.amount) AS total_payments
FROM
    Teacher t
LEFT JOIN
    Courses c ON t.teacher_id = c.teacher_id
LEFT JOIN
    Enrollments e ON c.course_id = e.course_id
LEFT JOIN
    Payments p ON e.student_id = p.student_id
GROUP BY
    t.teacher_id, t.first_name, t.last_name;


-- 5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.
SELECT student_id, first_name, last_name
FROM Students
WHERE (SELECT COUNT(DISTINCT course_id) FROM Courses) =
      (SELECT COUNT(DISTINCT course_id) FROM Enrollments WHERE Students.student_id = Enrollments.student_id);

-- 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
SELECT teacher_id, first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);

-- 7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
SELECT
    AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM
    Students;

-- 8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

-- 9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.

-- 10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
SELECT student_id, first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Payments
    GROUP BY student_id
    HAVING COUNT(payment_id) > 1
);

-- 11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.

-- 12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
SELECT c.course_name, (
    SELECT COUNT(*)
    FROM Enrollments e
    WHERE e.course_id = c.course_id
) AS enrolled_students_count
FROM Courses c;

-- 13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT AVG(amount) AS average_payment_amount
FROM Payments;
