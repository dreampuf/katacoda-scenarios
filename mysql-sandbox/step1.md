# Preparing practicing data

Let's download the sakila-data first:  
```
cd /tmp && \
wget http://downloads.mysql.com/docs/sakila-db.zip && \
unzip sakila-db.zip && \
mysql --user admin < sakila-db/sakila-schema.sql && \
mysql --user admin < sakila-db/sakila-data.sql
```
{{execute}}

You can checkout whether binlog works.  
`SHOW BINARY LOGS;`{{execute}} 

