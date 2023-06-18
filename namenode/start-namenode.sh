#!/bin/bash

if [ -z "$HADOOP_HOME" ]; then
  echo "Переменная среды HADOOP_HOME не установлена"
  exit 1
fi

if [ -z "$HADOOP_CONF_DIR" ]; then
  echo "Переменная среды HADOOP_CONF_DIR не установлена"
  exit 1
fi

if [ ! -d "$HADOOP_HOME/dfs/name" ]; then
  echo "Данные NameNode не найдены. Инициализация..."
  $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format
fi

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
