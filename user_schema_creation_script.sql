/* Formatted on 10/27/2023 5:37:58 PM (QP5 v5.381) */
CREATE USER OFSABC IDENTIFIED BY OFSABC
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    PROFILE DEFAULT
    ACCOUNT UNLOCK;

GRANT OLAP_USER TO OFSABC;

ALTER USER OFSABC
    DEFAULT ROLE ALL;

GRANT CREATE MATERIALIZED VIEW TO OFSABC;
GRANT CREATE PROCEDURE TO OFSABC;
GRANT CREATE SEQUENCE TO OFSABC;
GRANT CREATE SESSION TO OFSABC;
GRANT CREATE SYNONYM TO OFSABC;
GRANT CREATE TABLE TO OFSABC;
GRANT CREATE TRIGGER TO OFSABC;
GRANT CREATE TYPE TO OFSABC;
GRANT CREATE VIEW TO OFSABC;
GRANT DROP ANY INDEX TO OFSABC;

ALTER USER OFSABC
    QUOTA UNLIMITED ON USERS;

GRANT SELECT ON SYS.V_$PARAMETER TO OFSABC;