#!/bin/sh

ssh root@18.197.33.139 <<EOF
  cd project1
  git pull
  source /opt/envs/project1/bin/activate
  pip install -r requirements.txt
  #./manage.py migrate
  sudo supervisorctl restart djtrump
  exit
EOF
