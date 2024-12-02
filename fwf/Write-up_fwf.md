GPT
Write-up: Fun with Functional TryHackMe Box

Below is a detailed professional write-up describing the process of solving the "Fun with Functional" TryHackMe box.
Step 1: Initial Enumeration

    Conducted an Nmap scan on the target IP 10.10.86.16. The scan revealed:
        Port 22: SSH running OpenSSH 8.9p1.
        Port 5001: An HTTP service using Gunicorn. Accessing the service revealed a homepage with a functional programming theme and a link to /homework.

Step 2: Directory Bruteforcing

    Used a directory brute-forcing tool to enumerate endpoints on the web server. This confirmed the presence of /homework as a valid endpoint. The endpoint was inspected further.

Step 3: Reverse Shell via Homework Endpoint

    The /homework endpoint was vulnerable to file upload. This allowed execution of a reverse shell, providing access to the server as a user.

Step 4: Extracting SSH Key

    While exploring the file system, found an SSH private key in the .ssh directory of the prof user. This key was used to connect to the server as prof.

Step 5: User Flag

    After logging in as prof, located and read the user.txt file, which contained the flag: `EPI{h4sK377_C4n_83_r3vsh3ll_4s_W3lL}.`

Step 6: Privilege Escalation

    Checked the sudo permissions for the prof user, which revealed the ability to run the flask command as root without a password.

Steps for Exploiting Flask:

    Created a malicious Python script (shell.py) that spawns a bash shell.
    Set the FLASK_APP environment variable to the malicious script.
    Executed the Flask command using sudo, which ran the script as root and provided a root shell.

Step 7: Root Flag

    Navigated to the root directory and located the root.txt file. The flag was: `EPI{7VRns_0U7_p17H0N_1S_n0_83773r}.`