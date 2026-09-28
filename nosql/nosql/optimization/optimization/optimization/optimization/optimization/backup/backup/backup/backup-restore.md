# Backup and Restore Documentation

## Backup Command

The PostgreSQL database is backed up using the custom format:

```bash
pg_dump -Fc -f backups/capstone_$(date +%F).dump capstone
```

The custom format is suitable for use with `pg_restore`.

## Backup Verification

After creating the backup, the backup file was checked to confirm that it was created successfully.

## Restore Test

A separate database named:

```text
capstone_restore_test
```

was created for the restoration test.

The backup was restored into this database using:

```bash
pg_restore --dbname=capstone_restore_test backups/capstone_DATE.dump
```

The restored database was then checked using PostgreSQL commands such as:

```sql
\dt
```

and:

```sql
SELECT COUNT(*) FROM users;
```

## Result

The restore test confirms whether the backup can actually be used to reconstruct the database.

The restoration result should be documented using the actual output from the test environment.
