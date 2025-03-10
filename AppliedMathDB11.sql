CREATE DATABASE AppliedMathsDB;
USE AppliedMathsDB;

CREATE TABLE StudentsDetails (
    RegistrationNo INT PRIMARY KEY,
    Name VARCHAR(100),
    Program ENUM('M.Tech. DS', 'M.Tech. M&S', 'M.Sc. DS'),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Age INT
);

INSERT INTO StudentsDetails (RegistrationNo, Name, Program, Email, Age) VALUES
(1, 'Sumit Kumar Tapa', 'M.Tech. M&S', 'skt@xyz.com', 25),
(2, 'Shivanshu Tiwari', 'M.Tech. M&S', 'st@xyz.com', 24),
(3, 'Kushagra Singh', 'M.Sc. DS', 'ks@xyz.com', 22),
(4, 'Amrit Dubey', 'M.Tech. DS', 'ad@xyz.com', 25),
(5, 'Kiran Jadhav', 'M.Sc. DS', 'kj@xyz.com', 21),
(6, 'John Davis', 'M.Tech. M&S', 'jd@xyz.com', 26), 
(7, 'Deepanshu Sagar', 'M.Sc. DS', 'ds@xyz.com', 23), 
(8, 'Chetan Shetty', 'M.Tech. DS', 'cs@xyz.com', 24),
(9, 'Jeevan Jaykumar', 'M.Tech. M&S', 'jj@xyz.com', 22),
(10, 'Shiva Rajput', 'M.Sc. DS', 'shiva.rajput@xyz.com', 25);

SELECT * FROM StudentsDetails;

UPDATE StudentsDetails 
SET Email = 'kiranJ@xyz.com'
WHERE RegistrationNo = 5;

DELETE FROM StudentsDetails 
WHERE RegistrationNo = 8;

ALTER TABLE StudentsDetails ADD PhoneNo VARCHAR(15);

SELECT * FROM StudentsDetails 
WHERE PhoneNo LIKE '7%';

SELECT * FROM StudentsDetails 
ORDER BY Name ASC;

SELECT * FROM StudentsDetails 
WHERE Name LIKE 'A%';

SELECT * FROM StudentsDetails 
WHERE LOWER(Name) LIKE 'b%'
   OR LOWER(Name) LIKE 's%'
   OR LOWER(Name) LIKE 'm%';

SELECT * FROM StudentsDetails 
WHERE Age BETWEEN 21 AND 24;

SELECT * FROM StudentsDetails 
WHERE Age >= 21 AND Age <= 24;

SELECT * FROM StudentsDetails 
LIMIT 2;

SELECT * FROM StudentsDetails 
ORDER BY RegistrationNo 
LIMIT 2;

CREATE TABLE Courses (
    CourseCode VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100),
    RegistrationNo INT,
    FOREIGN KEY (RegistrationNo) REFERENCES StudentsDetails(RegistrationNo) ON DELETE CASCADE
);

INSERT INTO Courses (CourseCode, CourseName, RegistrationNo) VALUES
('AM-621', 'AMT', 1),
('AM-622', 'SL&NLS', 2),
('AM-623', 'ML', 3),
('AM-624', 'BDA', 4),
('AM-639', 'DL for CV', 5);

SELECT StudentsDetails.RegistrationNo, StudentsDetails.Name, StudentsDetails.Program, 
       Courses.CourseCode, Courses.CourseName
FROM StudentsDetails
INNER JOIN Courses
ON StudentsDetails.RegistrationNo = Courses.RegistrationNo;

SELECT StudentsDetails.RegistrationNo, StudentsDetails.Name, StudentsDetails.Program, 
       Courses.CourseCode, Courses.CourseName
FROM StudentsDetails
LEFT JOIN Courses
ON StudentsDetails.RegistrationNo = Courses.RegistrationNo;

SELECT COUNT(*) AS TotalStudents 
FROM StudentsDetails;

SELECT Age, COUNT(*) AS StudentCount 
FROM StudentsDetails 
GROUP BY Age;

SELECT Age, COUNT(*) AS StudentCount 
FROM StudentsDetails 
GROUP BY Age 
HAVING COUNT(*) > 1;

ALTER TABLE StudentsDetails 
MODIFY Email VARCHAR(100) NOT NULL UNIQUE;

ALTER TABLE StudentsDetails 
ADD PhoneNumber VARCHAR(15);

UPDATE StudentsDetails 
SET PhoneNumber = '7123456789' 
WHERE RegistrationNo = 1;

SELECT Name 
FROM StudentsDetails 
WHERE Age = (SELECT MIN(Age) FROM StudentsDetails);

-- Transaction Example
START TRANSACTION;
INSERT INTO StudentsDetails (RegistrationNo, Name, Program, Email, Age) VALUES
(11, 'Abdul Naeem', 'M.Tech. DS', 'an@xyz.com', 23);
COMMIT;
