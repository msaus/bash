db_user=root
db_password=root
database=measure

# max process
max_proc=1

# 出力データファイル設定
outfile=${base_dir}/keyword_tmp/OUTFILE.txt

# 読込データ設定
file_dir=${base_dir}/keyword_tmp

# ログ設定
log_dir=/var/vhosts/yahoo/fuel/app/logs/`date +%Y`/`date +%m`/`date +%d`.php
mkdir /var/vhosts/yahoo/fuel/app/logs/`date +%Y`/`date +%m`/  2>/dev/null
touch /var/vhosts/yahoo/fuel/app/logs/`date +%Y`/`date +%m`/`date +%d`.php  2>/dev/null
chmod 666 /var/vhosts/yahoo/fuel/app/logs/`date +%Y`/`date +%m`/`date +%d`.php 2>/dev/null