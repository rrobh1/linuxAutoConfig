#!/usr/bin/env bash
defaultInstall() {
echo 1
}









PS3='Digite para instalar as opções selecionadas: '
options=("Padrão" "Remmina" "OpenJdk8" "Eclipse" "HTOP" "NodeJs" "DBeaver" "Flathub" "All" "Sair" )

select opt in "${options[@]}"
do
    case $opt in
        "Remmina")
            echo "you chose choice 1"
            ;;
        "OpenJdk8")
            echo "you chose choice 2"
            ;;
        "Eclipse")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "HTOP")
            echo "you chose choice 1"
            ;;
        "NodeJs")
            echo "you chose choice 2"
            ;;
        "DBeaver")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Flathub")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "All")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "DBeaver")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Padrão")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

# instalação dos pacotes necessários para o funcionamento do sistema
echo 'Instalando ZSH'
sudo apt-get install zsh #ALWAYS
echo 'ZSH instalado com sucesso'

echo "Instalando Git"
sudo apt-get install git #ALWAYS
echo 'Git instalado com sucesso'

echo "Instalando Tilix"
sudo apt-get install tilix #ALWAYS
echo 'Tilix instalado com sucesso'

# Criação de pastas
echo 'Criando pastas'

echo 'Criando pasta Programs'
mkdir Programs

echo 'Criando pasta Temp'
mkdir temp

# Direcionamento para pasta temporaria
echo 'Entrando na pasta Temp'
cd temp

if [["${selecionadas[@]}" =~ "1"]]; then
  # Instalação do Remmina
  echo 'Instalando Remmina'
  sudo apt-get install remmina #SOMETIMES
  echo 'Remmina instalado com sucesso'
fi
if [ ["${selecionadas[@]}" =~ "2"]]; then
  # Instalação do OpenJdk8
  echo 'Instalando OpenJdk8'
  sudo apt-get install openjdk-8-jre #SOMETIMES
  echo 'OpenJdk8 instalado com sucesso'
fi
if [ ["${selecionadas[@]}" =~ "3"]]; then
  # Instalação do Eclipse
  echo 'Instalando Eclipse'
  # Download do eclipse
  wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz
  # Descompactação do arquivo
  tar -xf download.php\?file=%2Ftechnology%2Fepp%2Fdownloads%2Frelease%2Fluna%2FSR2%2Feclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz -C ~/Programs
  # Atalho para o eclipse
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
  echo 'Eclipse instalado com sucesso'
fi
if [ ["${selecionadas[@]}" =~ "4"]]; then
  # Instalação do HTOP
  echo 'Instalando HTOP'
  sudo apt-get install htop #SOMETIMES
  echo 'HTOP instalado com sucesso'
fi
if [ ["${selecionadas[@]}" =~ "5"]]; then
  # Instalação gerenciador nodejs
  echo 'Instalando NodeJs'
  curl -fsSL https://fnm.vercel.app/install | zsh
  echo 'NodeJs instalado com sucesso'
fi
if [ ["${selecionadas[@]}" =~ "6"]]; then
  # Instalação do DBeaver
  echo 'Instalando DBeaver'
  sudo apt-get install dbeaver #SOMETIMES
  echo 'DBeaver instalado com sucesso'
fi
if [ ["${selecionadas[@]}" =~ "7"]]; then
  flatpak install flathub io.dbeaver.DBeaverCommunity #SOMETIMES
fi
if [ ["${selecionadas[@]}" =~ "8"]]; then
fi
if [ ["${selecionadas[@]}" =~ "9"]]; then
  echo 'Saindo...'
  exit
else
  echo 'Opção inválida!'
  exit
fi

echo 'Instalando o oh-my-zsh'
# Instalação do zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'oh-my-zsh instalado com sucesso'
echo 'Baixando tema do zsh'
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

yes | cp -rf .zshrc ~/.zshrc

chsh -s $(which zsh)

# Donwload dos programas necessários para o funcionamento do sistema

echo 'Baixando VsCode'
wget https://az764295.vo.msecnd.net/stable/30d9c6cd9483b2cc586687151bcbcd635f373630/code_1.68.1-1655263094_amd64.deb
echo 'Instalando VsCode'
# Instalação dos programas baixados
sudo dpkg -i code_1.68.1-1655263094_amd64.deb

# Download e configuração Tilix
echo 'Baixando tema Dracula para o tilix'
wget https://github.com/dracula/tilix/archive/master.zip
echo 'Descompactando o tema Dracula'
# Unzip dos arquivos baixados
unzip master.zip
# Configuração do Tilix
mkdir ~/.config/tilix
mkdir ~/.config/tilix/schemes

mv tilix-master/Dracula.json ~/.config/tilix/schemes

echo 'Defina o terminal padrão para o Tilix'
#Configuração do terminal
sudo update-alternatives --config x-terminal-emulator
