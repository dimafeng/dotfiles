#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

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
      if [ -L ~/.$file ]
      then
        rm ~/.$file
      else
        mv ~/.$file $olddir/
      fi

      echo "Creating symlink to $file in home directory."
      ln -s $dir/$file ~/.$file
    done
}

install_commons() {
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    TEMP_PATH_FOR_THEME=/tmp/dracula-theme
    rm -rf $TEMP_PATH_FOR_THEME
    mkdir $TEMP_PATH_FOR_THEME
    wget https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme -O ~/.oh-my-zsh/themes/dracula.zsh-theme
}

install_applications_mac() {
    sh brew.sh
}

case "$1" in
    link)
        link_configs
        ;;
    install)
        install_commons
        ;;
    install_app_mac)
        install_applications_mac
        ;;
esac
