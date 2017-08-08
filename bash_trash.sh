#!/bin/bash                                                                                                                                                   
trap "HUP;  exit 1" 1
trap "INT;  exit 1" 2
trap "QUIT; exit 1" 3
trap "TERM; exit 1" 15
trap "KILL; exit 1" 9
trap "STOP; exit 1" 19

function HUP {
  echo "制御している端末／プロセスがハングアップしました" >> "$log_dir"
  exit 1
}

function INT {
  echo "キーボードからの割り込み命令（［Ctrl］＋［C］キー）がだされました" >> "$log_dir"
  exit 1
}

function QUIT {
  echo "  キーボードからの中止命令（［Ctrl］＋［\］キー）がだされました" >> "$log_dir"
  exit 1
}

function TERM {
  echo "プロセスの終了命令（デフォルト）が出されました" >> "$log_dir"
  exit 1
}

function KILL {
  echo "プロセスがKILLされました" >> "$log_dir"
  exit 1
}

function STOP {
  echo "プロセスの停止命令（［Ctrl］＋［Z］キー）が出されました" >> "$log_dir"
  exit 1
}                                                                                                                                                             
                                                                                                                                                              
on_exit(){                                                                                                                                                    
  # 正常終了時は何もログに出力しない                                                                                                                          
  if [ $? -ne 0 ]; then                                                                                                                                       
    echo "Kill child processes on exit by 'pkill -P $$'" >> "$log_dir"                                                                                        
    pkill -P $$                                                                                                                                               
  fi                                                                                                                                                          
}                                                                                                                                                             
                                                                                                                                                              
on_error() {                                                                                                                                                  
    errcode=$?                                                                                                                                                
    echo "error line $1: command exited with status $errcode." >> "$log_dir"                                                                                  
}                                                                                                                                                             
                                                                                                                                                              
# bash pseudo-signals                                                                                                                                         
trap 'on_exit' EXIT                                                                                                                                           
trap 'on_error $LINENO' ERR