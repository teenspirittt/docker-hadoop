FROM debian:10

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-11-jdk && \
    apt-get install -y curl && \
    apt-get clean
 
ADD start-namenode.sh /start-namenode.sh


ENV HADOOP_VERSION 3.2.1
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ADD ../conf/core-site.xml /opt/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml
ADD ../conf/hdfs-site.xml /opt/hadoop-$HADOOP_VERSION/etc/hadoop/hdfs-site.xml


ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV PATH=$PATH:$HADOOP_HOME/bin

EXPOSE 9870 9000

WORKDIR $HADOOP_HOME

CMD ["./start-namenode.sh"]
