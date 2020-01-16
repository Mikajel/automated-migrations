/* README: this is an update file for ACL database CI/CD versioning and non-destructive persistence */
/*         it operates on a top of 01-acl-ddl-only.sql and 02-acl-data-only.sql */
/*         file contains both ddl and data updates that will be served to running database based on migrations table */
/*         WARNING: if your migration filename contains an extra dot, you will break my script and I wil break your knees */

START TRANSACTION;

COMMIT;
