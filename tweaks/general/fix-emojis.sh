#!/bin/sh
echo "=========================================="
echo "| EMOJI FIXER                            |"
echo "=========================================="
echo "| Fix when some emojis (like ❤️) doesn't |" 
echo "| show colored in browser or other apps  |"
echo "=========================================="

echo " [!] To start, you will need root, i'll prompt you to (CTRL+C to cancel): "
sudo echo " >>> Installing emoji font!! \(^_^)/ (Google Noto Emoji) \n"
if [ "$(command -v apt)" ]; then
  sudo apt install -y fonts-noto-color-emoji > /dev/null 2>&1
elif [ "$(command -v pacman)" ]; then
  sudo pacman -S --noconfirm noto-fonts-emoji > /dev/null 2>&1
else
  echo " [!] Sorry, i can't figure out your package manager, trying with cURL..."
  curl https://github.com/googlefonts/noto-emoji/blob/master/fonts/NotoColorEmoji.ttf --output NotoColorEmoji.ttf
  mkdir -p ~/.fonts/
  mv ./NotoColorEmoji.ttf ~/.fonts/
fi

echo " >>> Adding config files to fix missing colored emojis..."
sudo rm -r emoji-fix > /dev/null 2>&1
git clone https://github.com/stove-panini/fontconfig-emoji.git emoji-fix > /dev/null 2>&1
mkdir -p ~/.config/fontconfig/conf.d
mv -t ~/.config/fontsconfig/conf.d emoji-fix/69-emoji.conf emoji-fix/70-no-dejavu.conf > /dev/null 2>&1
sudo rm -r emoji-fix > /dev/null 2>&1

echo " >>> Updating font config cache"
fc-cache -f

echo
echo "Done! 🎉"
echo "Now emojis should work!"
echo "Check in your browser! (restart it)"
echo "If your terminal support it, restart it to see too!"
echo "And if it doesn't show, try restart your session or system to update"
