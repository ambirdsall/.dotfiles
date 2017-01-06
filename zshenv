# {{{ `fpath` and Completion
fpath=(/usr/local/share/zsh/site-functions ~/.zsh $fpath)
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/ambirdsall/.zshrc'

autoload -Uz compinit
compinit
# }}}
# {{{ Globbing
setopt extended_glob
# }}}
# {{{ Make sure external HD is mounted

# Only run mounting command if both of the following conditions are true:
#   1) The current maching is running osx
#   2) there is a device named "asdf" on disk2s1
#   3) the directory ~/asdf is empty (i.e. no filesystem mounted there)
if [[ "$(uname)" = "Darwin" ]] && [[ -n `diskutil list | sed -n '/asdf.*disk2s1/p'` ]] && [[ -z "$(ls ~/asdf)" ]]; then
  diskutil mount -mountPoint ~/asdf disk2s1
fi
# }}}
# {{{ Rubies
eval "$(rbenv init -)"
# }}}
# {{{ Aliases
if [[ -a ~/.dotfiles/aliases.zsh ]]; then
  source ~/.dotfiles/aliases.zsh
fi
# }}}
# vim:foldmethod=marker:foldlevel=0
