#!/usr/bin/env bash

# shell 标准输入输出
# https://www.runoob.com/linux/linux-shell-echo.html

# 一、echo

# -n 使得echo不换行输出
echo -n "not new line "
echo "new echo output"
echo " -- new echo output2"

# -e 启动转义输出
echo "new \n line"
echo -e "new 2 \n line"
echo -e "new 2 \v line"

# 使用echo将数据输出到文件
echo "$(date)" > .data.txt
# 一个 > 表示 覆盖输出
# 两个 >> 表示 追加输出
echo "$(date)" >> .data2.txt
# 也可以直接使用：【"数据" >> 路径】的方式输出数据
date "+%Y-%m-%d %H:%M:%S" >> .data3.txt

echo "now $(date)"


#echo -n "实现进度条效果 Progress: ["
#for i in {1..20}; do
#    echo -n "#"
#    sleep 0.1
#done
#echo "] Done!"

# 二、printf
# https://www.runoob.com/linux/linux-shell-printf.html
# printf 命令的语法：
#   printf  format-string  [arguments...]
# printf 不会自动换行，要使用转义 \n
str="字符串"
num=123
printf "格式串：%s, 数字：%d \n" "$str" "$num"
# 一条语句处理多参数
printf "%-10s %5d %8.2f\n" "Apple" 5 2.5 "Orange" 3 1.75
printf "%-10s %5d %8.2f\n" "Apple" 5 2.5 "Orange" 3 1.75 "purse" 3 1.75

# 实现进度条
for i in {1..20}; do
    printf "\rProgress: [%-20s] %d%%" $(printf "%${i}s" | tr ' ' '#') $((i*5))
    sleep 0.1
done
printf "\n"



# 三、read -p
# read -p "提示信息" 变量名

# 参数说明：
  # -p 输入提示文字
  # -n 输入字符长度限制(达到6位，自动结束)
  # -t 输入限时
  # -s 隐藏输入内容
  # -r：防止转义（推荐习惯）
read  -p "请输入一段文字:" -n 6 -t 5 -s password
echo -e "\npassword is $password"

