#!/bin/bash
set -e

# check amount of input attributes
if [[ "$#" -ne 4 ]]; then
        echo "ERROR: Please specify HOST, DBNAME, USER and PASSWORD in respective order for migrations database"
        exit 1;
fi

DB_HOST=$1
DB_NAME=$2
DB_USER=$3
DB_PWD=$4

echo "Running migrations for database ${DB_NAME}@${DB_HOST}"

#for FILENAME in `ls /tmp/migrations/ | sort`; do
for FILENAME in `ls /migrations | sort`; do
    
    FILENAME_NO_EXTENSION=`echo $FILENAME | cut -d '.' -f1`
    
    # check if 'migrations' table contains entry on this migration name(shortened filename)
    ALREADY_MIGRATED=`mysql --host ${DB_HOST} --user ${DB_USER} --password=${DB_PWD} ${DB_NAME} --skip-column-names --silent --execute "SELECT COUNT(*) FROM migration WHERE name=\"${FILENAME_NO_EXTENSION}\";"`
    echo "Checking migration ${FILENAME_NO_EXTENSION}; Found ${ALREADY_MIGRATED}"

    # if migration was not applied yet, apply migration and register it to 'migrations' table
    if [[ $ALREADY_MIGRATED -eq 0 ]]; then
        echo "Applying migration ${FILENAME_NO_EXTENSION}"
        mysql --host ${DB_HOST} --user ${DB_USER} --password=${DB_PWD} ${DB_NAME} < /migrations/${FILENAME}
        mysql --host ${DB_HOST} --user ${DB_USER} --password=${DB_PWD} ${DB_NAME} --execute "INSERT INTO migration (name) VALUES (\"${FILENAME_NO_EXTENSION}\")"
    fi
done