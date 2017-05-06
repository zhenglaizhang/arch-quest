# Path to your oh-my-zsh installation.  
export ZSH=/home/$USER/.oh-my-zsh 
export TERM="xterm-256color"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# export POWERLINE_NO_ZSH_ZPYTHON=1
ZSH_THEME="afowler"

# source /usr/local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# set mail check interval as 0 to disable mail checking
MAILCHECK=0

HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt HIST_NO_STORE             # Don't store function definitions.

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(archlinux git docker sbt gradle mvn autojump colorize colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

export PATH="/home/$USER/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/home/$USER/.local/bin"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vi="vim"
alias o="open"
alias og="open https://github.com/zhenglaizhang" 
alias oz="open http://zhenglaizhang.net"
alias gs="git status"
alias t="tmux"
alias tailf="tail -f"
alias ping="ping -c 6"
alias dm="docker-machine"
alias dk="docker"
alias cls="clear"
alias cppath="pwd|pbcopy"
alias cat="pygmentize -g"
alias removeDeps="yaourt -Qdt"
alias pc="proxychains -q"


# better development experience
alias ruby="ruby -w"

# For big data
export HBASE_HOME=/usr/local/opt/hbase/libexec

# Turn on Jekyll verbose logging 
export JEKYLL_LOG_LEVEL=debug

eval "$(hub alias -s)"

bindkey '^p' autosuggest-accept
bindkey '^r' autosuggest-execute

# fpath=(/usr/local/share/zsh-completions $fpath)

# source ~/.tmuxinator.zsh
#eval "$(rbenv init -)"

export RI="--format ansi --width 70"

DEFAULT_USER="$USER"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/$USER/.sdkman"
#[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"

# JVM related tools alias
alias jps="jps -mlvV"

# common alias
alias ll="la"
# alias python=python3
# alias py=python3
alias py=python
alias scala=scala -Dscala.color=true

# git alias
alias g="tig"
alias gst="git status"
alias ga="git add "
alias gr='cd $(git rev-parse --show-toplevel)'
alias gd="git diff "
alias gdc="git diff --cached"
alias gaa="git add ."
alias gcam="git add .;git commit -am "
alias gci="git commit"
alias gcim="git commit -m"
alias gplom="proxychains git pull origin master --rebase"
alias gploo="proxychains git pull origin order --rebase"
alias gplod="proxychains git pull origin dev --rebase"
alias gphom="proxychains git push origin master"
alias gphoo="proxychains git push origin order"
alias gphod="proxychains git push origin dev"
alias gpho="proxychains git push origin"
alias gplo="proxychains git pull origin"
alias gmr="git merge"

# sbt alias
alias run="sbt run"
alias runm="sbt runMain"
alias validate="sbt validate"
alias tt="sbt test"
alias tto="sbt testOnly"
alias vcc="open target/scala-2.11/scoverage-report/index.html"
alias co="sbt compile"

# common alias
alias free="free -hw"
alias df="df -h"
alias pac="sudo pacman -S --needed "
alias ss="sudo sslocal -d start -c /etc/shadowsocks/config.json"
alias vpn="sudo openfortivpn" 
# back to previous folder 
#   cd -
#   popd
# type path directly
# return last command
#   r


# brew services
# stKafka="brew services start zookeeper & brew services start kafka"

# finder alias
alias f="vifm"


export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxMetaspaceSize=512M -XX:MetaspaceSize=512M -Xms1G -Xmx2G"


# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.secrets
