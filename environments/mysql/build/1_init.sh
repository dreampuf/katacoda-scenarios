docker pull mysql/mysql-server:latest
docker run \
  --name=mysql1 \
  -d \
  -p 3306:3306 \
  mysql/mysql-server:latest
while [ "`docker inspect --format='{{.State.Health.Status}}' mysql1`" != "healthy" ]; do
  echo "Starting server..."
  sleep 5
done
MYSQL_PASSWORD=$(docker logs mysql1 2>&1 | grep GENERATED | cut -d ' ' -f5)
docker exec -e MYSQL_PASSWORD=$MYSQL_PASSWORD mysql1 \
  mysql --connect-expired-password -uroot -p$MYSQL_PASSWORD \
  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';"
cat <<EOF >/tmp/setup.sql
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';
FLUSH PRIVILEGES;
EOF
docker exec mysql1 \
  mysql -uroot -ppassword -e "`cat /tmp/setup.sql`"
export MYSQL_HOST=0.0.0.0
export MYSQL_PWD=password

apt-get update && apt-get install -Vy mysql-client-core-5.7 < "/dev/null"
DIR=`pwd`
cd /tmp && wget http://downloads.mysql.com/docs/sakila-db.zip && unzip sakila-db.zip
mysql --user admin < sakila-db/sakila-schema.sql
mysql --user admin < sakila-db/sakila-data.sql
cd $DIR
echo "Environment is setup and ready to go"

mysql --user=admin