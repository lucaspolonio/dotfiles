# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx ruby sublime elixir)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export EDITOR='vim'
export GOPATH=$HOME/go

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH=$PATH:$(npm root -g)
export PATH="$(yarn global bin):$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vim="mvim -v"
alias c="clear"
alias cat="bat"

# oh-my-zsh
set KEYTIMEOUT=10
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
source <(kubectl completion zsh)
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1) '$PS1 # https://github.com/jonmosco/kube-ps1#customization

# Ruby/Rails
eval "$(rbenv init -)"
alias be="bundle exec"
alias rs="be rails server"
alias rc="be rails console"
alias migrate="be rake db:migrate && RAILS_ENV=test be rake db:migrate"
alias clear_sidekiq="be rails runner 'Sidekiq::ScheduledSet.new.clear ; Sidekiq::RetrySet.new.clear ; Sidekiq::Queue.new.clear'"

# Git
export GPG_TTY=$(tty)
alias g="git"
alias gp="git pull"
alias gm="git merge"
alias gco="git checkout"
alias gc="git commit"
alias gd="git diff"
alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gcp="git cherry-pick"
alias gpu="git push origin HEAD"
alias gphm="git push heroku master"
alias grb="git branch --sort=-committerdate"

# ag / tag (https://github.com/aykamko/tag)
if (( $+commands[tag] )); then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias ag=tag
fi

# fzf (https://github.com/junegunn/fzf)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # use ag to pre-filter files, respecting .gitignore
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FPP_DISABLE_SPLIT=true # FFS disable spp splitting in vim

# Erlang / Elixir
export ERL_AFLAGS="-kernel shell_history enabled" # Save history across iex shells
alias mtw="mix test.watch"
alias ismtt="iex -S mix test --trace"

# asdf (version manager for Elixir, etc)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Kubernetes
alias k="kubectl"
alias ks=kube-shell
alias kc="kubectx"
alias ke="kubens"
