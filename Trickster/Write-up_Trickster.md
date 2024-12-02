Nmap Scan:
I started by running an nmap scan on the target IP 10.10.153.225 with the -A and -p- options to discover open ports and services. The scan revealed that the following services were running:
HTTP on port 80 (Apache 2.4.52) with a 401 Unauthorized response.
Samba smbd on ports 139 and 445 (version 4.6.2).

Enum4linux:
I used enum4linux to enumerate users from the target machine. It revealed the domain name ASGARD and several local users, including loki and alligator.

Hydra Brute Force Attack:
Next, I attempted to brute-force the login for the alligator user using the hydra tool with a list of passwords from the rockyou.txt wordlist. After several attempts, I successfully cracked the password for alligator as barkley.

Bypassing JS Filter:
I noticed a JavaScript filter on the login form that tried to prevent certain input. I bypassed this filter by injecting a reverse shell command using a payload to execute a base64-decoded command, which connected back to my system and gave me a shell as the www-data user.

Finding the Web Flag:
After executing the reverse shell and navigating to /var/www/files/web.txt, I found the first flag: EPI{I_H4v3_4n_4RmY_4nd_Y0u_C4nT_St4p_M3}.

Port Forwarding with Chisel:
Since SSH was only available locally on the victim machine, I set up a reverse SSH tunnel using chisel. The chisel client connected to my server, forwarding the SSH port from 127.0.0.1:22 on the target machine to my local machine.

SSH Brute Force:
Using hydra, I then performed a brute-force attack on the SSH service running on port 9846, which had been forwarded via chisel. I cracked the password for the loki user as claudia.

SSH Access:
I logged in to the target machine via SSH as the loki user and retrieved the user.txt flag: EPI{L0v3_iS_T4ulY_4_D4gG3r}.

Privilege Escalation:
I checked the sudo permissions for loki and found that the user could run /usr/sbin/shutdown as root without a password. I reviewed the binary for shutdown and found that I could perform binary hijacking by creating a custom script for poweroff, which would execute a reverse shell to my system.

Root Shell:
After setting up the reverse shell and executing shutdown, I gained root access to the machine.

Root Flag:
I accessed the root user's home directory and found the root.txt flag, which contained the root flag: EPI{I_H4V3_B33n_f4lL1ng_F0r_W1y_t00_L0ng}.



