#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

echo "Installing xrdp"
sudo apt-get install -y xrdp
echo "Xrdp Installed"
sleep 1s
echo "Installing a desktop environment"
sleep 2s
echo "Choose a Desktop Environment to install\n"
sleep 1s
echo "1. Xfce4 \n"
echo "2. KDE Plasma Desktop \n"
echo "3. Ubuntu Mate Desktop \n"
COUNTER = 0
while [ $COUNTER -lt 4]
    do
        read  -p 'Input your choice: ' i
        if [$i -eq 1] 
        then
            echo "You selected xfce4"
            sudo apt-get install -y Xfce4
            echo "xfce4-session" > ~/.xsession
            sleep 1s
            /etc/init.d/xrdp start
            echo "XFCE4 successfully Installed!!  \n \nRDP Started!!"
            echo "Connect with your username $(whoami) and password: to $(wget -qO- ifconfig.co) at port 3389"
            break
        elif [$i -eq 2] 
        then
            echo "You selected Kde Plasma Desktop"
            sudo apt-get install -y kde-plasma-desktop
            echo "startkde" > ~/.xsession
            sleep 1s
            /etc/init.d/xrdp start
            echo "Kde Plasma Desktop successfully Installed!!  \n \nRDP Started!!"
            echo "Connect with your username $(whoami) and password: to $(wget -qO- ifconfig.co) at port 3389"
            break
        elif [$i -eq 3] 
        then
            echo "You selected Ubuntu Mate Desktop"
            sudo apt-get install -y ubuntu-mate-desktop
            echo "mate-session" > ~/.xsession
            sleep 1s
            /etc/init.d/xrdp start
            echo "Ubuntu Mate Desktop successfully Installed!!  \n \nRDP Started!!"
            echo "Connect with your username $(whoami) and password: to $(wget -qO- ifconfig.co) at port 3389"
            break

        else
            echo "Invalid Selection!!  $((3-$COUNTER)) chances left.."

        fi
        let COUNTER=COUNTER+1
done 

