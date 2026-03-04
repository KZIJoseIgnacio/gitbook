---
description: Universidad tecnologica de Chile Inacap
---

# Tesis Universitaria

En mi tesis "Implementación de un SOC Open Source", presenté un estudio sobre la viabilidad de construir un Centro de Operaciones de Seguridad (SOC) basado en software de código abierto, comparándolo con soluciones comerciales.

### Planteamiento del Problema

Siempre me he preguntado si un SOC basado en **software open source** puede ser igual de efectivo que uno que utiliza **software con licencia** en términos de seguridad, costos y rendimiento. Mi investigación busca responder esta pregunta y ofrecer una solución viable para organizaciones que desean fortalecer su ciberseguridad sin depender de licencias costosas.

### **Marco Teórico**

Para entender mejor el tema, investigué a fondo qué es un SOC, su estructura, funciones y los diferentes tipos que existen (físico, distribuido y mixto). También analicé herramientas clave como IDS, IPS, SIEM, honeypots y escáneres de vulnerabilidades. Además, comparé las ventajas y desventajas de usar software open source frente al software licensed, considerando factores como seguridad, estabilidad y costos. Finalmente, exploré la importancia de los sistemas operativos y la virtualización en la implementación de un SOC.

### Metodología

Decidí realizar una investigación aplicada, diseñando y configurando un SOC basado en software open source en un entorno controlado. Para esto, seleccioné herramientas como Wazuh + ELK, Snort, Suricata, OpenVAS y OPNsense, probando su funcionamiento y capacidad para detectar y mitigar amenazas.

### Implementación del SOC Open Source

La implementación fue un proceso clave en mi trabajo. Instalé y configuré diferentes herramientas en distintos nodos del SOC, entre ellos:

* **SIEM (Wazuh + ELK)** para la gestión de eventos de seguridad.
* **IPS (Suricata) e IDS (Snort)** para la detección y prevención de intrusos.
* **Otras herramientas de ciberseguridad** como OpenCTI, CyberChef y OpenVAS.
* **Honeypots y Firewalls** para aumentar la protección y análisis de amenazas.\
  Luego, realicé pruebas de funcionamiento y análisis de la detección de ataques para evaluar su efectividad.

### **Comparación SOC Open Source vs. Licensed**

Quería demostrar con datos concretos qué tan viable era mi solución, por lo que comparé las métricas de detección y mitigación de amenazas con SOC comerciales. También realicé un análisis de costos y facilidad de uso para evaluar si realmente valía la pena optar por una solución open source en lugar de una de pago.

### **Resultados y Conclusiones**

Mi investigación confirmó que **es posible implementar un SOC eficiente y efectivo utilizando software de código abierto**. Esta alternativa no solo reduce costos, sino que también permite mayor personalización. Sin embargo, descubrí que, en comparación con soluciones comerciales, el SOC open source requiere mayor conocimiento técnico y tiempo de configuración.

### **Reflexión Final**

Estoy convencido de que el uso de software open source en ciberseguridad es una opción viable y poderosa, especialmente para organizaciones con recursos limitados. Si bien existen desafíos, la flexibilidad, transparencia y accesibilidad de estas herramientas hacen que valga la pena invertir en su implementación y desarrollo.

{% file src="../.gitbook/assets/Tesis Implementación de un centro de operaciones de seguridad open source.pdf" %}

{% file src="../.gitbook/assets/Presentación Implementación de un centro de operaciones de seguridad open source.pdf" %}
