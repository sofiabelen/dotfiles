#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

export PATH=$PATH:"$HOME/bin"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BROWSER=/usr/bin/qutebrowser

alias ls='ls --color=auto'
alias vi='vim'
alias vtx='vim --servername VIM'
alias config='/usr/bin/git --git-dir=/home/sofia/.cfg/ --work-tree=/home/sofia'
alias sd='sudo shutdown now'
alias cfi='vim ~/.config/i3/config'
alias cfb='vim ~/.bashrc'
alias cfm='vim ~/.config/mutt/muttrc'
alias cfv='vim ~/.vimrc'
alias cfi='vim ~/.config/i3/config'
alias cfr='vim ~/.config/ranger/rc.conf'
alias cft='vim ~/.config/termite/config'
alias cfp='vim ~/.config/polybar/config'
alias cfq='vim ~/.config/qutebrowser/config.py'
alias cfc='vim ~/.compton.conf'
alias cfz='vim ~/.config/zathura/zathurarc'

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
