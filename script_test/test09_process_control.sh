#!/usr/bin/env bash

# Shell 流程控制
# https://www.runoob.com/linux/linux-shell-process-control.html


# if
a=10
b=20
if [[ "$a" -eq "$b" ]]; then
    printf "${a} 等于 ${b} \n"
elif [[ "$a" -lt "$b" ]]; then
    printf "${a} 小于 ${b} \n"
elif [[ "$a" -gt "$b" ]]; then
    printf "${a} 大于 ${b} \n"
else
  echo "没有符合的条件"
fi

# for
arr=(v1 v2 v3 v4 v5)
for value in "${arr[@]}" ; do
    echo "for遍历 ${value}"
done


# while
index=0
max=5
while [[ $index -lt $max ]]; do
  echo "while ${index}"
  ((index++))
done


# until, 直到条件为true时停止循环，条件为false时一直循环
index2=0
until [[ $index2 -gt 6 ]]; do
    echo "until 循环： ${index2}"
    ((index2++))
done


# case

# break
# continue