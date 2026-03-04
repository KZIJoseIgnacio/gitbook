---
description: Honeypot Open Source
---

# T-POT

### Instalación

```bash
git clone https://github.com/telekom-security/tpotce.git
```

```bash
cd tpotce/
```

```bash
./install.sh
```

```bash
htpasswd -n -b "CiberseguridadChqta" "Cy2k25Chqta" | base64 -w0
```

```bash
nano .env
```

```bash
Install? (y/n) y
```

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption><p>Selección de tipo de instalación (por defecto Hive)</p></figcaption></figure>

```bash
Definir user - password
```

<figure><img src="../../.gitbook/assets/image (3).png" alt=""><figcaption><p>Nuevo puerto de conexión vía SSH</p></figcaption></figure>

```bash
sudo journalctl -fu tpot
```

```bash
sudo netstat -tulnp | grep :25
```

```bash
sudo systemctl disable exim4
```

### Puertos T-POT

| Puerto                                                                                                                    | Funcionalidad                         |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------- |
| [64297](https://3.231.156.144:64297/kibana/app/dashboards#/view/8d4e8300-ebde-11e8-9675-1b303bfb38ef?_g=h@3a04046)/kibana | Dashboards                            |
| [64297](https://3.231.156.144:64297/kibana/app/dashboards#/view/8d4e8300-ebde-11e8-9675-1b303bfb38ef?_g=h@3a04046)/map/   | Mapa de ataque en vivo                |
| 64297/cyberchef/                                                                                                          | Encriptación, trasnformación de datos |
| 64297/spiderfoot/                                                                                                         | Ciberinteligencia                     |

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption><p>Capturas dashboards T-POT</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (5).png" alt=""><figcaption><p>Capturas Dashboards T-POT</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (6).png" alt=""><figcaption><p>Mapa de Ataque en Vivo</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (7).png" alt=""><figcaption><p>Cyberchef</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption><p>Spiderfoot CIberinteligencia</p></figcaption></figure>
