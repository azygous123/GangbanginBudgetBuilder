

DROP DATABASE IF EXISTS budget_system;

CREATE DATABASE budget_system CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE budget_system;

DROP USER IF EXISTS 'budgetuser'@'localhost';
CREATE USER 'budgetuser'@'localhost' IDENTIFIED BY '564b7f7e567!D00';
GRANT ALL PRIVILEGES ON budget_system.* TO 'budgetuser'@'localhost';
FLUSH PRIVILEGES;



CREATE TABLE Faculty
(
	FacultyID INT auto_increment primary key,
    Name_First VARCHAR(50) NOT NULL,
    Name_Last VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
	Hourly BOOLEAN NOT NULL,
    StaffType VARCHAR(30) NOT NULL
);

CREATE TABLE Tuition
(
	Amount DECIMAL (10,2)  NOT NULL,
    Type VARCHAR (30) NOT NULL,
    Year YEAR NOT NULL,
    InState BOOLEAN NOT NULL,
    Graduate BOOLEAN NOT NULL,
    primary key (Type, Year, InState, Graduate)    
);

CREATE TABLE Student
(
	StudentID INT auto_increment primary key,
    Name_First VARCHAR(50)  NOT NULL,
    Name_Last VARCHAR(50)  NOT NULL,
    Type VARCHAR(30) NOT NULL,
    Year YEAR  NOT NULL,
    InState BOOLEAN  NOT NULL,
    Graduate BOOLEAN NOT NULL,
    Stipend DECIMAL(10,2), -- Can be null because we may not have a stipend
    Salary DECIMAL(10,2), -- Can hold hourly rate or salary
    Hourly BOOLEAN, -- gives design felxibility so students can be paid hourly or salary
    Foreign Key (Type, Year, InState, Graduate) references Tuition(Type, Year, InState, Graduate)    
);

CREATE TABLE Fringe
(
	Type VARCHAR(50) NOT NULL,  -- same domain as studenttype or stafftype basically covers both
    Year YEAR NOT NULL,
    Val DECIMAL (5, 4) NOT NULL,
    primary key (Type, Year)
);

CREATE TABLE Travel (			-- Possible Travels
    Mode VARCHAR(50) NOT NULL,        -- Air, Bus, Rental Car, etc.
    Year YEAR NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    IsForeign BOOLEAN NOT NULL,         
    Amount DECIMAL(10,2) NOT NULL,    -- estimated cost per day
    PRIMARY KEY (Mode, Year, City, State, Country)
);

CREATE TABLE Institution (
    InstitutionID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Campus VARCHAR(100)  NOT NULL,
    City VARCHAR(50)  NOT NULL,
    State VARCHAR(50)  NOT NULL,
    Country VARCHAR(50)  NOT NULL,
    FARate DECIMAL(5,4)  NOT NULL,
    UNIQUE (Name, Campus, City)
);

-- Budget here
CREATE TABLE Budget
(
	BudgetID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    FundingSource VARCHAR(100),
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    PI INT NOT NULL,
    InstitutionID INT NOT NULL,
    foreign key (PI) references Faculty(FacultyID),
    foreign key (InstitutionID) references Institution(InstitutionID)
    
);

CREATE TABLE SubAward
(
	BudgetID INT NOT NULL,
    ParentID INT NOT NULL,
    primary key (BudgetID, ParentID),
    foreign key (BudgetID) references Budget(BudgetID),
    foreign key (ParentID) references Budget(BudgetID)
);



CREATE TABLE BudgetFaculty
(
	BudgetID INT NOT NULL,
    FacultyID INT NOT NULL,
    Role VARCHAR(30) NOT NULL,
    primary key (BudgetID, FacultyID),
    foreign key (BudgetID) references Budget(BudgetID),
    foreign key (FacultyID) references Faculty(FacultyID)    
);

CREATE TABLE BudgetStudent
(
	BudgetID INT NOT NULL,
    StudentID INT NOT NULL,
    primary key (BudgetID, StudentID),
    foreign key (BudgetID) references Budget(BudgetID),
    foreign key (StudentID) references Student(StudentID)
);

CREATE TABLE BudgetFringe
(
	BudgetID INT NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Year YEAR NOT NULL,
    PRIMARY KEY (BudgetID, Type, Year),
    foreign key (BudgetID) references Budget(BudgetID),
    foreign key (Type, Year) references Fringe(Type, Year)
    
);


CREATE TABLE BudgetTravel -- Chosen Travel Costs
(
	BudgetID INT NOT NULL,
	Mode VARCHAR(50) NOT NULL,        -- Air, Bus, Rental Car, Hotel etc.
    Year YEAR NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Duration INT,     -- Days
    PRIMARY KEY (BudgetID, Mode, Year, City, State, Country),
	foreign key (BudgetID) references Budget(BudgetID),
    foreign key (Mode, Year, City, State, Country) references Travel(Mode, Year, City, State, Country)   
);

CREATE TABLE Other (
    OtherID INT AUTO_INCREMENT PRIMARY KEY,
    BudgetID INT NOT NULL,
    Category VARCHAR(50) NOT NULL,        -- e.g. 'Temp Help', 'Equipment', 'Supplies'
    MiscNotes VARCHAR(255),
    Description VARCHAR(255),
    Year YEAR,                            -- optional, if you want to track by project year
    Amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (BudgetID) REFERENCES Budget(BudgetID)
);



ALTER USER 'root'@'localhost' IDENTIFIED BY '564b7f7e567!D00';
FLUSH PRIVILEGES;

COMMIT;

