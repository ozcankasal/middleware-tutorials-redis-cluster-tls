#!/bin/bash

cd /app/tls
bash create_certificate.sh

sleep 5
redis-cli --tls --cacert /app/tls/ca.crt --cluster create 172.23.0.11:6379 172.23.0.12:6379 172.23.0.13:6379 172.23.0.14:6379 172.23.0.15:6379 172.23.0.16:6379 --cluster-replicas 1 --cluster-yes