#!/usr/bin/env bash

dir=~/dotfiles
bkdir=~/dotfiles_bk
files="zshrc aria2 autoenv pip tty.js"

echo "Creating ${bkdir} for backup of any existing dotfiles in ~"
mkdir -p ${bkdir}
echo "...done"

for file in ${files}; do
    echo "Moving existing .${file} from ~ to ${bkdir}"
    mv ~/.${file} ${bkdir}/
    echo "Creating symlink to ${file} in ~"
    ln -s ${dir}/${file} ~/.${file}
done

echo "Finished"
