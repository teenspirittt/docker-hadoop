#!/bin/bash

cp /opt/hadoop-$HADOOP_VERSION/conf/core-site.xml /opt/hadoop-$HADOOP_VERSION/etc/hadoop/core-site.xml
cp /opt/hadoop-$HADOOP_VERSION/conf/hdfs-site.xml /opt/hadoop-$HADOOP_VERSION/etc/hadoop/hdfs-site.xml

/opt/hadoop-$HADOOP_VERSION/bin/hdfs namenode -format

/opt/hadoop-$HADOOP_VERSION/sbin/hadoop-daemon.sh start namenode
