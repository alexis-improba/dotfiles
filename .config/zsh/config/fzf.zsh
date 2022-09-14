# Author: Alexis Moins
# Creation: 16 jan 2022

# fzf highlighting
highlighting='bg:0,bg+:0,prompt:6,border:7,pointer:1,marker:1,fg:8,fg+:7,hl:2,hl+:2,info:5'

# {{{ exports

# Show fzf in a tmux popup window
export FZF_TMUX_OPTS="-p85%,70%"

# Default options for fzf
export FZF_DEFAULT_OPTS="--multi --height 99% --layout=reverse --color ${highlighting} --preview-window=border-none"

# Command executed by fzf to look for files
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude=.git'

export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# Command executed by fzf to change directory
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# }}}

unset highlighting

# Fuzzy completion for files and directories using **<TAB>
source "${BREW}/opt/fzf/shell/completion.zsh" 2> /dev/null

# Fuzzy completion for files (CTRL-T) and history (CTRL-R)
source "${BREW}/opt/fzf/shell/key-bindings.zsh"

# Rebind file search to '^Y'
bindkey -r '^T' && bindkey '^Y' fzf-file-widget

# Rebind history search to '^H'
bindkey -r '^R' && bindkey '^H' fzf-history-widget

# Rebind directory navigation to '^G'
bindkey -r '\ec' && bindkey '^G' fzf-cd-widget

bindkey -s '^K' '$(_gh)^M'
