USE attendance_db;
CREATE TABLE teacher_timetable (
    id INT AUTO_INCREMENT PRIMARY KEY,

    teacher_id INT NOT NULL,
    class_id INT NOT NULL,
    subject_code VARCHAR(20) NOT NULL,

    day ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
    hour_number INT NOT NULL CHECK (hour_number BETWEEN 1 AND 6),

    CONSTRAINT fk_tt_teacher
        FOREIGN KEY (teacher_id) REFERENCES teachers(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_tt_class
        FOREIGN KEY (class_id) REFERENCES classes(id)
        ON DELETE CASCADE,

    UNIQUE (teacher_id, day, hour_number),
    UNIQUE (class_id, day, hour_number)
);

INSERT INTO teacher_timetable 
(teacher_id, class_id, subject_code, day, hour_number)
VALUES
-- MONDAY

-- Dr. Suresh (2 MCA)
(1, 2, 'MCA201', 'Monday', 1),
(1, 2, 'MCA201', 'Monday', 2),

-- Ms. Priya (1 MCA)
(2, 1, 'MCA101', 'Monday', 3),

-- Mr. Anand (1 AIDS)
(3, 3, 'AIDS101', 'Monday', 4),

-- Dr. Karthik (2 AIDS)
(4, 4, 'AIDS201', 'Monday', 5),

-- Dr. Suresh (1 MCA again)
(1, 1, 'MCA102', 'Monday', 6);

INSERT INTO teacher_timetable 
(teacher_id, class_id, subject_code, day, hour_number)
VALUES
-- TUESDAY

(1, 1, 'MCA102', 'Tuesday', 1),
(2, 4, 'AIDS201', 'Tuesday', 2),
(3, 4, 'AIDS201', 'Tuesday', 3),
(4, 3, 'AIDS102', 'Tuesday', 4),
(2, 2, 'MCA202', 'Tuesday', 5),
(3, 2, 'MCA202', 'Tuesday', 6);

SELECT * FROM teacher_timetable