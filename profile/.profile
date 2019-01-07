#!/bin/sh
export EDITOR="/usr/bin/vim"
export SYSTEMD_EDITOR="$EDITOR"
export FCEDIT="$EDITOR"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
export SUDO_SYSTEMD_EDITOR="$EDITOR"
export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:"$LD_LIBRARY_PATH
export PKG_CONFIG_PATH
export GOPATH="/home/andrej/gopath"
export PATH="/usr/lib/ccache/bin/:$GOPATH/bin/:"$PATH":/usr/local/sbin/:/usr/sbin/:/sbin/"
# set input method to uim so .XCompose works
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS=@im=uim
#load pythonrc for e.g. tab completion
export PYTHONSTARTUP=~/.pythonrc
#configure virtualenvwrapper
export WORKON_HOME=$HOME/Projekte/python/envs
export PROJECT_HOME=$HOME/Projekte

#novaclient for GR
export OS_USERNAME=arode
export OS_PASSWORD=VbHXyWiEwTFHMtZgQ7iG
export OS_PROJECT_ID=30977a58713548a3a65c45afef3d749d
export OS_USER_DOMAIN_NAME=default
export OS_AUTH_URL=https://oprod-controller1.osuosl.org:5000/v3
export OS_COMPUTE_API_VERSION=2.1
export OS_IDENTITY_API_VERSION=3


source $(which virtualenvwrapper.sh)
alias nocomment=/usr/local/bin/nocomment.sh
function gfmu (){
	  $commits = git log --pretty="%H" --author="$@" 
	  for commit_hash in $commits 
	  do 
		    $files = git show --oneline --name-only $commit_hash | tail -n+2
	  done
	  $user_files = sort $files | uniq 
	  echo $user_files

}
eval "$(hub alias -s)"

#PATH="/home/andrej/perl5/bin${PATH+:}${PATH}"; export PATH;
#PERL5LIB="/home/andrej/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/andrej/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/andrej/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/andrej/perl5"; export PERL_MM_OPT;

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    xrdb -merge ~/.Xresources
    startx
fi
