USE attendance_db;
CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    staff_code VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    CONSTRAINT fk_teacher_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO teachers (user_id, staff_code, full_name, department)
VALUES
(7, 'CA_T301', 'Dr. Suresh', 'MCA'),
(10, 'CA_T305', 'Ms. Priya', 'MCA'),
(8, 'IT_T115', 'Mr. Anand', 'IT'),
(9, 'AI_T220', 'Dr. Karthik', 'AI&DS');

SELECT * FROM teachers ORDER BY user_id;
DROP TABLE teachers;

