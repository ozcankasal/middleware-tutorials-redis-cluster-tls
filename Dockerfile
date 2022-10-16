FROM redis:7.0.4 as base
RUN apt-get update && apt-get install -y openssl

ADD tls /app/tls
ADD redis /app/redis
ADD run.sh /app/run.sh
ADD create_cluster.sh /app/create_cluster.sh

RUN chmod -R 777 /app/run.sh
RUN chmod -R 777 /app/tls/create_certificate.sh
RUN chmod -R 777 /app/create_cluster.sh