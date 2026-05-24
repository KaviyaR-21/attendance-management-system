USE attendance_db;

-- ═══════════════════════════════════════════════════════
-- STEP 1: Add new IT teacher (user + teacher record)
-- ═══════════════════════════════════════════════════════

INSERT INTO users (username, password, role)
VALUES ('IT_T210', '150580', 'teacher');

-- Get the user_id of IT_T210 (should be 12 if your table has 11 rows)
-- Run: SELECT id FROM users WHERE username='IT_T210';
-- Then update the teacher insert below with correct user_id

INSERT INTO teachers (user_id, staff_code, full_name, department)
VALUES ((SELECT id FROM users WHERE username='IT_T210'), 'IT_T210', 'Mr. Ravi Kumar', 'IT');

-- ═══════════════════════════════════════════════════════
-- STEP 2: Ms. Priya timetable for 2nd MCA (class_id=2)
-- teacher_id=4 (CA_T305 Ms. Priya)
-- ═══════════════════════════════════════════════════════

DELETE FROM teacher_timetable WHERE teacher_id = 4;

INSERT INTO teacher_timetable (teacher_id, class_id, subject_code, day, hour_number)
VALUES
(4, 2, 'MCA202', 'Monday', 3),
(4, 2, 'MCA202', 'Monday', 5),
(4, 2, 'MCA202', 'Tuesday', 2),
(4, 2, 'MCA202', 'Tuesday', 3),
(4, 2, 'MCA202', 'Tuesday', 5),
(4, 2, 'MCA203', 'Wednesday', 1),
(4, 2, 'MCA203', 'Wednesday', 2),
(4, 2, 'MCA203', 'Wednesday', 4),
(4, 2, 'MCA203', 'Wednesday', 6),
(4, 2, 'MCA202', 'Thursday', 1),
(4, 2, 'MCA202', 'Thursday', 2),
(4, 2, 'MCA203', 'Thursday', 4),
(4, 2, 'MCA203', 'Friday', 1),
(4, 2, 'MCA203', 'Friday', 2),
(4, 2, 'MCA202', 'Friday', 5),
(4, 2, 'MCA202', 'Friday', 6);

-- ═══════════════════════════════════════════════════════
-- STEP 3: IT teacher timetable for 2nd IT (class_id=6)
-- teacher_id = (SELECT id FROM teachers WHERE staff_code='IT_T210')
-- ═══════════════════════════════════════════════════════

DELETE FROM teacher_timetable 
WHERE teacher_id = (SELECT id FROM teachers WHERE staff_code='IT_T210');

INSERT INTO teacher_timetable (teacher_id, class_id, subject_code, day, hour_number)
VALUES
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT201', 'Monday', 1),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT201', 'Monday', 2),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT202', 'Monday', 4),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT202', 'Monday', 5),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT203', 'Tuesday', 1),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT203', 'Tuesday', 2),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT201', 'Tuesday', 3),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT202', 'Tuesday', 5),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT201', 'Wednesday', 1),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT202', 'Wednesday', 3),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT202', 'Wednesday', 4),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT203', 'Wednesday', 6),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT203', 'Thursday', 2),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT203', 'Thursday', 3),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT201', 'Thursday', 4),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT201', 'Thursday', 5),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT202', 'Friday', 1),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT202', 'Friday', 2),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT201', 'Friday', 4),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT203', 'Friday', 5),
((SELECT id FROM teachers WHERE staff_code='IT_T210'), 6, 'IT203', 'Friday', 6);

-- ═══════════════════════════════════════════════════════
-- STEP 4: Clear old test attendance for student 1 & 3
-- ═══════════════════════════════════════════════════════

DELETE FROM attendance WHERE student_id IN (1, 3);

-- ═══════════════════════════════════════════════════════
-- STEP 5: Dummy attendance for Kaviya (student_id=1, 2nd MCA)
-- 3 weeks: Mar 2 to Mar 21, 2026
-- MCA201 (Dr.Suresh) ~85%, MCA202 (Ms.Priya) ~60%, MCA203 (Ms.Priya) ~85%
-- ═══════════════════════════════════════════════════════

