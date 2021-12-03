# The .bash_profile is sourced during interactive login - not during automated login

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH

# Load .bashrc (it isn't sourced when logging in through SSH)
[ -f ~/.bashrc ] && source ~/.bashrc