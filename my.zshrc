# Path to your oh-my-zsh installation.
export ZSH=/Users/piao/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git osx)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
# alias vi='vim'
alias vi='/usr/bin/vim'  # /usr/bin/vim 自带vim version 7.3
alias grep='grep --color=auto'
alias -s py=vi  # 在命令行直接输入python文件,会在vim中打开
alias -s txt=vi
alias -s go=vi
alias -s c=vi
alias -s php=vi
alias -s js=vi
alias -s gz='tar -xzvf'
alias vim='/usr/local/Cellar/vim/8.0.0604/bin/vim'  # brew install vim  version 8.0

#export GOROOT=/usr/local/Cellar/go/1.6.3/libexec
#export GOROOT=/usr/local/Cellar/go/1.8.3/libexec
#export GOROOT=/usr/local/Cellar/go/1.9/libexec
export GOROOT=/usr/local/Cellar/go/1.10/libexec
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/data/golang/server
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/piao/data/golang/server/bin:/usr/local/go/bin:/usr/local/opt/go/libexec/bin

# tmux
tmux_init()
{
    tmux new-session -s "kumu" -d -n "local"    # 开启一个会话
    tmux new-window -n "other"                  # 开启一个窗口
    tmux split-window -h                        # 开启一个竖屏
    tmux split-window -v "top"                  # 开启一个横屏,并执行top命令
    tmux -2 attach-session -d                   # tmux -2强制启用256color，连接已开启的tmux
}

# 判断是否已有开启的tmux会话，没有则开启
if which tmux 2>&1 >/dev/null; then
    test -z "$TMUX" && (tmux attach || tmux_init)
fi
# tmux

# Homebrew Bottles源
# echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
# source ~/.zshrc
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# homebrew默认源
# cd "$(brew --repo)"
# git remote set-url origin git://mirrors.ustc.edu.cn/brew.git
# homebrew-core源
# homebrew-core是Homebrew的核心软件仓库，收录了大部分的常用软件。
# cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
# git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git

# brew install android-sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# /Users/piao/data/erlang/rebar3
#export PATH=/Users/piao/data/erlang/rebar3/:$PATH
export PATH=/Users/piao/.cache/rebar3/bin:$PATH
#export PATH=/usr/local/Cellar/erlang/19.0.2/bin/:$PATH
export PATH=/usr/local/Cellar/erlang/20.0.5/bin/:$PATH
export ERL_LIBS=/Users/piao/data/erlang/proper

#curl https://cheat.sh/:zsh > ~/.zsh.d/_cht
fpath=(~/.zsh.d/ $fpath)
alias cht.sh='~/.zsh.d/cht.sh'
