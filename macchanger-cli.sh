#!/usr/bin/env bash

interfaces() {
ifaces=( $(ip addr list | awk -F': ' '/^[0-9]/ && $2 != "lo" {print $2}') )
}

printOptions() {
read -p "Option Number?: " Opt
}

startupup() {
echo '
    __  ___                __
   /  |/  /___ ___________/ /_  ____ _____  ____ ____  _____
  / /|_/ / __ `/ ___/ ___/ __ \/ __ `/ __ \/ __ `/ _ \/ ___/
 / /  / / /_/ / /__/ /__/ / / / /_/ / / / / /_/ /  __/ /
/_/  /_/\__,_/\___/\___/_/ /_/\__,_/_/ /_/\__, /\___/_/
                                         /____/             ' | lolcat --spread 1.0

echo ''
echo ''
echo '[1]. Select Network Interface' | lolcat --spread 1.0
echo '[2]. Set interface Down' | lolcat --spread 1.0
echo '[3]. Change Mac' | lolcat --spread 1.0
echo '[4]. Set Interface Up' | lolcat --spread 1.0
echo ''
}

startupup
sleep 0.5
printOptions

if [ $Opt = 1 ]
then
echo "Getting interface names..." | lolcat --spread 1.0
sleep 3
interfaces
#printf '%s\n' "${ifaces[@]}" # For testing only
echo '
    __  ___                __
   /  |/  /___ ___________/ /_  ____ _____  ____ ____  _____
  / /|_/ / __ `/ ___/ ___/ __ \/ __ `/ __ \/ __ `/ _ \/ ___/
 / /  / / /_/ / /__/ /__/ / / / /_/ / / / / /_/ /  __/ /
/_/  /_/\__,_/\___/\___/_/ /_/\__,_/_/ /_/\__, /\___/_/
                                         /____/             ' | lolcat --spread 1.0
echo '[1] ' ${ifaces[0]} | lolcat --spread 1.0
echo '[2] ' ${ifaces[1]} | lolcat --spread 1.0
echo '[3] ' ${ifaces[2]} | lolcat --spread 1.0
echo '[4] ' ${ifaces[3]} | lolcat --spread 1.0
echo '[5] ' ${ifaces[4]} | lolcat --spread 1.0
echo '[6] ' ${ifaces[5]} | lolcat --spread 1.0
echo '[7] ' ${ifaces[6]} | lolcat --spread 1.0
echo '[8] ' ${ifaces[7]} | lolcat --spread 1.0
echo '[9] ' ${ifaces[8]} | lolcat --spread 1.0
echo '[10] ' ${ifaces[9]} | lolcat --spread 1.0
read -p "Option Number?: " ifaceOpt

if [ $ifaceOpt = 1 ]
then
echo "Interface 1 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[0]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 2 ]
then
echo "Interface 2 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[1]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 3 ]
then
echo "Interface 3 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[2]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 4 ]
then
echo "Interface 4 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[3]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 5 ]
then
echo "Interface 5 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[4]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 6 ]
then
echo "Interface 6 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[5]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 7 ]
then
echo "Interface 7 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[6]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 8 ]
then
echo "Interface 8 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[7]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 9 ]
then
echo "Interface 9 Selected!"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[8]}
clear
startupup
printOptions
fi

if [ $ifaceOpt = 10 ]
then
echo "Interface 10 Selected! (You have a lot of interfaces!!)"  | lolcat --spread 1.0
echo "Setting interface selected..." | lolcat --spread 1.0
sleep 1
interface=${ifaces[9]}
clear
startupup
printOptions
fi

if [ $Opt = 2 ]
then
echo "Setting selected interface to down" | lolcat --spread 1.0
sudo ifconfig $interface down
clear
startup
fi

if [ $Opt = 3 ]
then
echo ''
read -p "Mac address to spoof? (must be with colons): " Mac
echo "Setting Mac..." | lolcat --spread 1.0
sleep 5
sudo macchanger --mac=$Mac $interface
clear
startup
fi

if [ $Opt = 4 ]
then
sudo ifconfig $interface up
clear
startup
fi

if  [[ "$Opt" != '4' ]] && [[ "$Opt" != '3' ]] && [[ "$Opt" != '2' ]] && [[ "$Opt" != '1' ]];
then
clear
echo "Please type number from 1-4 :)" | lolcat --spread 1.0
sleep 2
clear
startup
printOptions
fi
