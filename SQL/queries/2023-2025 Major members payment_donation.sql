-- Query vii


SELECT


SUM(
CASE

WHEN P.Amount <= 200

THEN P.Amount

ELSE 200

END
)

AS Total_Membership_Fees,


SUM(
CASE

WHEN P.Amount > 200

THEN P.Amount - 200

ELSE 0

END
)

AS Total_Donations



FROM Payments P


JOIN ClubMembers CM

ON P.MemberID = CM.MemberID



WHERE CM.MemberType='Major'


AND P.MembershipYear BETWEEN 2023 AND 2025;