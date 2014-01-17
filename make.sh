#!/usr/bin/env bash

dir=~/dotfiles
bkdir=~/dotfiles_bk
files="aria2 autoenv oh-my-zsh pip tty.js zshrc"

echo "Creating ${bkdir} for backup of any existing dotfiles in ~"
mkdir -p ${bkdir}
echo "...done"

for file in ${files}; do
    echo "Moving existing .${file} from ~ to ${bkdir}"
    mv ~/.${file} ${bkdir}/
    echo "Creating symlink to ${file} in ~"
    ln -s ${dir}/${file} ~/.${file}
done

#deploy oh-my-zsh custom plugins
ln -s "${dir}/zsh_plugins" "~/.oh-my-zsh/custom/plugins"

echo "Finished"
