fpath=(/usr/local/share/zsh/site-functions ~/.zsh $fpath)
source ~/code/zsh_business/iterm_dirs.sh
md5 ~/Dropbox/Apps/MobileOrg/* > ~/Dropbox/Apps/MobileOrg/checksums.dat
maybe_brew_update
rm ~/Desktop/Screen\ Shot*

export HISTFILE='~/.zsh_history'

#=====================#
# VIMIFY THE TERMINAL #
#=====================#

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
export PS1='%F{cyan}%~%b%f$(git_super_status) %F{yellow}$(current_commit) %F{cyan}%#%f '

# add homecooked stuff to $PATH
export PATH=$PATH:~/bin:~/.bin

# alias hub as git
eval "$(hub alias -s)"

# aws completion
source /usr/local/share/zsh/site-functions/_aws

# irc settings
export IRCSERVER="irc.freenode.net"

#==============================#
# HERE THERE BE CUSTOM ALIASES #
#==============================#
source ~/.aliases.sh

ljd () {
  ls -lG $1 | ack '^d' | awk '{print $9}'
}

rlog () {
  tail -f $1 | ack -i 'error' --passthru
}

mcd () {
	mkdir -p $1
	cd $1
}

cdd () {
	cd $1
	ls
}

gc () {
       repo=$1
       repo_dir_with_trailing_git=${repo##*/}
       repo_dir=${repo_dir_with_trailing_git%.git}
       git clone $repo
       cd $repo_dir
}

# syntax highlighting pager
# # use instead of less
= () {
    /usr/share/vim/vim73/macros/less.sh "$*"
}

eval "$(rbenv init - zsh --no-rehash)"
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/ambirdsall/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
