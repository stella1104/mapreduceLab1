#!/bin/sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /hdfs-test/mapreduce-test-data/access.log /logstat/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file /hdfs-test/mapreduce-test-python/logstat/mapper.py -mapper /hdfs-test/mapreduce-test-python/logstat/mapper.py \
-file /hdfs-test/mapreduce-test-python/logstat/reducer.py -reducer /hdfs-test/mapreduce-test-python/logstat/reducer.py \
-input /logstat/input/* -output /logstat/output/
/usr/local/hadoop/bin/hdfs dfs -cat /logstat/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat/output/
