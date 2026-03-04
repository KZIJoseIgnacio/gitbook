# Recopilación de información

La recopilación de información se puede distribuir en los siguientes objetivos y categorias.<br>

* Inteligencia de código abierto
* Enumeración de infraestructura
* Enumeración de servicios
* Enumeración de host

La fase de **recopilación de información** es fundamental en cualquier prueba de penetración, ya que proporciona la base para identificar vulnerabilidades y explotar sistemas con éxito. Comienza después del acuerdo contractual, y se enfoca en recolectar datos sobre la empresa, su infraestructura, empleados y servicios expuestos, tanto desde fuentes públicas (OSINT) como mediante escaneos activos. Esta fase incluye la enumeración de infraestructura, servicios y hosts, y permite mapear el entorno del cliente con el fin de entender cómo se comunican los sistemas y qué debilidades pueden existir. Encontrar información como claves SSH o contraseñas expuestas en plataformas como GitHub puede representar un riesgo crítico y debe reportarse de inmediato.

Dentro de esta fase, también se realizan tareas más técnicas como la **enumeración de servicios y hosts**, donde se identifican versiones de software, sistemas operativos y configuraciones que pueden presentar vulnerabilidades conocidas. Desde una perspectiva interna, es posible descubrir servicios "ocultos" o mal configurados que se consideran seguros por no estar expuestos externamente. Tras explotar alguna vulnerabilidad, se procede al **saqueo (pillaging)**, una etapa no oficial pero crucial en la que se recopila información sensible del host comprometido, como datos de clientes, credenciales, y configuraciones. Esta información ayuda en la **escalada de privilegios** y el **movimiento lateral**, fortaleciendo el alcance y efectividad de la prueba de penetración.
