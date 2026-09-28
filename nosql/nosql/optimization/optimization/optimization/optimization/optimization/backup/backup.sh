#!/bin/bash

set -e

mkdir -p backups

pg_dump -Fc \
  -f "backups/capstone_$(date +%F).dump" \
  capstone

echo "Backup completed successfully."