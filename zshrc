# Aliases are loaded in ~/.zshenv so they're available in non-interactive shell
# sessions (i.e. vim)

fpath=(/usr/local/share/zsh/site-functions ~/.zsh $fpath)

rm ~/Desktop/Screen\ Shot* 2> /dev/null
rm ~/Desktop/dd-* 2> /dev/null
~/.dotfiles/bin/maybe_brew_update
~/.dotfiles/bin/list_upgradable

export HISTFILE='~/.zsh_history'

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
# allow mv actions on multiple files, see:
autoload -U zmv
#=====================#
#       GIT LIT	      #
#=====================#

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
