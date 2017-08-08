#!/bin/sh                                                                                                                                                     

# ‘½d‹N“®–hŽ~
_CMD="$0 $@"
if [ "$$" -ne $(pgrep -fo "$_CMD") ]; then
  echo "INFO - "`date +%Y-%m-%d` `date +%H:%M:%S` "Šù‚É‹N“®‚µ‚Ä‚¢‚Ü‚·" >> "$log_dir"
  exit 1
fi