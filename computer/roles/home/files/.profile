# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


##
## Personal
##

export CODE="/code/";
export IBUS_ENABLE_SYNC_MODE=1
setxkbmap fr;


alias hgrep='history | grep'
alias lgrep='ls -alF | grep'
alias aptg='apt-get install -y'



alias tohome='cd ~'
alias tocode='cd $CODE'
alias tohk='cd $CODE/hk'
alias gst='git status'




# Ansible
alias ap='ansible-playbook'
alias avc='ansible-vault create --vault-password-file=~/.ssh/vault'

alias kbidea='ibus-daemon -rd'
alias kbfr='setxkbmap fr'

function dps() {
    docker ps | while read line; do
        if `echo $line | grep -q 'CONTAINER ID'`; then
            echo -e "IP ADDRESS\t$line"
        else
            CID=$(echo $line | awk '{print $1}');
            IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" $CID);
            printf "${IP}\t${line}\n"
        fi
    done;
}

#changing mouse defaults
~/bin/razer.sh;
