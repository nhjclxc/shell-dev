#!/usr/bin/env bash

# Shell test 命令
# https://www.runoob.com/linux/linux-shell-test.html

# test 命令是 Shell 内置的条件判断工具，用于评估表达式并返回布尔值（真/假），它通常与 if 语句结合使用，是 Shell 脚本中实现逻辑控制的基础。
#   Shell 中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

# 语法格式：test EXPRESSION 或 [ EXPRESSION ]  # 注意方括号内必须有空格


echo test 1 -lt 2
echo test [1 -lt 2]


declare -A user_map
user_map=(["zhangsan"]="pwd123" ["lisi"]="lisi123" ["ww"]="ww111" )
read -p "input username: " username
if [ -z $username ]; then
    echo "用户名不能为空！"
    exit 1
fi
printf "输入的用户名是：%s \n" "$username"

user_password=${user_map[${username}]}
if [ -z $user_password ]; then
    printf "用户: %s 不存在，无法登录 \n" "${username}"
    exit 1
fi

# 输出的密码最长是16位，并且隐藏输入的内容
read -p "input password" -n 16 -s password
if [ -z $password ]; then
    echo "输入的密码为空！"
    exit 1
fi
printf "\n输入的密码是：%s \n" "$password"
if [[ "$user_password" != "$password" ]]; then
    printf "用户：%s，输入的密码：%s 不正确 \n" "${username}" "${password}"
    exit 1
fi

echo "登录成功"








