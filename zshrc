HISTFILE=${HOME}/.histfile
HISTSIZE=2000
SAVEHIST=5000
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit1"
DEFAULT_USER="wheely"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(extract git fbterm history-substring-search mercurial ssh-agent sudo archlinux cp mosh npm pip python rake screen systemd autojump yeoman grunt mvn gibo todo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:${HOME}/.gem/ruby/2.1.0/bin:${HOME}/.gem/ruby/1.9.1/bin:${HOME}/bin:/opt/android-sdk/tools:/opt/android-sdk/platform-tools:${HOME}/dotfiles/gibo
#export PATH=$PATH:/home/wheely/.cabal/bin
export CLASSPATH=$CLASSPATH:/usr/share/java/bsh.jar

export EDITOR="vim"

export PYTHONSTARTUP="${HOME}/Applications/pythonstartup.py"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"

# Enabling cheat syntax highlighting
export CHEATCOLORS=true

# Display the current RVM ruby selection
#PS1="\$(/usr/local/rvm/bin/rvm-prompt) $PS1"

# RVM bash completion
#[[ -r /usr/local/rvm/scripts/completion ]] && . /usr/local/rvm/scripts/completion

#rbenv
eval "$(rbenv init -)"

if [ "$TERM" = "linux" ]; then
    eval $(dircolors /usr/share/dircolors/dircolors.ansi-universal)
fi

alias vim="stty stop '' -ixoff ; vim"
alias vi="vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
if [ -f /etc/lsb-release ]; then
    DISTRO=Debian
else
    DISTRO=ArchLinux
fi

alias apt-get='noglob sudo apt-fast'
if [[ ${DISTRO} == "ArchLinux" ]]; then
    alias sysupd='yaourt -Syua'
    alias setup='yaourt -S'
    alias syscl='sudo pacman -Sc'
    alias uninstl='sudo pacman -Rs'
elif [[ ${DISTRO} == "Debian" ]]; then
    alias sysupd='apt-get update;apt-get dist-upgrade'
    alias setup='apt-get install'
    alias syscl='apt-get autoremove && apt-get autoclean'
    alias uninstl='apt-get purge'
    source ${HOME}/.gvm/scripts/gvm
fi

alias aria2c="aria2c --conf-path=${HOME}/dotfiles/aria2/aria2.conf --dir=${HOME}/Downloads/aria2"
alias wifi='sudo create_ap -w 2 wlp0s19f2u5 enp2s0 FeedAndy@Arch 15986934907'
alias reboot='sudo reboot'
alias sv='sudo vim'
alias bsh='java bsh.Interpreter'
alias gbsh='java bsh.Console'
alias tomcat='sudo systemctl start tomcat7'
alias cat_end='sudo systemctl stop tomcat7'
alias cat_restart='sudo systemctl restart tomcat7'
alias vz='vim ${HOME}/.zshrc'
alias duff='duff -r -f '%n''
alias irc='irssi'
alias wine_setting='winetricks'
alias gcc='gcc -Wall -std=c99'
alias visudo='sudo visudo'
alias rake='noglob rake'
alias you-get="you-get -o /home/wheely/Videos/"
alias you-see="you-get -p cvlc"
alias proxy='export http_proxy="http://127.0.0.1:8087";export https_proxy="https://127.0.0.1:8087"'
alias w32gcc="i686-w64-mingw32-gcc -static-libgcc"
alias w32g++="i686-w64-mingw32-g++ -static -lpthread"
alias sogou='you-get --sogou-proxy=0.0.0.0:50106'
#alias cabal='/home/wheely/.cabal/bin/cabal'
alias grep='grep --color=always'
alias refont='fc-cache -vf'
alias cowsay='fortune | cowsay'
alias ci='picoc -i'
alias rdesktop='rdesktop -x l -z -P -g 100%'
alias fys='fanyi "$(xsel)"'   # translate selected words by fanyi
alias say='espeak'
alias rbs='proxychains rainbowstream'

# alias -s c='vi'
#alias -s py='vi'
alias -s cpp='vi'
alias -s htm='vi'
alias -s txt='vi'
#alias -s js='vi'
alias -s hs='vi'
alias -s md='vi'
alias -s markdown='vi'

alias -g xs='"$(xsel)"'   # get selected texts

source ${HOME}/.autoenv/activate.sh
source ${HOME}/bin/util.zsh

poorvpn() {
    sudo sshuttle --dns -vvr $@ 0.0.0.0/0
}

todo.sh() {
    if (( ! $# )); then
        /usr/bin/todo.sh ls
    else
        /usr/bin/todo.sh $@
    fi
}
alias t='todo.sh'

# colored man page
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

