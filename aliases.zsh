# * Shell variables (important files and directories)
export desk=~/Desktop
export dot=~/.dotfiles
export nvimrc=~/.config/vim/init.vim
# * General shell helpers
error () {
    echo "$@" > /dev/stderr
}
# * Tmux
# This function is primarily intended as a helper function for naming things
# after the current session, so a string that I'm confident I wouldn't ever use
# for a tmux session name is actually appropriate "error handling" if I'm not,
# in fact, inside a tmux session; certainly better than the default behavior of
# `tmux display-message -p "#S"` outside of a session, which is to echo the
# name of the last attached session.
tmux-session-name () {
  [[ -n $TMUX ]] && tmux display-message -p '#S' || echo NOTMUX
}
alias t=tmux
alias tt="tmux attach -t"
alias tk="tmux kill-session -t"
tn () {
  if [[ $# -gt 0 ]]; then
    tmux new -s $1; cd; clear
  else
    tmux new -s $(basename $(pwd)); cd; clear
  fi
}
# When the tmux session shrinks some and fills the margin with periods, it
# thinks there's another instance of the session in a smaller terminal. F that.
alias tda="tmux detach -a"
alias tls="tmux list-sessions 2>/dev/null || error wha\'s like tmux? damn few and they\'re a\'deid"

# When clearing screen:
#   if `$TMUX` is defined: just clear the screen, in a tmux session already
#   else:                  clear, then list sessions atop screen
alias clear='clear; [[ -z "$TMUX" ]] && tls 2>/dev/null || true'
# * emacsen
alias em='emacsclient -nw'
emm () {
  # uses fzf to pick a file and then passes it to emacsclient as the file argument
  em $(um)
}
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias amacs='emacs -q --load ~/.emacs.amb/init.el --debug-init --no-splash ~/.emacs.amb/init.el'
amb () {
    if [[ $# -gt 0 ]]; then
        emacsclient -s amb "$@" || emacs -q -l ~/.emacs.amb/init.el --daemon=amb &
    else
        emacsclient -s amb . || emacs -q -l ~/.emacs.amb/init.el --daemon=amb &
    fi
}
# * Current projects
cdc() {
  if [[ $# -gt 0 ]]; then
    cdd ~/code/${@}
  else
    cdd ~/code
  fi
}
compdef '_files -W ~/code' cdc

wut() {
  rg "export (class|interface|function|const|let|type) $1"
}

wur() {
  rg "import $1"
}
# * Edit/source development config files
cdot () {
  if [[ $# -gt 0 ]]; then
    pushd ~/.dotfiles/${@} && ls
  else
    pushd ~/.dotfiles && ls
  fi
}
alias prc="em ~/.dotfiles/pryrc"
alias ea="em ~/.dotfiles/aliases.zsh"
alias el="em ~/.local-aliases.zsh"
alias sdf="source ~/.dotfiles/aliases.zsh"
alias zrc="em ~/.dotfiles/zshrc"
alias rc="source ~/.dotfiles/zshrc"
# * Background jobs & processes
alias j=jobs
# Typing the percent sign gets annoying fast when you run `kill` all the time with `%n`-style arguments on suspended `jobs`
k () {
  kill %"$1"
}

alias cpu="top -o cpu"
# * popup notification on command completion
notify () {
  if [[ -z $1 ]]; then
    osascript -e "display notification 'Task finished with exit code $?'"
  else
    osascript -e "display notification '$@ finished with exit code $?'"
  fi
}
# * when the terminal display fucks up
alias smh='stty sane'
# * serve local files
alias serve="python -m SimpleHTTPServer"
# * awk
alias awkcsv='awk -F "\"*,\"*"'
# * `=`
= () {
  # iff there are 0 arguments given, assume input from stdin (i.e. a pipe)
  if [[ $# == 0 ]]; then
    /usr/local/share/vim/vim80/macros/less.sh "$*" -
  else
    /usr/local/share/vim/vim80/macros/less.sh "$*"
  fi
}
# * `cd`
alias 'cd-'="cd -"
alias ..="cdd .."
alias ...="cdd ../.."
alias ....="cdd ../../.."
alias .....="cdd ../../../.."
alias ......="cdd ../../../../.."
alias .......="cdd ../../../../../.."
alias ........="cdd ../../../../../../.."
alias .........="cdd ../../../../../../../.."

mcd () {
  mkdir -p $1
  cd $1
}

cdd () {
  cd $1
  ls -GF
}
# * `chmod`
alias cx='chmod +x'
# * Docker
alias docc='docker-compose'
# * `echo`
alias e=echo
# * fzf
# DEPENDENCY: gem install rouge
alias um="find . -type f | grep -vE '.tmp-*|.git|node_modules|bower_components' | fzf --multi --preview 'rougify {}'"
cdf() {
  pushd $(dirname $(find . -type f | grep -vE '.tmp-*|.git|node_modules|bower_components|DS_Store' | fzf --preview 'rougify {}'))
}
h () {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}
redo() {
  $(history -n -500 | fzf)
}
# * fc
alias shit=fc
# * treeish
# npm i -g @aweary/alder
alias tree=alder
# * `ls`
alias ls="ls -GF"
alias la="ls -A"
# * `mkdir`
alias mkdir="mkdir -pv"
# * `rm`
alias fuck="rm -rf"
# * `tail`
tailfh () {
  tail -f $1 | ack -i 'error' --passthru
}
alias tsslog='tail -f /tmp/tss.log'
# * `zmv`
alias mmv='noglob zmv -W'
# * Vim and fam
vi () {
  if [[ $# -gt 0 ]]; then
    vim "$@"
  else
    vim .
  fi
}
alias ci=vi
alias vis="vi -S Session.vim"
nv () {
  if [[ $# -gt 0 ]]; then
    vim "$@"
  else
    vim .
  fi
}
bo () {
  vi $(bundle show "$1")
}
# * Git
# alias hub as git
# eval "$(hub alias -s)"

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status -s
  fi
}

# Complete g like git, which is actually `hub`.
compdef g=hub

# run `git clone` and `cdd` into dir
gc () {
  repo=$1
  repo_dir_with_trailing_git=${repo##*/}
  repo_dir=${repo_dir_with_trailing_git%.git}
  git clone $repo
  cdd $repo_dir
}

co () {
  if [[ $# -gt 0 ]]; then
    git checkout "$@"
  else
    git checkout `git branch -l | sed 's/^ *//' | fzf --preview 'git show heads/{} | diff-so-fancy'`
  fi
}
# compdef co=git-checkout # zsh can't find git-checkout harrumph harrumph
cor () {
  co $(git recent $(echo "$(tput lines) - 2" | bc) | fzf --preview 'git show heads/{} | diff-so-fancy')
}
alias co-="git co -"

cob () {
  co -b "`echo $* | tr ' ' -`"
}

d () {
  # git diff --word-diff "$@"
  git diff --diff-algorithm=minimal --color "$@" | diff-so-fancy | less --tabs=4
}
alias gdc="d --cached"
alias gdo="git diff \$(git rev-parse --abbrev-ref HEAD 2> /dev/null)..origin/\$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

alias ts="tig status"

alias p="git add -p"

c () {
  if [[ $# -gt 0 ]]; then
    git commit -m "$*"
  else
    git commit -v
  fi
}
alias a="git commit --amend"
alias arh="git commit --amend --reuse-message=HEAD"

alias f="git fetch"

alias gr="git rebase"
alias gr-="git rebase -"
alias gri="g ri" # home-cooked git-ri, which simplifies syntax of `git rebase -i`

alias gp="git pull --ff-only"
alias gpr="git pull --rebase"

alias gb="git branch"
alias gbl="git branch -l"

l () {
  # no args
  if [[ $# -eq 0 ]]; then
    git log --oneline --decorate --graph --all
  # one arg which is an integer
  elif [[ $# -eq 1 ]] && [[ "$1" = <-> ]]; then
    git log --oneline --decorate -$1
  else
    echo "Usage: l [number of commits]" >&2
  fi
}
eval "$(ruby -e '9.times do |i| puts %Q{alias l#{i+1}=l\\ -#{i+1}} end')"
alias lo='git log --oneline --decorate'
alias lg="git log --oneline --decorate --graph --all"
alias rl="git reflog"

# unique () {
#   perl -ne '$H{$_}++ or print'
# }
# lately () {
#   # lists unique git refs you have checked out, in order of how recently you checked them out
#   git reflog | ack --nocolor checkout: | awk '{print $6}' | unique | more
# }

alias gg="git grep"

alias b="git blame"

alias stash="git stash save -u"
alias pop="git stash pop"

alias shipit='echo "       _~\n    _~ )_)_~\n    )_))_))_)\n    _!__!__!_\n    \______t/\n  ~~~~~~~~~~~~~" && git push origin $(git rev-parse --abbrev-ref HEAD 2> /dev/null)'
alias SHIPIT='echo "       _~\n    _~ )_)_~\n    )_))_))_)\n    _!__!__!_\n    \______t/\n  ~~~~~~~~~~~~~" && git push --force-with-lease origin $(git rev-parse --abbrev-ref HEAD 2> /dev/null)'
# an important part of being a good programmer is making fun of yourself when you make a typo
alias SHIIT='echo "       _~\n    _~ )_)_~\n    )_))_))_)\n    _!__!__!_\n    \______t/\n  ~~~~~~~~~~~~~" && echo "      FUUCK"'

alias update='git pull --rebase && bundle install && bundle exec rake db:migrate'

ghe () {
  curl -H "Authorization: token 124fe675cdf2c6fadbeadbb75bc81bd5f248c7ad" https://git.sigfig.com/api/v3/$(echo $* | tr " " "/")
}
# * tags
alias tag_js='find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
# * ip address
alias my_ip='dig +short myip.opendns.com @resolver1.opendns.com'
# * Self-expanding shell abbreviations
# cf. http://zshwiki.org/home/examples/zleiab
typeset -Ag abbreviations
abbreviations=(
"pa"    "| awk"
"pag"   "| agrep"
"pb"    "| bc"
"peg"   "| egrep"
"pg"    "| rg"
"pgr"   "| groff -s -p -t -e -Tlatin1 -mandoc"
"pf"    "| fzf"
"ph"    "| head"
"pj"    "| jq"
"pk"    "| keep"
"pm"    "| less" # yeah, this is misleading; but less > more and pl is taken
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
# * Image processing
alias imageoptim=/Applications/ImageOptim.app/Contents/MacOS/ImageOptim
# * Unicode arts and farts
alias idk="echo -n '¯\_(ツ)_/¯' | pbcopy && echo 'Copied \"¯\_(ツ)_/¯\" to clipboard'"
# Backslashes and underscores must be escaped if the text will be parsed as markdown
alias idke="echo -n '¯\\\\\\_(ツ)\_/¯' | pbcopy && echo 'Copied \"¯\\\\\_(ツ)\_/¯\" to clipboard'"
alias om="echo -n '¯\_( ˘͡ ˘̯)_/¯' | pbcopy && echo 'Copied \"¯\_( ˘͡ ˘̯)_/¯\" to clipboard'"
alias tableflip="echo -n '(╯°□°）╯︵ ┻━┻' | pbcopy && echo 'Copied \"(╯°□°）╯︵ ┻━┻\" to clipboard'"
alias muscles="echo -n 'ᕙ(⇀‸↼‶)ᕗ' | pbcopy && echo 'Copied \"ᕙ(⇀‸↼‶)ᕗ\" to clipboard'"
alias heyo="echo -n '(╭☞\'ω\')╭☞' | pbcopy && echo 'Copied \"(╭☞\'ω\')╭☞¯\" to clipboard'"
alias thanks="echo -n '(´▽\`ʃƪ)' | pbcopy && echo 'Copied \"(´▽\`ʃƪ)\" to clipboard'"
# * Entertainment
alias tetris='emacs -q --no-splash -f tetris'
alias hall="say -v cellos Doo da doo da dum dee dee doodly doo dum dum dum doo da doo da doo da doo da doo da doo da doo"
alias vlc=/Applications/VLC.app/Contents/MacOS/VLC

# and machine-specific aliases/overrides:
[ -f ~/.local-aliases.zsh ] && source ~/.local-aliases.zsh || true

# vim:foldmethod=marker:foldlevel=0
