---
description: Gestor de contenedores con interfaz gráfica
---

# Portainer

### Instalación

{% code overflow="wrap" %}
```bash
docker run -d -p 9003:9000 --restart always --name portainer -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce:latest
```
{% endcode %}

### Iniciar sesión Portainer

```bash
http://x.x.x.x:9000
```

<figure><img src="../../../../.gitbook/assets/image (13).png" alt=""><figcaption><p>Configurar usuario y contraseña</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/image (14).png" alt=""><figcaption><p>Portal Portainer</p></figcaption></figure>
