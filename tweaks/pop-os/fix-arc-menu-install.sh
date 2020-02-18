#!/usr/bin/bash
echo "==================================================="
echo "| ARCMENU FIXER                                   |"
echo "==================================================="
echo "| POP_OS! has a problem when install ArcMenu      |" 
echo "| It can be fixed by installing some dependencies |"
echo "==================================================="

     echo " [!] To start, you will need root, i'll prompt you to (CTRL+C to cancel): "
sudo echo " >>> Installing gnome menu libraries"
sudo apt install gir1.2-dbusmenu-gtk3-0.4 gir1.2-gmenu-3.0 > /dev/null 2>&1
echo 
read -p " [?] Are you using Google Chrome/Chromium browser? Y/n" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo " >>> So, installing Chrome Gnome Shell to simplify the extension installation directly in browser"
  sudo apt install chrome-gnome-shell > /dev/null 2>&1
fi

echo " >>> Prompting you to the Gnome Extension page arc-menu install... in 5 seconds"
echo "     When in there, click in the switch at the right side of the title"
echo 
echo "If you have already installed and the error keeps, try:"
echo " - Turning off the extension"
echo " - Logout"
echo " - and then turn on again"
xdg-open "https://extensions.gnome.org/extension/1228/arc-menu/"
echo "Enjoy your new stylish menu! 🎉"