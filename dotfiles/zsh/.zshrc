# ======================================
# HOMEBREW
# ======================================

# `brew shellenv` is run from .zprofile, so brew is already on PATH here.
# Resolve the prefix once; each `brew --prefix` call spawns a subprocess.
if type brew &>/dev/null; then
    BREW_PREFIX="$(brew --prefix)"
fi

# ======================================
# HISTORY
# ======================================

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY          # Record the timestamp of each command
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not on exit
setopt SHARE_HISTORY             # Share history between concurrent shells
setopt HIST_IGNORE_ALL_DUPS      # Keep only the most recent copy of a duplicated command
setopt HIST_IGNORE_SPACE         # Do not record commands that start with a space
setopt HIST_REDUCE_BLANKS        # Strip superfluous whitespace before recording
setopt HIST_VERIFY               # Expand a history reference rather than running it directly

# ======================================
# COMPLETIONS
# ======================================

if [[ -n "$BREW_PREFIX" ]]; then
    FPATH="$BREW_PREFIX/share/zsh-completions:$BREW_PREFIX/share/zsh/site-functions:$FPATH"
fi

# Completions dropped here by tools that install their own.
[[ -d ~/.zsh/completions ]] && FPATH="$HOME/.zsh/completions:$FPATH"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit

# Suggest an install when a command is not found
if [[ -r "$BREW_PREFIX/Library/Taps/homebrew/homebrew-command-not-found/handler.sh" ]]; then
    source "$BREW_PREFIX/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
fi

# ======================================
# JAVA
# ======================================

# Only the current LTS is installed; see the Brewfile.
if /usr/libexec/java_home -v 25 &>/dev/null; then
    export JAVA_HOME="$(/usr/libexec/java_home -v 25)"
fi

# ======================================
# ALIASES
# ======================================

# Better command defaults
alias ...='cd ../..'
alias ....='cd ../../..'

alias env='env | sort'

alias zshrc="source ~/.zshrc"

# Newer utilities, keeping the originals reachable
alias du=dust
alias old_du="/usr/bin/du"
alias find="fd -c always"
alias old_find="/usr/bin/find"
alias grep="rg -p"
alias old_grep="/usr/bin/grep"
alias cat="bat -f"
alias old_cat="/bin/cat"
alias ps="procs -c always --tree"
alias old_ps="/bin/ps"
alias ping=gping
alias old_ping="/sbin/ping"
alias sed="gsed"
alias old_sed="/usr/bin/sed"
alias man=tldr
alias old_man="/usr/bin/man"
alias ls="eza --all"
alias old_ls="/bin/ls"

# ======================================
# GIT
# ======================================

alias git-clean='git clean -X -f -d'
alias gst='git status'
alias glp='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'''

# ======================================
# CODING AGENTS
# ======================================

if type gh &>/dev/null; then
    github_token="$(gh auth token 2>/dev/null)"
    [[ -n "$github_token" ]] && export GITHUB_TOKEN="$github_token"
    unset github_token
fi

export SECRET_FILE="${SECRET_FILE:-$HOME/.dotfiles/secret.zsh}"
#if type op &>/dev/null && [[ -r "$SECRET_FILE" ]]; then
#    alias claude='op run --env-file="$SECRET_FILE" -- claude'
#    alias codex='op run --env-file="$SECRET_FILE" -- codex'
#fi

# ======================================
# KUBERNETES
# ======================================

alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# Generating the completion costs ~100ms, so cache it and refresh only when
# the kubectl binary is newer than the cache.
if type kubectl &>/dev/null; then
    kubectl_completion=~/.cache/zsh/kubectl_completion
    if [[ ! -r "$kubectl_completion" || $(command -v kubectl) -nt "$kubectl_completion" ]]; then
        mkdir -p "${kubectl_completion:h}"
        kubectl completion zsh > "$kubectl_completion"
    fi
    source "$kubectl_completion"
    compdef __start_kubectl k
    unset kubectl_completion
fi

# ======================================
# TOOL INITIALISATION
# ======================================

# Fuzzy finder; provides Ctrl-R history search and Ctrl-T file search
if type fzf &>/dev/null; then
    source <(fzf --zsh)
fi

# Smarter `cd`, invoked as `z`
if type zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# Prompt. The theme is stowed from dotfiles/oh-my-posh.
if type oh-my-posh &>/dev/null && [[ -r ~/.config/oh-my-posh/theme.omp.json ]]; then
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.omp.json)"
fi

# ======================================
# PLUGINS
# ======================================

# Syntax highlighting must be sourced last so it wraps the final widget set.
autosuggestions="$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
highlighting="$BREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

[[ -r "$autosuggestions" ]] && source "$autosuggestions"
[[ -r "$highlighting" ]] && source "$highlighting"

unset autosuggestions highlighting
