HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=5000
bindkey -v
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"
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
plugins=(git fbterm ssh-agent archlinux cp gem mosh npm pip python rake screen systemd autojump yeoman grunt mvn gibo)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.gem/ruby/1.9.1/bin:~/.gem/ruby/2.0.0/bin:~/bin:/opt/android-sdk/tools:/opt/android-sdk/platform-tools:~/dotfiles/gibo
export PATH=$PATH:/home/wheely/.cabal/bin
export CLASSPATH=$CLASSPATH:/usr/share/java/bsh.jar

export EDITOR="vim"

export PYTHONSTARTUP="~/Applications/pythonstartup.py"

export GIST_HOME="~/Documents/Programming/gists"

# Display the current RVM ruby selection
#PS1="\$(/usr/local/rvm/bin/rvm-prompt) $PS1"

# RVM bash completion
#[[ -r /usr/local/rvm/scripts/completion ]] && . /usr/local/rvm/scripts/completion

#rbenv
eval "$(rbenv init -)"

if [ "$TERM" = "linux" ]; then
		#fbterm byobu
        #echo -en "\e]P0222222" #black
        ##echo -en "\e]P8222222" #darkgray
        #echo -en "\e]P1803232" #darkred
        echo -en "\e]P9982b2b" #red
        ##echo -en "\e]P25b762f" #darkgreen
        #echo -en "\e]PA89b83f" #green
        ##echo -en "\e]P3aa9943" #brown
        echo -en "\e]PBefef60" #yellow
        ##echo -en "\e]P4324c80" #darkblue
        echo -en "\e]PC2b4f98" #blue
        ##echo -en "\e]P5706c9a" #darkmagenta
        ##echo -en "\e]PD826ab1" #magenta
        ##echo -en "\e]P692b19e" #darkcyan
        ##echo -en "\e]PEa1cdcd" #cyan
		echo -en "\e]P7ffffff" #lightgray
		echo -en "\e]PFdedede" #white
		#clear #for background artifacting
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

alias apt-get='noglob sudo apt-get'
if [[ ${DISTRO} == "ArchLinux" ]]; then
    alias sysupd='yaourt -Syua'
    alias setup='sudo pacman -S'
    alias syscl='sudo pacman -Sc'
    alias uninstl='sudo pacman -Rs'
elif [[ ${DISTRO} == "Debian" ]]; then
    alias sysupd='apt-get update && apt-get dist-upgrade'
    alias setup='apt-get install'
    alias syscl='apt-get autoremove && apt-get autoclean'
    alias uninstl='apt-get purge'
fi  

alias aria2c="aria2c --dir=${HOME}/Downloads/aria2"
alias wifi='sudo create_ap -w 2 wlp0s19f2u5 enp2s0 FeedAndy@Arch 15986934907'
alias reboot='sudo reboot'
alias sv='sudo vim'
alias bsh='java bsh.Interpreter'
alias gbsh='java bsh.Console'
alias tomcat='sudo systemctl start tomcat7'
alias cat_end='sudo systemctl stop tomcat7'
alias cat_restart='sudo systemctl restart tomcat7'
alias xl='python2 /home/wheely/Applications/xunlei-lixian/lixian_cli.py'
alias vz='vim ~/.zshrc'
alias duff='duff -r -f '%n''
alias irc='irssi'
alias wine_setting='winetricks'
alias gcc='gcc -Wall -std=c99'
alias visudo='sudo visudo'
alias rake='noglob rake'
alias you-get="you-get -o /home/wheely/Videos/"
alias w32gcc="i686-w64-mingw32-gcc -static-libgcc"
alias w32g++="i686-w64-mingw32-g++ -static -lpthread"
alias sogou='you-get --sogou-proxy=0.0.0.0:50106'
alias cabal='/home/wheely/.cabal/bin/cabal'
alias grep='grep --color=always'
alias sshuttle='sshuttle --dns -vvr'
alias ahk='ironahk'
alias refont='fc-cache -vf'
alias cowsay='fortune | cowsay'
alias c='picoc -i'

alias -s zip='7z x'
alias -s rar='7z x'
alias -s 7z='7z x'
#alias -s gz='tar -xzvf'
alias -s gz='lylyx'
alias -s bz2='tar -xjvf'
alias -s c='vi'
#alias -s py='vi'
alias -s cpp='vi'
alias -s htm='vi'
alias -s txt='vi'
#alias -s js='vi'
alias -s hs='vi'
alias -s md='vi'
alias -s markdown='vi'

source ~/.autoenv/activate.sh
