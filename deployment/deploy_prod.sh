#!/bin/bash

ssh root@54.93.39.57 <<EOF
  yum update -y
  git pull
  cd project1
  source /opt/envs/project1/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
  #./manage.py migrate
  sudo service httpd restart 
  exit
EOF
