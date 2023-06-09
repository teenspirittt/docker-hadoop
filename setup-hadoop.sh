#!/bin/bash


CORE_SITE_XML="/opt/hadoop-3.3.1/etc/hadoop/core-site.xml"
HDFS_SITE_XML="/opt/hadoop-3.3.1/etc/hadoop/hdfs-site.xml"

echo "<configuration>
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://localhost:9000</value>
  </property>
</configuration>" > $CORE_SITE_XML

echo "<configuration>
  <property>
    <name>dfs.namenode.http-address</name>
    <value>0.0.0.0:9870</value>
  </property>
</configuration>" > $HDFS_SITE_XML



export HDFS_NAMENODE_USER=root
export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root

hdfs namenode -format

hdfs namenode
hdfs datanode
hdfs secondarynamenode

sleep 5

# Отображение журналов
tail -f $HADOOP_HOME/logs/*.log
