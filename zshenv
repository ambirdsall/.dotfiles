# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/ambirdsall/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom aliases {{{
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
# }}}

