#!/bin/sh

ssh ec2-user@52.59.204.113 <<EOF
  cd project1
  git pull
  source /opt/envs/project1/bin/activate
  pip install -r requirements.txt
  #./manage.py migrate
  sudo supervisorctl restart project1
  exit
EOF
