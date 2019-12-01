#!/bin/ash

# Create an account
adduser -D $USERNAME
echo $USERNAME':'$PASSWD | chpasswd
echo -e $PASSWD'\n'$PASSWD | pdbedit -a -u $USERNAME
#mkdir /home/$USERNAME/share
#chown $USERNAME:$USERNAME /home/$USERNAME/share

# Start daemons
nmbd restart -D
smbd restart -FS </dev/null
