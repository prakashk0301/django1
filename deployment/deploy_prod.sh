#!/bin/bash

ssh root@142.93.116.229 <<EOF
  apt-get update -y
  #yum install update -y
  # for python 3.7 https://tecadmin.net/install-python-3-7-on-ubuntu-linuxmint/
  git pull
  #git pull <url>
  #cd <project name>
  cd django1
  source /opt/envs/django1/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
  #./manage.py migrate
  sudo service apache2 restart
  #sudo service httpd restart
  #sudo service nginx restart
  exit
EOF
