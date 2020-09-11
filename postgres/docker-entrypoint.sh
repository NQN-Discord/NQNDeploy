#!/bin/sh
cp /root/pg_hba.conf /var/lib/postgresql/data/
/docker-entrypoint-original.sh
