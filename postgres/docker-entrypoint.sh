#!/bin/bash
cp /root/pg_hba.conf /var/lib/postgresql/data/
cp /root/postgresql.conf /var/lib/postgresql/data/

su - postgres -c postgres
