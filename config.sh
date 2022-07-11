# instalação dos pacotes necessários para o funcionamento do sistema
sudo apt-get install zsh
sudo apt-get install git
sudo apt-get install htop
sudo apt-get install remmina
sudo apt-get install install openjdk-8-jre

flatpak install flathub io.dbeaver.DBeaverCommunity

# Instalação do zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Criação de pasta para arquivos temporarios
mkdir Programs
mkdir temp

# Direcionamento para pasta temporaria
cd temp

# Donwload dos programas necessários para o funcionamento do sistema
wget https://github.com/dracula/tilix/archive/master.zip
wget https://az764295.vo.msecnd.net/stable/30d9c6cd9483b2cc586687151bcbcd635f373630/code_1.68.1-1655263094_amd64.deb
wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz

# Unzip dos arquivos baixados
tar -xf download.php\?file=%2Ftechnology%2Fepp%2Fdownloads%2Frelease%2Fluna%2FSR2%2Feclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz -C ~/Programs
unzip master.zip

# Instalação dos programas baixados
sudo dpkg -i code_1.68.1-1655263094_amd64.deb

# Instalação gerenciador nodejs
curl -fsSL https://fnm.vercel.app/install | zsh

# Icone Eclipse
echo -e '[Desktop Entry]
Version=1.0
Name=Eclipse
Comment=Java IDE
Type=Application
Categories=Development;IDE;
Exec=/home/'$USER'/Programs/eclipse/eclipse
Terminal=false
StartupNotify=true
Icon=/home/'$USER'/Programs/eclipse/icon.xpm
Name[en_US]=Eclipse' >> /home/$USER/.local/share/applications/eclipse.desktop

# Configuração do Tilix
mkdir ~/.config/tilix
mkdir ~/.config/tilix/schemes

mv tilix-master/Dracula.json ~/.config/tilix/schemes

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

yes | cp -rf .zshrc ~/.zshrc

chsh -s $(which zsh)
