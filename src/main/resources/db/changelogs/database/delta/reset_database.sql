-- WARNING: Only use this to manually reset the oracle database for the egateway_owner_user.
-- WARNING: This can never be part of liquibase becuase it needs to be down often by developers. Liquibase is versioned.

--------------------------------------------------------
--  Remove Types
--------------------------------------------------------
BEGIN
FOR i IN (SELECT object_name FROM user_objects WHERE object_type='TYPE' )
LOOP
  EXECUTE IMMEDIATE 'DROP TYPE '||i.object_name||' FORCE';
END LOOP;
END;
/
--------------------------------------------------------
--  Remove Indexes
--------------------------------------------------------
-- BEGIN
-- FOR i IN (SELECT object_name FROM user_objects WHERE object_type='INDEX' )
-- LOOP
-- EXECUTE IMMEDIATE 'DROP INDEX '||i.object_name||' FORCE';
-- END LOOP;
-- END;
-- /
--------------------------------------------------------
--  Remove Triggers
--------------------------------------------------------
BEGIN
FOR i IN (SELECT object_name FROM user_objects WHERE object_type='TRIGGER' )
LOOP
EXECUTE IMMEDIATE 'DROP TRIGGER '||i.object_name;
END LOOP;
END;
/
--------------------------------------------------------
--  Remove Views
--------------------------------------------------------
BEGIN
FOR i IN (SELECT object_name FROM user_objects WHERE object_type='VIEW' )
LOOP
EXECUTE IMMEDIATE 'DROP VIEW '||i.object_name;
END LOOP;
END;
/
--------------------------------------------------------
--  Remove Packages
--------------------------------------------------------
BEGIN
FOR i IN (SELECT object_name FROM user_objects WHERE object_type='PACKAGE' )
LOOP
EXECUTE IMMEDIATE 'DROP PACKAGE '||i.object_name;
END LOOP;
END;
/
--------------------------------------------------------
--  Remove Tables
--------------------------------------------------------
BEGIN
FOR i IN (SELECT object_name FROM user_objects WHERE object_type='TABLE' )
LOOP
EXECUTE IMMEDIATE 'DROP TABLE '||i.object_name|| ' CASCADE CONSTRAINTS';
END LOOP;
END;
/
--------------------------------------------------------
--  Remove Sequences
--------------------------------------------------------
BEGIN
FOR i IN (SELECT object_name FROM user_objects WHERE object_type='SEQUENCE' )
LOOP
EXECUTE IMMEDIATE 'DROP SEQUENCE '||i.object_name;
END LOOP;
END;
/