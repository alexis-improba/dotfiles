# Author: Alexis Moins
# Creation: 03 oct 2021

# Append commands to the history file & import commands from other sessions
setopt SHAREHISTORY

# When entering a line with history expansion, perform history expansion and reload the
# line into the editing buffer
setopt HISTVERIFY

# Do not enter command lines into the history list if they are duplicates of the
# previous event
setopt HISTIGNOREDUPS

# Remove command lines from the history list when the first character on the
# line is a spacec
setopt HISTIGNORESPACE

# Remove superfluous blanks from each command line being added to the history
# list
setopt HISTREDUCEBLANKS

# File in which the history will be saved
HISTFILE="${HOME}/.local/share/zsh/history"

# Maximum number of items saved in the session's history
HISTSIZE=1000000

# Maximum number of items saved in the history file
SAVEHIST=1000000
