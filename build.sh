#!/bin/bash

################################
# Cody's Setup Builder.        #
# This *should* be idempotent. #
################################

# Install zsh
sudo apt install -y zsh

# Grab oh-my-zsh and install
# This will run the install script directly from stdin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# Install my favored oh-my-zsh theme
set ZSH_CUSTOM="~/.oh-my-zsh/custom"
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Install neovim and alias it to vim EDIT: for now, just vim
sudo apt install -y vim
# sudo apt install -y neovim

# Copy over the colorschemes I've collected
[ -d ~/.vim/colors ] || mkdir ~/.vim/colors
cp -r vim/colors/ ~/.vim/colors

# Install other things I like
sudo apt install -y screen tmux

# Stow my configurations. This generates symlinks.
# hyper auto-generates configs quite quickly, so I'm
# adopting the general pattern of mv + stow
sudo apt install -y stow
[ -d ~/.cody-builder-bkp ] || mkdir ~/.cody-builder-bkp
mv ~/.zshrc ~/.cody-builder-bkp && stow zsh
mv ~/.vimrc ~/.cody-builder-bkp && stow vim
mv ~/.hyper.js ~/.cody-builder-bkp && stow hyper

# Download custom fonts
[ -d fonts ] || mkdir fonts
pushd fonts
if [[ ! -d Hack ]]
then
    git clone -q git@github.com:source-foundry/Hack.git
fi

if [[ ! -d source-code-pro ]]
then
    git clone -q git@github.com:adobe-fonts/source-code-pro.git
fi

if [[ ! -d plex ]]
then
    git clone -q git@github.com:IBM/plex.git
fi
popd

# Install the fonts. Find all truetype font files and
# copy them over
[ -d ~/.fonts ] || mkdir ~/.fonts
find fonts/ -name '*.ttf' -exec cp {} ~/.fonts  \;

# Finally, change shell to zsh
chsh -s /bin/zsh
