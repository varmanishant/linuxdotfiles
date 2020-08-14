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

unalias ls

# Exports
# =======

export PATH="${HOME}"/bin:"${PATH}"
export PS1="$ "

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
