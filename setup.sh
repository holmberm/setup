#!/bin/sh
# Setup script for freebsd and gentoo. 
# Fetches config files from github and sets up directories and symlinks.

# prepare directory structure
cd $HOME
if [ -d .myconfig/ ]; then
    mv .myconfig myconfig.old
fi

if [ -d .fluxbox/ ]; then
    mv .fluxbox fluxbox.old
fi

if [ -d .xmonad/ ]; then
    mv .xmonad xmonad.old
fi

# This seems completely retarded.
# if [ -d .ssh/ ]; then
#     mv .ssh ssh.old
# fi

# Don't think I want a common .emacs.d, what with all the backup files.
# if [ -d .emacs.d/ ]; then
#     mv .emacs.d .emacs.d~
# fi

# Because BSD ln can't backup files, do it manually.
if [ -f .bash_profile ]; then
    mv .bash_profile bash_profile.old
fi
if [ -f .bashrc ]; then
    mv .bashrc bashrc.old
fi
if [ -f .conkyrc ]; then
    mv .conkyrc conkyrc.old
fi
if [ -f .conkyrc_x ]; then
    mv .conkyrc_x conkyrc_x.old
fi
if [ -f .emacs ]; then
    mv .emacs emacs.old
fi
if [ -f .gitconfig ]; then
    mv .gitconfig gitconfig.old
fi
if [ -f .screenrc ]; then
    mv .screenrc screenrc.old
fi
if [ -f .tmux.conf ]; then
    mv .tmux.conf tmux.conf.old
fi
if [ -f .Xresources ]; then
    mv .Xresources Xresources.old
fi
if [ -f .emacs.d/custom-functions.el ]; then
    mv .emacs.d/custom-functions-old.el
fi
if [ -f .ssh/config ]; then
    mv .ssh/config sshConfig.old
fi

# clone config files
git clone git@github.com:holmberm/myconfig.git
mv myconfig .myconfig

# links to files
ln -sf .myconfig/.bash_profile .
ln -sf .myconfig/.bashrc .
ln -sf .myconfig/.conkyrc .
ln -sf .myconfig/.conkyrc_x .
ln -sf .myconfig/.emacs .
ln -sf .myconfig/.gitconfig .
ln -sf .myconfig/.screenrc .
ln -sf .myconfig/.tmux.conf .
ln -sf .myconfig/.Xresources .
ln -sf $HOME/.myconfig/ssh/config .ssh/
ln -sf $HOME/.myconfig/custom-functions.el .emacs.d/

# links to directories
ln -sf .myconfig/.fluxbox .
ln -sf .myconfig/.xmonad .

