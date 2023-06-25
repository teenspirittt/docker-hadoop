FROM debian:10


RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-11-jdk && \
    apt-get install -y curl && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    apt-get clean


ENV SPARK_VERSION=3.2.0
ENV HADOOP_VERSION=3.3.1

RUN curl -fSL "https://downloads.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz" -o spark.tgz && \
    tar xvf spark.tgz && \
    rm spark.tgz && \
    mv spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION spark

ENV SPARK_HOME=/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
ENV PYSPARK_PYTHON=/usr/bin/python3


COPY requirements.txt /
RUN pip3 install -r /requirements.txt

COPY script.py /

CMD ["python3", "/script.py"]
