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




login_manager_selecionado=0

quantidade_login_managers=3

comentarios_login_managers=()
comentarios_login_managers[1]="1) sddm: bonito leve e elegante (recomandado ;] )"
comentarios_login_managers[2]="2) lxdm: leve"
comentarios_login_managers[3]="3) slim: minimalista"

comandos_login_managers=()
comandos_login_managers[1]="sudo apt install sddm"
comandos_login_managers[2]="sudo apt install lxdm"
comandos_login_managers[3]="sudo apt install slim"

pegar_login_manager(){
    clear
    for counter in $(seq 1 $quantidade_login_managers)
    do
        echo ${comentarios_login_managers[counter]}
    done
    read login_manager_selecionado
}


window_manager_selecionado=0

quantidade_window_managers=3

comentarios_window_managers=()
comentarios_window_managers[1]="1) mate: leve e retro"
comentarios_window_managers[2]="2) xfce4: leve e altamente customisavel"

comandos_window_managers=()
comandos_window_managers[1]="sudo apt install mate"
comandos_window_managers[2]="sudo apt install xfce4"

pegar_window_manager(){
    clear
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





installar(){
    clear
    
    eval ${comandos_login_managers[login_manager_selecionado]}

    echo instalar extras Y/N
    read instalar_extras

    sudo apt install xorg firefox

    if [ "$instalar_extras" = "$Y" ] | [ "$instalar_extras" = "$y" ]
    then
        sudo apt install gnome-software
    fi
    
    clear
    echo instalação completa gostaria de reiniciar ? Y/N
    read reiniciar
    if [ "$reiniciar" = "$Y" ] | [ "$reiniciar" = "$y" ]
    then
        sudo rebot
    fi
}




pegar_info
installar

