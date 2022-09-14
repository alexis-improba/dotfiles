# Author: Alexis Moins
# Creation: 30 octobre 2020

# Enters command mode
bindkey '^A' vi-cmd-mode

# Enters command mode (from visual mode)
bindkey -M visual '^A' vi-cmd-mode

# Cycles through history backward
bindkey '^P' up-line-or-search

# Cycles through history forward
bindkey '^N' down-line-or-search

# Removes the character just before the cursor (backspace)
bindkey '^?' backward-delete-char

# Removes the word before the cursor
bindkey '^W' backward-kill-word

# Removes every character before the cursor
bindkey '^U' backward-kill-line

# Removes every character after the cursor
bindkey '^K' kill-line

# Pulls the current line, executes a command then push the line back
bindkey '^B' push-line-or-edit

# Resumes the last process sent to the background
bindkey -s '^Z' 'fg^M'

# Restore the previously saved tmux session
bindkey -s '^O' 'tmux-restore-session^M'

# Save the current tmux session
bindkey -s '^X' 'tmux-save-session^M'

# Loads the zle-command-line function as a widget
autoload edit-command-line && zle -N edit-command-line

# Edit the current line in vim
bindkey -M vicmd '^F' edit-command-line

# Edit the current line in vim
bindkey '^F' edit-command-line

# Loads the completion list module (makes menuselect available)
zmodload zsh/complist

# Selects the completion on the left
bindkey -M menuselect 'h' vi-backward-char

# Selects the completion at the bottom
bindkey -M menuselect 'j' vi-down-line-or-history

# Selects the completion at the top
bindkey -M menuselect 'k' vi-up-line-or-history

# Selects the completion on the right
bindkey -M menuselect 'l' vi-forward-char

# Changes cursor to blinking underscore
clear_right_prompt() {
    RPROMPT=""
}

# Executes the clear_right_prompt function before each prompt
precmd_functions+=( clear_right_prompt )

# Change the right prompt according to the current vim mode
function zle-keymap-select() {
    case ${KEYMAP} in
        (vicmd) 
            # Command mode
            RPROMPT="%F{10} -- COMMAND -- %f" ;;
        (viins|main)
            # Insert | Normal mode
            RPROMPT="" ;;
    esac

    # Refresh prompt
    zle reset-prompt
}

# Loads the widget that manages the vi mode indicator
zle -N zle-keymap-select