INSERT INTO attendance (student_id, teacher_id, class_id, date, hour_number, status) VALUES
(1, 1, 2, '2026-03-02', 1, 'Present'),
(1, 1, 2, '2026-03-02', 2, 'Present'),
(1, 4, 2, '2026-03-02', 3, 'Present'),
(1, 4, 2, '2026-03-02', 5, 'Present'),
(1, 4, 2, '2026-03-03', 2, 'Present'),
(1, 4, 2, '2026-03-03', 3, 'Present'),
(1, 4, 2, '2026-03-03', 5, 'Present'),
(1, 1, 2, '2026-03-04', 5, 'Present'),
(1, 4, 2, '2026-03-04', 1, 'Present'),
(1, 4, 2, '2026-03-04', 2, 'Present'),
(1, 4, 2, '2026-03-04', 4, 'Present'),
(1, 4, 2, '2026-03-04', 6, 'Present'),
(1, 1, 2, '2026-03-05', 5, 'Absent'),
(1, 1, 2, '2026-03-05', 6, 'Present'),
(1, 4, 2, '2026-03-05', 1, 'Present'),
(1, 4, 2, '2026-03-05', 2, 'Present'),
(1, 4, 2, '2026-03-05', 4, 'Present'),
(1, 1, 2, '2026-03-06', 3, 'OnDuty'),
(1, 4, 2, '2026-03-06', 1, 'Present'),
(1, 4, 2, '2026-03-06', 2, 'Present'),
(1, 4, 2, '2026-03-06', 5, 'Absent'),
(1, 4, 2, '2026-03-06', 6, 'Absent'),
(1, 1, 2, '2026-03-09', 1, 'Present'),
(1, 1, 2, '2026-03-09', 2, 'Present'),
(1, 4, 2, '2026-03-09', 3, 'Present'),
(1, 4, 2, '2026-03-09', 5, 'Present'),
(1, 4, 2, '2026-03-10', 2, 'Present'),
(1, 4, 2, '2026-03-10', 3, 'Present'),
(1, 4, 2, '2026-03-10', 5, 'Absent'),
(1, 1, 2, '2026-03-11', 5, 'Present'),
(1, 4, 2, '2026-03-11', 1, 'Present'),
(1, 4, 2, '2026-03-11', 2, 'OnDuty'),
(1, 4, 2, '2026-03-11', 4, 'Present'),
(1, 4, 2, '2026-03-11', 6, 'Present'),
(1, 1, 2, '2026-03-12', 5, 'Present'),
(1, 1, 2, '2026-03-12', 6, 'Present'),
(1, 4, 2, '2026-03-12', 1, 'Present'),
(1, 4, 2, '2026-03-12', 2, 'Present'),
(1, 4, 2, '2026-03-12', 4, 'Absent'),
(1, 1, 2, '2026-03-13', 3, 'Absent'),
(1, 4, 2, '2026-03-13', 1, 'Present'),
(1, 4, 2, '2026-03-13', 2, 'Present'),
(1, 4, 2, '2026-03-13', 5, 'Present'),
(1, 4, 2, '2026-03-13', 6, 'Present'),
(1, 1, 2, '2026-03-16', 1, 'OnDuty'),
(1, 1, 2, '2026-03-16', 2, 'Present'),
(1, 4, 2, '2026-03-16', 3, 'Present'),
(1, 4, 2, '2026-03-16', 5, 'Present'),
(1, 4, 2, '2026-03-17', 2, 'Present'),
(1, 4, 2, '2026-03-17', 3, 'Present'),
(1, 4, 2, '2026-03-17', 5, 'OnDuty'),
(1, 1, 2, '2026-03-18', 5, 'Present'),
(1, 4, 2, '2026-03-18', 1, 'Present'),
(1, 4, 2, '2026-03-18', 2, 'Present'),
(1, 4, 2, '2026-03-18', 4, 'Present'),
(1, 4, 2, '2026-03-18', 6, 'Present'),
(1, 1, 2, '2026-03-19', 5, 'Absent'),
(1, 1, 2, '2026-03-19', 6, 'Present'),
(1, 4, 2, '2026-03-19', 1, 'Present'),
(1, 4, 2, '2026-03-19', 2, 'Present'),
(1, 4, 2, '2026-03-19', 4, 'Absent'),
(1, 1, 2, '2026-03-20', 3, 'Present'),
(1, 4, 2, '2026-03-20', 1, 'Present'),
(1, 4, 2, '2026-03-20', 2, 'Present'),
(1, 4, 2, '2026-03-20', 5, 'Absent'),
(1, 4, 2, '2026-03-20', 6, 'Present');

-- ═══════════════════════════════════════════════════════
-- STEP 6: Dummy attendance for Swathi (student_id=3, 2nd IT)
-- IT201 ~85%, IT202 ~62%, IT203 ~55%
-- ═══════════════════════════════════════════════════════

