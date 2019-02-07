#!/bin/sh

ssh -o StrictHostKeyChecking=no ec2-user@54.93.67.232 <<EOF
  cd project1
  git pull
  source /opt/envs/project1/bin/activate
  pip install -r requirements.txt
  #./manage.py migrate
  sudo supervisorctl restart project1
  exit
EOF
