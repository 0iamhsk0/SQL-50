SELECT COALESCE(EmployeeUNI.unique_id, NULL) AS unique_id, Employees.name
FROM Employees
LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id;
