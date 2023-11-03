alias nvimrc 'nvim $HOME/.config/nvim/init.lua'

# Active a python virtual env
alias activate 'source (fd activate.fish .venv)'

alias ... 'cd .. && cd ..'

# Copy stuff verbosely (-v) and ask for confirmation (-i)
alias cp 'cp -iv'

# Rename / move stuff verbosely (-v) and ask for confirmation (-i)
alias mv 'mv -iv'

# Remove stuff verbosely (-v) and ask for confirmation (-i)
alias rm 'rm -iv'

# Perform the daily brew checkout
alias daily 'brew update; brew upgrade; brew cleanup'

# Never display colors
alias fd 'fd --color="never"'

alias mkdir 'mkdir -p'

alias ls 'exa --git-ignore'

alias la 'exa --all'

alias ll 'exa --all --long --git'

alias tree 'exa --tree --git-ignore'

alias session 'nvim -S'

alias rg 'rg --smart-case'

alias ci git-commit

alias gc 'git-resolve-conflict'
