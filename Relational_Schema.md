# Country Soccer Club System (CSCS)

# Relational Schema Design

## COMP353 - Databases
## Summer 2026


---

# 1. Locations Relation


## Description

Stores information about the club head office and all branch locations.


## Attributes


| Attribute | Data Type | Constraint |
|---|---|---|
| LocationID | INT | Primary Key |
| Name | VARCHAR(100) | NOT NULL |
| Type | ENUM | Head / Branch |
| Address | VARCHAR(150) | |
| City | VARCHAR(50) | |
| Province | VARCHAR(50) | |
| PostalCode | VARCHAR(10) | |
| Phone | VARCHAR(20) | |
| WebAddress | VARCHAR(100) | |
| Capacity | INT | |


## Relational Schema


```
Locations(
    LocationID PK,
    Name,
    Type,
    Address,
    City,
    Province,
    PostalCode,
    Phone,
    WebAddress,
    Capacity
)
```

---

# 2. Personnel Relation


## Description

Stores information about all personnel working for the club.


## Attributes


| Attribute | Data Type | Constraint |
|---|---|---|
| PersonnelID | INT | Primary Key |
| FirstName | VARCHAR(50) | |
| LastName | VARCHAR(50) | |
| DOB | DATE | |
| SSN | VARCHAR(20) | UNIQUE, NOT NULL |
| MedicareNo | VARCHAR(20) | UNIQUE |
| Phone | VARCHAR(20) | |
| Email | VARCHAR(100) | |
| Address | VARCHAR(150) | |
| City | VARCHAR(50) | |
| Province | VARCHAR(50) | |
| PostalCode | VARCHAR(10) | |
| Role | ENUM | |
| Mandate | ENUM | Volunteer / Salaried |


## Relational Schema


```
Personnel(
    PersonnelID PK,
    FirstName,
    LastName,
    DOB,
    SSN UNIQUE,
    MedicareNo UNIQUE,
    Phone,
    Email,
    Address,
    City,
    Province,
    PostalCode,
    Role,
    Mandate
)
```

---

# 3. Personnel_Assignment Relation


## Description

Maintains the history of personnel working at different locations.


## Attributes


| Attribute | Data Type | Constraint |
|-|-|-|
| AssignmentID | INT | Primary Key |
| PersonnelID | INT | Foreign Key |
| LocationID | INT | Foreign Key |
| StartDate | DATE | |
| EndDate | DATE | Nullable |


## Relational Schema


```
Personnel_Assignment(
    AssignmentID PK,
    PersonnelID FK,
    LocationID FK,
    StartDate,
    EndDate
)
```

---

# 4. ClubMembers Relation


## Description

Stores all major and minor club members.


## Attributes


| Attribute | Data Type | Constraint |
|-|-|-|
| MemberID | INT | Primary Key |
| FirstName | VARCHAR(50) | |
| LastName | VARCHAR(50) | |
| DOB | DATE | Age >= 4 |
| Height | FLOAT | |
| Weight | FLOAT | |
| SSN | VARCHAR(20) | UNIQUE |
| MedicareNo | VARCHAR(20) | UNIQUE |
| Phone | VARCHAR(20) | |
| Address | VARCHAR(150) | |
| City | VARCHAR(50) | |
| Province | VARCHAR(50) | |
| PostalCode | VARCHAR(10) | |
| MemberType | ENUM | Major / Minor |


## Relational Schema


```
ClubMembers(
    MemberID PK,
    FirstName,
    LastName,
    DOB,
    Height,
    Weight,
    SSN UNIQUE,
    MedicareNo UNIQUE,
    Phone,
    Address,
    City,
    Province,
    PostalCode,
    MemberType
)
```

---

# 5. Member_Location_History Relation


## Description

Tracks the movement of club members between different locations.


## Relational Schema


```
Member_Location_History(
    HistoryID PK,
    MemberID FK,
    LocationID FK,
    StartDate,
    EndDate
)
```

