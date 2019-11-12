# dotfiles

I'm sick of setting up dotfiles over and over and trying to remember the things I
like. Hopefully, this will get me up and running on a new computer easy. It's
organized by platform on different branches. So far I only have a need for an Ubuntu
setup, but I'll add some more branches when the time comes.

The non-sudoer (like the cluster at work) case is not yet handled gracefully. You're 
better off running what you want manually out of the build script, for now. 

Features
--------
* zsh and oh-my-zsh
* Symlinks to config dotfiles
* A few CLI tools, like dive and xsv
* Some nice fonts, usually monospace ones
* Hyper configuration (terminal emulator)
* Vim configuration
* Terminal splash images!

## TODO
- [ ]  Add inventory of plugins included
- [ ]  Add flags to ignore fonts and sudo commands
- [ ]  Rename path_mods script
- [ ]  Add lazygit and gotop
- [ ]  Have stow ignore vim/colors/
- [ ]  Finish up vimrc (pull down the vim plugin managers, too)
- [ ]  Swap neovim for vim
