Step 1: Reconnaissance
The first step was conducting a reconnaissance scan on the target IP address (10.10.185.245). I used Nmap to perform a full scan to identify open ports and services running on the machine. The scan revealed the following:
Port 22: SSH (OpenSSH 7.6p1)
Port 80: HTTP (Apache httpd 2.4.38)

The HTTP service was running a web application called TekPedago, which I decided to investigate further.

Step 2: Analyzing the Web Application

Upon accessing the web application, I observed that it presented a simple gallery with buttons labeled A Tek and A Pedago. The application’s backend used PHP to handle requests based on the view parameter in the URL. I identified that the parameter was not sanitized properly, making it susceptible to Local File Inclusion (LFI) attacks. Specifically, the PHP code allowed including files based on the view parameter, without proper validation.

Step 3: Exploiting the LFI Vulnerability

I exploited the LFI vulnerability by manipulating the view parameter in the URL to include arbitrary files on the server. For example, by crafting a URL that referenced the php://filter wrapper, I was able to view the contents of sensitive files such as /etc/passwd. This file contained information about the system's user accounts, which was 
valuable for the next steps.

Step 4: Command Injection for Reverse Shell

After confirming the LFI vulnerability, I moved on to exploiting the server by executing commands remotely. I discovered that the web application allowed for command injection, enabling me to run arbitrary system commands. I injected a reverse shell command, instructing the server to connect back to my machine and provide me with a shell. The reverse shell gave me access to the system, but my privileges were still limited.

Step 5: Privilege Escalation

With the reverse shell in place, I began exploring ways to escalate my privileges. I found that the system was running a scheduled backup script executed by a cron job every minute. The script created backups in a specific directory. By modifying this script to include a payload that would spawn a root shell, I was able to execute commands as the root user.
The modified backup script triggered the reverse shell to connect back to my machine with root privileges. This allowed me to fully compromise the system.

Step 6: Flag Collection

Once I had gained root access, I navigated the system to locate the flags. I found several flags in sensitive locations, such as /root/flag4.txt, which confirmed my successful exploitation and privilege escalation.


