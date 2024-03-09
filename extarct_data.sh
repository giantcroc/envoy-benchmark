#!/bin/bash
set -e

indexs=(1 2 3)
payload_sizes=(1 4 16 64 256 1024)

for i in ${payload_sizes[*]};
do
 sum=0.0
 latency=0.0
 for j in ${indexs[*]};
 do
  sum=$(echo "$sum+`tail -1 ./$1/results${j}/$2/fortio_result${i}k.result|awk '{print $11+0.0}'`"|bc -l)
  latency=$(echo "$latency+`cat ./$1/results${j}/$2/fortio_result${i}k.result|grep "# target 99%"| awk '{print $4+0.0}'`"|bc -l)
 done
 sum=$(echo "$sum/3.0"|bc -l)
 latency=$(echo "$latency/3.0"|bc -l)
 echo "${i}k $sum $latency"
done

