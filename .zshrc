# Libraries
# =========

autoload -Uz compinit promptinit
autoload -U colors && colors
autoload -Uz add-zsh-hook

compinit
promptinit

# Settings
# ========

setopt autocd

PROMPT="%/ >>> "

if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi

bindkey -v

# X Terminal
# ==========


if [[ "${TERM}" = *xterm* ]] || [[ "${TERM}" = *256color* ]]; then

    # Prompt
    # ======

    PROMPT="%F{green}%/ %F{red}>%F{green}>%F{yellow}>%F{reset} "

    # Cursor Shape
    # ============

    echo -n -e "\x1b[5 q"

    # Title
    # =====

    function set-title-precmd() {
        printf "\e]2;%s\a" "Terminal"
    }

    function set-title-preexec() {
        printf "\e]2;%s\a" "Terminal"
    }

    autoload -Uz add-zsh-hook
    add-zsh-hook precmd set-title-precmd
    add-zsh-hook preexec set-title-preexec

fi

KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
    case "${KEYMAP}" in
        (vicmd) echo -n -e "\x1b[1 q" ;;
        (main|viins) echo -n -e "\x1b[5 q" ;;
        (*) echo -n -e "\x1b[5 q" ;;
    esac
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Key Setup
# =========

bindkey '^R' history-incremental-search-backward

bindkey -- "^[[A" up-line-or-history
bindkey -- "^[[B" down-line-or-history
bindkey -- "^[[C" forward-char
bindkey -- "^[[D" backward-char
bindkey -- "^[[H" beginning-of-line
bindkey -- "^[[F" end-of-line
bindkey -- "^[[1~" beginning-of-line
bindkey -- "^[[3~" delete-char
bindkey -- "^[[4~" end-of-line
bindkey -- "^[[5~" beginning-of-buffer-or-history
bindkey -- "^[[6~" end-of-buffer-or-history
bindkey -- "^[[1;5C" forward-word
bindkey -- "^[[1;5D" backward-word

# Aliases
# =======

alias root="sudo -s"

alias ll="ls -lrt"
alias python="python -q"

# Exports
# =======

export MANWIDTH=80

# Auto Completion
# ===============

zstyle ':completion:*' menu select

# History Settings
# ================

HISTFILE="${HOME}"/.commands
HISTSIZE=50
SAVEHIST=0
setopt append_history
setopt bang_hist
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

# Functions

is-function() {
    declare -f -F $1 > /dev/null
    return $?
}

start() {
    if [[ -f project.sh ]]; then
        (source project.sh; is-function run && run)
    fi
}

dirs=(
    "${HOME}"/linuxdotfiles/
    "${HOME}"/notes/
)

list-git-status() {
    git status --short "${dir}"
}

check-git-status() {
    for dir in "${dirs[@]}"; do
        (
            cd "${dir}" || continue
            echo "Directory: ${dir}"
            [[ -z $(git status -s) ]] || list-git-status
        )
    done
}

# Hacks
# =====

hacks="${HOME}/.hacks.sh"

if [[ -f "${hacks}" ]]; then
    source "${hacks}"
fi
