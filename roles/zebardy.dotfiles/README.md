<img src="https://raw.githubusercontent.com/geerlingguy/mac-dev-playbook/master/files/Mac-Dev-Playbook-Logo.png" width="250" height="156" alt="Mac Dev Playbook Logo" />

# Base Linux/OSX terminal/dot files Ansible Playbook

[![CI][badge-gh-actions]][link-gh-actions]

This playbook sets up terminal tools (zsh, oh my zsh powerline10k etc), base dotfiles and configurations.

## Installation

### OSX

  1. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).
  2. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

     1. Run the following command to add Python 3 to your $PATH: `export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"`
     2. Upgrade Pip: `sudo pip3 install --upgrade pip`
     3. Install Ansible: `pip3 install ansible`

  3. Clone or download this repository to your local drive.
  4. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
  5. Run `ansible-playbook main.yml --ask-become-pass` inside this directory. Enter your macOS account password when prompted for the 'BECOME' password.

### Linux (ubuntu)

1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

  1. Upgrade Pip: `sudo pip3 install --upgrade pip`
  2. Install Ansible: `pip3 install ansible`

2. Clone or download this repository to your local drive.
3. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles
4. Run `ansible-playbook main.yml --ask-become-pass` inside this directory. Enter your user account password when prompted for the 'BECOME' password.

### Android (termux)

1. pkg install git python-pip rust binutils

2. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

  1. Upgrade Pip: `sudo pip3 install --upgrade pip`
  2. Install Ansible: `pip3 install ansible`

3. Clone or download this repository to your local drive.
4. Run `ANSIBLE_REMOTE_TMP=/data/data/com.termux/files/usr/tmp ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles
5. Run `ANSIBLE_REMOTE_TMP=/data/data/com.termux/files/usr/tmp ansible-playbook main.yml` inside this directory.

### Running a specific set of tagged tasks

You can filter which part of the provisioning process to run by specifying a set of tags using `ansible-playbook`'s `--tags` flag. The tags available are 
- `terminal`
- `osx`

    ansible-playbook main.yml -K --tags "dotfiles,osx"

## Testing the Playbook

You can test on macOS itself inside a VM, for at least some of the required testing (App Store apps and some proprietary software might not install properly). I currently recommend:

  - [UTM](https://mac.getutm.app)
  - [Tart](https://github.com/cirruslabs/tart)

## Author

This project was created by Aaron Moses. Based on the mac setup project of [Jeff Geerling](https://www.jeffgeerling.com/) (originally inspired by [MWGriffin/ansible-playbooks](https://github.com/MWGriffin/ansible-playbooks)).
