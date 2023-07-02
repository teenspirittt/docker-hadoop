FROM python:3.9.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    apt-get install -y wget

ENV SPARK_VERSION=3.4.1 \
    HADOOP_VERSION=3 \
    JAVA_VERSION=11 \
    JAVA_HOME="/home/jdk-${JAVA_VERSION}.0.2" \
    SPARK_HOME="/home/spark"

ENV PATH="${JAVA_HOME}/bin/:${SPARK_HOME}/bin/:${PATH}"
ENV PYTHONPATH="${SPARK_HOME}/python/:${SPARK_HOME}/python/lib/py4j-0.10.9.5-src.zip:$PYTHONPATH"

RUN DOWNLOAD_URL="https://download.java.net/java/GA/jdk${JAVA_VERSION}/9/GPL/openjdk-${JAVA_VERSION}.0.2_linux-x64_bin.tar.gz" \
    && TMP_DIR="$(mktemp -d)" \
    && curl -fL "${DOWNLOAD_URL}" --output "${TMP_DIR}/openjdk-${JAVA_VERSION}.0.2_linux-x64_bin.tar.gz" \
    && mkdir -p "${JAVA_HOME}" \
    && tar -xzf "${TMP_DIR}/openjdk-${JAVA_VERSION}.0.2_linux-x64_bin.tar.gz" -C "${JAVA_HOME}" --strip-components=1 \
    && rm -rf "${TMP_DIR}" \
    && java --version

RUN DOWNLOAD_URL_SPARK="https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" \
    && wget --no-verbose -O spark.tgz "${DOWNLOAD_URL_SPARK}" \
    && tar -xf spark.tgz -C /home/ \
    && mv "/home/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}" "${SPARK_HOME}" \
    && rm spark.tgz

WORKDIR $SPARK_HOME

ENTRYPOINT ["python"]
