CREATE DATABASE student_management;
USE student_management;
DROP TABLE professor;
-- 1
CREATE TABLE student(
    id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    middle_name VARCHAR(45),
    autobiography BLOB,
    group_id INT NULL,
    entry_year INT(4) NOT NULL,
    date_of_birth DATE NOT NULL,
    city VARCHAR(50) NOT NULL,
    rating DECIMAL(4.2) DEFAULT 0.0 CHECK(rating BETWEEN 0 AND 100),
    scholarship DECIMAL
);
-- 2
CREATE TABLE student_group(
    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    name VARCHAR(20) NOT NULL,
    specialty_id INT
);
-- 3
CREATE TABLE specialty(
    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    name VARCHAR(20) UNIQUE NOT NULL
);
-- 4
CREATE TABLE course(
    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    name VARCHAR(40) NOT NULL,
    professor_id INT
);
-- 5
CREATE TABLE professor(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    second_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20)
);
-- 6
CREATE TABLE module_result(
    module_number INT NOT NULL CHECK(module_number BETWEEN 1 AND 2),
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade INT DEFAULT 0 CHECK(grade BETWEEN 0 AND 50)
);
-- 7
CREATE TABLE semester_result(
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade DECIMAL DEFAULT 0 CHECK (grade BETWEEN 0 AND 100),
    control_type VARCHAR(4) DEFAULT 'test' CHECK(control_type IN('test', 'exam'))
);
-- 8
CREATE TABLE scholarship(
    student_id INT NOT NULL,
    amount DECIMAL NOT NULL
);

-- 1.1
ALTER TABLE student
	ADD FOREIGN KEY (group_id)
    	REFERENCES student_group (id)
        ON UPDATE CASCADE
        ON DELETE SET NULL;
-- 1.4
ALTER TABLE course
    ADD FOREIGN KEY (professor_id)
        REFERENCES professor(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL;
-- 2.1
ALTER TABLE student_group
    ADD FOREIGN KEY (specialty_id)
        REFERENCES specialty(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL;
-- 2.6
ALTER TABLE module_result
    ADD FOREIGN KEY (student_id)
		REFERENCES student (id)
        ON UPDATE CASCADE,
	ADD FOREIGN KEY (course_id)
		REFERENCES course (id)
        ON UPDATE CASCADE;
-- 2.7
ALTER TABLE semester_result
	ADD FOREIGN KEY (student_id)
		REFERENCES student (id)
        ON UPDATE CASCADE,
	ADD FOREIGN KEY (course_id)
		REFERENCES course (id)
        ON UPDATE CASCADE;
-- 2.8
ALTER TABLE scholarship
	ADD FOREIGN KEY (student_id)
		REFERENCES student (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE;
        
-- 

INSERT INTO specialty (name)
	VALUES 	('Software Egineering'),
			('Physics'),
            ('Chemistry'),
            ('Mathematics');
-- 
INSERT INTO student_group (name, specialty_id)
    VALUES ('MN-41', 1), ('MNP-41', 2);
-- 
INSERT INTO student
(first_name, last_name, group_id, entry_year, date_of_birth, city) VALUES
    ('Anjey', 'Duda', 1, 2015, '1998-05-21', 'Abu-Dabi'),
    ('Olenka', 'Chereshnia', 1, 2015, '1997-02-19', 'Zbarazh'),
    ('Ivan', 'Nagnybida', 2, 2000, '1975-05-21', 'Zhmerynka'),
    ('James', 'Bond', 2, 2016, '1997-07-07', 'Washington');
-- 
INSERT INTO professor (first_name, second_name, middle_name)
	VALUES 	('Stepan', 'Guba', 'Karmenovych'),
			('Oleg', 'Oleg', 'Olegovych'),
            ('Adrian', 'Chelentano', 'Ivanovych');
-- 
INSERT INTO course (name, teacher_id)
	VALUES 	('Artificial Intelligence', 1),
			('Mobile and Web Computing', 2),
            ('Software Engineering', 3);
-- 
INSERT INTO module_result (module_number, student_id, course_id, grade)
	VALUES	(1, 1, 1, 44),
			(1, 1, 3, 96),
            (1, 3, 1, 85),
            (1, 3, 2, 100), 
            (1, 2, 1, 50),
            (2, 1, 2, 78);
	
INSERT INTO semester_result (semester_number, student_id, course_id, grade, control_type)
	VALUES 	(1, 1, 1, 56, 'test'),
			(1, 1, 3, 60, 'exam'),
            (1, 3, 2, 100, 'exam'),
            (1, 3, 1, 95, 'exam');
            
INSERT INTO scholarship (student_id, amount)
	VALUES	(1, 720.0),
			(3, 880.0);
            
SELECT student.last_name, student.first_name, course.name, professor.second_name, grade FROM student
		JOIN semester_result ON student_id = id
        JOIN course ON course.id=course_id
        JOIN professor ON professor.id = professor_id;
