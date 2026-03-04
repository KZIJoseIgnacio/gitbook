# Samba

Samba es una implementación libre del protocolo de archivos compartidos de Microsoft Windows para sistemas de tipo UNIX. De esta forma, es posible que computadoras con GNU/Linux, Mac OS X o Unix en general se vean como servidores o actúen como clientes en redes de Windows.

Mientras que el puerto 139 se conoce técnicamente como "NBT sobre IP", el puerto 445 es "SMB sobre IP". SMB significa 'Server Message Blocks'.&#x20;

En lenguaje moderno, el bloque de mensajes de servidor también se conoce como sistema de archivos común de Internet.&#x20;

El sistema funciona como un protocolo de red de capa de aplicación que se utiliza principalmente para ofrecer acceso compartido a archivos, impresoras, puertos serie y otros tipos de comunicaciones entre nodos de una red.

Por ejemplo, en Windows, SMB puede ejecutarse directamente sobre TCP/IP sin necesidad de NetBIOS sobre TCP/IP.&#x20;

Esto utilizará, como señalas, el puerto 445. En otros sistemas, encontrarás servicios y aplicaciones que utilizan el puerto 139. Esto significa que SMB se ejecuta con NetBIOS sobre TCP/IP

### Enumeration Samba And Tricks&#x20;

```
Protocol_Name: SMB    #Protocol Abbreviation if there is one.
Port_Number:  137,138,139     #Comma separated if there is more than one.
Protocol_Description: Server Message Block         #Protocol Abbreviation Spelled out

Entry_1:
  Name: Notes
  Description: Notes for SMB
  Note: |
    While Port 139 is known technically as ‘NBT over IP’, Port 445 is ‘SMB over IP’. SMB stands for ‘Server Message Blocks’. Server Message Block in modern language is also known as Common Internet File System. The system operates as an application-layer network protocol primarily used for offering shared access to files, printers, serial ports, and other sorts of communications between nodes on a network.

    #These are the commands I run in order every time I see an open SMB port

    With No Creds
    nbtscan {IP}
    smbmap -H {IP}
    smbmap -H {IP} -u null -p null
    smbmap -H {IP} -u guest
    smbclient -N -L //{IP}
    smbclient -N //{IP}/ --option="client min protocol"=LANMAN1
    rpcclient {IP}
    rpcclient -U "" {IP}
    crackmapexec smb {IP}
    crackmapexec smb {IP} --pass-pol -u "" -p ""
    crackmapexec smb {IP} --pass-pol -u "guest" -p ""
    GetADUsers.py -dc-ip {IP} "{Domain_Name}/" -all
    GetNPUsers.py -dc-ip {IP} -request "{Domain_Name}/" -format hashcat
    GetUserSPNs.py -dc-ip {IP} -request "{Domain_Name}/"
    getArch.py -target {IP}

    With Creds
    smbmap -H {IP} -u {Username} -p {Password}
    smbclient "\\\\{IP}\\\" -U {Username} -W {Domain_Name} -l {IP}
    smbclient "\\\\{IP}\\\" -U {Username} -W {Domain_Name} -l {IP} --pw-nt-hash `hash`
    crackmapexec smb {IP} -u {Username} -p {Password} --shares
    GetADUsers.py {Domain_Name}/{Username}:{Password} -all
    GetNPUsers.py {Domain_Name}/{Username}:{Password} -request -format hashcat
    GetUserSPNs.py {Domain_Name}/{Username}:{Password} -request

    https://book.hacktricks.xyz/pentesting/pentesting-smb

Entry_2:
  Name: Enum4Linux
  Description: General SMB Scan
  Command: enum4linux -a {IP}

Entry_3:
  Name: Nmap SMB Scan 1
  Description: SMB Vuln Scan With Nmap
  Command: nmap -p 139,445 -vv -Pn --script=smb-vuln-cve2009-3103.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-ms17-010.nse {IP}

Entry_4:
  Name: Nmap Smb Scan 2
  Description: SMB Vuln Scan With Nmap (Less Specific)
  Command: nmap --script smb-vuln* -Pn -p 139,445 {IP}

Entry_5:
  Name: Hydra Brute Force
  Description: Need User
  Command: hydra -t 1 -V -f -l {Username} -P {Big_Passwordlist} {IP} smb
  
Entry_6:
  Name: SMB/SMB2 139/445 consolesless mfs enumeration
  Description: SMB/SMB2 139/445  enumeration without the need to run msfconsole
  Note: sourced from https://github.com/carlospolop/legion
  Command: msfconsole -q -x 'use auxiliary/scanner/smb/smb_version; set RHOSTS {IP}; set RPORT 139; run; exit' && msfconsole -q -x 'use auxiliary/scanner/smb/smb2; set RHOSTS {IP}; set RPORT 139; run; exit' && msfconsole -q -x 'use auxiliary/scanner/smb/smb_version; set RHOSTS {IP}; set RPORT 445; run; exit' && msfconsole -q -x 'use auxiliary/scanner/smb/smb2; set RHOSTS {IP}; set RPORT 445; run; exit' 
    
```
