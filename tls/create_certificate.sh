#!/bin/bash

host_ip=$(cat /etc/hosts | grep ${HOSTNAME} | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
sed -i "s/HOST_NAME/${HOSTNAME}/g" /app/tls/request.cfg
sed -i "s/HOST_IP/${host_ip}/g" /app/tls/request.cfg

openssl req -config request.cfg -newkey rsa:2048 -nodes -sha256 -keyout redis.key -out redis.csr

openssl x509 -req -sha256 -days 365 -in redis.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out redis.crt -extfile request.cfg -extensions v3_req