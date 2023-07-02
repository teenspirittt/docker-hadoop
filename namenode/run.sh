#!/bin/bash

if [ -z "$HADOOP_HOME" ]; then
  echo "The environment variable HADOOP_HOME is not set."
  exit 1
fi

if [ -z "$HADOOP_CONF_DIR" ]; then
  echo "The environment variable HADOOP_CONF_DIR is not set."
  exit 1
fi

$HADOOP_HOME/bin/hdfs namenode  -format

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode

#opt/hadoop-$HADOOP_VERSION/sbin/start-dfs.sh
