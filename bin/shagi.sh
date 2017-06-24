#shagi

V="v 1.0"
#echo $V

maxproc() {
    #regresa 1 si $1 es true
    echo $1'>'$2 | bc -l
}

opcionC() {
    echo limite de consumo de cpu: ${1}
    max=$1
    #touch cpuLimit.sh
    #echo "" > cpuLimit.sh

    for x in $(ps -o pid,c ax | awk ' NR>1  {print $1":"$2 } ' | sort -k2 -nr )
    do
        pid=$(echo $x | awk '{split($0,a,":"); print a[1]}')
        proc=$(echo $x | awk '{split($0,a,":"); print a[2]}')
        #info=$(echo $x | awk '{split($0,a,":"); print a[3]}')

        if [ $(maxproc ${proc} ${max}) -eq 1 ]
        then
            echo cpulimit -p ${pid} -l ${max} & #>> cpuLimit.sh
        fi
    done
}

#echo $#


if [ "$#" -eq 1 ]
then
    case "$1" in
        -n)
            #ps -o pid,ppid,pcpu ax
            #echo pid cpu
            ps -o pid,c ax | sort -k2 -n | awk 'NR>3 && $2>0' | sort -k2 -nr 
        ;;
        
        -c)
            max=70
            opcionC ${max}
#            echo limite de consumo de cpu: ${max}
#            
#            #touch cpuLimit.sh
#            #echo "" > cpuLimit.sh
#            
#            for x in $(ps -o pid,c ax | awk ' NR>1  {print $1":"$2 } ')
#            do
#                pid=$(echo $x | awk '{split($0,a,":"); print a[1]}')
#                proc=$(echo $x | awk '{split($0,a,":"); print a[2]}')
#                #info=$(echo $x | awk '{split($0,a,":"); print a[3]}')
#
#                if [ $(maxproc ${proc} ${max}) -eq 1 ]
#                then
#                    echo cpulimit -p ${pid} -l ${max} & #>> cpuLimit.sh
#                fi
#            done
#            #echo resultados en cpuLimit.sh
        ;;
        
        -h)
            echo "                                    Shagui $V"
            echo -------------------------------------------------
            echo "Shagui puede mostrar los procesos que cosumen procesador"
            echo "Parametros: "            
            echo "  -n  Modo Ninja: muestra unicamente el PID y el porcentaje usado"
            echo " uso: shagui.sh -n"
            echo
            echo "  -c [limite]  Pone un limite al maximo consumo de cpu que pueden usar "
            echo "     los procesos que sobrepasen el valor [limite] "
            echo "     si se omite [limite] tomo  como default 30"
            echo "     Para ponel el limite usa cpulimit por lo que nesesita los permisos de"
            echo "     root o ser ejecutado con sudo "
            echo " uso: shagui.sh -c 20"
            echo "      shagui.sh -c"
            echo
            echo "  -h muestra esta ayuda "
            echo            
            
            exit 1
        ;;
    esac

elif [ "$#" -eq 2 ]
then
    max=$2
    if [ "$1" = "-c" ]
    then
        opcionC ${max}
#        echo limite de consumo de cpu: ${max}
#        #touch cpuLimit.sh
#        #echo "" > cpuLimit.sh
#       
#        for x in $(ps -o pid,c ax | awk ' NR>1 && $2>0  {print $1":"$2 } ')
#        do
#            pid=$(echo $x | awk '{split($0,a,":"); print a[1]}')
#            proc=$(echo $x | awk '{split($0,a,":"); print a[2]}')
#            #info=$(echo $x | awk '{split($0,a,":"); print a[3]}')
#            
#            if [ $(maxproc ${proc} ${max}) -eq 1 ]
#            then
#                echo cpulimit -p ${pid} -l ${max} & #>> cpuLimit.sh
#            fi
#        done
        #echo resultados en cpuLimit.sh
    fi
## -n %% muestra en modo nunja los que superan el valor %%
else
            echo __________________________________________________
            echo "Shagi: Dude, the awake procs..."
            echo " "
            echo [PID] [Porcentaje] [Proceso]
            #top -b -n1 -c | gawk 'NR>7 && $9>0  '
            #ps -o pid,c,command ax | awk ' NR>1 && $2>0  {print $1, $2, $3 } '
            #top -b -n1 -c | gawk 'NR>7 && $9>sub(/0,0/, "0", $9)  {print $1, $9, $12}'
            ps -o pid,pcpu,command ax | awk ' NR>1 && $2>0  {print $1, $2, $3 } ' | sort -k2 -nr 
            echo -------------------------------------------------
fi
