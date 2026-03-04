---
description: SIEM + XDR Open Source
---

# Wazuh

## Instalación

Clonar el respositorio de github

```bash
git clone https://github.com/wazuh/wazuh-docker.git -b v4.12.0
```

Ingresar al instalador single-node

```bash
cd wazuh-docker/single-node
```

Generar certificados digitales

```bash
docker-compose -f generate-indexer-certs.yml run --rm generator
```

Editar docker-compose para cambiar puertos

```bash
nano docker-compose.yml
```

Ejecutar el levantamiento de los contenedores

```bash
docker-compose up -d
```

Establecer el uso de memoria correctamente para el wazuh-indexer

```java
OPENSEARCH_JAVA_OPTS	-Xms3g -Xmx3g
```

Otorgar los permisos de administración correctos para cambiar parámetros dentro de la interfaz del contenedor wazuh-dashboard

```bash
chmod 777 /usr/share/wazuh-dashboard/data/wazuh/config/wazuh.yml
```

## Website

Ingresar al dashboard de administración de Wazuh

> https://10.10.10.10:9010

<figure><img src="../../.gitbook/assets/image (15).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (16).png" alt=""><figcaption></figcaption></figure>

## Integraciones

### Office 365

```java
  <office365>
    <enabled>yes</enabled>
    <interval>10m</interval>
    <curl_max_size>100M</curl_max_size>
    <only_future_events>yes</only_future_events>
    <api_auth>
      <tenant_id>INSERT</tenant_id>
      <client_id>INSERT</client_id>
      <client_secret>INSERT</client_secret>
    </api_auth>
    <subscriptions>
      <subscription>Audit.General</subscription>
      <subscription>Audit.SharePoint</subscription>
      <subscription>Audit.AzureActiveDirectory</subscription>
      <subscription>Audit.Exchange</subscription>
      <subscription>DLP.All</subscription>
    </subscriptions>
  </office365>
```

<figure><img src="../../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

### Virustotal

```bash
  <integration>
    <name>virustotal</name>
    <api_key>INSERT</api_key>
    <group>syscheck</group>
    <alert_format>json</alert_format>
  </integration>
```

### Maltiverse

```bash
  <integration>
    <name>maltiverse</name>
    <hook_url>https://api.maltiverse.com</hook_url>
    <level>3</level>
    <api_key>INSERT</api_key>
    <alert_format>json</alert_format>
  </integration>
```

### Slack

```bash
  <integration>
    <name>slack</name>
    <hook_url>INSERT</hook_url>
    <alert_format>json</alert_format>
    <level>12</level>
  </integration>
```

```bash
  <wodle name="aws-s3">
    <disabled>no</disabled>
    <interval>10m</interval>
    <run_on_start>yes</run_on_start>
    <skip_on_error>yes</skip_on_error>
    <bucket type="waf">
      <name>s3wazuhbucket</name>
      <path>waf</path>
      <aws_profile>default</aws_profile>
    </bucket>
  </wodle>
```

### AWS

Dentro del contenedor wazuh manager se deben crear los siguientes ficheros

```bash
export AWS_ACCESS_KEY_ID=<ID>
export AWS_SECRET_ACCESS_KEY=<SECRET>
```

```bash
mkdir /root/.aws/credentials
```

```bash
[default]
aws_access_key_id=<ID>
aws_secret_access_key=<SECRET>
```

```bash
/root/.aws/config
```

```bash
[default]
region = us-east-1
```

```bash
  <wodle name="aws-s3">
    <disabled>no</disabled>
    <interval>10m</interval>
    <run_on_start>yes</run_on_start>
    <skip_on_error>yes</skip_on_error>
    <bucket type="waf">
      <name>bucket-name-s3</name>
      <path>waf</path>
      <aws_profile>default</aws_profile>
    </bucket>
  </wodle>
  
  <wodle name="aws-s3">
    <disabled>no</disabled>
    <interval>10m</interval>
    <run_on_start>yes</run_on_start>
    <skip_on_error>yes</skip_on_error>
    <bucket type="cloudtrail">
      <name>bucket-name-s3</name>
      <path>cloudtrail</path>
      <aws_profile>default</aws_profile>
    </bucket>
  </wodle>  
```

## Agentes

### FIM Linux

Instalar auditd

<pre class="language-bash"><code class="lang-bash"><strong>sudo apt install auditd
</strong></code></pre>

```bash
sudo systemctl enable auditd --now
```

Agregar la siguiente linea en la configuración del fichero del agente

{% code overflow="wrap" %}
```bash
<directories check_all="yes" realtime="yes" report_changes="yes" whodata="yes">/home/ciberseguridad/FIM-TEST/</directories>
```
{% endcode %}

Reiniciar el agente Wazuh

```bash
systemctl restart wazuh-agent.service
```

### FIM Windows

Agregar la siguiente linea en la configuración del fichero del agente

{% code overflow="wrap" %}
```java
<directories recursion_level="2" check_all="yes" report_changes="yes" realtime="yes">C:\FIM</directories>
```
{% endcode %}

* level 0 = Solo se monitorean los archivos directamente dentro del directorio especificado
* level 1 = Se monitorean los archivos en el directorio especificado y en sus subdirectorios inmediatos.
* level 2= Incluye el directorio especificado, sus subdirectorios inmediatos y los subdirectorios.

Reiniciar el agente Wazuh

```bash
NET STOP Wazuh
```

```
NET START Wazuh
```

## Tableros

Tableros office 365

{% file src="../../.gitbook/assets/tablero wazuh - office365.ndjson" %}

## Problemas Conocidos

### Desinstalar agente Wazuh

Eliminar rastros que generan conflictos

```bash
apt-get remove wazuh-agent
```

```bash
apt-get remove --purge wazuh-agent
```

```bash
systemctl disable wazuh-agent
```

```bash
systemctl daemon-reload
```
