#!/bin/bash

GREEN='\e[32m'
NC='\e[0m'

# Update the package list and install zsh, tmux and vim
echo "${GREEN}Install necessary packages...${NC}"
sudo apt update
sudo apt install zsh tmux curl vim neofetch -y

echo "${GREEN}Prepare backup folder...${NC}"
if [ -d ~/.dotfiles-backup ] ; then
    echo "${GREEN}Backup folder already exists !${NC}"
    echo ""
else
    echo "${GREEN}Now creating backup folder...${NC}"
    mkdir ~/.dotfiles-backup
fi

# Create symbolic link for .tmux.conf
if [ -f ~/.tmux.conf ]; then
	echo "${GREEN}Backing up existing .tmux.conf...${NC}"
	echo ""
	mv ~/.tmux.conf ~/.dotfiles-backup/.tmux.conf
fi
echo "${GREEN}Create symbolic link for .tmux.conf${NC}"
echo ""
ln -s ~/.dotfiles/home/tmux.conf ~/.tmux.conf

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh/ ] ; then
	echo "${GREEN}oh-my-zsh has already been installed...${NC}"
	echo ""
else
	echo "${GREEN}oh-my-zsh not found, install it...${NC}"
	echo ""
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  "" --unattended
fi

# Install oh-my-zsh plugin
echo "${GREEN}install oh-my-zsh plugins...${NC}"
echo ""
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
echo "${GREEN}Install powerlevel10k...${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install go
if [ -d /usr/local/go/ ]; then
	echo "${GREEN}go is already installed...${NC}"
	echo ""
else
	echo "${GREEN}go is not found, now install it...${NC}"
	echo ""
	curl -fLo /tmp/go.tgz https://golang.org/dl/go1.15.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf /tmp/go.tgz
fi

# Install and configure lsd
echo "${GREEN}Install vivid and lsd...${NC}"
echo ""
curl -fLo /tmp/vivid.deb https://github.com/sharkdp/vivid/releases/download/v0.5.0/vivid_0.5.0_amd64.deb
sudo dpkg -i /tmp/vivid.deb

curl -fLo /tmp/lsd.deb https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd_0.17.0_amd64.deb
sudo dpkg -i /tmp/lsd.deb

# Configure vim
echo "${GREEN}Configure vim...${NC}"
echo ""
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ -f ~/.vimrc ]; then
	echo "${GREEN}Backup existing .vimrc...${NC}"
	echo ""
	mv ~/.vimrc ~/.dotfiles-backup/.vimrc
fi
echo "${GREEN}Create symbolic link for .vimrc${NC}"
echo ""
ln -s ~/.dotfiles/home/vimrc ~/.vimrc
echo "${GREEN}Installing vim themes${NC}"
echo ""
mkdir -p ~/.vim/colors
cp -f ~/.dotfiles/vim/colors/*.vim ~/.vim/colors/

# Create symbolic link for .zshrc
if [ -f ~/.zshrc ]; then
	echo "${GREEN}Backup existing .zshrc...${NC}"
	echo ""
	mv ~/.zshrc ~/.dotfiles-backup/.zshrc
fi

if [ -f ~/.p10k.zsh ]; then
	echo "${GREEN}Backup existing .p10k.zsh...${NC}"
	echo ""
	mv ~/.p10k.zsh ~/.dotfiles-backup/.p10k.zsh
fi

echo "${GREEN}Create symbolic link for .p10k.zsh .zshrc...${NC}"
echo ""
ln -s ~/.dotfiles/home/p10k.zsh ~/.p10k.zsh
ln -s ~/.dotfiles/home/zshrc ~/.zshrc
# Change the shell to zsh
echo "${GREEN}Change shell to zsh...${NC}"
echo ""
sudo chsh $USER -s $(which zsh)

echo "${GREEN}All configurations are done!!! Good to go.${NC}"
echo "${GREEN}Logout and login again to see the difference.${NC}"
