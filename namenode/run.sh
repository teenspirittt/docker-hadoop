#!/bin/bash

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format 

/opt/hadoop-$HADOOP_VERSION/sbin/hadoop-daemon.sh start namenode
