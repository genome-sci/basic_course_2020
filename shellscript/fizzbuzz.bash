#!/bin/bash

n=$(seq 10)

for i in $n;do

  if [ $(($i%3)) -eq 0 ];then
    echo "fizz"

  else
    echo $i

  fi
done
