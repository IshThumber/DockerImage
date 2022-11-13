# builder step used to download and configure spark environment
FROM openjdk:11.0.11-jre-slim-buster 

USER 0

# install python3 and curl to download spark 
RUN mkdir -p /opt 
RUN apt-get update -y 
RUN apt-get install -y python3
RUN ln -s /usr/bin/python3 /usr/bin/python 
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update -y 
RUN apt-get install -y curl 
RUN curl https://dlcdn.apache.org/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz -o spark.tgz
RUN tar xvf spark.tgz 
RUN mv spark-3.3.1-bin-hadoop3 /opt/spark

# Spark environment variables
ENV SPARK_HOME /opt/spark
ENV PATH ${PATH}:${SPARK_HOME}/bin:${SPARK_HOME}/sbin
ENV PYSPARK_PYTHON /usr/bin/python3

# Installation of Spark and Python dependencies
RUN apt-get -y install python3-pip 
RUN pip3 install pyspark

WORKDIR /opt

# Copy the python script to the container
COPY one.py /opt/