FROM openjdk:8-jdk

ENV HADOOP_HOME=/opt/hadoop-3.3.1
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

COPY hadoop-3.3.1.tar.gz /opt/
RUN tar -xzf /opt/hadoop-3.3.1.tar.gz -C /opt/ && \
    rm /opt/hadoop-3.3.1.tar.gz

COPY start-nodemanager.sh /opt/hadoop-3.3.1/start-nodemanager.sh
RUN chmod +x /opt/hadoop-3.3.1/start-nodemanager.sh

COPY conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
COPY conf/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
COPY conf/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml

EXPOSE 8042 8044

CMD ["/opt/hadoop-3.3.1/start-nodemanager.sh"]
