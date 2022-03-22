# Preparing practicing data

Let's download the sakila-data first:  
`DIR=$(PWD)`{{execute}}  
`cd /tmp`{{execute}}  
`wget http://downloads.mysql.com/docs/sakila-db.zip && unzip sakila-db.zip`{{execute}}  

And loading the data:  
`mysql --user admin < sakila-db/sakila-schema.sql && mysql --user admin < sakila-db/sakila-data.sql`{{execute}}  
`cd $DIR`{{execute}}  

# Checkout the binlog
You can checkout whether binlog works.  
`mysql -uadmin`{{execute}}  
`SHOW BINARY LOGS;`{{execute}} 

