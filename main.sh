useradd -m og
adduser og sudo
echo 'og:y' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
dpkg -i chrome-remote-desktop_current_amd64.deb
apt install -y --fix-broken

export DEBIAN_FRONTEND=noninteractive
apt install --assume-yes xfce4 desktop-base xfce4-terminal
bash -c 'echo \"exec /etc/X11/Xsession /usr/bin/xfce4-session\" > /etc/chrome-remote-desktop-session'
apt remove --assume-yes gnome-terminal
apt install --assume-yes xscreensaver
systemctl disable lightdm.service

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt install -y --fix-broken
adduser og chrome-remote-desktop
read -p "Enter CRP: " CRP
bash -c "su - og -c '${CRP} --pin=123456'"
service chrome-remote-desktop start
echo "ready to use!"
nohup sleep 99999999
