#!/bin/bash
if [ "$EUID" -ne 0 ]
then
echo "Please run as root with \"sudo $0\""
exit
fi

echo "This install may take a while! Sit tight!"
yum -y install which python python-devel python-setuptools git make wget gcc libffi libffi-devel openssl openssl-devel cloud-utils-growpart
easy_install pip
pip install --upgrade pip setuptools
pip install cryptography paramiko jinja2 httplib2 six pyyaml a2x ansible
#Copy over and set permissions for ansible.cfg, since ansible.cfg isn't installed with the python install.
mkdir /etc/ansible/
chmod 755 /etc/ansible/
chown root:root /etc/ansible/
cp ./files/ansible.cfg /etc/ansible/ansible.cfg
chown root:root /etc/ansible/ansible.cfg
chmod 644 /etc/ansible/ansible.cfg
#Create and set permissions for ansible.cfg, since ansible.sh. This is to set the environment variable for ANSIBLE_CONFIG
#so we have it set for all users and don't have to define it on login everytime.
cp ./files/ansible.sh /etc/profile.d/ansible.sh
chown root:root /etc/profile.d/ansible.sh
chmod 644 /etc/profile.d/ansible.sh
echo 'Done!'
