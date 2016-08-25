# Aliases are loaded in ~/.zshenv so they're available in non-interactive shell
# sessions (i.e. vim)

# {{{ zsh setup
fpath=(/usr/local/share/zsh/site-functions ~/.zsh $fpath)
export HISTFILE='~/.zsh_history'
# allow mv actions on multiple files, see:
autoload -U zmv
# }}}
# {{{ Side effects on opening a terminal
rm ~/Desktop/Screen\ Shot* > /dev/null 2>&1
rm ~/Desktop/dd-* > /dev/null 2>&1
~/.dotfiles/bin/say_something_nice
# brew update in the background, suppressing output
brew update 2>&1 > /dev/null &
~/.dotfiles/bin/list_upgradable
# }}}
# VIMIFY THE TERMINAL {{{

export EDITOR=vim

bindkey -v
# export KEYTIMEOUT=3
bindkey -M viins 'jf' vi-cmd-mode
bindkey -M viins 'fj' vi-cmd-mode

function zle-line-init zle-keymap-select {
    NORMAL_MODE_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$NORMAL_MODE_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
# }}}
# {{{ Git prompt
current_commit() {
    git rev-parse --short HEAD 2> /dev/null
}

# totally sweet prompt
GIT_PROMPT_EXECUTABLE="haskell"
source ~/code/zsh_business/zsh-git-prompt/zshrc.sh
PS1='%F{cyan}%~%b%f $(git_super_status) %F{136}$(current_commit)
%F{088}%f$(~/.dotfiles/bin/icon_for_time_of_day)  '

# add homecooked stuff to $PATH
export PATH=$PATH:~/bin:~/.bin

# alias hub as git
eval "$(hub alias -s)"

# aws completion
source /usr/local/share/zsh/site-functions/_aws

# irc settings
export IRCSERVER="irc.freenode.net"

# # The following lines were added by compinstall

# zstyle ':completion:*' completer _expand _complete _ignored
# zstyle :compinstall filename '/Users/ambirdsall/.zshrc'

# autoload -Uz compinit
# compinit
# # End of lines added by compinstall

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

eval "$(rbenv init -)

"# vim:foldmethod=marker:foldlevel=0
