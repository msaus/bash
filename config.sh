db_user=root
db_password=root
database=measure

# max process
max_proc=1

# �o�̓f�[�^�t�@�C���ݒ�
outfile=${base_dir}/keyword_tmp/OUTFILE.txt

# �Ǎ��f�[�^�ݒ�
file_dir=${base_dir}/keyword_tmp

# ���O�ݒ�
log_dir=/var/vhosts/yahoo/fuel/app/logs/`date +%Y`/`date +%m`/`date +%d`.php
mkdir /var/vhosts/yahoo/fuel/app/logs/`date +%Y`/`date +%m`/  2>/dev/null
touch /var/vhosts/yahoo/fuel/app/logs/`date +%Y`/`date +%m`/`date +%d`.php  2>/dev/null
chmod 666 /var/vhosts/yahoo/fuel/app/logs/`date +%Y`/`date +%m`/`date +%d`.php 2>/dev/null