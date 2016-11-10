# {{{ The following lines were added by compinstall
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
# {{{ Variables for important directories
export asdf=~/asdf
export dot=~/.dotfiles
export desk=~/Desktop
# }}}
# Custom aliases {{{
source ~/.dotfiles/aliases.zsh

# syntax highlighting pager
# # use instead of less
= () {
    /usr/local/share/vim/vim80/macros/less.sh "$*"
}
# }}}

# vim:foldmethod=marker:foldlevel=0
