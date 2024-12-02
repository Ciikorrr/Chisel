Step 1: Initial Enumeration
Conducted a comprehensive scan of the target IP 10.10.56.250 using Nmap. Key findings included:
Port 22: SSH running OpenSSH 7.6p1.
Port 111: RPC service for NFS and related services.
Port 139/445: Samba (SMB) with workgroup set to WORKGROUP.
Port 6379: Redis key-value store, accessible without authentication initially.
Additional services like rsync (port 873) and java-rmi (port 40981) were also identified.


Step 2: SMB Enumeration
Used smbclient to explore SMB shares and discovered a file named services.txt, containing the first flag.

Step 3: NFS Mount and Exploration
Listed NFS exports using showmount, revealing the /opt/conf share.
Mounted the share locally to access its contents, which included a Redis configuration file. This file revealed the Redis password:
B65Hx562F@ggAZ@F.

Step 4: Redis Enumeration
Connected to the Redis service using the password. Discovered an internal flag and credentials for an rsync service encoded in Base64. After decoding, the following credentials were retrieved:
User: rsync-connect
Password: Hcg3HP67@TW@Bc72v


Step 5: Rsync Exploitation
Used the retrieved credentials to copy files from the rsync service to the local machine. Among the files, the user.txt flag was found.

Step 6: Gaining SSH Access
Generated a new SSH key and added the public key to the authorized_keys file of the user jaqen using rsync.
Connected to the target machine as jaqen using SSH and the generated private key.

Step 7: TeamCity Discovery and Local Access
Found a /TeamCity directory in the root filesystem, indicating a TeamCity instance running on port 8111 locally.
Created an SSH tunnel to forward the service to the local machine for access.

Step 8: Privilege Escalation via TeamCity
Analyzed the catalina.out log file in the TeamCity directory and retrieved a super admin token.
Logged into TeamCity with the token and created a new project with a custom build configuration.
Added a build step to execute a custom Python script that deployed a reverse shell, providing root access to the target.

Step 9: Root Flag
After gaining root access, navigated to the root directory and retrieved the final flag.

