#!/bin/sh

ssh root@18.194.22.139
  cd project1
  git pull
  source /opt/envs/project1/bin/activate
  pip install -r requirements.txt
  yum install -y update
  yum install -y httpd
  service httpd start 
  service httpd enable
  #./manage.py migrate
  sudo supervisorctl restart djtrump
 
