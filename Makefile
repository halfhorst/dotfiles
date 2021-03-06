# A Makefile for setting up my computer under Debian-based systems.
# Note that WSL requires special considerations. Specifically,
# the hyper configuration will live in a different place and requires
# wsl.exe as its executable.

.PHONY: zsh vim git hyper logos fonts dive

all: zsh vim git hyper logos fonts

zsh:
	# Note that under the Windows Subsystem for Linux,
	# wsl.exe must be used to respsect etc/passwd. 
	# bash.exe will not.
	# install zplug for packages. not currently working with WSL
	# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
	# zplug install
	stow --target=${HOME} zsh
	chsh -s /bin/zsh

vim:
	sudo apt install -y vim

	# install pathogen.vim
	mkdir -p vim/.vim/autoload ~/.vim/bundle
	curl -LSso vim/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	
	# install vim-plug
	curl -fLo vim/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# install pathogen packages
	git clone https://github.com/myusuf3/numbers.vim.git vim/.vim/bundle/numbers
	git clone https://tpope.io/vim/commentary.git vim/.vim/bundle/commentary
	git clone https://tpope.io/vim/surround.git vim/.vim/bundle/surround
	git clone https://github.com/airblade/vim-gitgutter.git vim/.vim/bundle/gitgutter

	stow --target=${HOME} vim

git:
	stow --target=${HOME} git

hyper:
	stow --target=${HOME} hyper

logos:
	stow --target=${HOME} logos

fonts:
	rm -rfd fonts
	mkdir -p fonts ${HOME}/.fonts
	chdir fonts \
		&& git clone git@github.com:source-foundry/Hack.git \
		&& git clone git@github.com:adobe-fonts/source-code-pro.git \
		&& git clone git@github.com:IBM/plex.git \
		&& git clone git@github.com:mozilla/Fira.git \
		&& git clone git@github.com:be5invis/Iosevka.git
	find fonts/ -name '*.ttf' -exec cp {} ~/.fonts  \;

	# install powerline fonts
	sudo apt install -y fonts-powerline


# Once-in-a-while useful utilities

dive:
	wget https://github.com/wagoodman/dive/releases/download/v0.8.1/dive_0.8.1_linux_amd64.deb
	sudo apt install ./dive_0.8.1_linux_amd64.deb
	rm dive_0.8.1_linux_amd64.deb
