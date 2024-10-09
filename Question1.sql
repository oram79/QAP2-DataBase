-- Logan Oram
-- Oct 9th, 2024

-- Creating Tables

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    enrollment_date DATE
);

CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(100)
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    course_description VARCHAR(255),
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- INSERTING DATA
-- Student Data

INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES
('Cole', 'Caufield', 'colecaufield22@gmail.com', '2024-10-09'),
('Nick', 'Suzuki', 'nicksuzuki14@gmail.com', '2024-10-09'),
('Juraj', 'Slafkovsky', 'jurajslaf20@gmail.com', '2024-10-09'),
('Lane', 'Hutson', 'lanehutson48@gmail.com', '2024-10-09'),
('Kaiden', 'Guhle', 'kaidenguhle21@gmail.com', '2024-10-09');

-- Professor Data

INSERT INTO professors (first_name, last_name, department) VALUES
('Martin', 'St.Louis', 'Intro to head coaching'),
('Kent', 'Hughes', 'Intro to Managing'),
('Geoff', 'Molson', 'Entrepreneurship 1001'),
('Jeff', 'Gorton', 'Entrepreneurship 2200');

-- Courses Data

INSERT INTO courses (course_name, course_description, professor_id) VALUES
('Offence', 'Intro To Offence', 2),
('Defence', 'Intro To Defence', 3),
('PowerPlay', 'Techniques On Power-Play', 1);

-- Enrollments Data
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-10-09'),
(2, 1, '2024-10-09'),
(3, 1, '2024-10-09'),
(4, 3, '2024-10-09'),
(5, 2, '2024-10-09');

-- Retrieve Students From Offence Course
SELECT CONCAT(s.first_name, ' ', s.last_name) as full_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
WHERE c.course_name = 'Offence';
-- Retrieve Courses And Professors To That Course
SELECT c.course_name, CONCAT(p.first_name, ' ', p.last_name) AS professor_full_name
FROM courses c
JOIN professors p ON c.professor_id = p.id;
-- Retrieve Courses That Have Students Enrolled
SELECT DISTINCT c.course_name
FROM courses c
JOIN enrollments e ON c.id = e.course_id;
-- Changing Student Email
UPDATE students
SET email = 'jurajslafkovsky20@gmail.com'
WHERE id = 3;
-- Delete The "Power-Play" Course
DELETE FROM enrollments
WHERE student_id = 4 AND course_id = 3;


