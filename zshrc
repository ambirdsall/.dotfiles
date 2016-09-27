# Aliases are loaded in ~/.zshenv so they're available in non-interactive shell
# sessions (i.e. vim)

# {{{ zsh setup
fpath=(/usr/local/share/zsh/site-functions ~/.zsh $fpath)
export HISTFILE='~/.zsh_history'
# allow mv actions on multiple files, see:
autoload -U zmv
# }}}
# {{{ Side effects on opening a terminal
# clean up the desktop
rm ~/Desktop/(dd-|Screen\ Shot)*(.N) 2> /dev/null
# brew update in the background, suppressing output
brew update &> /dev/null &

# print some stuff:
~/.dotfiles/bin/list_upgradable

echo 'Tmux sessions:'
tmux list-sessions

# ~/.dotfiles/bin/say_something_nice
echo "\nToday in history:"
cat /usr/share/calendar/calendar.history | grep $(date +%m/%d) | gshuf -n 1
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
# {{{ Totally sweet prompt
current_commit() {
    git rev-parse --short HEAD 2> /dev/null
}

export GIT_PROMPT_EXECUTABLE="haskell"
source ~/code/zsh_business/zsh-git-prompt/zshrc.sh

reverse_dir_stack() {
  dirs | awk '{ for (i=NF; i>1; i--) printf "%s ", $i }'
}

PS1='$(reverse_dir_stack)%F{cyan}%~%f $(git_super_status) %F{136}$(current_commit)
%F{088}%f%{$(~/.dotfiles/bin/icon_for_time_of_day)%2G%}  '
# RPS1 set in VIMIFY THE TERMINAL
# }}}
# {{{ $LESS
export LESS=MR
# }}}
# {{{ $PATH
# add homecooked stuff
export PATH=~/bin:~/.bin:$PATH
# hi npm
export PATH=$PATH:./node_modules/.bin
# }}}
# {{{ Completion
# aws
source /usr/local/share/zsh/site-functions/_aws
# npm
source ~/.dotfiles/npm_completion.sh
# }}}
# {{{ irc
export IRCSERVER="irc.freenode.net"
# }}}
# {{{ Rubies
eval "$(rbenv init -)"
# }}}

# vim:foldmethod=marker:foldlevel=0
