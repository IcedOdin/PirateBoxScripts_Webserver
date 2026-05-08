sudo apt-get update
sudo apt-get -y install lighttpd
sudo /etc/init.d/lighttpd stop 
sudo update-rc.d lighttpd remove 
sudo apt-get -y install dnsmasq 
sudo /etc/init.d/dnsmasq stop 
sudo update-rc.d dnsmasq remove 
sudo apt-get -y install hostapd 
sudo /etc/init.d/hostapd stop 
sudo update-rc.d hostapd remove 
sudo apt-get -y install iw 
wget "https://github.com/IcedOdin/PirateBoxScripts_Webserver/releases/download/v1.1.4/piratebox-ws_1.1.4.tar.gz" 
tar xzf piratebox-ws_1.1.4.tar.gz 
cd piratebox 
sudo mkdir -p /opt 
sudo cp -rv piratebox /opt 
sudo ln -s /opt/piratebox/init.d/piratebox /etc/init.d/piratebox 
sudo update-rc.d piratebox defaults 
sudo /etc/init.d/piratebox start
cd /home/pi 
mkdir python_programs 
cd python_programs
wget "https://github.com/IcedOdin/PirateBoxScripts_Webserver/new/master/piscripts/rpi_halt_btn.py"
wget "https://github.com/IcedOdin/PirateBoxScripts_Webserver/new/master/piscripts/illuminate_leds.py"

sudo sed -i '$ a python /home/pi/python_programs/rpi_halt_btn.py&' /etc/rc.local
sudo sed -i '$ a post-up python /home/pi/python_programs/illuminate_leds.py' /etc/network/interfaces
sudo halt
