USE attendance_db;

CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,

    student_id INT NOT NULL,
    teacher_id INT NOT NULL,
    class_id INT NOT NULL,

    date DATE NOT NULL,
    hour_number INT NOT NULL CHECK (hour_number BETWEEN 1 AND 6),

    status ENUM('Present','Absent','OnDuty') NOT NULL,

    marked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_att_student
        FOREIGN KEY (student_id) REFERENCES students(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_att_teacher
        FOREIGN KEY (teacher_id) REFERENCES teachers(id),

    CONSTRAINT fk_att_class
        FOREIGN KEY (class_id) REFERENCES classes(id),

    UNIQUE (student_id, date, hour_number)
);
INSERT INTO attendance 
(student_id, teacher_id, class_id, date, hour_number, status)
VALUES
(1, 1, 2, '2026-02-20', 1, 'Present'),
(1, 1, 2, '2026-02-20', 2, 'Present'),
(1, 2, 2, '2026-02-20', 3, 'Absent');
 
 SELECT * FROM attendance;
 DROP TABLE attendance;