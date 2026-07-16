# Country Soccer Club System (CSCS)

![Database](https://img.shields.io/badge/Database-MySQL-blue)
![Course](https://img.shields.io/badge/Course-COMP353-orange)
![University](https://img.shields.io/badge/University-Concordia%20University-red)

## COMP 353 – Databases  
## Summer 2026 Warm-up Project

---
### Team Members

| Name | Student ID | 
| :--- | :--- | 
|  |  | 
| Chunru Qiu | 40283505 | 
|  |  | 
|  |  | 

# 1. Project Description

The **Country Soccer Club System (CSCS)** is a relational database application developed for managing the operations of a nonprofit soccer club.

The system is designed to store, organize, and retrieve information related to club members, locations, personnel, teams, family relationships, payments, hobbies, and FIFA game participation.

The database supports the daily management activities of the soccer club, including:

- Managing the club headquarters and branches
- Maintaining personnel information and employment history
- Registering major and minor club members
- Managing family members and guardians
- Tracking member locations over time
- Managing teams and team membership
- Recording member hobbies
- Maintaining membership payment information
- Tracking FIFA game participation records

The database was designed using the **Entity-Relationship (E/R) model**, converted into a relational schema, and implemented using **MySQL**.

---

# 2. Project Objectives

The main objectives of this project are:

- Design an appropriate database model for the Country Soccer Club System.
- Convert the E/R model into relational tables.
- Implement the database using MySQL.
- Populate each relation with representative data.
- Develop SQL queries to answer business requirements.
- Maintain data integrity using primary keys, foreign keys, and constraints.

---

# 3. System Requirements

## Database Management System


MySQL 8.0+


## Development Tools

| Tool | Purpose |
|---|---|
| Visual Studio Code | SQL and documentation editing |
| MySQL Workbench | Database execution and testing |
| PlantUML | ER Diagram generation |
| Markdown | Project documentation |

---

# 4. Project Directory Structure


CSCS_Project
│
├── README.md
│
├── ER_Diagram.puml
│
├── Relational_Schema.md
│
└── SQL
│
├── create_database.sql
├── create_tables.sql
│
├── insert_locations.sql
├── insert_personnel.sql
├── insert_club_members.sql
├── insert_family_members.sql
├── insert_hobbies.sql
├── insert_personnel_assignment.sql
├── insert_member_location_history.sql
├── insert_family_location_history.sql
├── insert_family_relationship.sql
├── insert_teams.sql
├── insert_team_members.sql
├── insert_member_hobby.sql
├── insert_payments.sql
├── insert_fifa_games.sql
├── insert_game_participation.sql
│
└── queries.sql


---

# 5. Database Schema Overview

The CSCS database consists of multiple relations designed to represent different aspects of the soccer club.

---

## 5.1 Locations

Stores information about club headquarters and branches.

Attributes include:

- Location ID
- Location name
- Type (Head / Branch)
- Address
- City
- Province
- Postal code
- Phone number
- Website
- Maximum capacity


---

## 5.2 Personnel

Stores information about all personnel working for the club.

Examples:

- General manager
- Administrator
- Coach
- Captain
- Assistant coach
- Other staff


Maintained information:

- Personal information
- Contact information
- SSN
- Medicare number
- Role
- Employment mandate


---

## 5.3 Personnel Assignment

Maintains the working history of personnel.

A personnel member can work at different locations during different time periods.

Attributes:

- Personnel ID
- Location ID
- Start date
- End date


---

## 5.4 Club Members

Stores all registered club members.

The system supports two member types:

### Major Member

Members who are:


18 years old or above


### Minor Member

Members who are:


4 - 17 years old


Stored information:

- Membership number
- Name
- Date of birth
- Height
- Weight
- Contact information
- Member type


---

## 5.5 Family Members

Stores parents, guardians, and other registered family members.

Information includes:

- Personal information
- Contact information
- Location information


---

## 5.6 Family Relationship

Maintains relationships between family members and club members.

Supported relationships:

- Father
- Mother
- Grandfather
- Grandmother
- Tutor
- Partner
- Friend
- Other


---

## 5.7 Hobbies

Stores available hobbies.

Examples:

- Soccer
- Tennis
- Swimming
- Hockey
- Golf
- Volleyball


A member can have multiple hobbies.

---

## 5.8 Payments

Stores membership payment information.

Maintained attributes:

- Payment date
- Amount
- Payment method
- Membership year


Payment methods:

- Cash
- Debit
- Credit Card


---

## 5.9 Teams

Stores Boys and Girls soccer teams.

Each team belongs to one location.

---

## 5.10 FIFA Games

Stores FIFA game information:

- Game date
- Game location
- Opponent
- Final score


---

## 5.11 Game Participation

A relationship table connecting:


Club Member
|
|
FIFA Game
|
|
Team


It records which members participated in which games.

---

# 6. Database Creation Instructions

## Step 1: Create Database

Open MySQL Workbench.

Execute:

```sql
CREATE DATABASE CSCS;

USE CSCS;

or run:

SQL/create_database.sql
Step 2: Create Tables

Execute:

SQL/create_tables.sql

This creates all database relations, including:

Primary keys
Foreign keys
Constraints
Data types
Step 3: Insert Data

The insertion scripts must be executed in the following order:

1. insert_locations.sql

2. insert_personnel.sql

3. insert_club_members.sql

4. insert_family_members.sql

5. insert_hobbies.sql

6. insert_personnel_assignment.sql

7. insert_member_location_history.sql

8. insert_family_location_history.sql

9. insert_family_relationship.sql

10. insert_teams.sql

11. insert_team_members.sql

12. insert_member_hobby.sql

13. insert_payments.sql

14. insert_fifa_games.sql

15. insert_game_participation.sql

Each relation contains at least 10 representative tuples as required by the project specification.

7. SQL Queries

All required project queries are included in:

SQL/queries.sql
Query 1

Retrieve complete information for every location:

Including:

Location details
General manager
Number of personnel
Number of club members
Number of FIFA participants
Query 2

Retrieve all major club members who participated in FIFA games.

Information includes:

Location
Membership number
Name
Age
Status
Number of games played
Query 3

Retrieve all members with at least four hobbies.

Information includes:

Location
Member information
Age
Number of hobbies
Query 4

Retrieve major members who never participated in FIFA games.

Query 5

Generate a report showing:

Age -> Number of club members

sorted by descending age.

Query 6

Retrieve major club members who are also family members and display information about associated children.

Query 7

Calculate:

Total membership fees
Total donations

for major members between:

2023 - 2025
Query 8

Retrieve members who participated in:

4 or more FIFA games
8. ER Diagram

The ER diagram was created using PlantUML.

File:

ER_Diagram.puml

To generate the diagram:

Install PlantUML extension in VS Code.
Open the .puml file.
Run PlantUML Preview.
Export the generated diagram.
9. Data Integrity Constraints

The database implements:

Primary Keys

Every entity contains a unique identifier.

Examples:

LocationID
PersonnelID
MemberID
GameID
Foreign Keys

Relationships between tables are enforced using foreign keys.

Examples:

ClubMembers -> Locations

Payments -> ClubMembers

Game_Participation -> FIFA_Games
Unique Constraints

Implemented for:

Social Security Number
Medicare Card Number
Relationship Constraints

The database maintains:

Member location history
Personnel working history
Family relationships
Team participation
Game participation
10. Testing

The database was tested using:

SELECT COUNT(*) FROM TableName;

for every relation.

Example:

SELECT COUNT(*) 
FROM Locations;

Expected result:

10

Each relation contains sufficient data to test all required SQL queries.

11. Contributors

COMP353 Database Project Group

Concordia University

Summer 2026

12. Conclusion

The CSCS database provides a complete relational database solution for managing a soccer club system.

The project demonstrates:

Database modeling
ER design
Relational schema conversion
SQL implementation
Data manipulation
Complex query development

The final system satisfies the requirements specified in the COMP 353 Database course project.