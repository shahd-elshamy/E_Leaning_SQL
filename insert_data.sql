use E_Learning

--DML:

INSERT INTO categories (category_name, description) VALUES
('Programming', 'Courses covering software development and coding skills'),
('Data Science', 'Machine learning, statistics, and data analysis courses'),
('Web Development', 'Frontend, backend, and full-stack web courses'),
('Databases', 'SQL, NoSQL, and database design courses'),
('Cybersecurity', 'Network security, ethical hacking, and encryption'),
('Mobile Development', 'iOS and Android application development'),
('Cloud Computing', 'AWS, Azure, GCP, and DevOps fundamentals'),
('UI/UX Design', 'User interface and user experience design principles')

INSERT INTO instructors (first_name, last_name, email, hire_date, salary) VALUES
('Ahmed','Hassan', 'ahmed.hassan@elearn.com', '2019-03-15' ,8000),
('Sara', 'Mohamed', 'sara.mohamed@elearn.com', '2020-07-01' ,9500),
('Omar', 'Khaled', 'omar.khaled@elearn.com', '2018-11-20',11000),
('Nour', 'Ali', 'nour.ali@elearn.com', '2021-01-10' ,7500),
('Youssef', 'Ibrahim', 'youssef.ibrahim@elearn.com','2017-05-25' ,13000),
('Mona', 'Samir', 'mona.samir@elearn.com', '2022-03-08', 7000),
('Karim', 'Fawzi', 'karim.fawzi@elearn.com', '2020-09-14',10000),
('Layla', 'Mansour', 'layla.mansour@elearn.com', '2023-02-01',6500);

INSERT INTO courses (title, duration_hrs, category_id, instructor_id) VALUES
('Python for Beginners', 30,  1, 1),   -- Programming / Ahmed
('Machine Learning A-Z', 50,  2, 5),   -- Data Science / Youssef
('HTML & CSS Masterclass', 20,  3, 4),   -- Web Development / Nour
('SQL Server from Scratch', 25,  4, 3),   -- Databases / Omar
('Ethical Hacking Fundamentals',40,  5, 7),   -- Cybersecurity / Karim
('React JS Complete Guide', 35,  3, 2),   -- Web Development / Sara
('Flutter & Dart Bootcamp', 45,  6, 6),   -- Mobile / Mona
('AWS Cloud Practitioner',  28,  7, 5),   -- Cloud / Youssef
('Data Analysis with Pandas', 22,  2, 1),   -- Data Science / Ahmed
('Advanced SQL & Query Tuning',18,  4, 3),   -- Databases / Omar
('UI/UX Design with Figma', 24,  8, 8),   -- UI/UX / Layla
('Node.js & Express API', 32,  3, 2);   -- Web Development / Sara

INSERT INTO students (first_name, last_name, email, phone, birth_date, address) VALUES
('Mariam', 'Tarek', 'mariam.tarek@gmail.com', '01001234567', '2000-04-12', 'Cairo'),
('Hassan', 'Nabil', 'hassan.nabil@gmail.com', '01112345678', '1998-09-23', 'Alexandria'),
('Dina', 'Youssef', 'dina.youssef@gmail.com', '01223456789', '2001-02-17', 'Giza'),
('Mostafa', 'Adel', 'mostafa.adel@gmail.com', '01334567890', '1999-07-05', 'Cairo'),
('Nada', 'Saeed', 'nada.saeed@gmail.com', '01445678901', '2002-11-30', 'Mansoura'),
('Ahmed', 'Fouad', 'ahmed.fouad@gmail.com', '01556789012', '1997-03-18', 'Cairo'),
('Rania', 'Hossam', 'rania.hossam@gmail.com','01667890123', '2000-08-25', 'Alexandria'),
('Khaled', 'Ramzy', 'khaled.ramzy@gmail.com', '01778901234', '1996-12-09', 'Giza'),
('Salma', 'Gamal', 'salma.gamal@gmail.com', '01889012345', '2003-05-14', 'Cairo'),
('Tamer', 'Zaki', 'tamer.zaki@gmail.com', '01990123456', '1995-01-27', 'Suez');

INSERT INTO enrollments (status, student_id, course_id) VALUES
('Completed', 1,  1),
('Completed', 1,  3),
('Active',    1,  6),
('Completed', 2,  4),
('Completed', 2, 10),
('Active',    2,  8),
('Completed', 3,  2),
('Active',    3,  9),
('Dropped',   3,  5),
('Completed', 4,  4),
('Active',    4,  6),
('Completed', 5,  3),
('Active',    5, 11),
('Completed', 6,  1),
('Completed', 6,  2),
('Active',    7,  7),
('Completed', 8,  5),
('Active',    9, 12);

INSERT INTO reviews (rating, comment, student_id, course_id) VALUES
(5, 'Excellent course, very well explained!',           1,  1),
(4, 'Good content but needs more exercises.',           1,  3),
(5, 'Best SQL course I have ever taken.',               2,  4),
(3, 'Average — expected more advanced topics.',         2, 10),
(5, 'Mind-blowing introduction to ML!',                 3,  2),
(4, 'Practical and straight to the point.',             3,  9),
(4, 'Solid course, great real-world examples.',         4,  4),
(5, 'Loved every minute of this course!',               5,  3),
(2, 'Too basic for me, but ok for beginners.',          6,  1),
(5, 'Youssef is an amazing instructor.',                6,  2),
(4, 'Very detailed and well structured.',               7,  7),
(5, 'Karim explains hacking concepts perfectly.',       8,  5),
(3, 'Decent UI/UX content, could be deeper.',           5, 11),
(4, 'Great Node.js project-based approach.',            9, 12);
