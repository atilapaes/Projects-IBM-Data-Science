-- Query 1 - Retrieve all employees whose address is in Elgin,IL
SELECT * FROM EMPLOYEES
	WHERE ADDRESS LIKE '%Elgin,IL';

-- Query 2 - Retrieve all employees who were born during the 1970's.
SELECT * FROM EMPLOYEES
	WHERE B_DATE BETWEEN '1970-01-01' AND '1979-12-31';

-- Query 3 - Retrieve all employees in deparment  5 whose salary is between 60000 and 70000
SELECT * FROM EMPLOYEES
	WHERE SALARY BETWEEN 60000 AND 70000;

-- Query 4A - Retrieve a list of employees ordered by department ID
SELECT * FROM EMPLOYEES
	ORDER BY DEP_ID;
	
-- Query 4B - Query 4B: Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
SELECT * FROM EMPLOYEES
	ORDER BY DEP_ID DESC, L_NAME DESC;
	
-- Query 5A - For each department ID retrieve the number of employees in the department
SELECT DEP_ID, COUNT(DEP_ID)
	FROM EMPLOYEES GROUP BY DEP_ID;
	
-- Query 5B - For each department retrieve the number of employees in the department, and the average employees salary in the department.	
SELECT DEP_ID,  --I am going to use the DEP_ID value to group the data
	COUNT(DEP_ID),  --Count the number of people in each department
	AVG(SALARY) -- Calculate the average salary from each group
	FROM EMPLOYEES GROUP BY DEP_ID; -- From the table Employees, I grouped by the Department ID

-- Query 5C - Label the computed columns in the result set of Query 5B as NUM_EMPLOYEES and AVG_SALARY.
SELECT DEP_ID,  --I am going to use the DEP_ID value to group the data
	COUNT(DEP_ID) AS NUM_EMPLOYEES,  --Count the number of people in each department, renamed the column to NUM_EMPLOYEES
	AVG(SALARY) AS AVG_SALARY -- Calculate the average salary from each group, rename the coumn  to AVG-_SALARY
	FROM EMPLOYEES GROUP BY DEP_ID; -- From the table Employees, I grouped by the Department ID

-- Query 5D - In Query 5C order the result set by Average Salary.
SELECT DEP_ID,  
	COUNT(DEP_ID) AS NUM_EMPLOYEES,  
	AVG(SALARY) AS AVG_SALARY
	FROM EMPLOYEES GROUP BY DEP_ID
	ORDER BY AVG_SALARY;
	
-- Query 5E - In Query 5D limit the result to departments with fewer than 4 employees.	
-- Hint: Use HAVING after the GROUP BY, and use the count() function in the HAVING clause instead of the column label.
SELECT DEP_ID,  
	COUNT(DEP_ID) AS NUM_EMPLOYEES,  
	AVG(SALARY) AS AVG_SALARY
	FROM EMPLOYEES GROUP BY DEP_ID
	HAVING COUNT(DEP_ID) <4 -- Use HAVING after the GROUP BY, and use the count() function in the HAVING clause instead of the column label.
	ORDER BY AVG_SALARY;

-- BONUS Query 6 - Similar to 4B but instead of department ID use department name. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.	
-- Query 4B - Query 4B: Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.

SELECT EMPLOYEES.*
	FROM EMPLOYEES, DEPARTMENTS
	WHERE EMPLOYEES.DEP_ID =DEPARTMENTS.DEPT_ID_DEP
	ORDER BY DEPARTMENTS.DEP_NAME DESC, EMPLOYEES.L_NAME DESC;