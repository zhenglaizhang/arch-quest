# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=/home/zhenglai/.oh-my-zsh

# `theme name` or `random`
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# use case-sensitive completion.
# CASE_SENSITIVE="true"

# use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# set mail check interval as 0 to disable mail checking
MAILCHECK=0

# if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Dont write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Dont execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt HIST_NO_STORE             # Dont store function definitions.



# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    archlinux
    git
    docker
    sbt
    gradle
    mvn
    ruby
    rails
    autojump
    colorize
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zalias


eval "$(hub alias -s)"

bindkey '^p' autosuggest-accept
bindkey '^r' autosuggest-execute


# Opts
export RI="--format ansi --width 70"
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxMetaspaceSize=512M -XX:MetaspaceSize=512M -Xms1G -Xmx2G"


# local .secrets 
source ~/.secrets


export PATH="/home/$USER/.bin:/home/$USER/.local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export LANG=en_US.UTF-8
export EDITOR="vim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# export SSH_KEY_PATH="~/.ssh/rsa_id"

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
