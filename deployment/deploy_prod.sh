#!/bin/sh

ssh -o StrictHostKeyChecking=no -T ec2-user@3.120.141.30 <<EOF
  cd project1
  git pull
  source /opt/envs/project1/bin/activate
  pip install -r requirements.txt
  #./manage.py migrate
  sudo supervisorctl restart project1
  exit
EOF
