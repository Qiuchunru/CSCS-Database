DROP DATABASE IF EXISTS CSCS;

CREATE DATABASE CSCS;

USE CSCS;


-- =====================================
-- 1. Locations
-- =====================================

CREATE TABLE Locations
(
    LocationID INT AUTO_INCREMENT,

    Name VARCHAR(100) NOT NULL,

    Type ENUM('Head','Branch') NOT NULL,

    Address VARCHAR(150),

    City VARCHAR(50),

    Province VARCHAR(50),

    PostalCode VARCHAR(10),

    Phone VARCHAR(20),

    WebAddress VARCHAR(100),

    Capacity INT,

    PRIMARY KEY(LocationID)
);



-- =====================================
-- 2. Personnel
-- =====================================

CREATE TABLE Personnel
(
    PersonnelID INT AUTO_INCREMENT,

    FirstName VARCHAR(50),

    LastName VARCHAR(50),

    DOB DATE,

    SSN VARCHAR(20) NOT NULL UNIQUE,

    MedicareNo VARCHAR(20) UNIQUE,

    Phone VARCHAR(20),

    Email VARCHAR(100),

    Address VARCHAR(150),

    City VARCHAR(50),

    Province VARCHAR(50),

    PostalCode VARCHAR(10),

    Role ENUM(
        'Administrator',
        'Captain',
        'Coach',
        'Assistant Coach',
        'Other'
    ),

    Mandate ENUM(
        'Volunteer',
        'Salaried'
    ),

    PRIMARY KEY(PersonnelID)
);



-- =====================================
-- 3. ClubMembers
-- =====================================

CREATE TABLE ClubMembers
(
    MemberID INT AUTO_INCREMENT,

    FirstName VARCHAR(50),

    LastName VARCHAR(50),

    DOB DATE,

    Height FLOAT,

    Weight FLOAT,

    SSN VARCHAR(20) UNIQUE,

    MedicareNo VARCHAR(20) UNIQUE,

    Phone VARCHAR(20),

    Address VARCHAR(150),

    City VARCHAR(50),

    Province VARCHAR(50),

    PostalCode VARCHAR(10),

    MemberType ENUM(
        'Major',
        'Minor'
    ) NOT NULL,


    PRIMARY KEY(MemberID)
);



-- =====================================
-- 4. FamilyMembers
-- =====================================

CREATE TABLE FamilyMembers
(
    FamilyID INT AUTO_INCREMENT,

    FirstName VARCHAR(50),

    LastName VARCHAR(50),

    DOB DATE,

    SSN VARCHAR(20) UNIQUE,

    MedicareNo VARCHAR(20) UNIQUE,

    Phone VARCHAR(20),

    Email VARCHAR(100),

    Address VARCHAR(150),

    City VARCHAR(50),

    Province VARCHAR(50),

    PostalCode VARCHAR(10),


    PRIMARY KEY(FamilyID)
);



-- =====================================
-- 5. Hobbies
-- =====================================

CREATE TABLE Hobbies
(
    HobbyID INT AUTO_INCREMENT,

    HobbyName VARCHAR(50) NOT NULL,


    PRIMARY KEY(HobbyID)
);



-- =====================================
-- 6. Personnel Assignment
-- =====================================

CREATE TABLE Personnel_Assignment
(
    AssignmentID INT AUTO_INCREMENT,

    PersonnelID INT,

    LocationID INT,

    StartDate DATE,

    EndDate DATE,


    PRIMARY KEY(AssignmentID),


    FOREIGN KEY(PersonnelID)
    REFERENCES Personnel(PersonnelID),


    FOREIGN KEY(LocationID)
    REFERENCES Locations(LocationID)
);



-- =====================================
-- 7. Member Location History
-- =====================================

CREATE TABLE Member_Location_History
(
    HistoryID INT AUTO_INCREMENT,

    MemberID INT,

    LocationID INT,

    StartDate DATE,

    EndDate DATE,


    PRIMARY KEY(HistoryID),


    FOREIGN KEY(MemberID)
    REFERENCES ClubMembers(MemberID),


    FOREIGN KEY(LocationID)
    REFERENCES Locations(LocationID)
);



