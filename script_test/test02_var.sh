#!/usr/bin/env bash

# https://www.runoob.com/linux/linux-shell-variable.html

# local 标识符只能在韩素中使用
#'local' is only valid in functions.
#local foo="bar"
#变量名和等号之间不能有空格
foo="bar"
#Remove spaces around = to assign (or use [ ] to compare, or quote '=' if literal).
#foo = "bar"


echo "$(ls)"
echo 1+1


your_name="tom"
echo $your_name
# 要给变量赋值(写)的时候不要加 $ ,使用（读取）变量的时候才要加 $
your_name="alibaba"
echo $your_name


# 声明只读变量
url="/health"
echo $url
url="/status"
echo $url
readonly url
# ./test02_var.sh: 行 35: url: 只读变量
url="/aaa"
echo $url

# 变量被删除后不能再次使用。unset 命令不能删除只读变量。
unset your_name
echo $your_name
#./test02_var.sh: 第 42 行：unset: url: 无法取消设定：只读variable
unset url
echo $url


str="qwertyuiuyt"
num=111
arr=(1 2 3 4 5 6)
# 关联数组
declare -A associative_array
associative_array["name"]="John"
associative_array["age"]=30
echo $str
echo $num
echo $arr
echo $associative_array

# 读取系统的环境变量
echo $PATH

# 特殊变量： 有一些特殊变量在 Shell 中具有特殊含义，例如 $0 表示脚本的名称，$1, $2, 等表示脚本的参数。
#         $#表示传递给脚本的参数数量，$? 表示上一个命令的退出状态等。
# ./test02_var.sh aaa bbb ccc
# ./test02_var.sh - aaa - bbb - 3 - 0
echo $0 - $1 - $2 - $# - $?



# 单引号''不能引用变量，双引号""才能引用变量
echo 'shell1 ${foo}'
echo "shell2 $foo - $fooaaa - ${foo}aaa "
echo ${foo}


your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1

# 使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2  $greeting_3

# 获取字符串长度
echo "${your_name} 的长度为：${#your_name}，${#your_name[0]}"

# 字符串查找
tmp="${your_name%%[no]*}"
echo $(( ${#tmp} + 1 ))

# 获取子串, 第一个字符的索引为0
echo ${your_name:1:3}

#shell数组
#数组定义：数组名=(值1 值2 ... 值n)
array_name=(value0 value1 value2 value3)
echo ${array_name[0]}
array_name[0]=value666
echo ${array_name[0]}
array_name[4]=value123

#使用 @ 符号可以获取数组中的所有元素，例如：
#Double quote array expansions to avoid re-splitting elements.
echo ${array_name[@]}
#获取数组长度，使用@或*
echo ${#array_name[@]}
echo ${#array_name[*]}
echo ${#array_name[0]} # 单个元素的长度

:<<EOF
多
行
注
释
1
EOF

#Useless echo? Instead of 'echo $(cmd)', just use 'cmd'
echo "$(expr 5 + 6)"

