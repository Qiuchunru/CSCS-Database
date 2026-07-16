-- Query viii

USE CSCS;
SELECT


L.Name AS Location_Name,


CM.MemberID,


CM.FirstName,


CM.LastName,


TIMESTAMPDIFF(
YEAR,
CM.DOB,
CURDATE()
)

AS Age,


CM.City,

CM.Province,


'Active' AS Status,


COUNT(GP.GameID)

AS Total_FIFA_Games



FROM ClubMembers CM



JOIN Member_Location_History MLH

ON CM.MemberID = MLH.MemberID



JOIN Locations L

ON MLH.LocationID = L.LocationID



JOIN Game_Participation GP

ON CM.MemberID = GP.MemberID



GROUP BY

L.Name,

CM.MemberID,

CM.FirstName,

CM.LastName,

CM.DOB,

CM.City,

CM.Province



HAVING COUNT(GP.GameID)>=4



ORDER BY

Location_Name ASC,

Age ASC;