INSERT INTO attendance (student_id, teacher_id, class_id, date, hour_number, status) VALUES
(3, 5, 6, '2026-03-02', 1, 'Present'),
(3, 5, 6, '2026-03-02', 2, 'Present'),
(3, 5, 6, '2026-03-02', 4, 'Absent'),
(3, 5, 6, '2026-03-02', 5, 'Present'),
(3, 5, 6, '2026-03-03', 1, 'Present'),
(3, 5, 6, '2026-03-03', 2, 'Present'),
(3, 5, 6, '2026-03-03', 3, 'Present'),
(3, 5, 6, '2026-03-03', 5, 'Absent'),
(3, 5, 6, '2026-03-04', 1, 'Present'),
(3, 5, 6, '2026-03-04', 3, 'Absent'),
(3, 5, 6, '2026-03-04', 4, 'Present'),
(3, 5, 6, '2026-03-04', 6, 'Present'),
(3, 5, 6, '2026-03-05', 2, 'Absent'),
(3, 5, 6, '2026-03-05', 3, 'Absent'),
(3, 5, 6, '2026-03-05', 4, 'Present'),
(3, 5, 6, '2026-03-05', 5, 'Present'),
(3, 5, 6, '2026-03-06', 1, 'Absent'),
(3, 5, 6, '2026-03-06', 2, 'Present'),
(3, 5, 6, '2026-03-06', 4, 'Present'),
(3, 5, 6, '2026-03-06', 5, 'Present'),
(3, 5, 6, '2026-03-06', 6, 'Present'),
(3, 5, 6, '2026-03-09', 1, 'Present'),
(3, 5, 6, '2026-03-09', 2, 'Present'),
(3, 5, 6, '2026-03-09', 4, 'Present'),
(3, 5, 6, '2026-03-09', 5, 'Present'),
(3, 5, 6, '2026-03-10', 1, 'Absent'),
(3, 5, 6, '2026-03-10', 2, 'Absent'),
(3, 5, 6, '2026-03-10', 3, 'Present'),
(3, 5, 6, '2026-03-10', 5, 'Absent'),
(3, 5, 6, '2026-03-11', 1, 'Present'),
(3, 5, 6, '2026-03-11', 3, 'Absent'),
(3, 5, 6, '2026-03-11', 4, 'Absent'),
(3, 5, 6, '2026-03-11', 6, 'Present'),
(3, 5, 6, '2026-03-12', 2, 'Absent'),
(3, 5, 6, '2026-03-12', 3, 'Present'),
(3, 5, 6, '2026-03-12', 4, 'Present'),
(3, 5, 6, '2026-03-12', 5, 'Present'),
(3, 5, 6, '2026-03-13', 1, 'Present'),
(3, 5, 6, '2026-03-13', 2, 'Present'),
(3, 5, 6, '2026-03-13', 4, 'Absent'),
(3, 5, 6, '2026-03-13', 5, 'Present'),
(3, 5, 6, '2026-03-13', 6, 'Present'),
(3, 5, 6, '2026-03-16', 1, 'Present'),
(3, 5, 6, '2026-03-16', 2, 'Present'),
(3, 5, 6, '2026-03-16', 4, 'Absent'),
(3, 5, 6, '2026-03-16', 5, 'Present'),
(3, 5, 6, '2026-03-17', 1, 'Present'),
(3, 5, 6, '2026-03-17', 2, 'OnDuty'),
(3, 5, 6, '2026-03-17', 3, 'Absent'),
(3, 5, 6, '2026-03-17', 5, 'Present'),
(3, 5, 6, '2026-03-18', 1, 'Present'),
(3, 5, 6, '2026-03-18', 3, 'Present'),
(3, 5, 6, '2026-03-18', 4, 'Present'),
(3, 5, 6, '2026-03-18', 6, 'OnDuty'),
(3, 5, 6, '2026-03-19', 2, 'Absent'),
(3, 5, 6, '2026-03-19', 3, 'Present'),
(3, 5, 6, '2026-03-19', 4, 'Present'),
(3, 5, 6, '2026-03-19', 5, 'Present'),
(3, 5, 6, '2026-03-20', 1, 'Present'),
(3, 5, 6, '2026-03-20', 2, 'Present'),
(3, 5, 6, '2026-03-20', 4, 'Present'),
(3, 5, 6, '2026-03-20', 5, 'Absent'),
(3, 5, 6, '2026-03-20', 6, 'Absent');
