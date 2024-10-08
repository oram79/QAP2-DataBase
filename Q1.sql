-- CREATE TABLES

CREATE TABLE students (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    enrollment_date DATE
);

CREATE TABLE professors (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT,
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

-- INSERT DATA
-- Insert Students

INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES
('Cole', 'Caufield', 'colecaufield22@gmail.com', '2019-06-21'),
('Nick', 'Suzuki', 'nicksuzuki14@gmail.com', '2017-06-23'),
('Juraj', 'Slafkovsky', 'jurajslaf20@gmail.com' '2022-07-8'),
('Lane', 'Hutson', 'lanehutson48@gmail.com', '2024-10-09'),
('Kaiden', 'Guhle', 'kaidenguhle21@gmail.com', '2022-03-09');

INSERT INTO professors (first_name, last_name, department) VALUES
('Martin', 'St.Louis', 'Intro to head coaching'),
('Kent', 'Hughes', 'Intro to Managing'),
('Geoff', 'Molson' 'Entrepreneurship 1001'),
('Jeff', 'Gorton', 'Entrepreneurship 2200');

