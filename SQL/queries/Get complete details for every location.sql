USE CSCS;
SELECT

L.Name AS Location_Name,

L.Address,

L.City,

L.Province,

L.PostalCode,

L.Phone,

L.WebAddress,

L.Type,

L.Capacity,


(
SELECT CONCAT(P.FirstName,' ',P.LastName)

FROM Personnel P

JOIN Personnel_Assignment PA

ON P.PersonnelID = PA.PersonnelID

WHERE PA.LocationID = L.LocationID

AND P.Role='Administrator'

LIMIT 1

) AS General_Manager,


(
SELECT COUNT(*)

FROM Personnel_Assignment PA

WHERE PA.LocationID=L.LocationID
) AS Number_of_Personnel,


(
SELECT COUNT(*)

FROM Member_Location_History MLH

WHERE MLH.LocationID=L.LocationID
) AS Number_of_Members,


(
SELECT COUNT(DISTINCT GP.MemberID)

FROM Game_Participation GP

JOIN ClubMembers CM

ON GP.MemberID=CM.MemberID

JOIN Member_Location_History MLH

ON CM.MemberID=MLH.MemberID

WHERE MLH.LocationID=L.LocationID
)

AS FIFA_Players


FROM Locations L

ORDER BY Number_of_Members ASC;