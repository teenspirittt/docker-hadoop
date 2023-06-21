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
    rm hadoop-3.3.1.tar.gz

# Копирование конфигурационных файлов
COPY conf/yarn-site.xml /opt/hadoop-3.3.1/etc/hadoop/yarn-site.xml
COPY conf/resourcemanager-log4j.properties /opt/hadoop-3.3.1/etc/hadoop/log4j.properties

# Настройка переменных среды
ENV HADOOP_HOME=/opt/hadoop-3.3.1
ENV PATH=$PATH:$HADOOP_HOME/bin

# Открываем порты для веб-интерфейса ResourceManager
EXPOSE 8088

# Установка рабочей директории
WORKDIR $HADOOP_HOME

# Запуск ResourceManager
CMD ["yarn", "resourcemanager"]
