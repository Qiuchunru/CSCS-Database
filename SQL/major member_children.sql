-- Query vi


SELECT


FM.FirstName AS Major_Member_FirstName,

FM.LastName AS Major_Member_LastName,


Parent.MemberID AS Major_Member_ID,


Child.FirstName AS Child_FirstName,

Child.LastName AS Child_LastName,


Child.DOB,

Child.SSN,

Child.MedicareNo,

Child.Phone,

Child.Address,

Child.City,

Child.Province,

Child.PostalCode,


FR.RelationshipType,


'Active' AS Status



FROM FamilyMembers FM



JOIN ClubMembers Parent

ON FM.SSN = Parent.SSN



JOIN FamilyRelationship FR

ON FM.FamilyID = FR.FamilyID



JOIN ClubMembers Child

ON FR.MemberID = Child.MemberID



WHERE Parent.MemberType='Major';