#!/usr/bin/env bash

#
# https://www.runoob.com/linux/linux-shell-func.html


:<<EOF
shell函数格式

[ function ] funname [()] {

    action;

    [return int;]
}
EOF

#  👉 在 shell 里：
   #return 表示 退出状态码
   #取值范围：0 ~ 255
   #只能用于函数/脚本退出状态
#    return 1


function foo() {
  echo "脚本执行 1"
  printf "脚本执行 2"
  # 使用日志输出，这样输出值就不会被 $(foo) 捕获
  echo "使用日志输出 1"  >&2
  printf "使用日志输出 2"  >&2
  echo 123
}

# $(foo) 会捕获函数里的 所有标准输出（stdout）
# 使用 echo 和直接 printf 的输出会被$() 捕获，
# 因此如果某个函数内部要输出信息，与此同时又不希望被调用者捕获的话 就要在后面使用 >&2
res=$(foo)
echo "返回值：${res}"
# 只取函数的最后一个echo输出
#res=$(foo | tail -n1)


function foo() {
    echo 'foo function'
}

# 注意，如果某个函数要接收参数，那么参数也不是写在函数定义的括号内部
# 而是在函数内部使用 $序号 来接收
function bar() {
    a=$1
    b=$2
    c=$3
    echo "参数 a: ${a}"
    echo "参数 b: ${b}"
    echo "参数 c: ${c}"
}

echo 'foo enter'
# 注意 shell 的函数调用不要使用括号，要传参数的话直接空格后面添加
foo
bar 123 "zxc" true
echo 'foo leave'


# 获取函数的返回值, 使用echo返回
function add() {
    a=$1
    b=$2
    echo $(($a+$b))
}
# 使用echo返回, 要使用 $() 形式获取返回值
res=$(add 1 2)
echo "add函数返回的结果：$res"


# 获取函数的返回值, 使用 return 返回
function add2() {
    a=$1
    b=$2
    # 注意⚠️：return只能返回0-255之间的整数，这个add2只是一个示例，要想实现add效果必须使用echo来返回
    # 而return作为返回值的效果一般是为什么返回函数的状态，如如成功失败等的标志
    return $(($a+$b))
}
# 使用 return 返回，要使用$?获取最近一个函数的return返回值
add2 1 2
echo "add2函数返回的结果：$?"

# 注意⚠️：$? 仅对其上一条指令负责，一旦函数返回后其返回值没有立即保存入参数，那么其返回值将不再能通过 $? 获得。因此要就近获取




