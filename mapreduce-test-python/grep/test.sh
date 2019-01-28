#!/bin/sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /grep/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /grep/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /grep/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /hdfs-test/mapreduce-test-data/test.txt /grep/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file /hdfs-test/mapreduce-test-python/grep/mapper.py -mapper "/hdfs-test/mapreduce-test-python/grep/mapper.py world" \
-file /hdfs-test/mapreduce-test-python/grep/reducer.py -reducer /hdfs-test/mapreduce-test-python/grep/reducer.py \
-input /grep/input/* -output /grep/output/
/usr/local/hadoop/bin/hdfs dfs -cat /grep/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /grep/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /grep/output/
