#!/bin/bash

set -e

TEST_DB="capstone_restore_test"

dropdb --if-exists "$TEST_DB"
createdb "$TEST_DB"

LATEST_BACKUP=$(ls -t backups/capstone_*.dump | head -n 1)

pg_restore \
  --dbname="$TEST_DB" \
  --clean \
  --if-exists \
  "$LATEST_BACKUP"

echo "Restore test completed successfully."

psql "$TEST_DB" -c "\dt"