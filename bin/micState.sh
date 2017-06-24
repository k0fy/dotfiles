#!/bin/bash
ver=0.1

stR=$(echo $(amixer sget Capture | grep Left:) | awk '{split($6,a,":"); print a[1]}')
stL=$(echo $(amixer sget Capture | grep Right:) | awk '{split($6,a,":"); print a[1]}')

#amixer get Capture | grep Left | grep off
ICON=/home/jlgb/.config/xfce4/panel/launcher-37/13543955291.desktop
e1=/home/jlgb/bin/accesos/m.OFF
e2=/home/jlgb/bin/accesos/m

# notify-send
notifyMicro(){
  ico=/home/jlgb/bin/accesos/audio-input-microphone.png
  
  if [ "$1" == "on" ] ; then
    notify-send -u normal -i $ico "Micro status:" "Micro on!!"
  else
    notify-send -u normal -i $ico "Micro status:" "micro off"
  fi
}


if [ "$stR" == "[off]" ] || [ "$stL" == "[off]" ] ; then 
  off=0
  notifyMicro on
  
  cat $e2 >  $ICON
  amixer sset Capture cap &> /dev/null
else 
  off=1
  notifyMicro off
  
  cat $e1 >  $ICON
  amixer sset Capture nocap &> /dev/null
fi

#echo $off
#if [ "$off" -eq 1 ] ; then
#  cat $e1 >  $ICON
#  amixer sset Capture nocap &> /dev/null
#else
#  cat $e2 >  $ICON
#  amixer sset Capture cap &> /dev/null
#fi
