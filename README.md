# scripts_mana
scripts for mana

#EXAMPLE: interfaces.pl
root@kali:/usr/share/mana-toolkit/run-mana# perl scripts_mana/interfaces.pl
current values:
upstream=eth0
phy=wlan0
interface=wlan0

root@kali:/usr/share/mana-toolkit/run-mana# perl scripts_mana/interfaces.pl wlan0 wlan1
changed values:
upstream=wlan0
phy=wlan1
interface=wlan1

root@kali:/usr/share/mana-toolkit/run-mana# perl scripts_mana/interfaces.pl eth0 wlan0
changed values:
upstream=eth0
phy=wlan0
interface=wlan0