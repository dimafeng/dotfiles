#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

case "$1" in
    link)
        link_configs()
        ;;
    install)
        install_commons()
        ;;
    install_apps)
        install_applications()
        ;;
esac

link_configs() {
    dir=~/dotfiles                    # dotfiles directory
    olddir=~/dotfiles_old             # old dotfiles backup directory
    files="bashrc vimrc bash_profile functions aliases zshrc"    # list of files/folders to symlink in homedir

    ##########

    # create dotfiles_old in homedir
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
    echo "...done"

    # change to the dotfiles directory
    echo "Changing to the $dir directory"
    cd $dir
    echo "...done"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
    for file in $files; do
        #echo "Moving any existing dotfiles from ~ to $olddir"
        #mv ~/$file ~/dotfiles_old/
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done
}

install_commons() {
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
}

install_applications_mac() {
    sh brew.sh 
}
