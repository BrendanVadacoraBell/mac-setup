#!/bin/bash


# Python is not on the PATH by default
export PATH=$PATH:~/Library/Python/3.11/bin

# Setup commandline tools since we need that to do most things on mac terminal
function installCommandLineTools {
    printf "\n Installing command-line-tools 🔨\n"
    xcode-select --install
    sudo xcodebuild -license
}

function installPip {
    printf "\n Installing pip 🐍 \n"

    # Follow ansible guide https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py --user
}

function installAnsible {
    printf "\n Installing ansible 🎩 \n"

    python3 -m pip install --user ansible
    printf "$(ansible --version)"
}

function runPlaybook {
    printf "\n Setting up mac 🚧 \n"
    ansible-galaxy collection install -r requirements.yml
    ansible-playbook -i "localhost" -c local main.yml --ask-become-pass
    printf "\n A shiny new mac is ready to use ✅"
}

function help {
    printf "This is the mac setup automation for Brendan Vadacora Bell's mac dev environment."
    printf "This tool primarily runs the installation of UI applications, App store applications, cli tools and development environment."
    printf "The above steps also require some standard setup of command line tools on macOS and the python package manager, pip."
    printf "Options:"
    printf "h     Print this help manual"
    printf "c     Install command-line-tools"
    printf "p     Install Pip, the python package manager"
    printf "a     Install Ansible, the automation tool running the main steps"
    printf "      By default, this script will run the ansible playbook."
    printf "      Options can be combined to install multiple facets, but must be used in the 'cpa' order to be effective."
}

while getopts ":hcpa" option; do
   case $option in
       h)
           help
           exit;;
       c)
           installCommandLineTools
           ;;
       p)
           installPip
           ;;
       a)
           installAnsible
           ;;
   esac
done

runPlaybook

