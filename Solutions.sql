--1.	Retrieve the name and membership_type of female members.

SELECT ms.name, mt.membership_type
FROM members as ms
JOIN memberships as mt ON ms.member_id = mt.member_id
WHERE mt.gender = 'F';
--2.	Find members who have a Monthly membership and joined after 2023-11-01.

SELECT *
FROM memberships
WHERE membership_type = 'Monthly'
      AND
      join_date > '2023-11-01';
--3.	List the name and status of active members over 25.

SELECT ms.name, mt.status 
FROM members as ms
JOIN memberships as mt ON ms.member_id = mt.member_id
WHERE status = 'Active'
      AND 
      age > 25;
	  
--4.	Get details of visits on a specific date (2024-01-01).

SELECT * 
FROM visits
WHERE visit_date = '2024-01-01';

--5.	List members with a Quarterly membership aged between 20 and 30.

SELECT *
FROM memberships
WHERE membership_type = 'Quaterly'
      AND
      age BETWEEN 20 and 30;

--Additional aggregations and grouping: 

--6.	Count total visits made by each member.

SELECT member_id, COUNT(*) as total_visits
FROM visits
GROUP BY 1;

--7.	Count members by membership type (e.g., Monthly, Weekly, Quarterly).

SELECT membership_type, COUNT(membership_type) as cnt_of_members
FROM memberships
GROUP BY membership_type;

--8.	Calculate the average age of members, grouped by membership type.

SELECT membership_type, AVG(age) as avg_members
FROM memberships
GROUP BY 2;

--9.	Total visits for each visit date.

SELECT visit_date, COUNT(*) as number_of_visits
FROM visits
GROUP BY visit_date;

--10.	Count members by status (e.g., Active or Cancelled).

SELECT status, COUNT(*) as number_of_members
FROM memberships
WHERE status = 'Active' 
      OR
      status = 'Cancelled'
GROUP BY status;

Advanced queries:

--11. Top 3 members with the highest visits.

SELECT ms.name, COUNT(*) as total_visits
FROM members as ms
JOIN visits as v ON ms.member_id = v.member_id
GROUP BY ms.name
ORDER BY total_visits DESC
LIMIT 3;

--12.	Active Monthly members grouped by membership type, sorted by recent join dates.

SELECT membership_type, COUNT(*) as number_of_members 
FROM memberships
WHERE membership_type = 'Monthly' 
      AND
      status = 'Active'
GROUP BY membership_type
LIMIT 2;

--13.	Members with more than 2 visits, sorted by total visits, displaying the top 5.

SELECT ms.name, COUNT(*) as total_visits
FROM members as ms
JOIN visits as v ON ms.member_id = v.member_id
GROUP BY ms.name
HAVING COUNT(*) > 2
ORDER BY total_visits
LIMIT 5;
 
--14.	Members who joined in 2023, grouped by membership type (where each group has >1 member).

SELECT membership_type, COUNT(*) AS number_of_number
FROM memberships
WHERE join_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY membership_type
HAVING COUNT(*) > 1;

--15.	Average age of active members, grouped by membership type, limited to the top 3 results.

SELECT membership_type, AVG(age) as avg_member 
FROM memberships
WHERE status = 'Active'
GROUP BY 1
ORDER BY 1 ASC
LIMIT 3;
--
