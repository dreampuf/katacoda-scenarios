#!/bin/bash
docker pull mysql/mysql-server:latest
docker run \
  --name=mysql1 \
  -d \
  -v /opt/mysql:/var/lib/mysql \
  -p 3306:3306 \
  mysql/mysql-server:latest \
  --datadir=/var/lib/mysql \
  --user=mysql \
  --server-id=1 \
  --log-bin=/var/lib/mysql/mysql-bin.log
echo "Starting server"
while [ "`docker inspect --format='{{.State.Health.Status}}' mysql1`" != "healthy" ]; do
  echo -n "."
  sleep 3
done
MYSQL_PASSWORD=$(docker logs mysql1 2>&1 | grep GENERATED | cut -d ' ' -f5)
docker exec -e MYSQL_PASSWORD=$MYSQL_PASSWORD mysql1 \
  mysql --connect-expired-password -uroot -p$MYSQL_PASSWORD \
  -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';"
cat <<EOF >/tmp/setup.sql
CREATE USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';
FLUSH PRIVILEGES;
EOF
docker exec mysql1 \
  mysql -uroot -ppassword -e "`cat /tmp/setup.sql`"
apt-get -qq update && apt-get -qq install -y mysql-client-8.0 < "/dev/null"
export MYSQL_HOST=0.0.0.0
export MYSQL_PWD=password

cd /tmp && \
  wget http://downloads.mysql.com/docs/sakila-db.zip && \
  unzip sakila-db.zip && \
  mysql --user admin < sakila-db/sakila-schema.sql && \
  mysql --user admin < sakila-db/sakila-data.sql
echo "Environment is setup and ready to go"
echo "The IP address for this environment is [[HOST_IP]]"
echo "The URL to access Port 80 is [[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]"
mysql --user=admin

SHOW BINARY LOGS;
show databases;
use sakila;