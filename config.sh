#!/usr/bin/env bash

start() {
  # [ ! -x "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1
  mkdir Programs
  mkdir temp
}

tilix() {
  (
    echo "25"; sleep 1
    echo "# Instalando Tilix" ; sudo apt-get install tilix
    echo "50" ; sleep 1
    echo "# Configurando Tilix...." ; tilixConfig
    echo "90" ; sleep 1
    echo "# Tilix instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando Tilix" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

git() {
  (
    echo "25"; sleep 1
    echo "# Instalando Git" ; sudo apt-get install git
    echo "50" ; sleep 1
    #echo "# Configurando Git...." ; gitConfig
    #echo "90" ; sleep 1
    echo "# Git instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando Git" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

zsh() {
  (
    echo "25"; sleep 1
    echo "# Instalando Zsh" ; sudo apt-get install zsh
    echo "50" ; sleep 1
    echo "# Configurando Zsh...." ; ohmyzsh
    echo "90" ; sleep 1
    echo "# ZSH instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando ZSH" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

remmina() {
  (
    echo "25"; sleep 1
    echo "# Instalando Remmina" ; sudo apt-get install remmina
    echo "65" ; sleep 1
    echo "# Remmina instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando Remmina" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

openjdk8() {
  (
    echo "25"; sleep 1
    echo "# Instalando OpenJdk8" ; sudo apt-get install openjdk-8-jre
    echo "65" ; sleep 1
    echo "# OpenJdk8 instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando OpenJdk8" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

eclipse() {
  (
    echo "25"; sleep 1
    echo "# Baixando Eclipse" ; wget https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz -P ~/temp
    echo "50" ; sleep 1
    echo "# Descompactando Eclipse...." ; tar -xf download.php\?file=%2Ftechnology%2Fepp%2Fdownloads%2Frelease%2Fluna%2FSR2%2Feclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz -C ~/Programs
    echo "75" ; sleep 1
    echo "# Criando atalho Eclipse" ; echo -e '[Desktop Entry]
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
    echo "95" ; sleep 1
    echo "# Eclipse instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando Eclipse" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

htop() {
  (
    echo "25"; sleep 1
    echo "# Instalando HTOP" ; sudo apt-get install htop
    echo "65" ; sleep 1
    echo "# HTOP instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando HTOP" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

node() {
  (
    echo "25"; sleep 1
    echo "# Instalando NodeJS" ; curl -fsSL https://fnm.vercel.app/install | zsh
    echo "65" ; sleep 1
    echo "# NodeJs instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando NodeJs (FNM)" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

dbeaver() {
  (
    echo "25"; sleep 1
    echo "# Instalando DBeaver" ; sudo apt-get install dbeaver
    echo "65" ; sleep 1
    echo "# DBeaver instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando DBeaver" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

ohmyzsh() {
  (
    echo "15"; sleep 1
    echo "# Instalando oh-my-zsh" ; sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "25" ; sleep 1
    echo "# Baixando tema do zsh" ; git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" 
    echo "50" ; sleep 1
    echo "# Configurando tema do zsh" ; ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    echo "75" ; sleep 1
    echo "# Configurando tema do zsh" ; yes | cp -rf .zshrc ~/.zshrc > chsh -s $(which zsh)
    echo "90" ; sleep 1
    echo "# ZSH configurado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Configurando oh-my-zsh" \
  --text="Configurando..." \
  --auto-close \
  --percentage=0
}

vscode() {
  (
    echo "10"; sleep 1
    echo "# Instalando VsCode" ; sudo apt-get install wget gpg
    echo "20" ; sleep 1
    echo "# Instalando VsCode" ; wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg 
    echo "30" ; sleep 1
    echo "# Instalando VsCode" ; sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "40" ; sleep 1
    echo "# Instalando VsCode" ; sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    echo "50" ; sleep 1
    echo "# Instalando VsCode" ; rm -f packages.microsoft.gpg    
    echo "60" ; sleep 1
    echo "# Instalando VsCode" ; sudo apt install apt-transport-https 
    echo "70" ; sleep 1
    echo "# Instalando VsCode" ; sudo apt update  
    echo "80" ; sleep 1
    echo "# Instalando VsCode" ; sudo apt install code
    echo "90" ; sleep 1
    echo "# VsCode instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando VsCode" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

tilixConfig() {
  (
    echo "10"; sleep 1
    echo "# Baixando tema Dracula para o tilix" ; wget https://github.com/dracula/tilix/archive/master.zip -P ~/temp
    echo "25" ; sleep 1
    echo "# Descompactando o tema Dracula" ; unzip ~/temp/master.zip -d ~/temp    
    echo "35" ; sleep 1
    echo "# Criando diretorios Tilix" ; mkdir ~/.config/tilix ; mkdir ~/.config/tilix/schemes
    echo "50" ; sleep 1
    echo "# Movendo arquivos de configuração" ; mv ~/temp/tilix-master/Dracula.json ~/.config/tilix/schemes
    echo "75" ; sleep 1
    echo "# Definindo como terminal padrão" ; sudo update-alternatives --config x-terminal-emulator
    echo "90" ; sleep 1
    echo "# Tilix configurado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Configurando Tilix" \
  --text="Configurando..." \
  --auto-close \
  --percentage=0
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

chrome() {
  (
    echo "25"; sleep 1
    echo "# Baixando Chrome" ; wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    echo "45" ; sleep 1
    echo "# Instalando o Chrome" ; sudo apt install ./google-chrome-stable_current_amd64.deb
    echo "65" ; sleep 1
    echo "# Chrome instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando Chrome" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}

msTeams() {
  (
    echo "25"; sleep 1
    echo "# Baixando MsTeams" ; curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    echo "45" ; sleep 1
    echo "# Instalando pacotes MsTeams" ; sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
    echo "65" ; sleep 1
    echo "# Atualizando pacotes" ; sudo apt update
    echo "75" ; sleep 1
    echo "# Instalando o MsTeams" ; sudo apt install teams
    echo "85" ; sleep 1
    echo "# MsTeams instalado com sucesso" ; sleep 1
    echo "100" ; sleep 1
  ) |
  zenity --progress \
  --title="Instalando MsTeams" \
  --text="Instalando..." \
  --auto-close \
  --percentage=0
}


start

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
      HTOP "Htop" \
      FALSE "Remmina" \
      FALSE "OpenJdk8" \
      FALSE "Eclipse" \
      FALSE "NodeJs" \
      FALSE "DBeaver" \
      FALSE "Flathub" \
      FALSE "Chrome" \
      FALSE "Teams" \
      FALSE "REPLACE")
  [ $? -ne 0 ] && exit 
  array="${opt//|/ }"
  options=($array)
  for value in "${options[@]}"; do
    case "$value" in
      "Remmina")
      remmina
      ;;
      "VsCode")
      vscode
      ;;
      "OpenJdk8")
      openjdk8
      ;;
      "Eclipse")
      eclipse
      ;;
      "NodeJs")
      node
      ;;
      "DBeaver")
      dbeaver
      ;;
      "Chrome")
      chrome
      ;;      
      "Teams")
      msTeams
      ;;
      "HTOP")
      htop
      ;;
      "ZSH")
      zsh
      ;;
      "GIT")
      git
      ;;
      "ohmyzsh")
      ohmyzsh
      ;;
      "tilixConfig")
      tilixConfig
      ;;
      "gitConfig")
      gitConfig
      ;;
      "Tilix")
      tilix
      ;;
    esac
  done
done