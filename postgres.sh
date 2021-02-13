#!/bin/bash
yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
dnf -qy module disable postgresql
dnf -y install postgresql12 postgresql12-server postgresql12-contrib
/usr/pgsql-12/bin/postgresql-12-setup initdb
systemctl enable --now postgresql-12
yum -y install firewalld
firewall-cmd --permanent --add-port=5432/tcp
firewall-cmd --reload