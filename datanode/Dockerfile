FROM debian:latest

# Установка Java и других зависимостей
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk-headless && \
    apt-get clean

# Установка Hadoop
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://downloads.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz && \
    tar -xzf hadoop-3.3.1.tar.gz -C /opt/ && \
    rm hadoop-3.3.1.tar.gz && \
    mkdir -p /opt/hadoop-3.3.1/data/datanode && \
    chmod +x /opt/hadoop-3.3.1/start-datanode.sh

# Копирование конфигурационных файлов
COPY conf/core-site.xml /opt/hadoop-3.3.1/etc/hadoop/core-site.xml
COPY conf/hdfs-site.xml /opt/hadoop-3.3.1/etc/hadoop/hdfs-site.xml

# Настройка переменных среды
ENV HADOOP_HOME=/opt/hadoop-3.3.1
ENV PATH=$PATH:$HADOOP_HOME/bin

# Открываем порт для обмена данными между Datanode и Namenode
EXPOSE 9864

# Установка рабочей директории
WORKDIR $HADOOP_HOME

# Запуск Datanode
CMD ["./start-datanode.sh"]
