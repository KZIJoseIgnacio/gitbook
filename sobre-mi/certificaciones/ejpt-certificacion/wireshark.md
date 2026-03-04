# Wireshark

Wireshark es un analizador de protocolos utilizado para realizar análisis y solucionar problemas en redes de comunicaciones, para análisis de datos y protocolos, y como una herramienta didáctica. Cuenta con todas las características estándar de un analizador de protocolos de forma únicamente hueca.

A continuación le indico algunos filtros que pueden ser de ayuda.

| Syntaxis               | Descripción                                                               |
| ---------------------- | ------------------------------------------------------------------------- |
| ip                     | Solo paquetes que utilizan IP como protocolo de capa 3.                   |
| not ip                 | Lo contrario de la sintaxis anterior.                                     |
| tcp port 80            | Paquetes donde el puerto TCP de origen o destino es 80.                   |
| net 192.168.54.0/24    | Paquetes desde y hacia la red especificada.                               |
| src port 8080          | El puerto de origen debe ser 8080; el protocolo de transporte no importa. |
| src net 192.168.1.0/24 | La dirección IP de origen debe estar en la red especificada.              |
| host 192.168.45.65     | Todos los paquetes desde o hacia el host especificado.                    |
| host www.example.com   | Todos los paquetes desde o hacia el nombre de host especificado.          |
