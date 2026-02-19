# Install
sudo apt install -y vim-gtk3 bat tre-command zsh zoxide

# Configure zsh
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ~/.zsh/zsh-autosuggestions &> /dev/null
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ~/.zsh/zsh-syntax-highlighting &> /dev/null
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure &> /dev/null
mkdir -p ~/.zsh/sudo
wget https://github.com/ohmyzsh/ohmyzsh/raw/master/plugins/sudo/sudo.plugin.zsh -P ~/.zsh/sudo &> /dev/null

# Zsh as default shell
chsh -s $(which zsh)

# Configure vim
mkdir -p ~/.vim/undo-dir
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# i3
sudo apt-get install -y i3
sudo apt-get install -y rxvt-unicode xsel lxappearance
fc-cache -fv

# Theme
# Change it using mate-control-center
wget -N https://raw.githubusercontent.com/zayronxio/Zafiro-icons/master/Install-Zafiro-Icons.sh && chmod +x Install-Zafiro-Icons.sh && bash ./Install-Zafiro-Icons.sh
