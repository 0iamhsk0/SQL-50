SELECT COALESCE(EmployeeUNI.unique_id, NULL) AS unique_id, Employees.name
-- COALESCE is unnessary, since joins by default gives NULL for empty values
FROM Employees
LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id;
