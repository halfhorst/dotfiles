#!/bin/bash

################################
# This *should* be idempotent. #
################################

GREEN='\033[0;32m'
NC='\033[0m'

printf "\n${GREEN}Installing zsh and oh-my-zsh.${NC}\n"
sudo apt install -y zsh
# Grab oh-my-zsh and install
# This will run the install script directly from stdin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# Install my favored oh-my-zsh theme
set ZSH_CUSTOM="~/.oh-my-zsh/custom"
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

printf "\n${GREEN}Installing vim and copying over color schemes.${NC}\n"
sudo apt install -y vim
# sudo apt install -y neovim  # TODO: Alias install and alias nvim
# Copy over the colorschemes I've collected
[ -d ~/.vim/colors ] || mkdir -p ~/.vim/colors
cp -r vim/colors/ ~/.vim/colors

printf "\n${GREEN}Getting the vim package plugin managers.${NC}\n"
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "\n${GREEN}Installing Pathogen-managed plugins.${NC}\n"
git clone https://github.com/myusuf3/numbers.vim.git ~/.vim/bundle/numbers

# Install other things I like
# sudo apt install -y screen tmux

printf "\n${GREEN}Copying terminal splash logos.${NC}\n"
[ -d ~/.logos ] || mkdir ~/.logos
cp -r logos/. ~/.logos

printf "\n${GREEN}Cloning and installing xsv.${NC}\n"
# xsv is a command line tabular data tool
if [ ! -d ~/xsv ] 
then
    pushd ~
    git clone git://github.com/BurntSushi/xsv
    cd xsv
    cargo build --release
    popd
fi

printf"\n${GREEN}Installing dive.${NC}\n"
# dive lets you explore docker images
wget https://github.com/wagoodman/dive/releases/download/v0.8.1/dive_0.8.1_linux_amd64.deb
sudo apt install ./dive_0.8.1_linux_amd64.deb
rm dive_0.8.1_linux_amd64.deb

printf "\n${GREEN}Stowing configurations for zsh, vim and hyper.${NC}\n"
# Stow generates symlinks. hyper auto-generates configs quite quickly,
# so I'm adopting the general pattern of mv + stow.
sudo apt install -y stow
[ -d ~/.dotfile-builder-bkp ] || mkdir ~/.dotfile-builder-bkp
mv ~/.zshrc ~/.dotfile-builder-bkp && stow zsh
mv ~/.vimrc ~/.dotfile-builder-bkp && stow vim
mv ~/.hyper.js ~/.dotfile-builder-bkp && stow hyper

# Download custom fonts

printf "\n${GREEN}Downloading and installing custom fonts.${NC}\n"
sudo apt install -y fonts-powerline  # for agnoster oh-my-zsh theme

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

# Install by finding all truetype font files and copying them over
[ -d ~/.fonts ] || mkdir ~/.fonts
find fonts/ -name '*.ttf' -exec cp {} ~/.fonts  \;

printf "\n${GREEN}Changing shell to zsh.${NC}\n"
chsh -s /bin/zsh $USER

