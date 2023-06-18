#!/bin/bash

if [ -z "$HADOOP_HOME" ]; then
  echo "Переменная среды HADOOP_HOME не установлена"
  exit 1
fi

if [ -z "$HADOOP_CONF_DIR" ]; then
  echo "Переменная среды HADOOP_CONF_DIR не установлена"
  exit 1
fi

$HADOOP_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
