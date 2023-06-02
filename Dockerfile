# это база
FROM ubuntu:20.04

# Installing jdk
RUN apt-get update && apt-get install -y openjdk-8-jdk

# Installing hadoop
RUN apt-get update && apt-get install -y wget
RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
RUN tar xfz hadoop-3.3.1.tar.gz -C /opt/
RUN rm hadoop-3.3.1.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/opt/hadoop-3.3.1
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# cpy conf files
COPY core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml

EXPOSE 9870 9864 9866 9867 9868 9869 9871 9872

# start hadoop, namenode and DataNode
CMD ["hdfs", "namenode"]
CMD ["hdfs", "datanode"]

