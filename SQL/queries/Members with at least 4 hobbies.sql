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


COUNT(MH.HobbyID)

AS Hobby_Number



FROM ClubMembers CM


JOIN Member_Location_History MLH

ON CM.MemberID=MLH.MemberID


JOIN Locations L

ON MLH.LocationID=L.LocationID


JOIN Member_Hobby MH

ON CM.MemberID=MH.MemberID



GROUP BY CM.MemberID


HAVING COUNT(MH.HobbyID)>=4


ORDER BY Age DESC, Location_Name ASC;