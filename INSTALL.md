./configure  
make  
sudo make install  

requires the proj library to be installed  
on arch linux that is simply "sudo pacman -S proj"  
on debian, something like "sudo apt install proj-bin proj-data libproj-dev"  

man projsync  
projsync --area-of-use ?  
sudo projsync --system-directory --area-of-use NAME  

