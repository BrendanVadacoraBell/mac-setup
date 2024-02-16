# BVB Mac Setup

Setting up a new development environment is always a tedious task, minor tools can be missed if done
manually, and consumes time that can be used doing other things. A personal development environment
is also extremely important to enable one's greatest productivity. An automated setup of a new
development environment can take out the manual and tedious process whilst ensuring the ideal
environment is setup for the best productivity.

This project will configure and automate the setup of my development environment for any macOS
machine I use.

## How

[Ansible](https://www.ansible.com/). There are many resources for setting up a mac or linux OS with
the necessary tools an developer needs to be productive. The main sources that inspire this
pariticular setup are:

- [geerlingguy's mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook/tree/master)
- [TalkingQuickly's ansible-osx-setup](https://github.com/TalkingQuickly/ansible-osx-setup)

### Running

There is a helper script that will coordinate the various facets of setting up a mac, e.g.
command line tools, pip, ansible.

The script assumes the environment is ready to run ansible:

```
./bin/boostrap.sh
```

If other things need to be installed, there are options that can be combined for a full install: e.g
The following will install command-line-tools, pip, and ansible before running the ansible playbook.

```
./bin/boostrap.sh -c -p -a # -cpa
```

## Changelog

### 2024-02-16
- Add fish dotfile step to load existing configuration into a new installation of fish.
- Add kitty dotfile step to load existing configuration into a new installation of kitty.
- Fix fish default shell path to prevent kitty from not fully loading fish on startup.
