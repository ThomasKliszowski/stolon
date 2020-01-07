#!/bin/bash

# Exit on error
set -e

POSTGRES_DIR=/stolon-data/postgres
SECRETS_DIR=/walg-secret

# Exit if the server is a standby one
if [ -f $POSTGRES_DIR/standby.signal ]; then
  echo "Standby server, skip backup"
  exit 0
fi

echo "New backup"
envdir $SECRETS_DIR wal-g backup-push $POSTGRES_DIR
