#!/bin/sh

ssh root@142.93.116.229 <<EOF
  cd project1
  git pull
  source /opt/envs/project1/bin/activate
  pip install -r requirements.txt
  #./manage.py migrate
  sudo supervisorctl restart project1
  exit
EOF
