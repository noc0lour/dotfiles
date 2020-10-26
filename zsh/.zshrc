# Path to your oh-my-zsh installation.
ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH=/home/andrej/.oh-my-zsh
export TERM="rxvt-unicode-256color"

source ~/.profile

plugins=(encode64 systemd git github cp nmap tmux-cssh colorize ssh-agent ansible virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"

DEFAULT_USER="andrej"

P9K_PROMPT_ON_NEWLINE=true
P9K_RPROMPT_ON_NEWLINE=true
P9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv time)
 DISABLE_AUTO_TITLE="true"
 COMPLETION_WAITING_DOTS="true"
 export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

#Special Keybindings urxvt
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

#Fix keybindings for termite
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "\e[3~" delete-char
bindkey "${terminfo[kich1]}" quoted-insert
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

function gfmu (){
    commits=("${(@f)$(git log --pretty="%H" --author="$@")}")
    files=""
    for commit_hash in $commits
    do
        new_files=$(git show --oneline --name-only $commit_hash | tail -n+2)
        files="${files}${new_files}\n"
    done
    user_files=$(echo $files | sort -u)
    echo $user_files

}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
