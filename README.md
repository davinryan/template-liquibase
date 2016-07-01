Refer to http://www.liquibase.org/documentation/changes/sql.html for SQL support

WARNING: Starting from scratch? Then read this

please run these files first manually as the system or sysdba user. This 
should never be automated by liquibase as it makes administrator changes. 
These files are only to be used for setting up the egateway database only.

resources/db/changelogs/egateway/base/base_tablespace.sql
resources/db/changelogs/egateway/base/base_users_roles.sql
resources/db/changelogs/egateway/base/base_users_development.sql

WARNING:

you need to run as the EGATEWAY_OWNER db user

resources/db/changelogs/egateway_owner/base/base_owner_plsql_18032016.sql

manually after running liquibase. Liquibase doesn't support things being in packages.

If you see the following error when creating the table spaces. Then create a tmp folder under C:/. Linux users you are
sweet as.

Error starting at line : 20 in command -
CREATE TABLESPACE EGATEWAY_DATA
  datafile '/tmp/egateway_data_01.dbf'
  size 10m autoextend on next 10m maxsize 10g
Error report -
SQL Error: ORA-01119: error in creating database file '/tmp/egateway_data_01.dbf'
ORA-27040: file create error, unable to create file
OSD-04002: unable to open file
O/S-Error: (OS 3) The system cannot find the path specified.
01119. 00000 -  "error in creating database file '%s'"
*Cause:    Usually due to not having enough space on the device.
*Action:


An examle of running the file against test is:
$ java -jar target/TREE-Liquibase-eGateway-0.0.6-SNAPSHOT-jar-with-dependencies.jar --owner.username "EGATEWAY_OWNER" --owner.password "t3tadm" --url "jdbc:oracle:thin:@//devcluster-scan:1521/TREE_TST.DS.ACC.CO.NZ" --context "delta","data"
this runs both the delta and data contexts against the egateway database

