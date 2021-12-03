# Ansible Control
This is a generic build for a RHEL-/Oracle Linux-derived Ansible control node.

`secrets.yml` and the SSH key in the SSH role must be encrypted with Ansible
Vault. **Do not commit these files to version control unencrypted!** If you
think you are liable to forget this point, exclude them with `.gitignore`.

Features of this build include:

- Security hardening from the DevSec project
- Enhanced tab completion courtesy of `fzf`
- The excellent `micro` text editor
- A better Linux console experience thanks to `tmux`

I recommend learning to use `fzf` and `tmux`. If you're familiar with Windows
shortcut keys, you already know how to use `micro`. Why suffer any longer with
vi/emacs/nano?!

## Usage

### Target system

Edit the `inventory` file, to specify the address of the target system (which
could be the same machine on which you run this playbook).

### Fstab

The fstab role facilitates mounting a Windows share to the Ansible control node.
This makes it possible to edit playbooks using a Windows machine (with Visual
Studio Code, for example), while running the playbook using Linux - either a
separate Linux machine, or the Windows Subsystem for Linux. Amend
`windows_share` to suit, in the `config.yml` file.

This Windows share containing the playbooks should be writable by the control
node. Having shared the folder from the Windows machine, place the Windows user
credentials in `secrets.yml` and encrypt that file with Ansible Vault (see
below).

### SSH

Replace the text in `roles\ssh\file\ansible.privkey` with your SSH private key.
Then encrypt that file with Ansible Vault (see below). Once the playbook has
run, the `users` role removes password based access for the playbook user. So
test SSH before logging out!

## Ansible Vault

Store your Ansible Vault password in a (protected) file at, e.g.,
`~/vault-password`. This is obviously outside the playbook. Do not commit your
Vault password!

Encrypt sensitive files with, e.g.:

    ansible-vault encrypt --vault-id ~/vault-password [secrets.yml]

And to decrypt:

    ansible-vault decrypt --vault-id ~/vault-password [secrets.yml]

Remember not to leave files unecrypted. Make changes and re-encrypt immediately.

## Requirements
This playbook makes use of external roles. Install these by running the
following commands on another Ansible control node or this node itself:
   
    ansible-galaxy collection install -r requirements.yml

## Playbook runs
You will need the Ansible Vault decryption password available for playbook runs.

    ansible-playbook main.yml --vault-id [~/vault-password] [--tags tag1,tag2]

## Python version

The latest Ansible version deprecates Python < 3.8. But RHEL 8 only provides
full support for Python 3.6. Installing a later version of Python from the
repos reduces the quantity of Python packages available (e.g. libselinux).
Hence the decision to stick with Python 3.6 and tolerate the deprecation
warnings until RHEL-based OSes receive a Python version bump.