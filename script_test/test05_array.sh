#!/usr/bin/env bash

# 数组
# https://www.runoob.com/linux/linux-shell-array.html

arr=(v1 v2 v3 123 v5)

# 读取数组元素
#${array_name[index]}
echo ${arr[0]}
echo ${arr[3]}
arr[3]=666
echo ${arr[3]}
echo ${#arr[0]} # 获取单个元素的长度
echo ${#arr[@]}
echo ${#arr[*]}



# 声明关联数组
#declare -A site
declare -A site=(["google"]="www.google.com" ["runoob"]="www.runoob.com" ["taobao"]="www.taobao.com")
echo ${site["google"]}
echo ${site["runoob"]}
site["baidu"]="www.baidu.com"
site["jd"]="www.jd.com"
echo ${site["baidu"]}
echo "获取数组中的所有元素： ${site[@]}"
echo "获取数组中的所有元素： ${site[*]}"
echo "获取数组中的所有key： ${!site[*]}"
echo "数组长度： ${#site[*]}"
echo "数组长度： ${#site[@]}"

# 将某个变量写入数组
name="zhangsan"
#${name} 的值 "zhangsan" 被 展开，直接存进数组
var_arr=(1 ${name} 3)
echo "数组变量：${var_arr[1]}"
name="lisi"
echo "数组变量：${var_arr[1]}"


# 数组的遍历
arr1=(v1 v2 v3 v4 v5 v6)

# 1️⃣ 使用 for in 遍历
for value in "${arr1[@]}"; do
  echo "1️⃣ 使用 for in 遍历：${value}"
done

# 2️⃣ 使用索引遍历
for i in "${!arr1[@]}"; do
  echo "2️⃣ 使用索引遍历: ${arr1[i]}"
done

#3️⃣ 使用 while 循环 + 下标
i=0
while [ $i -lt ${#arr1[@]} ]; do
    echo "使用 while 循环 + 下标：${arr1[i]}"
    ((i++))
done


iqq=0
echo $((iqq++))  # 输出 0，iqq 变成 1
echo $((++iqq))  # iqq 先变成 2，输出 2