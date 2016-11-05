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
    /usr/share/vim/vim73/macros/less.sh "$*"
}
# }}}

# vim:foldmethod=marker:foldlevel=0
