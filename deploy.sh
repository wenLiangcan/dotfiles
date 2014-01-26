#!/usr/bin/env bash

dir=${HOME}/dotfiles
bkdir=${HOME}/dotfiles_bk
files="autoenv oh-my-zsh pip tty.js zshrc"

echo "Creating ${bkdir} for backup of any existing dotfiles in ~"
mkdir -p ${bkdir}
echo "...done"

for file in ${files}; do
    if [ -f ${HOME}/.${file} ]; then
        echo "Moving existing .${file} from ~ to ${bkdir}"
        mv ${HOME}/.${file} ${bkdir}/
    fi
    echo "Creating symlink to ${file} in ~"
    ln -s ${dir}/${file} ${HOME}/.${file}
done

#deploy oh-my-zsh custom plugins
mkdir -p "${HOME}/.oh-my-zsh/custom"
ln -s "${dir}/zsh_plugins" "${HOME}/.oh-my-zsh/custom/plugins"

#pretty git log alia: git lg
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

mkdir -p "${dir}/zsh_plugins/gibo"
ln -s "${dir}/gibo/gibo-completion.zsh" "${dir}/zsh_plugins/gibo/gibo.plugin.zsh"

echo "Finished"
