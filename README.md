# automated-migrations

This is a backup of my MySQL database migration script.

Script runs all migration SQL scripts in order by name.
Migrations that were already applied do NOT run.
After migration runs, it is saved into 'migrations' table in the same DB.
Migrations happen in TRANSACTIONS.
If single migration fails, migrating does NOT continue.

Assumptions:
- ran by bash 4 or higher or bash 4 superset shell
- selected database contains table named "migration" [id, name, datetime default=now()]
- paths inside the script are correctly set to target migrations folder
- migrations are in order by name (ordering by bash 'sort')

Usage:
/path/to/migrations.sh DB_HOST DB_NAME DB_USER DB_PWD

Example:
~/migrations.sh localhost mydb root 12345

NOTE: Tested with mariadb:10.3.9-bionic Docker image
