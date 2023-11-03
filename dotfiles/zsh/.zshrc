
# IntelliJ shortcut to use `idea` command to open files
export PATH=$PATH":/Applications/IntelliJ IDEA CE.app/Contents/MacOS"

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
plugins=(git)

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
source $ZSH/oh-my-zsh.sh

# ======================================
# JAVA PATHS
# ======================================

alias java20="export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-20.jdk/Contents/Home"
alias java17="export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
alias java11="export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"

# ======================================
# SCALA
# ======================================

alias scala2="scala-cli -S 2.13"
alias scala3="scala-cli -S 3.3"
alias sfmt="sbt scalafmtAll"

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
alias ls='ls -lah'
alias env='env | sort'
alias sed='gsed'                                                            # Use gsed instead of sed

alias zshrc="source ~/.zshrc"

alias pip='pip3'
alias python='python3'

# ======================================
# GIT
# ======================================

alias git-clean='git clean -X -f -d'
alias gst='git status'
alias glp='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'

# ======================================
# SBT
# ======================================

export SBT_OPTS='-Xmx2G'

alias sbt-no-ass-tests='sbt "set test in assembly := {}"'
alias sbt-test='sbt test it:test'
alias sbt-profile='sbt -Dsbt.task.timings=true'
