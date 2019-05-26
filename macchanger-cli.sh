#!/usr/bin/env bash

interface="wlp4s0"

printOptions() {
read -p "Option Number?: " Opt
}

echo '
    __  ___                __
   /  |/  /___ ___________/ /_  ____ _____  ____ ____  _____
  / /|_/ / __ `/ ___/ ___/ __ \/ __ `/ __ \/ __ `/ _ \/ ___/
 / /  / / /_/ / /__/ /__/ / / / /_/ / / / / /_/ /  __/ /
/_/  /_/\__,_/\___/\___/_/ /_/\__,_/_/ /_/\__, /\___/_/
                                         /____/             ' | lolcat --spread 1.0

echo ''
echo ''

echo '1. Set interface Down' | lolcat --spread 1.0
echo '2. Change Mac' | lolcat --spread 1.0
echo '3. Set Interface Up' | lolcat --spread 1.0
echo ''

printOptions

if [ $Opt = 1 ]
then
sudo ifconfig $interface down
fi

if [ $Opt = 2 ]
then
echo ''
read -p "Mac address to spoof? (must be with colons): " Mac
sudo macchanger --mac=$Mac $interface
fi

if [ $Opt = 3 ]
then
sudo ifconfig $interface up
fi
