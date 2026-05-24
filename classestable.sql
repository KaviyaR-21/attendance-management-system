USE attendance_db;

CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    UNIQUE (course, year)
);
INSERT INTO classes (course, year) VALUES
('MCA', 1),
('MCA', 2),
('AI&DS', 1),
('AI&DS', 2),
('IT', 1),
('IT', 2);
SELECT * FROM classes;