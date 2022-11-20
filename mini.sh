#!/bin/bash 

#repositorio horiginal
#https://github.com/TheoLomeuBraga/install_wm_on_linux.git


e_numero(){
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
       return 0
    else
        return 1
    fi
}
e_numero_ret=0

e_letra(){
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
       return 1
    else
        return 0
    fi
}
e_letra_ret=0




login_manager_selecionado=1

quantidade_login_managers=4

comentarios_login_managers=()
comentarios_login_managers[1]="1) sddm: bonito, leve e elegante (recomandado ;] )"
comentarios_login_managers[2]="2) lxdm: leve (pode ter problemans com o xfce)"
comentarios_login_managers[3]="3) slim: minimalista"
comentarios_login_managers[4]="4) lightDM: elegante"

comandos_login_managers=()
comandos_login_managers[1]=" sddm"
comandos_login_managers[2]=" lxdm"
comandos_login_managers[3]=" slim"
comandos_login_managers[4]=" lightdm"

pegar_login_manager(){
    clear
    echo escolha o seu gerenciator de login
    for counter in $(seq 1 $quantidade_login_managers)
    do
        echo ${comentarios_login_managers[counter]}
    done
    read login_manager_selecionado
}


window_manager_selecionado=1

quantidade_window_managers=6

comentarios_window_managers=()
comentarios_window_managers[1]="1) mate: retro e leve"
comentarios_window_managers[2]="2) xfce4: leve e altamente customisavel"
comentarios_window_managers[3]="3) kde: bonito"
comentarios_window_managers[4]="4) cinnamon: bonito e parecido com o windows"
comentarios_window_managers[5]="5) lxdm: simples e leve"
comentarios_window_managers[6]="6) unity: bonito e parecido com o gnome (do ubuntu)"

comandos_window_managers=()
comandos_window_managers[1]=" mate"
comandos_window_managers[2]=" xfce4"
comandos_window_managers[3]=" kde-full"
comandos_window_managers[4]=" cinnamon"
comandos_window_managers[5]=" lxdm"
comandos_window_managers[6]=" ubuntu-unity-desktop"


pegar_window_manager(){
    clear
    echo escolha o seu gerenciator de janela
    for counter in $(seq 1 $quantidade_window_managers)
    do
        echo ${comentarios_window_managers[counter]}
    done
    read window_manager_selecionado
}
pegar_info(){
    pegar_login_manager
    pegar_window_manager
}


adicionar_repositorios(){
    sudo apt-get install software-properties-common
}


installar(){
    
    comando_instalacao="sudo apt install xorg firefox ubuntu-standard "

    comando_instalacao+=${comandos_login_managers[login_manager_selecionado]}
    comando_instalacao+=${comandos_window_managers[window_manager_selecionado]}

    clear
    echo instalar extras Y/N
    read instalar_extras
    
    

    if [ $instalar_extras == "Y" ] || [ $instalar_extras == "y" ]
    then
        comando_instalacao+=" gnome-software discover discover neofetch vim "
    fi

    

    clear
    echo configiração completa deseja instalar ? Y/N
    read deve_instalar
    if [ $deve_instalar == "Y" ] || [ $deve_instalar == "y" ]
    then
        adicionar_repositorios
        sudo apt install update
        eval $comando_instalacao

        clear
        echo instalação completa gostaria de iniciar o login manager ? Y/N
        read iniciar
        if [ $iniciar == "Y" ] || [ $iniciar == "y" ]
        then
            comando_iniciar_janela="sudo "
            comando_iniciar_janela+=${comandos_login_managers[login_manager_selecionado]}
            eval $comando_iniciar_janela
            clear
        fi
    fi

    

}

pegar_info
installar

<<<<<<< HEAD
=======



>>>>>>> ee3185606e25a1c9fd6ac0af5a093f4e72131de5