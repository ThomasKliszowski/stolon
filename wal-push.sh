#!/bin/bash

# Exit on error
set -e

POSTGRES_DIR=/stolon-data/postgres
SECRETS_DIR=/walg-secret

# Exit if the server is a standby one
if [ -f $POSTGRES_DIR/standby.signal ]; then
  echo "Standby server, skip wal push"
  exit 0
fi

echo "Push wal $@"
envdir $SECRETS_DIR wal-g wal-push "$@"
