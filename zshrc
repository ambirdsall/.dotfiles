# {{{ zsh setup
export HISTFILE='~/.zsh_history'
export HISTCONTROL=ignorespace
# allow mv actions on multiple files, see:
autoload -U zmv
setopt auto_cd
# }}}
# {{{ Login display
# print outdated libraries:
# ~/.dotfiles/sbin/list_upgradable

if tmux list-sessions &>/dev/null; then
  echo 'Tmux sessions:'
  echo "$(tmux list-sessions)\n"
fi

echo "Today in history:"
cat /usr/share/calendar/calendar.history | grep $(date +%m/%d) | gshuf -n 1
# }}}
# {{{ Side effects on opening a terminal
# clean up the desktop
rm ~/Desktop/(dd-|Screen\ Shot)*(.N) 2> /dev/null
# brew update in the background, suppressing output
# brew update &> /dev/null &
# }}}
# terminal setup {{{
# export EDITOR=vim
export EDITOR='emacsclient -nw --alternate-editor="emacs"'
export MANPAGER="nvim -c 'set ft=man' -"

bindkey -v
# # export KEYTIMEOUT=3
# bindkey -M viins 'jf' vi-cmd-mode
# bindkey -M viins 'fj' vi-cmd-mode

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

# TODO fix handling of directories with spaces in their names
reverse_dir_stack() {
  dirs | awk '{ for (i=NF; i>1; i--) printf("%s %%F{238}᎒%%f", $i) }'
}

PS1='$(reverse_dir_stack)%F{cyan}%~%f $(git_super_status) %F{136}$(current_commit)%f
%(?.%F{239}.%F{196})⭆%f '

# RPS1 set in VIMIFY THE TERMINAL
# }}}
# {{{ $LESS
export LESS=MRFKGX
# }}}
# {{{ $PATH and friends
# add homecooked stuff
export PATH=~/bin:~/.bin:$PATH
# hi rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"
# hi go
export PATH="$HOME/go/bin:$PATH"
# hi sigfig
export PATH="$PATH:$HOME/workspace/ngts/ngts_dev_tools/bin"
export NODE_PATH=$NODE_PATH:/usr/local/lib/
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
# hi nix
eval "$(direnv hook zsh)"
# }}}
# {{{ irc
export IRCSERVER="irc.freenode.net"
# }}}
# {{{ Completion
# # aws
source /usr/local/share/zsh/site-functions/_aws
# npm
source ~/.dotfiles/npm_completion.sh
###-begin-ng-completion###
#

# ng command completion script
#   This command supports 3 cases.
#   1. (Default case) It prints a common completion initialisation for both Bash and Zsh.
#      It is the result of either calling "ng completion" or "ng completion -a".
#   2. Produce Bash-only completion: "ng completion -b" or "ng completion --bash".
#   3. Produce Zsh-only completion: "ng completion -z" or "ng completion --zsh".
#
# Installation: ng completion -b >> ~/.bashrc
#           or  ng completion -z >> ~/.zshrc
#
_ng_completion () {
        local words cword opts
        read -Ac words
        read -cn cword
        let cword-=1

        case $words[cword] in
          ng|help) opts="--version -v b build completion doc e e2e eject g generate get help l lint new s serve server set t test v version xi18n" ;;
b|build) opts="--aot --app --base-href --deploy-url --environment --extract-css --i18n-file --i18n-format --locale --output-hashing --output-path --poll --progress --sourcemaps --stats-json --target --vendor-chunk --verbose --watch -a -aot -bh -d -e -ec -i18nFile -i18nFormat -locale -oh -op -poll -pr -sm -statsJson -t -v -vc -w" ;;
completion) opts="--all --bash --zsh -a -b -z" ;;
e|e2e) opts="--aot --app --base-href --config --deploy-url --element-explorer --environment --extract-css --hmr --host --i18n-file --i18n-format --live-reload --live-reload-client --locale --open --output-hashing --output-path --poll --port --progress --proxy-config --serve --sourcemaps --specs --ssl --ssl-cert --ssl-key --target --vendor-chunk --verbose --watch --webdriver-update -H -a -aot -bh -c -d -e -ec -ee -hmr -i18nFile -i18nFormat -liveReloadClient -locale -lr -o -oh -op -p -pc -poll -pr -s -sm -sp -ssl -sslCert -sslKey -t -v -vc -w -wu" ;;
eject) opts="--aot --app --base-href --deploy-url --environment --extract-css --force --i18n-file --i18n-format --locale --output-hashing --output-path --poll --progress --sourcemaps --target --vendor-chunk --verbose --watch -a -aot -bh -d -e -ec -force -i18nFile -i18nFormat -locale -oh -op -poll -pr -sm -t -v -vc -w" ;;
g|generate) opts="class component directive enum guard interface module pipe service--dry-run --verbose -d -v" ;;
get) opts="--global -global" ;;
l|lint) opts="--fix --force --format --type-check -fix -force -format -typeCheck" ;;
new) opts="--directory --dry-run --inline-style --inline-template --link-cli --prefix --routing --skip-commit --skip-git --skip-install --skip-tests --source-dir --style --verbose -d -dir -is -it -lc -p -routing -sc -sd -sg -si -st -style -v" ;;
s|serve|server) opts="--aot --app --base-href --deploy-url --environment --extract-css --hmr --host --i18n-file --i18n-format --live-reload --live-reload-client --locale --open --output-hashing --output-path --poll --port --progress --proxy-config --sourcemaps --ssl --ssl-cert --ssl-key --target --vendor-chunk --verbose --watch -H -a -aot -bh -d -e -ec -hmr -i18nFile -i18nFormat -liveReloadClient -locale -lr -o -oh -op -p -pc -poll -pr -sm -ssl -sslCert -sslKey -t -v -vc -w" ;;
set) opts="--global -g" ;;
t|test) opts="--app --browsers --code-coverage --colors --config --log-level --poll --port --progress --reporters --single-run --sourcemaps --watch -a -browsers -c -cc -colors -logLevel -poll -port -progress -reporters -sm -sr -w" ;;
--version|-v|v|version) opts="--verbose -verbose" ;;
xi18n) opts="--app --i18n-format --locale --out-file --output-path --progress --verbose -a -f -l -of -op -progress -verbose" ;;
*) opts="" ;;
        esac

        setopt shwordsplit
        reply=($opts)
        unset shwordsplit
      }

      compctl -K _ng_completion ng
###-end-ng-completion###
# }}}
# {{{ Aliases
[[ -a ~/.dotfiles/aliases.zsh ]] && source ~/.dotfiles/aliases.zsh
# }}}
# vim:foldmethod=marker:foldlevel=0

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
