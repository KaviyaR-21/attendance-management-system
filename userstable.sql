CREATE DATABASE attendance_db;
USE attendance_db;


--User table is created
DROP TABLE users;
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin','student', 'teacher') NOT NULL,
  is_first_login BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--INSERT values
-- Students
INSERT INTO users (username, password, role) VALUES
('24CA022', '210703', 'student'),
('25CA005', '150604', 'student'),
('24IT012',  '251003', 'student'),
('25IT007',  '120604', 'student'),
('24AIDS032','120603', 'student'),
('25AIDS018','271104', 'student');

-- Teachers
INSERT INTO users (username, password, role) VALUES
('CA_T301', '010178', 'teacher'),
('IT_T115', '120680', 'teacher'),
('AI_T220', '150575', 'teacher'),
('CA_T305', '221080', 'teacher');

INSERT INTO users (username, password, role)
VALUES ('ADMIN_01', 'admin123', 'admin');

SELECT * FROM users;


