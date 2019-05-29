# * $PATH and friends
# hi node
export PATH="$HOME/.npm-packages/bin:$PATH"
export NODE_PATH=$NODE_PATH:/usr/local/lib/
# hi rust
export PATH="$HOME/.cargo/bin:$PATH"
# hi go
export PATH="$HOME/go/bin:$PATH"
# hi sigfig
export PATH="$PATH:$HOME/workspace/ngts/ngts_dev_tools/bin"
export RAINBOW_TIME=yep
# * Side effects on opening a terminal
# clean up the desktop
$(rm ~/Desktop/(dd-|Screen\ Shot)*(.N) 2> /dev/null &)
# * zsh setup
export HISTFILE='~/.zsh_history'
export HISTCONTROL=ignorespace
export HISTSIZE=500
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# allow mv actions on multiple files, see:
autoload -U zmv
setopt auto_cd
# * Login display
if tmux list-sessions &>/dev/null; then
  echo 'Tmux sessions:'
  echo "$(tmux list-sessions)\n"
fi

if command -v gshuf &>/dev/null; then
  echo "Today in history:"
  cat /usr/share/calendar/calendar.history | grep -v src/ | grep $(date +%m/%d) | gshuf -n 1
fi
# * NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" &>/dev/null # This loads nvm

if command -v nvm &>/dev/null; then
    if [ $PWD =~ react ]; then
        nvm use
    elif [ $PWD =~ ngts ]; then
        nvm use
    else
        nvm use default
    fi
fi

# * Editing text
# ** $EDITOR and friends
export EDITOR='emacsclient -nw --alternate-editor="emacs -q -nw -l ~/.emacs.amb/init.el"'
export MANPAGER="vim -c 'set ft=man' -"

# ** bringing some hybrid mode to zsh
bindkey -v
# # export KEYTIMEOUT=3

# VI MODE KEYBINDINGS (ins mode)
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line
bindkey -M viins '^r'    history-incremental-pattern-search-backward
bindkey -M viins '^s'    history-incremental-pattern-search-forward
bindkey -M viins '^p'    up-line-or-history
bindkey -M viins '^n'    down-line-or-history
bindkey -M viins '^y'    yank
bindkey -M viins '^w'    backward-kill-word
bindkey -M viins '^u'    backward-kill-line
bindkey -M viins '^h'    backward-delete-char
bindkey -M viins '^?'    backward-delete-char
bindkey -M viins '^_'    undo
bindkey -M viins '^x^r'  redisplay
bindkey -M viins '\eOH'  beginning-of-line # Home
bindkey -M viins '\eOF'  end-of-line       # End
bindkey -M viins '\e[2~' overwrite-mode    # Insert
bindkey -M viins '\ef'   forward-word      # Alt-f
bindkey -M viins '\eb'   backward-word     # Alt-b
bindkey -M viins '\ed'   kill-word         # Alt-d


# VI MODE KEYBINDINGS (cmd mode)
bindkey -M vicmd '^a'    beginning-of-line
bindkey -M vicmd '^e'    end-of-line
bindkey -M vicmd '^r'    history-incremental-pattern-search-backward
bindkey -M vicmd '^s'    history-incremental-pattern-search-forward
bindkey -M vicmd '^p'    up-line-or-history
bindkey -M vicmd '^n'    down-line-or-history
bindkey -M vicmd '^y'    yank
bindkey -M vicmd '^w'    backward-kill-word
bindkey -M vicmd '^u'    backward-kill-line
bindkey -M vicmd '/'     vi-history-search-forward
bindkey -M vicmd '?'     vi-history-search-backward
bindkey -M vicmd '^_'    undo
bindkey -M vicmd '\ef'   forward-word                      # Alt-f
bindkey -M vicmd '\eb'   backward-word                     # Alt-b
bindkey -M vicmd '\ed'   kill-word                         # Alt-d
bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
bindkey -M vicmd '\e[6~' history-beginning-search-forward  # PageDown


function zle-line-init zle-keymap-select {
    NORMAL_MODE_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$NORMAL_MODE_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
# * Totally sweet prompt
current_commit() {
    git rev-parse --short HEAD 2> /dev/null
}

export GIT_PROMPT_EXECUTABLE="haskell"
source ~/code/zsh_business/zsh-git-prompt/zshrc.sh

# TODO fix handling of directories with spaces in their names
reverse_dir_stack() {
  dirs | awk '{ for (i=NF; i>1; i--) printf("%s %%F{238}᎒%%f", $i) }'
}

#  git rev-parse --git-dir &>/dev/null
export PS1='%F{239}┌%f $(reverse_dir_stack)%F{cyan}%~%f$(if git rev-parse --git-dir &>/dev/null; then echo " $(git_super_status) %F{136}$(current_commit)%f "; else echo " "; fi)$(~/bin/moon-phase)
%F{239}└─%f%(?.%F{239}.%F{196})➣%f '

# RPS1 set in VIMIFY THE TERMINAL
# * $LESS
export LESS=MRFKGX
# * direnv
# hi nix
eval "$(direnv hook zsh)"
# * irc
export IRCSERVER="irc.freenode.net"
# * Aliases
[[ -a ~/.dotfiles/aliases.zsh ]] && source ~/.dotfiles/aliases.zsh

export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
