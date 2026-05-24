USE attendance_db;

-- create

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    register_no VARCHAR(20) UNIQUE,
    full_name VARCHAR(100) NOT NULL,
     class_id INT NOT NULL,
     
    CONSTRAINT fk_student_user 
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
	CONSTRAINT fk_student_class
        FOREIGN KEY (class_id) REFERENCES classes(id)
);

-- insert
INSERT INTO students (user_id, register_no, full_name, class_id)
VALUES
(1, '24CA022', 'Kaviya', 2),
(2, '25CA005', 'Adhar', 1),
(3, '24IT012', 'Swathi', 6),
(4, '25IT007', 'Dharshan', 5),
(5, '24AIDS032', 'Shalini', 4),
(6, '25AIDS018', 'Hari', 3);


-- fetch 
SELECT * FROM students;

DROP TABLE students;