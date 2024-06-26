FROM debian:11

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-11-jdk && \
    apt-get install -y curl && \
    apt-get clean

ENV HADOOP_VERSION=3.3.1
ENV HADOOP_URL=https://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir -p /opt/hadoop-$HADOOP_VERSION/hdfs/namenode
RUN mkdir /hadoop-data

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin

EXPOSE 9870 9000

WORKDIR $HADOOP_HOME

COPY run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT ["/bin/bash", "/run.sh"]
