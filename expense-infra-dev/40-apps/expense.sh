#!/bin/bash

dnf install ansible -y

cd /tmp

git clone https://github.com/Amarnadh31/expense-ansible-roles.git

cd expense-ansible-roles

ansible-playbook mysql.yaml

ansible-playbook backend.yaml

ansible-playbook frontend.yaml