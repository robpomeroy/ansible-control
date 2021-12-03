# The .bash_profile is sourced during interactive login - not during automated login

# Sets things up so Ansible SSH key is used automatically (e.g. for running playbooks)
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/ansible.privkey.openssh-no-passphrase

export AWS_VAULT_BACKEND=pass

# Load .bashrc (it isn't sourced when logging in through SSH)
[ -f ~/.bashrc ] && source ~/.bashrc