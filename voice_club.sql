-- Create the voice_club database
CREATE DATABASE IF NOT EXISTS voice_club;
USE voice_club;

-- Table: person
CREATE TABLE person (
  person_id INTEGER PRIMARY KEY,
  email VARCHAR(255),
  last_name VARCHAR(255),
  first_name VARCHAR(255)
);

-- Table: person_phoneNum
CREATE TABLE person_phoneNum (
  phone_number VARCHAR(255),
  person_id INTEGER,
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);

-- Table: student
CREATE TABLE student (
  student_id INTEGER PRIMARY KEY,
  major VARCHAR(255),
  grad_year INTEGER
);

-- Table: department
CREATE TABLE department (
  department_id INTEGER PRIMARY KEY,
  name VARCHAR(255)
);

-- Table: faculty
CREATE TABLE faculty (
  faculty_id INTEGER PRIMARY KEY,
  department INTEGER,
  FOREIGN KEY (department) REFERENCES department(department_id)
);

-- Table: membership
CREATE TABLE membership (
  end_time DATETIME,
  start_time DATETIME,
  faculty_id INTEGER,
  student_id INTEGER,
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id)
);

-- Table: club
CREATE TABLE club (
  club_id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  end_date DATE,
  start_date DATE,
  faculty_id INTEGER,
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

-- Table: location
CREATE TABLE location (
  location_id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

-- Table: event
CREATE TABLE event (
  event_id INTEGER PRIMARY KEY,
  time DATETIME,
  date DATE,
  description VARCHAR(255),
  location_id INTEGER,
  club_id INTEGER,
  FOREIGN KEY (location_id) REFERENCES location(location_id),
  FOREIGN KEY (club_id) REFERENCES club(club_id)
);

-- Table: attendance
CREATE TABLE attendance (
  attendance_id INTEGER PRIMARY KEY,
  event_id INTEGER,
  student_id INTEGER,
  FOREIGN KEY (event_id) REFERENCES event(event_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id)
);

-- Table: genre
CREATE TABLE genre (
  genre_id INTEGER PRIMARY KEY,
  name VARCHAR(255)
);

-- Table: performance
CREATE TABLE performance (
  performance_id INTEGER PRIMARY KEY,
  end_time DATETIME,
  start_time DATETIME,
  event_id INTEGER,
  FOREIGN KEY (event_id) REFERENCES event(event_id)
);

-- Table: song
CREATE TABLE song (
  song_id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  artist VARCHAR(255),
  genre_id INTEGER,
  FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

INSERT INTO person (person_id, email, last_name, first_name)
VALUES (1, 'john.doe@example.com', 'Doe', 'John'),
(2, 'jane.doe@example.com', 'Doe', 'Jane'),
(3, 'bob.smith@example.com', 'Smith', 'Bob'),
(4, 'sarah.jones@example.com', 'Jones', 'Sarah'),
(5, 'michael.smith@example.com', 'Smith', 'Michael'),
(6, 'lisa.johnson@example.com', 'Johnson', 'Lisa'),
(7, 'david.lee@example.com', 'Lee', 'David'),
(8, 'amy.baker@example.com', 'Baker', 'Amy'),
(9, 'kate.harris@example.com', 'Harris', 'Kate'),
(10, 'tom.davis@example.com', 'Davis', 'Tom');

INSERT INTO person_phoneNum (phone_number, person_id)
VALUES ('123-456-7890', 1),
('111-222-3333', 2),
('555-555-5555', 3),
('444-444-4444', 4),
('666-666-6666', 5),
('777-777-7777', 6),
('888-888-8888', 7),
('999-999-9999', 8),
('333-333-3333', 9),
('222-222-2222', 10);

INSERT INTO student (student_id, major, grad_year)
VALUES (1, 'Computer Science', 2023),
(2, 'Biology', 2024),
(3, 'History', 2022),
(4, 'Business', 2023),
(5, 'Psychology', 2024),
(6, 'Political Science', 2022),
(7, 'Engineering', 2023),
(8, 'English', 2024),
(9, 'Mathematics', 2022),
(10, 'Art', 2023);

INSERT INTO department (department_id, name)
VALUES (1, 'Computer Science'),
(2, 'Biology'),
(3, 'History'),
(4, 'Business'),
(5, 'Psychology'),
(6, 'Political Science'),
(7, 'Engineering'),
(8, 'English'),
(9, 'Mathematics'),
(10, 'Art');
INSERT INTO faculty (faculty_id, department)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO membership (end_time, start_time, faculty_id, student_id)
VALUES ('2023-05-31 23:59:59', '2022-06-01 00:00:00', 1, 1),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 2, 2),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 3, 3),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 4, 4),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 5, 5),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 6, 6),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 7, 7),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 8, 8),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 9, 9),
('2023-05-31 23:59:59', '2022-06-01 00:00:00', 10, 10);

