# {{{ `fpath` and Completion
fpath=(/usr/local/share/zsh/site-functions ~/.zsh $fpath)
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/Users/ambirdsall/.zshrc'

autoload -Uz compinit
compinit

_grepish() {
  if (( CURRENT == 2 )); then
    compadd $(cut -f 1 .git/tags tmp/tags 2>/dev/null | grep -v '!_TAG')
  fi
}
compdef _grepish ag rg ack grep
# }}}
# {{{ Globbing
setopt extended_glob
# }}}
# {{{ Set up Dropbox on external HD

# Only run mounting command if both of the following conditions are true:
#   1) The current maching is running osx
#   2) there is a device named "asdf" on disk2s1
#   3) the directory ~/asdf is empty (i.e. no filesystem mounted there)
# Only start Dropbox after mounting the drive and cleaning up the
# auto-generated metadata files OSX barfs up on any file system but HFS. This
# ought to prevent a bunch of pointless, annoying notifications to other people
# about the existence and then deletion of those metadata files.
if [[ "$(uname)" = "Darwin" ]] && [[ -n `diskutil list | sed -n '/asdf.*disk2s1/p'` ]] && [[ -z "$(ls ~/asdf)" ]]; then
  diskutil mount -mountPoint ~/asdf disk2s1
  command -v dot_clean && dot_clean -m ~/asdf/Dropbox
  open /Applications/Dropbox.app/
fi
# }}}
# {{{ Rubies
eval "$(/usr/local/bin/rbenv init -)"
# }}}
# {{{ [commented out] Make aliases available when shelling out from n?vim
# if [[ -n `env | grep VIMRUNTIME` ]]; then
#   [[ -a ~/.dotfiles/aliases.zsh ]] && source ~/.dotfiles/aliases.zsh
# fi
# }}}
# vim:foldmethod=marker:foldlevel=0
