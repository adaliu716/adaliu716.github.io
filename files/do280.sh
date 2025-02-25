#!/bin/bash
mkdir /tmp/pgy
cd /tmp/pgy
wget https://pgy.oray.com/softwares/153/download/2549/PgyVisitor-6.9.0-amd64.rpm
dnf localinstall PgyVisitor-6.9.0-amd64.rpm -y
firewall-cmd --zone=public --add-forward-port=port=443:proto=tcp:toaddr=192.168.50.254:toport=443 --per
firewall-cmd --zone=public --add-forward-port=port=80:proto=tcp:toaddr=192.168.50.254:toport=80 --per
firewall-cmd --zone=public --add-forward-port=port=8443:proto=tcp:toaddr=192.168.50.50:toport=8443 --per
firewall-cmd --zone=public --add-masquerade --per
firewall-cmd --reload

read -p 'Please input your pgy uid: ' uid
read -p 'Please input your pgy login password: ' password

pgyvisitor login -u $uid -p $password

pgyvisitor autologin set -y

cd /
rm -rf /tmp/pgy

