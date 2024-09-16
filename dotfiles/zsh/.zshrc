
# Pycharm shortcut to use `pycharm` command to open files
export PATH=$PATH":/Applications/PyCharm CE.app/Contents/MacOS"

# ======================================
# ZSH settings 
# ======================================

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"
ZSH_THEME="muse"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git command-not-found history)

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
source $ZSH/oh-my-zsh.sh

# ======================================
# JAVA PATHS
# ======================================

alias java21="export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"
alias java17="export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
alias java11="export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"
alias java8="export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"

# ======================================
# HOMEBREW
# ======================================

# Enable autocomplete. Source: `https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh`
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi


# ======================================
# ALIASES
# ======================================

# Better command defaults
alias ...='cd ../..'
alias ....='cd ../../..'

alias env='env | sort'

alias pip="pip3"
alias python="python3"

alias zshrc="source ~/.zshrc"

# ======================================
# Newer utilities and backup old aliases
# ======================================
alias du=dust
alias old_du="/usr/bin/du"
alias find="fd -c always"
alias old_find="/usr/bin/find"
alias grep="rg -p"
alias old_grep="/usr/bin/grep"
alias cat="bat -f"
alias ps="procs -c always --tree"
alias ping=gping
alias sed="gsed"
alias old_sed="/usr/bin/sed"
alias old_man="/usr/bin/man"
alias man=tldr
alias ls="eza -all"
alias old_ls="/usr/bin/ls"

# ======================================
# GIT
# ======================================

alias git-clean='git clean -X -f -d'
alias gst='git status'
alias glp='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'

# ======================================
# oh-my-posh theme
# ======================================

if command -v oh-my-posh &> /dev/null
then
    eval "$(oh-my-posh init zsh --config ~/bin/oh-my-posh/themes/tiwahu.omp.json)"
fi
