echo what is your username
read username
echo what is your password
stty -echo 
read password
stty echo
echo "do you want to autologin (if you want to use autologin type yes, otherwise type no)"
read autologin
#username and password for automatic setting up a gnome account

mirror
yes | update
yes $password | sudo mirror
#answers yes to proceed with update / installation and automatic types in your password to proceed with instalation
upall

git clone https://github.com/arcolinuxd/arco-gnome
cd arco-gnome

sudo ./000-use-all-cores-makepkg-conf-v4.sh
sudo ./100-display-manager-and-desktop-v1.sh
sudo ./110-install-sound-v3.sh
sudo ./120-bluetooth-v2.sh
sudo ./121-fix-bluetooth-switch-not-working-v1.sh
sudo ./130-install-printers-v3.sh
yes $password | yes $password | yes $username | ./140-install-samba-v3.sh
sudo ./150-install-network-discovery-v4.sh
sudo ./160-install-tlp-for-laptops-v1.sh
sudo ./200-software-arch-linux-repo-v2.sh
sudo ./300-software-AUR-repo-v1.sh
sudo ./400-software-arch-linux-repo-distro-specific-v1.sh
sudo ./500-software-AUR-repo-distro-specific-v1.sh
sudo ./600-software-from-ArcoLinux-repo-v1.sh
sudo ./700-installing-fonts-v2.sh
sudo ./800-autologin-v3.sh
if ($autologin = no || $autologin = No || $autologin = n) {
} else if ($autologin = yes || $autologin = Yes || $autologin = y) {
$username | sudo ./800-autologin-v3.sh
} else {
echo "That's not a valid option, please choose yes or no";
}
sudo ./900-fix-microcode-error-v1.sh
sudo ./910-fix-mouse-cursor-breeze-snow-v1.sh
#runs all the codes you need


sudo reboot
#reboots the system