# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH
export AWS_VAULT_BACKEND="pass"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Better character encoding and line drawing for PuTTY sessions
if [ "$TERM" = "putty" ]; then
  export LC_ALL=C
else
  export LC_ALL=en_US.utf8
fi
export TERM=xterm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
