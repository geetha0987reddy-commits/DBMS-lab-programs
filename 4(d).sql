
USE Set4DB;


-- Q4.d) Demonstrate DCL commands GRANT and REVOKE

-- Step 1: Drop user if it already exists to avoid creation warnings
DROP USER IF EXISTS 'test_user'@'localhost';

-- Step 2: Create a new user
CREATE USER 'test_user'@'localhost' IDENTIFIED BY 'password123';

-- Step 3: Grant SELECT and INSERT permissions on Set4DB to the user
GRANT SELECT, INSERT ON Set4DB.* TO 'test_user'@'localhost';

-- Step 4: Revoke INSERT permission from the user
REVOKE INSERT ON Set4DB.* FROM 'test_user'@'localhost';

-- Step 5: Flush privilege tables to apply changes
FLUSH PRIVILEGES;

-- Step 6: Display current granted privileges for verification
SHOW GRANTS FOR 'test_user'@'localhost';