#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)

export PATH=$PATH:"$HOME/bin:/home/sofia/.local/bin"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export BROWSER=/usr/bin/qutebrowser

alias ls='ls --color=auto'
alias vi='vim'
alias vtx='vim --servername VIM'
alias config='/usr/bin/git --git-dir=/home/sofia/.cfg/ --work-tree=/home/sofia'
alias sd='sudo shutdown now'

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

set -o vi

export PS1="[\[\033[01;35m\]qkick \[\033[01;32m\]\w\[\033[00m\]]\$ "

source ~/.shortcuts
#pywall theme on tty
#source ~/.cache/wal/colors-tty.sh
