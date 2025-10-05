-- ========================================================
-- Budget System Database Setup Script
-- Author: Dustin Goodpaster
-- Date: October 2025
-- Description: Drops and recreates the Budget System database,
--              user, and schema for team synchronization.
-- ========================================================

DROP DATABASE IF EXISTS budget_system;

CREATE DATABASE budget_system CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE budget_system;

DROP USER IF EXISTS 'budgetuser'@'localhost';
CREATE USER 'budgetuser'@'localhost' IDENTIFIED BY '564b7f7e567!D00';
GRANT ALL PRIVILEGES ON budget_system.* TO 'budgetuser'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE Institution (
    InstitutionID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(20)
);

CREATE TABLE TravelProfile (
    TravelID INT AUTO_INCREMENT PRIMARY KEY,
    Description VARCHAR(255),
    Rate DECIMAL(10,2)
);

CREATE TABLE Tuition (
    TuitionID INT AUTO_INCREMENT PRIMARY KEY,
    ProgramName VARCHAR(255),
    Rate DECIMAL(10,2)
);

CREATE TABLE Faculty (
    FacultyID INT AUTO_INCREMENT PRIMARY KEY,
    InstitutionID INT,
    Name VARCHAR(255),
    Email VARCHAR(255),
    FOREIGN KEY (InstitutionID) REFERENCES Institution(InstitutionID)
);

CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    InstitutionID INT,
    Name VARCHAR(255),
    Email VARCHAR(255),
    TuitionID INT,
    TravelID INT,
    FOREIGN KEY (InstitutionID) REFERENCES Institution(InstitutionID),
    FOREIGN KEY (TuitionID) REFERENCES Tuition(TuitionID),
    FOREIGN KEY (TravelID) REFERENCES TravelProfile(TravelID)
);

INSERT INTO TravelProfile (Description, Rate)
VALUES
('Local Travel (Flat Rate)', 25.00),
('In-State Travel (Per Mile)', 0.58),
('Out-of-State Travel (Per Mile)', 0.65),
('Conference Travel (Per Day)', 120.00),
('International Travel (Per Day)', 150.00),
('Field Research (Per Day)', 200.00),
('Overseas Field Research (Per Day)', 250.00),
('Faculty Conference Travel', 175.00),
('Administrative Travel', 90.00),
('Athletic Team Travel (Per Trip)', 600.00);

INSERT INTO Tuition (ProgramName, Rate)
VALUES
('Computer Science (Undergraduate)', 8500.00),
('Computer Science (Graduate)', 12500.00),
('Electrical Engineering (Undergraduate)', 8700.00),
('Electrical Engineering (Graduate)', 13000.00),
('Business Administration', 9000.00),
('Psychology', 7800.00),
('Fine Arts', 7200.00),
('Nursing', 11800.00),
('Education', 7600.00),
('Online Degree Program', 6500.00);



INSERT INTO Institution (Name, City, State)
VALUES ('University of Idaho', 'Moscow', 'ID');

ALTER USER 'root'@'localhost' IDENTIFIED BY '564b7f7e567!D00';
FLUSH PRIVILEGES;

COMMIT;

