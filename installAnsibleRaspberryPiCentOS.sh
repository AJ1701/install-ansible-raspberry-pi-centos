#!/bin/bash
echo "This install may take a while! Sit tight!"
yum -y install which python python-devel python-setuptools git make wget gcc libffi libffi-devel openssl openssl-devel cloud-utils-growpart
easy_install pip
pip install --upgrade pip setuptools
pip install cryptography paramiko jinja2 httplib2 six pyyaml a2x ansible 
echo 'Done!'
