#!/bin/bash

# Setup commandline tools since we need that to do most things on mac terminal
xcode-select --install
sudo xcodebuild -license

# Python is not on the PATH by default
export PATH=$PATH:~/Library/Python/3.11/bin

# Follow ansible guide https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

python3 -m pip install --user ansible
echo "$(ansible --version)"

ansible-galaxy collection install -r requirements.yml
ansible-playbook -i "localhost" -c local main.yml --ask-become-pass

