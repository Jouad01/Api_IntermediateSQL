CREATE USER 'victor'@'localhost' IDENTIFIED BY 'password';
CREATE ROLE administrator;
GRANT SELECT,INSERT,UPDATE,DELETE ON BicycleStore.* TO administrator;
GRANT administrator TO 'victor'@'localhost';
SHOW GRANTS for 'victor'@'localhost';
SELECT CURRENT_ROLE;

CREATE USER 'jouad'@'localhost' IDENTIFIED BY '12345';
CREATE ROLE employee;
GRANT SELECT,INSERT,UPDATE ON BicycleStore.* TO employee;
GRANT employee TO 'jouad'@'localhost';
SHOW GRANTS for 'jouad'@'localhost';
SELECT CURRENT_ROLE;

-- The set of the roles will be inserted when start mariadb with the new user.
SET ROLE administrator;
SET ROLE employee;