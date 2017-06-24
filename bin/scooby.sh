#!/bin/bash

V="v 0.1"

#Scooby
if [ "$#" -eq 1 ]
then
    case "$1" in
      -n)
          ps -o pid,ppid,command ax | grep defunct | awk '$3!="grep"  { print $2}' | sort -u
      ;;
    
      -p)
          ps -o pid,ppid,command ax | grep defunct | awk '$3!="grep"  { print $3}'
      ;;
    
      -h|*)
          echo "                                    Scooby $V"
          echo -------------------------------------------------
          echo "Scooby: Puedo buscar de estas formas"
          echo "   -n  Modo Ninja: solo muestra los  PPID"
          echo "   -p  Modo rastreador: solo muestra el nombre de los procesos zombie"
          
          exit 1
      ;;
    esac
else

    echo _____________________________________________________________________
    echo Scooby: Guau..  Buscando Zombies...
    echo
    echo [PID] [PPID] [proceso]
    echo -----------------------

    ps -o pid,ppid,command ax | grep defunct | awk '$3!="grep"  { print $1, $2 ,$3}'

    echo _____________________________________________________________________
    echo
    echo 
fi