---

# 6. FamilyMembers Relation


## Description

Stores parents, guardians and other family members.


## Relational Schema


```
FamilyMembers(
    FamilyID PK,
    FirstName,
    LastName,
    DOB,
    SSN UNIQUE,
    MedicareNo UNIQUE,
    Phone,
    Email,
    Address,
    City,
    Province,
    PostalCode
)
```

---

# 7. Family_Location_History Relation


## Description

Tracks family members associated with different locations over time.


## Relational Schema


```
Family_Location_History(
    HistoryID PK,
    FamilyID FK,
    LocationID FK,
    StartDate,
    EndDate
)
```

---

# 8. FamilyRelationship Relation


## Description

Maintains relationship between family members and minor club members.


## Attributes


| Attribute | Constraint |
|-|-|
| FamilyID | PK, FK |
| MemberID | PK, FK |
| StartDate | PK |
| EndDate | |
| RelationshipType | |


## Relational Schema


```
FamilyRelationship(
    FamilyID PK FK,
    MemberID PK FK,
    StartDate PK,
    EndDate,
    RelationshipType
)
```


RelationshipType values:


```
Father
Mother
Grandfather
Grandmother
Tutor
Partner
Friend
Other
```

---

# 9. Hobbies Relation


## Relational Schema


```
Hobbies(
    HobbyID PK,
    HobbyName
)
```

---

# 10. Member_Hobby Relation


## Description

Resolves many-to-many relationship between members and hobbies.


## Relational Schema


```
Member_Hobby(
    MemberID PK FK,
    HobbyID PK FK
)
```

---

# 11. Payments Relation


## Description

Stores all membership payments and possible donations.


## Relational Schema


```
Payments(
    PaymentID PK,
    PaymentDate,
    Amount,
    Method,
    MembershipYear,
    MemberID FK
)
```


Payment Method:


```
Cash
Debit
Credit Card
```

---

# 12. Teams Relation


## Description

Stores Boys and Girls soccer teams.


## Relational Schema


```
Teams(
    TeamID PK,
    TeamName,
    Gender,
    LocationID FK
)
```


Gender:


```
Boys
Girls
```

---

# 13. Team_Members Relation


## Description

Stores the history of members joining teams.


## Relational Schema


```
Team_Members(
    TeamID PK FK,
    MemberID PK FK,
    StartDate,
    EndDate
)
```

---

# 14. FIFA_Games Relation


## Description

Stores FIFA game information.


## Relational Schema


```
FIFA_Games(
    GameID PK,
    GameDate,
    LocationID FK,
    OpponentTeam,
    Score
)
```

---

# 15. Game_Participation Relation


## Description

Records members participating in FIFA games.


## Relational Schema


```
Game_Participation(
    MemberID PK FK,
    GameID PK FK,
    TeamID FK
)
```

---

# Relationship Mapping Summary


| Relationship | Mapping |
|-|-|
| Locations - ClubMembers | 1:N through Member_Location_History |
| Locations - Personnel | 1:N through Personnel_Assignment |
| Locations - FamilyMembers | 1:N through Family_Location_History |
| FamilyMembers - ClubMembers | M:N through FamilyRelationship |
| ClubMembers - Hobbies | M:N through Member_Hobby |
| ClubMembers - Payments | 1:N |
| Locations - Teams | 1:N |
| ClubMembers - Teams | M:N through Team_Members |
| ClubMembers - FIFA_Games | M:N through Game_Participation |
| Teams - FIFA_Games | 1:N |


---

# Total Relations

The CSCS database contains the following relations:

1. Locations  
2. Personnel  
3. Personnel_Assignment  
4. ClubMembers  
5. Member_Location_History  
6. FamilyMembers  
7. Family_Location_History  
8. FamilyRelationship  
9. Hobbies  
10. Member_Hobby  
11. Payments  
12. Teams  
13. Team_Members  
14. FIFA_Games  
15. Game_Participation  

