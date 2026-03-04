# Post Explotación

Durante la etapa de **post-explotación** en una prueba de penetración, ya se ha comprometido con éxito un sistema objetivo. Esta fase se enfoca en maximizar el valor del acceso obtenido, buscando información sensible, evaluando posibilidades de escalar privilegios y asegurando el acceso persistente. A diferencia de las fases anteriores, esta se lleva a cabo desde una perspectiva interna, con acceso directo al sistema comprometido, lo que permite un análisis mucho más profundo del entorno.

***

#### **Pruebas evasivas**

A pesar de tener acceso, debemos actuar con cautela para no ser detectados. Incluso una acción mínima puede activar alertas en sistemas de defensa como EDR. Las pruebas evasivas pueden clasificarse como:

* **Evasive**: Diseñadas para evitar la detección.
* **Hybrid Evasive**: Mezcla de técnicas evasivas y no evasivas.
* **Non-Evasive**: Completamente visibles para los sistemas de defensa.

Elegir el tipo de prueba depende del objetivo acordado con el cliente: algunas veces se busca precisamente que los sistemas defensivos reaccionen para evaluar su eficacia.

***

#### **Recopilación de información (desde dentro)**

Ahora, con una vista interna del sistema, volvemos a recolectar información, pero esta vez con acceso local. Se revisan:

* Recursos compartidos
* Servicios locales
* Arquitectura de red
* Configuraciones de seguridad

Esta información no solo da contexto, sino que sienta las bases para las siguientes fases.

***

#### **Expoliación (Pillaging)**

Aquí se analiza el papel del host en la red y se busca información valiosa, como:

* Contraseñas en texto plano
* Archivos de configuración sensibles
* Claves SSH
* Documentos internos, correos, scripts

Se examinan detalles como subredes, servicios internos, y la interacción del host con otros dispositivos para encontrar nuevas vías de ataque y posibles movimientos laterales.

***

#### **Persistencia**

El objetivo es asegurar que podamos volver a acceder al sistema incluso si la sesión actual se cierra. Esto puede lograrse con:

* Backdoors
* Credenciales almacenadas
* Modificaciones en scripts o tareas programadas

El momento de establecer persistencia debe ser evaluado con cuidado, especialmente si la explotación original puede haber sido inestable.

***

#### **Evaluación de vulnerabilidades (interna)**

Ya con acceso local, volvemos a buscar vulnerabilidades desde una posición privilegiada. Esto puede revelar nuevas debilidades que antes no eran visibles externamente, y es especialmente útil para identificar vectores de escalada de privilegios.

***

#### **Escalada de privilegios**

Aquí buscamos pasar de un usuario común a uno con permisos de administrador o incluso SYSTEM/root. Puede hacerse de dos maneras:

* **Local**: Explotando vulnerabilidades del sistema actual.
* **Indirecta**: Reutilizando credenciales de usuarios con mayores privilegios.

Esto es fundamental para obtener control total del sistema y moverse con libertad dentro de la red.

***

#### **Exfiltración de datos**

Una prueba común en esta fase es determinar si es posible extraer información del entorno. Esto pone a prueba defensas como DLP o EDR, y se recomienda:

* Simular la exfiltración con datos ficticios (p. ej., tarjetas de crédito falsas).
* Confirmar con el cliente antes de exfiltrar datos reales.
* Documentar todo, incluyendo capturas o grabaciones, para sustentar hallazgos.

Se deben tener en cuenta marcos regulatorios como **PCI-DSS**, **HIPAA**, **GDPR**, entre otros, dependiendo del tipo de datos manejados.

***

Esta fase es especialmente crítica porque muestra el **impacto real de una intrusión** y sirve para valorar el riesgo. Si se obtiene acceso a información sensible, se recomienda informar de inmediato al cliente, quien puede decidir pausar o modificar el alcance de la prueba.

En la siguiente etapa, se abordará el **movimiento lateral**, que aprovecha la información recolectada aquí para acceder a otros sistemas dentro de la red.
