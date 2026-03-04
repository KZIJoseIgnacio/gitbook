---
description: Escáner de vulnerabilidades de código abierto
---

# OpenVAS

### Instalación

```bash
sudo apt update && sudo apt upgrade
```

```bash
sudo apt install gvm -y
```

```bash
sudo apt install openvas -y
```

```bash
sudo gvm-setup
```

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption><p>Entrega de credenciales OpenVAS</p></figcaption></figure>

### Verificar instalación

```bash
sudo gvm-check-setup
```

### Puerto por defecto

```bash
nano /usr/lib/systemd/system/gsad.service
```

```bash
ExecStart=/usr/local/sbin/gsad --foreground --listen=0.0.0.0 --port=9001
```

### Iniciar sesión OpenVAS

```bash
https://x.x.x.x:9001
```

<figure><img src="../../.gitbook/assets/image (11).png" alt=""><figcaption><p>Portal de incio de sesión</p></figcaption></figure>

### Actualizar motores de busqueda

```bash
greenbone-nvt-sync
```

```bash
greenbone-feed-sync
```

### Iniciar / Detener Servicios

```bash
sudo gvm-start
```

```bash
sudo gvm-stop
```

