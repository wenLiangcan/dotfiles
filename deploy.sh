#!/usr/bin/env bash

dir=~/dotfiles
bkdir=~/dotfiles_bk
files="aria2 autoenv oh-my-zsh pip tty.js zshrc"

echo "Creating ${bkdir} for backup of any existing dotfiles in ~"
mkdir -p ${bkdir}
echo "...done"

for file in ${files}; do
    if [ -f ~/.${file} ]; then
        echo "Moving existing .${file} from ~ to ${bkdir}"
        mv ~/.${file} ${bkdir}/
    fi
    echo "Creating symlink to ${file} in ~"
    ln -s ${dir}/${file} ~/.${file}
done

#deploy oh-my-zsh custom plugins
ln -s "${dir}/zsh_plugins" "~/.oh-my-zsh/custom/plugins"

#pretty git log alia: git lg
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

mkdir -p "${dir}/zsh_plugins/gibo"
ln -s "${dir}/gibo/gibo-completion.zsh" "${dir}/zsh_plugins/gibo/gibo.plugin.zsh"

echo "Finished"
