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
comentarios_login_managers[1]="1) sddm: bonito, leve e elegante (recomandado ;] )"
comentarios_login_managers[2]="2) lxdm: leve"
comentarios_login_managers[3]="3) slim: minimalista"

comandos_login_managers=()
comandos_login_managers[1]=" sddm"
comandos_login_managers[2]=" lxdm"
comandos_login_managers[3]=" slim"

pegar_login_manager(){
    clear
    for counter in $(seq 1 $quantidade_login_managers)
    do
        echo ${comentarios_login_managers[counter]}
    done
    read login_manager_selecionado
}


window_manager_selecionado=0

quantidade_window_managers=4

comentarios_window_managers=()
comentarios_window_managers[1]="1) mate: leve e retro"
comentarios_window_managers[2]="2) xfce4: leve e altamente customisavel"
comentarios_window_managers[3]="3) kde: bonito"
comentarios_window_managers[4]="4) cinnamon: bonito e parecido com o windows"

comandos_window_managers=()
comandos_window_managers[1]=" mate"
comandos_window_managers[2]=" xfce4"
comandos_window_managers[3]=" kde-full"
comandos_window_managers[4]=" cinnamon"

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
    comando_instalacao="sudo apt install "

    comando_instalacao+=${comandos_login_managers[login_manager_selecionado]}
    comando_instalacao+=${comandos_window_managers[window_manager_selecionado]}

    echo instalar extras Y/N
    read instalar_extras

    
    comando_instalacao+=" xorg firefox"

    if [ $instalar_extras == "Y" ] || [ $instalar_extras == "y" ]
    then
        comando_instalacao+=" gnome-software"
    fi
    

    eval $comando_instalacao

    clear
    echo instalação completa gostaria de iniciar o login manager ? Y/N
    read iniciar
    if [ $iniciar == "Y" ] || [ $iniciar == "y" ]
    then
        comando_iniciar_janela="sudo "
        comando_iniciar_janela+=${comandos_login_managers[login_manager_selecionado]}
    fi

    
    


}




pegar_info
installar

