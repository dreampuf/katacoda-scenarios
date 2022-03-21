# Install spark and tools

Lets update Ubuntu first:

`python --version`{{execute}}

`pip install jupyter notebook`{{execute}}

`sudo apt-get update`{{execute}}

`sudo apt install -y default-jdk scala git`{{execute}}

`wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz`{{execute}}

`sudo mkdir /opt/spark`{{execute}}

`sudo tar -xf spark*.tgz -C /opt/spark --strip-component 1`{{execute}}

`sudo chmod -R 777 /opt/spark`{{execute}}

`export SPARK_HOME=/opt/spark`{{execute}}

`export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin`{{execute}}

`export PYSPARK_PYTHON=/usr/bin/python3`{{execute}}

`pip install findspark`{{execute}}

`start-master.sh`{{execute}}

`export PYSPARK_DRIVER_PYTHON="jupyter"`{{execute}}

`export PYSPARK_DRIVER_PYTHON_OPTS="notebook --allow-root"`{{execute}}

`pyspark`{{execute}}

Copy this address in your browser to see Spark server
`https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com`

Copy this address in your browser to see Jupyter notebook
`https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com`

Copy the token from your terminal to log in Jupyter notebook

`sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1`{{execute}}

`pyspark`{{execute}}

`sudo apt-get update`{{execute}}

For full functionality, spark needs java 8

`java -version`{{execute}}

We'll also need python:   
`python -V`{{execute}}   
and python 3   
`python3 -V`{{execute}}

and update it:
`pip install --upgrade pip`{{execute}}


Download Spark (we're using release 2.4, package 2.7):
`curl -O http://apache.mirrors.nublue.co.uk/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz`{{execute}}

`sudo apt install default-jdk scala git`{{execute}}

`wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz`{{execute}}

sudo mkdir /opt/spark

sudo tar -xf spark*.tgz -C /opt/spark --strip-component 1

sudo chmod -R 777 /opt/spark

export SPARK_HOME=/opt/spark

export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

export PYSPARK_PYTHON=/usr/bin/python3

start-master.sh


start-master.sh --port 7072 --webui-port 8082

sudo ufw allow 8080

start-worker.sh spark://ubuntu:7077

stop-worker.sh

start-worker.sh -m 212M spark://ubuntu:7077

spark-shell

pyspark

stop-master.sh

stop-worker.sh

stop-all.sh

start-all.sh

Ref: https://www.how2shout.com/linux/installing-apache-spark-on-ubuntu-20-04-or-18-04/

Extract it:
`tar -xvf spark-2.4.5-bin-hadoop2.7.tgz`{{execute}}

And set it up for execution:
`mv spark-2.4.5-bin-hadoop2.7 /usr/local/spark`{{execute}}



`export SPARK_HOME=/usr/local/spark`{{execute}}

`export PATH=$PATH:$SPARK_HOME/bin`{{execute}}


check JAVA
`echo $JAVA_HOME`{{execute}}
should equal
`JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre`{{execute}}

And finally lets check spark (for scala) is installed and working:
`spark-shell --version`{{execute}}

and for python:
`pyspark --version`{{execute}}
