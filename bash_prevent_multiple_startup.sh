#!/bin/sh                                                                                                                                                     

# 引数が無ければメッセージを出力し終了
if [ "$1" = "" ]; then
  echo "no argument"
  exit 1
fi

# 多重起動防止
_CMD="$0 $@"
if [ "$$" -ne $(pgrep -fo "$_CMD") ]; then
  echo "INFO - "`date +%Y-%m-%d` `date +%H:%M:%S` "既に起動しています" >> "$log_dir"
  exit 1
fi