Step 1: Initial Enumeration
Conducted an Nmap scan on the target 10.10.174.233. Key findings included:
Port 22: SSH running OpenSSH 7.6p1.
Port 80: HTTP running Apache 2.4.29.
Discovered the HTTP service hosted a website with the title "Patience."


Step 2: Web Enumeration
Used feroxbuster to enumerate hidden directories and files on the web server. Results revealed:
A large video file at /assets/img/patience.mp4.
A directory containing CSS, fonts, and image files.
The presence of a Cookie header (id) in the HTTP requests, which appeared significant.


Step 3: Cookie Manipulation
Manipulated the Cookie header (id) in requests to inject malicious SQL commands and gain access to a file upload capability.
Uploaded a PHP reverse shell to establish a foothold on the target system.

Step 4: Initial Access
Executed the uploaded reverse shell by accessing it through the browser.
Gained a shell on the machine as the user cookie-monster.
Found a log file in /home/cookie-monster/cookie_analysis containing credentials for SSH access:
Password: Giv3_Me_M04r_Co0Ki3s.

Step 5: SSH Access
Logged into the target via SSH as cookie-monster.
Conducted enumeration using linpeas, which revealed:
A writable directory at /dev/shm.
Tools like ping, bash, and nc available for exploitation.


Step 6: Port Forwarding and Gitea Access

`ssh -L 3001:localhost:3000 cookie-monster@10.10.174.233`

Discovered a Gitea service running on port 3000 locally.
Logged into Gitea and leveraged a Git post-receive hook to execute a reverse shell.

Step 7: Shell as Git User
Gained a shell as the git user on the machine hosting Gitea.
Checked sudo privileges for the git user and found they allowed running all commands as root.

Step 8: Root Access
Escalated privileges to root using sudo su.
Accessed the root directory and retrieved the final flag:
EPI{C_1s_f0R_C00K135_tH4T_S_G00d_3n0UgH_F0r_M3}.