-- =====================================
-- 8. Family Location History
-- =====================================

CREATE TABLE Family_Location_History
(
    HistoryID INT AUTO_INCREMENT,

    FamilyID INT,

    LocationID INT,

    StartDate DATE,

    EndDate DATE,


    PRIMARY KEY(HistoryID),


    FOREIGN KEY(FamilyID)
    REFERENCES FamilyMembers(FamilyID),


    FOREIGN KEY(LocationID)
    REFERENCES Locations(LocationID)
);



-- =====================================
-- 9. Family Relationship
-- =====================================

CREATE TABLE FamilyRelationship
(
    FamilyID INT,

    MemberID INT,

    StartDate DATE,

    EndDate DATE,

    RelationshipType ENUM(
        'Father',
        'Mother',
        'Grandfather',
        'Grandmother',
        'Tutor',
        'Partner',
        'Friend',
        'Other'
    ),


    PRIMARY KEY(
        FamilyID,
        MemberID,
        StartDate
    ),


    FOREIGN KEY(FamilyID)
    REFERENCES FamilyMembers(FamilyID),


    FOREIGN KEY(MemberID)
    REFERENCES ClubMembers(MemberID)
);



-- =====================================
-- 10. Member Hobby
-- =====================================

CREATE TABLE Member_Hobby
(
    MemberID INT,

    HobbyID INT,


    PRIMARY KEY(
        MemberID,
        HobbyID
    ),


    FOREIGN KEY(MemberID)
    REFERENCES ClubMembers(MemberID),


    FOREIGN KEY(HobbyID)
    REFERENCES Hobbies(HobbyID)
);



-- =====================================
-- 11. Payments
-- =====================================

CREATE TABLE Payments
(
    PaymentID INT AUTO_INCREMENT,

    PaymentDate DATE,

    Amount DECIMAL(10,2),

    Method ENUM(
        'Cash',
        'Debit',
        'Credit Card'
    ),

    MembershipYear INT,

    MemberID INT,


    PRIMARY KEY(PaymentID),


    FOREIGN KEY(MemberID)
    REFERENCES ClubMembers(MemberID)
);



-- =====================================
-- 12. Teams
-- =====================================

CREATE TABLE Teams
(
    TeamID INT AUTO_INCREMENT,

    TeamName VARCHAR(100),

    Gender ENUM(
        'Boys',
        'Girls'
    ),


    LocationID INT,


    PRIMARY KEY(TeamID),


    FOREIGN KEY(LocationID)
    REFERENCES Locations(LocationID)
);



-- =====================================
-- 13. Team Members
-- =====================================

CREATE TABLE Team_Members
(
    TeamID INT,

    MemberID INT,

    StartDate DATE,

    EndDate DATE,


    PRIMARY KEY(
        TeamID,
        MemberID
    ),


    FOREIGN KEY(TeamID)
    REFERENCES Teams(TeamID),


    FOREIGN KEY(MemberID)
    REFERENCES ClubMembers(MemberID)
);



-- =====================================
-- 14. FIFA Games
-- =====================================

CREATE TABLE FIFA_Games
(
    GameID INT AUTO_INCREMENT,

    GameDate DATE,

    LocationID INT,

    OpponentTeam VARCHAR(100),

    Score VARCHAR(20),


    PRIMARY KEY(GameID),


    FOREIGN KEY(LocationID)
    REFERENCES Locations(LocationID)
);



-- =====================================
-- 15. Game Participation
-- =====================================

CREATE TABLE Game_Participation
(
    MemberID INT,

    GameID INT,

    TeamID INT,


    PRIMARY KEY(
        MemberID,
        GameID
    ),


    FOREIGN KEY(MemberID)
    REFERENCES ClubMembers(MemberID),


    FOREIGN KEY(GameID)
    REFERENCES FIFA_Games(GameID),


    FOREIGN KEY(TeamID)
    REFERENCES Teams(TeamID)
);
