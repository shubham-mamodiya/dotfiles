wget -q -O - http://www.geogebra.net/linux/office@geogebra.org.gpg.key | sudo apt-key add -
sudo apt-add-repository -u 'deb http://www.geogebra.net/linux/ stable main'
sudo apt update
sudo apt install geogebra-classic
