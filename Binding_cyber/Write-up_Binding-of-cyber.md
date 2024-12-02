### **Step 1: Initial Enumeration**

*   Executed the provided script (./script.sh), revealing open ports on the target IP address 10.10.142.181.
    
*   Observed ASCII-art-like hints in the output, which included the phrase "goprot23" spread across multiple lines, suggesting a potential clue or flag location.
    
`
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
`

### **Step 2: Exploring Port 23456**

*   Connected to port 23456 using nc and received a cryptic message:"It remember! I put the flags in my chest, it's on a NFS share, how do I list them?"
    

### **Step 3: Identifying NFS Share**

*   Scanned the target and discovered port 2049 (NFS) was open, indicating a shared filesystem.
    
*   Used showmount -e 10.10.142.181 to list exported shares, identifying /home/nfs.
    

### **Step 4: Mounting the NFS Share**

*   Mounted the NFS share locally with the command:sudo mount -t nfs 10.10.142.181:/home/nfs /tmp -nolock.
    

### **Step 5: Locating and Cracking Chest.zip**

*   Found a chest.zip file in the NFS share.
    
*   Used fcrackzip to brute-force the zip password with the RockYou wordlist, revealing the password: isaaciscrazy.
    

### **Step 6: Extracting Files from Chest.zip**

*   Unzipped the archive using the command:unzip -P "isaaciscrazy" /tmp/chest.zip.
    
*   Navigated to the extracted content and identified an SSH private key located at /home/isaac/.ssh/id\_rsa.
    

### **Step 7: Gaining SSH Access**

*   Connected to the target machine as isaac using the private key with the command: ssh -i id\_rsa isaac@10.10.142.181.
    
*   Located and read the flag.txt file, revealing:EPI{4ch13V3M3N7\_7R0Phy\_90lD3n\_90d}.
    

### **Step 8: Investigating Privilege Escalation**

*   Found a hint.txt file suggesting a range of ports to explore further (5000-6500).
    
*   Discovered a Ruby shell environment and escaped it using system commands.
    
*   Ran linpeas for system enumeration, which identified that the tar binary had special capabilities (setcap).
    

### **Step 9: Privilege Escalation via Tar**

*   Leveraged tar's elevated permissions to escalate privileges, gaining root access.
    
*   Successfully obtained further information as required.
    

### **Conclusion**

The challenge provided opportunities to explore enumeration, brute-forcing, and privilege escalation techniques. The final flag EPI{4ch13V3M3N7\_7R0Phy\_90lD3n\_90d} was retrieved, completing the box successfully.