#!/bin/sh
#echo $@


uso(){
    echo
#    echo "La idea detras de loopMOUNT.sh es montar sistemas de ficheros o imagenes de discos de una forma simple."
    echo
    echo "Uso:"
    echo "loopMOUNT.sh [mount|umount|help] <iso> <punto de montaje> [tipo de extension]"
    echo 
    echo "loopMOUNT.sh mount foo.iso /media/cdrom"
    echo "loopMOUNT.sh mount foo /media/foo ext4"
    echo
    echo "loopMOUNT.sh mount <iso> <punto de montaje> <extension>"
}

monta(){
    #encaso de que sea una imagen de nero
    #se usa:
    # mount -t iso9660 -o loop,offset=307200 imagen.nrg /directorio/de/montaje

    #loopMOUNT.sh mount <iso> <punto de montaje>
    if [ "$#" -eq 3 ]
    then
        echo "montando $2 en $3"
        sudo mount -o loop $2 $3
    elif  [ "$#" -eq 4 ]
    then
        #loopMOUNT.sh mount <iso> <punto de montaje> <extension>
        sudo mount -o loop $2 $3 -t $4
    else
        uso 
    fi
}

#
desmonta(){
    if [ "$#" -eq 2 ]
    then
        echo "desmontando $2"
        sudo umount $2
    else
        uso 
    fi
}

case "$1" in
  mount)
    monta $@
    ;;
  umount)
    #echo "Error: argument '$1' not supported" >&2
    desmonta $@ 
    ;;
  help|?|"")
    uso
    ;;
  *)
    echo "Error"
    uso
    #echo "Usage: loopMOUNT.sh [mount|umount|help|?]" >&2
    exit 3
    ;;
esac
