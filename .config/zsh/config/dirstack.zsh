# Author: Alexis Moins
# Creation: 6 janvier 2021

# Change de dossier sans avoir à utiliser cd
setopt AUTOCD       

# N'affiche pas le dossier lors de la navigation
setopt CDSILENT 

# Ajoute automatiquement les dossiers dans la pile de dossiers
setopt AUTOPUSHD

# Inverse l'utilisation de cd - et cd +
setopt PUSHDMINUS

# N'affiche pas les éléments de la pile lors des changements de dossiers
setopt PUSHDSILENT

# N'ajoute pas le dossier s'il est déjà présent dans la pile
setopt PUSHDIGNOREDUPS

# Maximum size of the dirstack
DIRSTACKSIZE=9

# Add the zsh & vim config directories to the dirstack
dirstack+=( "${DOTFILES}" "${ZDOTDIR}" "${VIMDOTDIR}" "${HOME}/Documents" )

# Displays the dirstack
alias dl="dirs -p"
