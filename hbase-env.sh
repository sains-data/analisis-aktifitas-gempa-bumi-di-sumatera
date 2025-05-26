#!/bin/bash
# HBase Environment Configuration

# Set HBase home
export HBASE_HOME="/hbase"
export HBASE_CONF_DIR="$HBASE_HOME/conf"
export HBASE_LOG_DIR="$HBASE_HOME/logs"

# Java Configuration
export JAVA_HOME="/usr/lib/jvm/java-1.8.0"

# Memory Settings
export HBASE_MASTER_OPTS="-Xms4g -Xmx8g -XX:MaxDirectMemorySize=2g"
export HBASE_REGIONSERVER_OPTS="-Xms8g -Xmx16g -XX:MaxDirectMemorySize=4g"
export HBASE_ZOOKEEPER_OPTS="-Xms1g -Xmx2g"

# Off-Heap Memory (Critical for read performance)
export HBASE_OFFHEAPSIZE=2g

# Hadoop Integration
export HADOOP_HOME="/hadoop"
export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"

# Performance Tuning
export HBASE_OPTS="$HBASE_OPTS -XX:+UseG1GC -XX:MaxGCPauseMillis=100"
export HBASE_OPTS="$HBASE_OPTS -XX:+ParallelRefProcEnabled"
export HBASE_OPTS="$HBASE_OPTS -XX:ReservedCodeCacheSize=256m"

# Native Library Support
export HBASE_LIBRARY_PATH="$HADOOP_HOME/lib/native"

# ZooKeeper Configuration
export HBASE_MANAGES_ZK=true  # Set to false if using external ZK
export ZOOKEEPER_HOME="/zookeeper"

# SSH Configuration (for distributed mode)
export HBASE_SSH_OPTS="-o StrictHostKeyChecking=no"

# RegionServer Crash Protection
export HBASE_REGIONSERVER_RECOVERING="true"