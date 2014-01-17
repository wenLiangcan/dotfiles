#!/usr/bin/env bash

dir=~/dotfiles
bkdir=~/dotfiles_bk
files="zshrc"
folders="aria2 autoenv pip"

echo "Creating ${bkdir} for backup of any existing dotfiles in ~"
mkdir -p ${bkdir}
echo "...done"

for file in ${files}; do
    echo "Moving existing .${file} from ~ to ${bkdir}"
    mv ~/.${file} ${bkdir}/
    echo "Creating symlink to ${file} in ~"
    ln -s ${dir}/${file} ~/.${file}
done

for folder in ${folders}; do
    echo "Moving existing .${folder} from ~ to ${bkdir}"
    mv -f ~/.${folder} ${bkdir}/
    echo "Creating symlink to ${folder} in ~"
    ln -s ${dir}/${folder} ~/.${folder}
done

echo "Finished"
