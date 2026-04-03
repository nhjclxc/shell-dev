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
res=$(foo)
echo "返回值：${res}"
# 只取函数的最后一个echo输出
#res=$(foo | tail -n1)