INSERT INTO club (club_id, name, description, end_date, start_date, faculty_id)
VALUES (1, 'Chess Club', 'A club for chess enthusiasts', '2023-05-31', '2022-06-01', 1),
(2, 'Debate Club', 'A club for debaters', '2023-05-31', '2022-06-01', 2),
(3, 'Cooking Club', 'A club for foodies', '2023-05-31', '2022-06-01', 3),
(4, 'Photography Club', 'A club for photographers', '2023-05-31', '2022-06-01', 4),
(5, 'Gardening Club', 'A club for gardeners', '2023-05-31', '2022-06-01', 5),
(6, 'Music Club', 'A club for musicians', '2023-05-31', '2022-06-01', 6),
(7, 'Fitness Club', 'A club for fitness enthusiasts', '2023-05-31', '2022-06-01', 7),
(8, 'Art Club', 'A club for artists', '2023-05-31', '2022-06-01', 8),
(9, 'Film Club', 'A club for movie lovers', '2023-05-31', '2022-06-01', 9),
(10, 'Dance Club', 'A club for dancers', '2023-05-31', '2022-06-01', 10);

INSERT INTO location (location_id, name, address)
VALUES (1, 'Student Center', '123 Main St'),
(2, 'Gymnasium', '456 Elm St'),
(3, 'Library', '789 Oak St'),
(4, 'Auditorium', '101 Maple St'),
(5, 'Art Studio', '555 Pine St'),
(6, 'Science Lab', '777 Oak St'),
(7, 'Music Room', '888 Elm St'),
(8, 'Dance Studio', '999 Maple St'),
(9, 'Cafeteria', '222 Oak St'),
(10, 'Fitness Center', '333 Elm St');
INSERT INTO event (event_id, time, date, description, location_id, club_id)
VALUES (1, '2022-06-01 12:00:00', '2022-06-01', 'Chess tournament', 1, 1),
(2, '2022-06-05 14:00:00', '2022-06-05', 'Debate competition', 2, 2),
(3, '2022-06-10 18:00:00', '2022-06-10', 'Cooking demonstration', 3, 3),
(4, '2022-06-15 20:00:00', '2022-06-15', 'Photography exhibition', 4, 4),
(5, '2022-06-20 16:00:00', '2022-06-20', 'Gardening workshop', 5, 5),
(6, '2022-06-25 19:00:00', '2022-06-25', 'Music concert', 6, 6),
(7, '2022-06-30 17:00:00', '2022-06-30', 'Fitness class', 7, 7),
(8, '2022-07-05 15:00:00', '2022-07-05', 'Art exhibit', 8, 8),
(9, '2022-07-10 11:00:00', '2022-07-10', 'Film screening', 9, 9),
(10, '2022-07-15 13:00:00', '2022-07-15', 'Dance performance', 10, 10);

INSERT INTO attendance (attendance_id, event_id, student_id)
VALUES (1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8),
(9, 5, 9),
(10, 5, 10);

INSERT INTO genre (genre_id, name)
VALUES (1, 'Rock'),
(2, 'Pop'),
(3, 'Hip Hop'),
(4, 'Jazz'),
(5, 'Classical'),
(6, 'Electronic'),
(7, 'Folk'),
(8, 'Country'),
(9, 'Blues'),
(10, 'R&B');

INSERT INTO performance (performance_id, end_time, start_time, event_id)
VALUES (1, '2022-06-25 22:00:00', '2022-06-25 20:00:00', 6),
(2, '2022-07-15 15:00:00', '2022-07-15 13:00:00', 10),
(3, '2022-06-01 15:00:00', '2022-06-01 14:00:00', 1),
(4, '2022-06-15 22:00:00', '2022-06-15 20:00:00', 4),
(5, '2022-07-05 18:00:00', '2022-07-05 16:00:00', 8),
(6, '2022-06-20 18:00:00', '2022-06-20 16:00:00', 5),
(7, '2022-06-10 20:00:00', '2022-06-10 18:00:00', 3),
(8, '2022-06-30 19:00:00', '2022-06-30 17:00:00', 7),
(9, '2022-07-10 13:00:00', '2022-07-10 11:00:00', 9),
(10, '2022-06-05 16:00:00', '2022-06-05 14:00:00', 2);

