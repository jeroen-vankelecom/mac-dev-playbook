#!/bin/bash
# script to bootstrap setting up a mac with ansible 

echo "==================================================="
echo "Bootstrap your MacBook for final setup with Ansible"
echo "==================================================="

echo "*** installing pip and virtualenv"
sudo easy_install pip
sudo pip install virtualenv

echo "*** installing ansible in a virtualenv"
virtualenv venv
source venv/bin/activate
pip install ansible

echo "*** fetching all required ansible roles"
ansible-galaxy install -r requirements.yml

echo "*** getting the stuff done, hang on there!"
ansible-playbook main.yml -i inventory -K --tags "dotfiles,homebrew"

echo "*** and finally, let's pour some colour over it..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "*** and we are done! Enjoy!"

exit 0
