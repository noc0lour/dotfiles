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
export INPUT_METHOD=uim
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS=@im=uim
#load pythonrc for e.g. tab completion
export PYTHONSTARTUP=~/.pythonrc
#configure virtualenvwrapper
export WORKON_HOME=$HOME/Projekte/python/envs
export PROJECT_HOME=$HOME/Projekte
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library

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

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    xrdb -merge ~/.Xresources
    startx
fi
. "$HOME/.cargo/env"
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init --path)"
