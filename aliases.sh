#===============#
# RUN THIS SHIT #
#===============#
alias ea="vim ~/.aliases.sh"
alias sdf="source ~/.aliases.sh"

#===========#
# THIS SHIT #
#===========#

# ABBRV
# cf. http://zshwiki.org/home/examples/zleiab
#######
typeset -Ag abbreviations
abbreviations=(
"pm"    "| less" # yeah, this is misleading; but less > more and pl is taken
"pa"    "| ack"
"peg"   "| egrep"
"pag"   "| agrep"
"pgr"   "| groff -s -p -t -e -Tlatin1 -mandoc"
"ph"    "| head"
"pk"    "| keep"
"pt"    "| tail -f"
"pv"    "| vim"
"pw"    "| wc"
"px"    "| xargs"
)

magic-abbrev-expand() {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
  LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
  zle self-insert
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert
#######

alias wut="ping -c 5 -q 127.0.0.1 && echo '' && ping -c 100 -q www.google.com"
alias phone="ssh -t root@192.168.0.101 'echo \"photos live at /private/var/mobile/Media/DCIM/\"; exec zsh;'"
alias ftphone="sftp root@192.168.0.101"

alias logoscroll="../../../bin/build_logo_scroll"

# shell script to boot up Emacs.app with given arguments
# alias emacs='~/code/clinteresting/emacs'
alias tetris='emacs -q --no-splash -f tetris'
alias hall="say -v cellos Doo da doo da dum dee dee doodly doo dum dum dum doo da doo da doo da doo da doo da doo da doo"
alias idk="echo -n '¯\_(ツ)_/¯' | pbcopy && echo 'Copied \"¯\_(ツ)_/¯\" to clipboard'"

alias t=tmux
alias tt="tmux attach -t"
# When the tmux session shrinks some and fills the margin with periods, it
# thinks there's another instance of the session in a smaller terminal. F that.
alias tda="tmux detach -a"

alias vi=vim
alias ci=vim

alias prc="vim ~/.pryrc"

alias zrc="vi ~/.zshrc" # cd ~/bin && ln -s ~/bin/zrc ~/.zshrc
alias rc="source ~/.zshrc"

alias bundle="bundle _1.10.6_"
alias be="bundle exec"
alias bes="bundle exec rails server"
alias lkj="bundle exec rails console"
alias kjh="bundle exec rails console --sandbox"

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# Complete g like git
compdef g=git

alias co="git co"
com () {
  if [[ $(pwd) == ~/job/helloflock.github.io ]]; then
    git co source
  else
    git co master
  fi
}
alias cor="git co release"
alias cod="git co development"
alias s="git status -s"
alias ss="git status"
alias p="git add -p"
c () {
  if [[ $# > 0 ]]; then
    git commit -m '$@'
  else
    git commit -v
  fi
}
alias cm="git commit -m"
alias a="git commit --amend"
alias arh="git commit --amend --reuse-message=HEAD"
alias f="git fetch"
alias gr="git rebase"
alias gp="git pull"
alias gpr="git pull --rebase"
alias d="git diff"
alias gb="git branch"
alias gbl="git branch -l"
alias l="git log --oneline --decorate"
alias lg="git log --oneline --decorate --graph --all"
alias rl="git reflog"
alias rlc="git reflog|ack --nocolor checkout"
alias gg="git grep"
alias b="git blame"
alias stash="git stash -u"
alias shipit='echo "       _~\n    _~ )_)_~\n    )_))_))_)\n    _!__!__!_\n    \______t/\n  ~~~~~~~~~~~~~" && git push origin $(git rev-parse --abbrev-ref HEAD 2> /dev/null)'
alias SHIPIT='echo "       _~\n    _~ )_)_~\n    )_))_))_)\n    _!__!__!_\n    \______t/\n  ~~~~~~~~~~~~~" && git push -f origin $(git rev-parse --abbrev-ref HEAD 2> /dev/null)'
alias update='git pull --rebase && bundle install && bundle exec rake db:migrate'

alias cpu="top -o cpu"

alias ls="ls -GF"
alias la="ls -A"
alias ll="ls -lrSGA"
alias lll='(printf "PERMISSIONS LINKS OWNER GROUP SIZE MONTH DAY " ; printf "HH:MM/YEAR NAME\n" ; ls -l | sed 1d) | column -t'
alias cdl="cd !$"
alias ..="cdd .."
alias ...="cdd ../.."
alias ....="cdd ../../.."
alias .....="cdd ../../../.."
alias mmv='noglob zmv -W'
alias mkdir="mkdir -pv"
alias fuck="rm -rf"
