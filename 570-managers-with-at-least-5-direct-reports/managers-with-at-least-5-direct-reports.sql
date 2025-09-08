-- -- Write your PostgreSQL query statement below
-- select name from employee where id in
-- (select managerId from employee group by managerId
-- having (count(distinct id)>=5))

SELECT e1.name
FROM Employee e1
JOIN Employee e2 ON e1.id = e2.managerID
GROUP BY e1.id, e1.name
HAVING COUNT(e2.id) >= 5;
