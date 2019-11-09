# dotfiles

I work on serveral different computers and never quite got my Ubuntu setup the same
between them. I got sick of the different configurations and built an idempotent
shell script that will get me up-and-running with a basic setup. So far I only have
a need for an Ubuntu setup, but I'll add some more branches when the time comes.

The non-sudoer (like the cluster at work) case is not yet handled gracefully. You're 
better off running what you want manually out of the build script, for now. 

General Activities
------------------
* gives me zsh and oh-my-zsh
* symlinks config dotfiles
* installs some command line applications that I like
* installs some system fonts that I like
* configures my terminal emulator of choice, hyper
* copies over my terminal splash pictures!

## TODO
- [X]  Move path manipulations to separate, ignored file
- [X]  Add source computer splash logo
- [ ]  Add inventory of plugins included
- [ ]  Add flags for things like ignoring fonts and sudo commands
- [ ]  Rename path_mods script
- [ ]  saving old dotfiles needs to follow symlinks. ALso it silently
       fails to stow
- [ ]  Add lazygit
- [ ]  Have stow ignore vim/colors/
- [ ]  Add gotop
- [ ]  Finish up vimrc (pull down the vim plugin managers, too)
- [ ]  Swap neovim for vim
