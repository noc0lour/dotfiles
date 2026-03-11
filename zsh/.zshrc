# Path to your oh-my-zsh installation.
ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH=${HOME}/.oh-my-zsh

source ~/.profile

export GPG_TTY=$(tty)

plugins=(encode64 systemd git github cp nmap tmux-cssh colorize ssh-agent ansible pyenv fzf poetry poetry-env)

export FZF_BASE=${HOME}/.fzf
export FZF_DEFAULT_COMMAND='fzf'

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

unsetopt nomatch

# shellcheck disable=2148,SC2168,SC1090,SC2125
#local FOUND_ATUIN=$+commands[atuin]

#if [[ $FOUND_ATUIN -eq 1 ]]; then
#  source <(atuin init zsh)
#fi

atuin-setup() {
        if ! which atuin &> /dev/null; then return 1; fi
        bindkey '^E' _atuin_search_widget

        export ATUIN_NOBIND="true"
        eval "$(atuin init "zsh")"
        fzf-atuin-history-widget() {
            local selected num
            setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2>/dev/null

            # local atuin_opts="--cmd-only --limit ${ATUIN_LIMIT:-5000}"
            local atuin_opts="--cmd-only"
            local fzf_opts=(
                --height=${FZF_TMUX_HEIGHT:-80%}
                --tac
                "-n2..,.."
                --tiebreak=index
                "--query=${LBUFFER}"
                "+m"
                "--bind=ctrl-d:reload(atuin search $atuin_opts -c $PWD),ctrl-r:reload(atuin search $atuin_opts)"
            )

            selected=$(
                eval "atuin search ${atuin_opts}" |
                    fzf "${fzf_opts[@]}"
            )
            local ret=$?
            if [ -n "$selected" ]; then
                # the += lets it insert at current pos instead of replacing
                LBUFFER+="${selected}"
            fi
            zle reset-prompt
            return $ret
        }
        zle -N fzf-atuin-history-widget
        bindkey '^R' fzf-atuin-history-widget
    }
    atuin-setup


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
pyenv virtualenvwrapper

function conda_init(){
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
# . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"  # commented out by conda initialize
        else
            export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}

function radioconda_init(){
    __conda_setup="$('/Users/andrej/radioconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    fi
    unset __conda_setup
}
