#!/usr/bin/env bash

# shell 运算符
# https://www.runoob.com/linux/linux-shell-basic-operators.html


# expr is antiquated. Consider rewriting this using $((..)), ${} or [[ ]].
echo " : `expr 1 + 2`"
echo " : $((1 + 2))"

a=1
b=2
if [ $a -lt $b ]; then
  echo "a小"
else
  echo "b小"
fi



#!/bin/bash
# author:菜鸟教程
# url:www.runoob.com

a=10
b=20

if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a == $b: a 等于 b"
fi

# 布尔运算符
# 与 -a, -and
# 或 -o, -or
# 非 !


if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a 小于 5 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 5 或 $b 大于 100 : 返回 false"
fi

# 逻辑运算符
# &&	逻辑的 AND	[[ $a -lt 100 && $b -gt 100 ]] 返回 false
# ||	逻辑的 OR	[[ $a -lt 100 || $b -gt 100 ]] 返回 true


a=10
b=20

if [[ $a -lt 100 && $b -gt 100 ]]
#if [ $a -lt 100 -a $b -gt 100 ]
then
   echo "返回 true"
else
   echo "返回 false"
fi


#字符串运算符
#  =	检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
#  !=	检测两个字符串是否不相等，不相等返回 true。	[ $a != $b ] 返回 true。
#  -z	检测字符串长度是否为0，为0返回 true。	[ -z $a ] 返回 false。
#  -n	检测字符串长度是否不为 0，不为 0 返回 true。	[ -n "$a" ] 返回 true。
#  $	检测字符串是否不为空，不为空返回 true。	[ $a ] 返回 true。

s1="str"
s2="str"
s3="sss"
if [ $s1 = $s2 ]; then
    echo "$s1 == $s2"
fi

if [ $s1 != $s3 ]; then
    echo " $s1 != $s3 "
fi

ss=""
if [ -z $ss ]; then
    echo "$ss 的字符串长度为0"
fi
ss2="ss222"
if [ ! -z $ss2 ]; then
    echo "! -z : $ss2 的字符串长度不为0"
fi
if [[ -n $ss2 ]]; then
    echo " -n : $ss2 的字符串长度不为0"
fi

if [ $ss2 ]; then
    echo " $ss2 字符串不为空"
fi
if [ $ss ]; then
    echo " $ss 字符串不为空"
else
    echo " ss:[$ss] 字符串为空"
fi


# 实现变量的自增或自减
# 方法1:使用let语句, Instead of 'let expr', prefer (( expr )) .
num1=11
echo "num1: ${num1}"
let num1++
echo "num1: ${num1}"
let num1--
let num1--
echo "num1: ${num1}"

# 方法2:使用(())
num2=11
echo "num2: ${num2}"
((num2++))
echo "num2: ${num2}"
((num2--))
((num2--))
echo "num2: ${num2}"
num2=$((num2 - 1))
echo "num2: ${num2}"



:<<EOF
[] 表达式
注意：在 [] 表达式中，常见的 >, < 需要加转义字符，表示字符串大小比较，以 acill 码位置作为比较。不直接支持 >, < 运算符，还有逻辑运算符 || 、&& ，它需要用 -a[and] –o[or] 表示。

[[ ]] 表达式
注意：[[]] 运算符只是 [] 运算符的扩充。能够支持 >, < 符号运算不需要转义符，它还是以字符串比较大小。里面支持逻辑运算符：|| && ，不再使用 -a -o。
EOF