# Libraries
# =========

[[ -f /etc/bashrc ]] && source /etc/bashrc

[[ -f /etc/bash_completion ]] && source /etc/bash_completion

# Unsets
# ======

unset LS_COLORS
unset PROMPT_COMMAND

# Unalias
# =======

unalias ls 1>/dev/null 2>/dev/null

# Exports
# =======

export PATH="${HOME}"/bin:"${PATH}"
export PS1="\u@\h> "

# Functions
# =========

function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

# FZF
# ===

[[ -f $HOME/.fzf.bash ]] && source $HOME/.fzf.bash
