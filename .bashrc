#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

export PATH=$PATH:"$HOME/bin"

alias vi='vim'
alias vtx='vim --servername VIM'
alias config='/usr/bin/git --git-dir=/home/sofia/.cfg/ --work-tree=/home/sofia'
