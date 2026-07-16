-- Query v
-- Total number of club members for every age

USE CSCS;
SELECT

TIMESTAMPDIFF(
YEAR,
DOB,
CURDATE()
) AS Age,


COUNT(*) AS Number_of_Members


FROM ClubMembers


GROUP BY Age


ORDER BY Age DESC;