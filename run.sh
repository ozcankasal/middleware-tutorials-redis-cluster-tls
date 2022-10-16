#!/bin/bash

cd /app/tls
bash create_certificate.sh

cd /app/redis
redis-server ./redis.conf


