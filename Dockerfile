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

# copy setup script
COPY setup-hadoop.sh /opt/setup-hadoop.sh
RUN chmod +x /opt/setup-hadoop.sh

# start hadoop, namenode and DataNode
CMD ["/opt/setup-hadoop.sh"]


