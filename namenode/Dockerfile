FROM openjdk:8-jdk

ENV HADOOP_HOME=/opt/hadoop-3.3.1
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

COPY hadoop-3.3.1.tar.gz /opt/
RUN tar -xzf /opt/hadoop-3.3.1.tar.gz -C /opt/ && \
    rm /opt/hadoop-3.3.1.tar.gz

COPY start-namenode.sh /opt/hadoop-3.3.1/start-namenode.sh
RUN chmod +x /opt/hadoop-3.3.1/start-namenode.sh

COPY conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml

RUN mkdir -p /opt/hadoop-3.3.1/data/namenode && \
    hdfs namenode -format

EXPOSE 9870

CMD ["/opt/hadoop-3.3.1/start-namenode.sh"]
