#!/bin/sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /hdfs-test/mapreduce-test-data/access.log /logstat2/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file /hdfs-test/mapreduce-test-python/logstat2/mapper.py -mapper /hdfs-test/mapreduce-test-python/logstat2/mapper.py \
-file /hdfs-test/mapreduce-test-python/logstat2/reducer.py -reducer /hdfs-test/mapreduce-test-python/logstat2/reducer.py \
-input /logstat2/input/* -output /logstat2/output/
/usr/local/hadoop/bin/hdfs dfs -cat /logstat2/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/
