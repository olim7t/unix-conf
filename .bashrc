# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

SCM_BREEZE=$HOME/externals/scm_breeze/scm_breeze.sh
[ -s "$SCM_BREEZE" ] && source "$SCM_BREEZE"

# For stuff I don't want to commit to GitHub
BASHRC_IGNORED=$HOME/.bashrc_ignored
[ -s "$BASHRC_IGNORED" ] && source "$BASHRC_IGNORED"
