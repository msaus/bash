#!/bin/sh                                                                                                                                                     

# ���d�N���h�~
_CMD="$0 $@"
if [ "$$" -ne $(pgrep -fo "$_CMD") ]; then
  echo "INFO - "`date +%Y-%m-%d` `date +%H:%M:%S` "���ɋN�����Ă��܂�" >> "$log_dir"
  exit 1
fi