Step 1: Initial Enumeration

    Conducted an Nmap scan on the target 10.10.40.21. Findings included:
        Port 22: SSH running OpenSSH 7.6p1.
        Port 80: HTTP service, which redirected to multiple paths, including /blog and /wordpress.

Step 2: Web Enumeration

    Used feroxbuster to enumerate directories on the HTTP service. Discovered:
        A WordPress instance at /wordpress.
        Various WordPress-related directories, such as /wp-content and /wp-admin.

Step 3: WordPress Vulnerability Assessment

    Ran wpscan against the WordPress installation. Discovered:
        WordPress version 5.4.2, which is outdated and insecure.
        Default admin credentials were admin:romania.

Step 4: Gaining Access via WordPress

    Logged into the WordPress admin panel using the default credentials.
    Edited the 404.php file in the theme editor to include a PHP reverse shell.
    Triggered the reverse shell by visiting the modified 404 error page, gaining a shell as www-data.

Step 5: User Flag and Jenkins Discovery

    Found the user.txt flag in /home/squeezie: EPI{_SuN7_F3r1C1t_c4_M4n4Nc_1_P3p3N3_}.
    Located a file named wp-save.txt in /opt/, containing a clue about credentials: time_time_best_single.

Step 6: Port Discovery and Jenkins Access

    Enumerated open ports using ss -tulpn and identified:
        Jenkins service running locally on port 8080.
    Created an SSH tunnel to forward the Jenkins port to the local machine:

    ssh -L 8080:localhost:8080 squeezie@10.10.40.21

    Accessed the Jenkins interface at http://localhost:8080 using the credentials admin:spongebob.

Step 7: Privilege Escalation via Jenkins

    Used the Jenkins script console to execute a reverse shell payload, gaining a shell as the jenkins user.

Step 8: Root Access

    Found a note in /opt/note.txt with the root SSH credentials: Password: ambiance_skandal_tu_connais_deja.
    Logged in via SSH as root and retrieved the root.txt flag: EPI{D4nS4M_1n_T1m3_t1Me_4S4_C4_By3_bY3_By3}.