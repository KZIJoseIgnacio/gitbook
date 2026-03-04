# Routing

El enrutamiento o ruteo es la función de buscar un camino entre todos los posibles en una red de paquetes cuyas topologías poseen una gran conectividad.

Para ver cómo se ve su tabla de enrutamiento actual use los siguientes comandos.

* ip route        | Linux
* route print   | Windows

Para añadir una nueva ruta a su tabla use el siguiente comando.

> ip route add \<IP-Network>\</Mask> via \<IP-Gateway>
