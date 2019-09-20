# This should be idempotent.

# Grab oh-my-zsh and install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh install.sh

# stow everything
# stow zsh vim hyper

# clone fonts
mkdir fonts
pushd fonts
git clone git@github.com:source-foundry/Hack.git
git clone git@github.com:adobe-fonts/source-code-pro.git
git clone git@github.com:IBM/plex.git


# build fonts



# alias vim to nvim

