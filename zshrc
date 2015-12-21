fpath=(/usr/local/share/zsh/site-functions ~/.zsh $fpath)
source ~/code/zsh_business/iterm_dirs.sh
md5 ~/Dropbox/Apps/MobileOrg/* > ~/Dropbox/Apps/MobileOrg/checksums.dat
maybe_brew_update
rm ~/Desktop/Screen\ Shot*

#=====================#
# VIMIFY THE TERMINAL #
#=====================#

bindkey -v
# export KEYTIMEOUT=3
bindkey -M viins 'jf' vi-cmd-mode
bindkey -M viins 'fj' vi-cmd-mode
source ~/code/zsh_business/opp.zsh/opp.zsh
source ~/code/zsh_business/opp.zsh/opp/*.zsh

function zle-line-init zle-keymap-select {
    NORMAL_MODE_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$NORMAL_MODE_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#=====================#
#=====================#

# totally sweet prompt
GIT_PROMPT_EXECUTABLE="haskell"
source ~/code/zsh_business/zsh-git-prompt/zshrc.sh
export PS1='%F{cyan}%~%b%f$(git_super_status) %F{cyan}%#%f '

export EDITOR="/usr/local/bin/vim"

# adds Go to $PATH
export GOPATH="/Users/ambirdsall/code/go"
export PATH=$PATH:$GOPATH/bin

# sets up global installs for npm
NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# syntax highlighting in less
#export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"; export LESS=" -R"

export PATH=$PATH:/Users/ambirdsall/code/clinteresting

# alias hub as git
eval "$(hub alias -s)"

# irc settings
export IRCSERVER="irc.freenode.net"

#==============================#
# HERE THERE BE CUSTOM ALIASES #
#==============================#
alias wut="ping -c 5 -q 127.0.0.1 && echo '' && ping -c 100 -q www.google.com"

alias emacs='/usr/local/bin/emacs'
alias tetris='emacs -q --no-splash -f tetris'
alias hall="say -v cellos Doo da doo da dum dee dee doodly doo dum dum dum doo da doo da doo da doo da doo da doo da doo"

alias swift=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift
alias swiftc=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc

alias subl="/Applications/Sublime\ Text\ 3.app/Contents/SharedSupport/bin/subl"

alias vi="vim"

alias prc="vim ~/.pryrc"

alias zrc="vim ~/.zshrc"
alias rc="source ~/.zshrc"

alias be="bundle exec"
alias bes="bundle exec rails server"
alias lkj="bundle exec rails console"
alias kjh="bundle exec rails console --sandbox"

alias g="git"
alias p="git add -p"
alias c="git commit"
alias a="git commit --amend"
alias s="git status"
alias d="git diff"
alias l="git branch --list"
alias co="git co"

alias cpu="top -o cpu"

alias ls="ls -GF"
alias la="ls -A"
alias ll="ls -lrSGA"
alias cdl="cd !$"
alias ..="cdd .."
alias ...="cdd ../.."
alias ....="cdd ../../.."
alias .....="cdd ../../../.."
alias mkdir="mkdir -pv"
alias fuck="rm -rf"

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

letter () {
	rm temp/Alex_Birdsall_cover_letter.txt
	cp $1 temp/Alex_Birdsall_cover_letter.txt
}

# syntax highlighting pager
# # use instead of less
= () {
    /usr/share/vim/vim73/macros/less.sh "$*"
}

coffeefy () {
    js2coffee $1 | coffee -sc > $2
}

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/ambirdsall/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
