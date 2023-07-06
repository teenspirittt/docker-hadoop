# Project: docker-hadoop with Spark

This project provides a Docker-based environment for running Hadoop with Spark. It allows you to set up a Hadoop cluster along with Spark instances for distributed data processing.

The project consists of the following components:

- `conf`: Contains configuration files for Hadoop.
- `datanode`: Docker container for the Hadoop DataNode.
- `namenode`: Docker container for the Hadoop NameNode.
- `docker-compose.yml`: Docker Compose file for defining and running the containers.

## Usage

To set up the Hadoop cluster with Spark, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project's root directory (`docker-hadoop`).
3. Customize the Hadoop configuration files (`core-site.xml` and `hdfs-site.xml`) in the `conf` directory if needed.
5. Run the following command to start the containers:

```
docker-compose up -d
```

This command will build and run the Hadoop NameNode and DataNode containers, along with Spark instances for master and workers.

You can access the following web interfaces:
```
Hadoop NameNode: http://localhost:9870
Hadoop DataNode: http://localhost:9864
Spark Master: http://localhost:8090
```

## Notes

* The project utilizes the official Apache Spark Docker image (apache/spark) and the BDE 2020 Spark images (bde2020/spark-master and bde2020/spark-worker) for running Spark.

* The conf/spark directory is mounted into the Spark container to provide custom Spark configuration.

* The containers are connected to a custom network (hadoop-net) to enable communication between them.