INSERT INTO song (song_id, title, artist, genre_id)
VALUES (1, 'Stairway to Heaven', 'Led Zeppelin', 1),
(2, 'Thriller', 'Michael Jackson', 2),
(3, 'The Message', 'Grandmaster Flash and the Furious Five', 3),
(4, 'Take Five', 'Dave Brubeck Quartet', 4),
(5, 'Moonlight Sonata', 'Ludwig van Beethoven', 5),
(6, 'Around the World', 'Daft Punk', 6),
(7, 'The Times They Are A-Changin', 'Bob Dylan', 7),
(8, 'Jolene', 'Dolly Parton', 8),
(9, 'The Thrill Is Gone', 'B.B. King', 9),
(10, 'I Will Always Love You', 'Whitney Houston', 10);

-- Select all data from the person table
SELECT * FROM person;

-- Select all data from the person_phoneNum table
SELECT * FROM person_phoneNum;

-- Select all data from the student table
SELECT * FROM student;

-- Select all data from the department table
SELECT * FROM department;

-- Select all data from the faculty table
SELECT * FROM faculty;

-- Select all data from the membership table
SELECT * FROM membership;

-- Select all data from the club table
SELECT * FROM club;

-- Select all data from the location table
SELECT * FROM location;

-- Select all data from the event table
SELECT * FROM event;

-- Select all data from the attendance table
SELECT * FROM attendance;

-- Select all data from the genre table
SELECT * FROM genre;

-- Select all data from the performance table
SELECT * FROM performance;

-- Select all data from the song table
SELECT * FROM song;
-- 1)Retrieve the names and email addresses of all persons in the database:
SELECT first_name, last_name, email
FROM person;

-- 2)Retrieve the names of students and their majors:
SELECT first_name, last_name, major
FROM student
JOIN person ON student.student_id = person.person_id;

-- 3)Retrieve the names of all faculty members and the department they belong to:
SELECT first_name, last_name, name AS department
FROM faculty
JOIN department ON faculty.department = department.department_id
JOIN person ON faculty.faculty_id = person.person_id;

-- 4)Retrieve the names of all clubs and their descriptions:
SELECT name, description
FROM club;

-- 5)Retrieve the names of all clubs and the names of their faculty advisors:
SELECT club.name, person.first_name, person.last_name
FROM club
JOIN faculty ON club.faculty_id = faculty.faculty_id
JOIN person ON faculty.faculty_id = person.person_id;

-- 6)Retrieve the names of all songs and their genres:
SELECT title, name AS genre
FROM song
JOIN genre ON song.genre_id = genre.genre_id;

-- 7)Retrieve the names of all events and their locations:
SELECT event_id, description, name AS location
FROM event
JOIN location ON event.location_id = location.location_id;

-- 8)Retrieve the names of all performances and the names of the events they are associated with:
SELECT performance_id, event.event_id, event.description
FROM performance
JOIN event ON performance.event_id = event.event_id;

-- 9)Retrieve the names and majors of all students who are members of a club:
SELECT person.first_name, person.last_name, student.major
FROM person
JOIN student ON person.person_id = student.student_id
JOIN membership ON student.student_id = membership.student_id
JOIN club ON membership.faculty_id = club.faculty_id;

-- 10)Retrieve the names of all clubs and the number of members in each club:
SELECT club.name, COUNT(DISTINCT membership.student_id) AS num_members
FROM club
JOIN membership ON club.faculty_id = membership.faculty_id
GROUP BY club.club_id;

-- 11)Retrieve the names of all members who have attended at least one club event and the number of events they have attended:
SELECT person.first_name, person.last_name, COUNT(DISTINCT attendance.event_id) AS num_events
FROM person
JOIN student ON person.person_id = student.student_id
JOIN attendance ON student.student_id = attendance.student_id
GROUP BY person.person_id
HAVING COUNT(DISTINCT attendance.event_id) > 0;

  
