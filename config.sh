sudo apt-get install zsh
sudo apt-get install git
sudo apt-get install htop

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://github.com/dracula/tilix/archive/master.zip
unzip master.zip

mkdir ~/.config/tilix
mkdir ~/.config/tilix/schemes

mv tilix-master/Dracula.json ~/.config/tilix/schemes

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

yes | cp -rf .zshrc ~/.zshrc

curl -fsSL https://fnm.vercel.app/install | zsh

chsh -s $(which zsh)