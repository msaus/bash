#!/bin/bash                                                                                                                                                   
trap "HUP;  exit 1" 1
trap "INT;  exit 1" 2
trap "QUIT; exit 1" 3
trap "TERM; exit 1" 15
trap "KILL; exit 1" 9
trap "STOP; exit 1" 19

function HUP {
  echo "���䂵�Ă���[���^�v���Z�X���n���O�A�b�v���܂���" >> "$log_dir"
  exit 1
}

function INT {
  echo "�L�[�{�[�h����̊��荞�ݖ��߁i�mCtrl�n�{�mC�n�L�[�j��������܂���" >> "$log_dir"
  exit 1
}

function QUIT {
  echo "  �L�[�{�[�h����̒��~���߁i�mCtrl�n�{�m\�n�L�[�j��������܂���" >> "$log_dir"
  exit 1
}

function TERM {
  echo "�v���Z�X�̏I�����߁i�f�t�H���g�j���o����܂���" >> "$log_dir"
  exit 1
}

function KILL {
  echo "�v���Z�X��KILL����܂���" >> "$log_dir"
  exit 1
}

function STOP {
  echo "�v���Z�X�̒�~���߁i�mCtrl�n�{�mZ�n�L�[�j���o����܂���" >> "$log_dir"
  exit 1
}                                                                                                                                                             
                                                                                                                                                              
on_exit(){                                                                                                                                                    
  # ����I�����͉������O�ɏo�͂��Ȃ�                                                                                                                          
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