#!/bin/bash

# PostgreSQL settings
PG_USER="adminpost"
PG_DB="dbpgsql"
PG_HOST="aws-db-pg.cyvxmusxt9s8.ap-southeast-2.rds.amazonaws.com"
PG_PORT="5432"

# Timestamp for the backup file
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Backup directory (adjust to your preference)
BACKUP_DIR="/db/backup"

# Create a backup file
BACKUP_FILE="$BACKUP_DIR/$PG_DB-$TIMESTAMP.sql"

# Perform the backup
pg_dump -h $PG_HOST -p $PG_PORT -U $PG_USER $PG_DB > $BACKUP_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "PostgreSQL backup completed successfully: $BACKUP_FILE"
else
    echo "PostgreSQL backup failed"
    exit 1
fi

# Upload to AWS S3
aws s3 cp $BACKUP_FILE s3://backup.db/


