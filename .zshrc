# Manage history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Theme
fpath+=$HOME/.zsh/pure
PURE_PROMPT_SYMBOL='↳'
zstyle ':prompt:pure:prompt:*' color red
autoload -U promptinit; promptinit
prompt pure

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/sudo/sudo.plugin.zsh

autoload -U compinit && compinit

# Command correction
#setopt correctall
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit && compinit

# Smarter cd using zoxide
eval "$(zoxide init zsh)"
alias cd=z

# Aliases
alias l='ls'
alias la='ls -lAh'
alias ll='ls -lh'

alias feh='feh --scale-down --auto-zoom'
alias bat='batcat'
alias tree='tre'

#Change external monitor brightness
#sudo ddcutil setvcp 10 new_val

#Functions
function gstatus {
    git status -s
	echo "Do you want to continue ? [y/n]"
	read answer
	case "$answer" in
	  y|Y)
        return 0
        ;;
	  *)
        return 1
        ;;
	esac
}

function gp {
    if [ $# -eq 1 ]; then
        # push without tag
        if gstatus; then
            echo
            git commit -m "$1"
            echo
            git push
        fi
    elif [ $# -eq 2 ]; then
        # push with tag
        if gstatus; then
            echo
            git commit -m "$1"
            echo
            git tag -a "$2" -m "$1"
            echo
            git push --follow-tags
        fi
    else
        echo "Usage : $0 [Commit message] [Optional tag]"
    fi
}
