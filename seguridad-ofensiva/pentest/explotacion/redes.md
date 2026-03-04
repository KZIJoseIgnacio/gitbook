# Redes

## Información en Tráfico

### Credenciales

#### Pcredz

Capturar trafico con wireshark

```bash
wireshark
```

Obtener software de revisión de trafico

```bash
git clone https://github.com/lgandx/PCredz.git
```

Analizar trafico capturado

```bash
python3 -m venv venv
```

```bash
source venv/bin/activate
```

```bash
./Pcredz -f <file.pcapng> -t -v
```

### Recursos Windows

#### Snnafler

Descargar el software (se requiere que este dentro del dominio)

{% code overflow="wrap" %}
```powershell
curl https://github.com/SnaffCon/Snaffler/releases/download/1.0.212/Snaffler.exe -o Snaffler.exe
```
{% endcode %}

Ejecutar escaneo

```powershell
Snaffler.exe -s
```

#### **PowerHuntShares**

Descargar el software

<pre><code><strong>https://github.com/NetSPI/PowerHuntShares.git
</strong></code></pre>

Ejecutar el software

```powershell
Invoke-HuntSMBShares -Threads 100 -OutputDirectory c:\Users\<user>\<carpeta>
```

#### Man Spider

Descargar el software

```bash
git clone https://github.com/blacklanternsecurity/MANSPIDER.git
```

Ejecutar consulta a recurso windows autenticado en busca de parametro dado

{% code overflow="wrap" %}
```bash
docker run --rm -v ./manspider:/root/.manspider blacklanternsecurity/manspider <ip.host.dst> -c '<param.busqueda:passwd>' -u '<user>' -p '<password>'
```
{% endcode %}

#### Netexec

Ejecutar consulta a recurso windows autenticado en busca de contraseñas almacenadas

{% code overflow="wrap" %}
```bash
nxc smb 10.10.10.10 -u <user> -p "<password>" -M spider_plus -o DOWNLOAD_FLAG=True --smb-timeout 60
```
{% endcode %}

```bash
cd /tmp/nxc_hosted/nxc_spider_plus
```

```bash
grep -ri "passw" > salida.txt
```

