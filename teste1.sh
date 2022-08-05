#!/usr/bin/env bash
defaultInstall() {
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

}

remmina() {
  sudo apt-get install remmina #SOMETIMES
  dialog \
  --title 'Instalação dos Pacotes' \
  --gauge "Instalando Remmina" \
  8 40 60 100
  dialog --msgbox "Remmina instalado com sucesso"
}

openjdk8() {
  echo 'Instalando OpenJdk8'
  sudo apt-get install openjdk-8-jre #SOMETIMES
  echo 'OpenJdk8 instalado com sucesso'
}

eclipse() {
  # Instalação do Eclipse
  echo 'Instalando Eclipse'
  # Download do eclipse
  wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz -P ~/temp
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
    Name[en_US]=Eclipse' >>/home/$USER/.local/share/applications/eclipse.desktop
  echo 'Eclipse instalado com sucesso'
}

htop() {
  # Instalação do HTOP
  echo 'Instalando HTOP'
  sudo apt-get install htop #SOMETIMES
  echo 'HTOP instalado com sucesso'
}

node() {
  # Instalação gerenciador nodejs (FNM)
  echo 'Instalando NodeJs'
  curl -fsSL https://fnm.vercel.app/install | zsh
  echo 'NodeJs instalado com sucesso'
}

dbeaver() {
  # Instalação do DBeaver
  echo 'Instalando DBeaver'
  sudo apt-get install dbeaver #SOMETIMES
  echo 'DBeaver instalado com sucesso'
}

ohmyzsh() {
  echo 'Instalando o oh-my-zsh'
  # Instalação do zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo 'oh-my-zsh instalado com sucesso'
  echo 'Baixando tema do zsh'
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

  yes | cp -rf .zshrc ~/.zshrc

  chsh -s $(which zsh)

}

vscode() {
  echo 'Baixando VsCode'
  wget https://az764295.vo.msecnd.net/stable/30d9c6cd9483b2cc586687151bcbcd635f373630/code_1.68.1-1655263094_amd64.deb -P ~/temp
  echo 'Instalando VsCode'
  # Instalação dos programas baixados
  sudo dpkg -i code_1.68.1-1655263094_amd64.deb
}

tilixConfig() {
  # Download e configuração Tilix
  echo 'Baixando tema Dracula para o tilix'
  wget https://github.com/dracula/tilix/archive/master.zip -P ~/temp
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
}

gitConfig() {
  NOME=$(zenity --title "Configurando o Git" \
                --text "Digite o nome do usuário do Git" \
                --width=500 \
                --entry)
  EMAIL=$(zenity --title "Configurando o Git" \
                --text "Digite o email do usuário do Git" \
                --width=500 \
                --entry)
  
  git config --global user.name "$NOME"
  git config --global user.email "$EMAIL"
}

[ ! -x "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1

mkdir Programs
mkdir temp

while :
do
  opt=$(zenity --title "Linux Auto Config 1.0" \
      --text "O que você quer instalar?" \
      --width=500 \
      --height=500 \
      --list \
      --checklist \
      --column "Instalar" \
      --column "Programa" \
      TRUE "GIT" \
      TRUE "ZSH" \
      TRUE "Tilix" \
      TRUE "VsCode" \
      TRUE "ohmyzsh" \
      TRUE "tilixConfig" \
      TRUE "gitConfig" \
      FALSE "Remmina" \
      FALSE "OpenJdk8" \
      FALSE "Eclipse" \
      FALSE "NodeJs" \
      FALSE "DBeaver" \
      FALSE "Flathub" \
      FALSE "REPLACE")
  [ $? -ne 0 ] && exit 
  options=($opt)
  for value in "${options[@]}"; do
    case "$value" in
      "Remmina")
      teste
        #remmina
        ;;
      "VsCode")

      ;;
      "OpenJdk8")
      
      ;;
      "Eclipse")
      
      ;;
      "NodeJs")
      
      ;;
      "DBeaver")
      
      ;;
      "Flathub")
      
      ;;
      "ZSH")
      
      ;;
      "GIT")
      
      ;;
      "ohmyzsh")
      
      ;;
      "tilixConfig")
      
      ;;
      "gitConfig")
      
      ;;
      "Tilix")
      
      ;;
    esac
  done
done

# defaultInstall
# vscode
# ohmyzsh
# tilixConfig