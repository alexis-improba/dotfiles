set -o vi

#
# Functions
#
add_path() {
    # Empty directory name
    [[ -z "${1}" ]] && return 0

    # Directory does not exist
    [[ ! -d "${1}" ]] && return 0

    # Directory is already in path
    [[ "${PATH}" == *"${1}"* ]] && return 0

    # echo "added ${1} to path"
    export PATH="${1}:${PATH}"
}

take() {
    mkdir -p "${1}" && cd "${1}"
}

activate() {
    local script="$(fd --no-ignore --hidden "activate$")"

    [[ -z "${script}" ]] && echo "<activate> script not found" && return 1
    source "${script}"
}

is_executable() {
    local executable="$(which "${1}")"
    [[ -n "${executable}" ]] && return 0 || return 1
}

H() {
    selected="$(history | awk '{$1=""; print $0}' | awk '!seen[$0]++' | gum filter)"

    if [[ -n "${selected}" ]]; then
        echo ${selected}
        command ${selected}
    fi
}

#
# PATH
#
add_path "/opt/homebrew/bin"

add_path "${HOME}/scripts"
add_path "${HOME}/.local/bin"

add_path "${HOME}/.bun/bin"
add_path "${HOME}/.cargo/bin"

add_path "${HOME}/.local/share/bob/nvim-bin"

#
# ENVIRONMENT
#
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"
export EDITOR="nvim"

#
# gum
#
export GUM_FILTER_MATCH_FOREGROUND="2"
export GUM_FILTER_PROMPT_FOREGROUND="7"
export GUM_FILTER_INDICATOR_FOREGROUND="1"

export GUM_FILTER_SELECTED_PREFIX_FOREGROUND="4"
export GUM_FILTER_UNSELECTED_PREFIX_FOREGROUND="#6e738d"

export GUM_FILTER_INDICATOR=">"

export GUM_PAGER_HELP_FOREGROUND="#6e738d"
export GUM_PAGER_LINE_NUMBER_FOREGROUND="#6e738d"

#
# pm
#
export PM_HOME="${HOME}/git"
export PM_SHOW_CMD="bat"

export PM_VITE_CMD="bun"
export PM_VITE_TEMPLATE="vue-ts"

export PM_GO_USERNAME="alexis-moins"

#
# mise
#
export MISE_USE_TOML=1
#
#
# Tools config
#
is_executable starship && eval "$(starship init bash)"
is_executable zoxide && eval "$(zoxide init bash)"

is_executable mise && eval "$(mise activate bash)"

#
# Aliases
#
alias gs="git status --short"

alias gA="git add -A"
alias ga="git-add"

alias gR="git-restore"
alias gr="git-restore-staged"

alias gp="git pull"
alias gP="git push"

alias gd="git-diff"
alias gds="git-diff-staged"

alias gl="git log"
alias gw="git-switch-branch"

alias gc="git switch --create"

alias ta="tmux attach"
alias dk="docker"

alias nvimrc="nvim ${HOME}/.config/nvim/init.lua"

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

alias mkdir="mkdir -p"

# Perform the daily brew checkout
alias daily="brew update; brew upgrade; brew cleanup"

# Never display colors
alias fd="fd --color=never"

alias ls="eza --git-ignore"
alias la="eza --all"
alias ll="eza --all --long --git"
alias tree="eza --tree --git-ignore"

alias session="nvim -S"

alias j="just"

alias psql="docker exec -it postgres psql"

# Easier directory navigation
alias ..="cd .."
alias ...="cd .. && cd .."

alias de="dot-edit"
alias se="script-edit"
