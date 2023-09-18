/*CREATE TABLE*/
-- CREATE TABLE emp_salary
-- (
--     emp_id INT NOT NULL,
--     name NVARCHAR(20)  NOT NULL,
--     salary NVARCHAR(30),
--     dept_id INTEGER
-- );

/*INSERT RECORDS*/

-- INSERT INTO emp_salary
-- (emp_id, name, salary, dept_id)
-- VALUES(101, 'sohan', '3000', '11'),
-- (102, 'rohan', '4000', '12'),
-- (103, 'mohan', '5000', '13'),
-- (104, 'cat', '3000', '11'),
-- (105, 'suresh', '4000', '12'),
-- (109, 'mahesh', '7000', '12'),
-- (108, 'kamal', '8000', '11');

/*wRITE A QUERY TO PRINT SAME SALARY EARNER IN SAME DEPARTMENT*/
 WITH CTE AS (
SELECT DEPT_ID, SALARY FROM emp_salary
GROUP BY DEPT_ID, SALARY
HAVING COUNT(SALARY)>1),
CTE2 AS (
    SELECT NAME,SALARY FROM emp_salary
)
SELECT NAME,DEPT_ID, C.SALARY FROM 
CTE C JOIN CTE2 C2 ON C.SALARY=C2.SALARY
ORDER BY DEPT_ID 

