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


'Active' AS Status



FROM ClubMembers CM


JOIN Member_Location_History MLH

ON CM.MemberID=MLH.MemberID


JOIN Locations L

ON MLH.LocationID=L.LocationID


WHERE CM.MemberType='Major'


AND CM.MemberID NOT IN

(
SELECT MemberID

FROM Game_Participation
)


ORDER BY Location_Name, Age;