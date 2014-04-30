#!/bin/bash

# Decide wether to start gpg-agent daemon.
# Create necessary symbolic link in $HOME/.gnupg/S.gpg-agent
# (Source: http://www.linuxquestions.org/questions/linux-security-4/gpg-gpg-agent-can't-connect-to-root-gnupg-s-gpg-agent-611843/)

SOCKET=S.gpg-agent
PIDOF=`pidof gpg-agent`
RETVAL=$?

if [ "$RETVAL" -eq 1 ]; then
	echo "Starting gpg-agent daemon."
	eval `gpg-agent --daemon `
else
	echo "Daemon gpg-agent already running."
fi

# Nasty way to find gpg-agent's socket file...
GPG_SOCKET_FILE=`find /tmp/gpg-* -name $SOCKET`
echo "Updating socket file link."
cp -fs $GPG_SOCKET_FILE $HOME/.gnupg/
