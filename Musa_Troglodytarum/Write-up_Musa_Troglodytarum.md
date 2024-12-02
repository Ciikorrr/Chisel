Step 1: Initial Enumeration
Conducted an Nmap scan on the target 10.10.151.17, identifying the following services:
Port 21: FTP running vsftpd 3.0.2.
Port 22: SSH running OpenSSH 6.7p1.
Port 80: HTTP running Apache 2.4.10.


Step 2: Directory Bruteforcing
Used a directory brute-forcing tool to discover hidden files and directories. Key findings included:
/assets/style.css contained a reference to a hidden PHP file:
/l3_B4n4N13r_D3s_M0nT4gN3s.php.


Step 3: Exploring the PHP Endpoint
Accessed the /l3_B4n4N13r_D3s_M0nT4gN3s.php endpoint, which redirected to another location with a query parameter pointing to a hidden directory. The response indicated the username for FTP was banane_celeste.

Step 4: FTP Access
Found a hidden image using the redirection mechanism, downloaded it, and extracted strings from the image. A list of potential passwords was generated.
Used Hydra to brute-force the FTP login with the username banane_celeste and the generated password list, successfully logging in with the password 4nndoLjqyBE0FSIDivNC.

Step 5: Retrieving Sensitive Files
Downloaded Valerian_creds.txt from the FTP server, which contained encoded data formatted in whitespace characters.
Decoded the file using a whitespace decoder, revealing credentials:
User: valerian
Password: T4k_t4k_S0lide_Dyn0_int0_Cr1mP.


Step 6: SSH Access as Valerian
Logged into the target via SSH using the credentials for valerian. Upon login, a message from root to Gabriel hinted at a hidden message in /usr/games/s3cr3t/.

Step 7: Retrieving Gabriel’s Password
Located a hidden file named .th1s_m3ss4ag3_15_f0r_g4br13L_0nly!. The content criticized Gabriel’s poor password security and revealed his password:
ca_serait_jamais_arrive_en_haskell.

Step 8: SSH Access as Gabriel
Logged into the target as Gabriel using the password. Retrieved the user.txt flag:
`EPI{l3_7R0nC_3S7_3N_R34Li73_un_PS3ud0_7r0NC_InCR0ya8Le}.`

Step 9: Privilege Escalation
Checked sudo permissions and discovered Gabriel could execute /usr/bin/vi on user.txt with any user except root. This was vulnerable to CVE-2019-14287, allowing a bypass of the user restriction.
Exploited the vulnerability by running sudo -u#1 /usr/bin/vi /home/gabriel/user.txt.
In vi, spawned a shell using the :shell command, gaining root access.


Step 10: Root Flag
Navigated to the root directory and retrieved the root.txt flag:
`EPI{L4_t193_Fl0R1F3R3_D35_m0nt49N35_DR35533}.`

