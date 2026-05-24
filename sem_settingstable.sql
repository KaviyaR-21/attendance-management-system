USE attendance_db;
CREATE TABLE semester_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    is_closed BOOLEAN DEFAULT FALSE,
    closed_at TIMESTAMP NULL,
    closed_by INT NULL,
    academic_year VARCHAR(20) DEFAULT '2025-26'
);
INSERT INTO semester_settings (is_closed, academic_year) VALUES (FALSE, '2025-26');