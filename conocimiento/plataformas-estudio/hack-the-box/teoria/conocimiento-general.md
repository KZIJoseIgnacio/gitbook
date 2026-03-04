# Conocimiento General

### DNS

<table data-header-hidden><thead><tr><th width="98.54547119140625">Registro DNS</th><th>Descripción</th></tr></thead><tbody><tr><td>A</td><td>Como resultado, devuelve una dirección IPv4 del dominio solicitado.</td></tr><tr><td>AAAA</td><td>Devuelve una dirección IPv6 del dominio solicitado.</td></tr><tr><td>MX</td><td>Como resultado, devuelve los servidores de correo responsables.</td></tr><tr><td>NS</td><td>Devuelve los servidores DNS (servidores de nombres) del dominio.</td></tr><tr><td>TXT</td><td>Este registro puede contener información diversa. El todo TXT se puede utilizar, por ejemplo, para validar Google Search Console o validar certificados SSL. Además, las entradas SPF y DMARC están configuradas para validar el tráfico de correo y protegerlo del spam.</td></tr><tr><td>CNAME</td><td>Este registro sirve como alias para otro nombre de dominio. Si desea que el www.example.eu de dominio apunte a la misma IP que example.eu, debe crear un registro A para example.eu y un registro CNAME para www.example.eu.</td></tr><tr><td>PTR</td><td>El registro PTR funciona al revés (búsqueda inversa). Convierte las direcciones IP en nombres de dominio válidos.</td></tr><tr><td>SOA</td><td>Proporciona información sobre la zona DNS correspondiente y la dirección de correo electrónico del contacto administrativo.</td></tr></tbody></table>

Dorks

| Operador                 | Descripción del operador                                                             | Ejemplo                                             | Ejemplo de descripción                                                                                 |
| ------------------------ | ------------------------------------------------------------------------------------ | --------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| `site:`                  | Limita los resultados a un sitio web o dominio específico.                           | `site:example.com`                                  | Encuentre todas las páginas de acceso público en example.com.                                          |
| `inurl:`                 | Busca páginas con un término específico en la URL.                                   | `inurl:login`                                       | Busque páginas de inicio de sesión en cualquier sitio web.                                             |
| `filetype:`              | Busca archivos de un tipo determinado.                                               | `filetype:pdf`                                      | Encuentre documentos PDF descargables.                                                                 |
| `intitle:`               | Busca páginas con un término específico en el título.                                | `intitle:"confidential report"`                     | Busque documentos titulados "informe confidencial" o variaciones similares.                            |
| `intext:` o `inbody:`    | Busca un término dentro del cuerpo del texto de las páginas.                         | `intext:"password reset"`                           | Identifique las páginas web que contengan el término "restablecimiento de contraseña".                 |
| `cache:`                 | Muestra la versión almacenada en caché de una página web (si está disponible).       | `cache:example.com`                                 | Vea la versión en caché de example.com para ver su contenido anterior.                                 |
| `link:`                  | Busca páginas que enlazan con una página web específica.                             | `link:example.com`                                  | Identifique los sitios web que enlazan con example.com.                                                |
| `related:`               | Busca sitios web relacionados con una página web específica.                         | `related:example.com`                               | Descubre sitios web similares a example.com.                                                           |
| `info:`                  | Proporciona un resumen de la información sobre una página web.                       | `info:example.com`                                  | Obtén detalles básicos sobre example.com, como el título y la descripción.                             |
| `define:`                | Proporciona definiciones de una palabra o frase.                                     | `define:phishing`                                   | Obtenga una definición de "phishing" de varias fuentes.                                                |
| `numrange:`              | Busca números dentro de un rango específico.                                         | `site:example.com numrange:1000-2000`               | Busque páginas en example.com que contengan números entre 1000 y 2000.                                 |
| `allintext:`             | Busca páginas que contengan todas las palabras especificadas en el cuerpo del texto. | `allintext:admin password reset`                    | Busque páginas que contengan "admin" y "password restable" en el cuerpo del texto.                     |
| `allinurl:`              | Busca páginas que contengan todas las palabras especificadas en la dirección URL.    | `allinurl:admin panel`                              | Busque páginas con "admin" y "panel" en la URL.                                                        |
| `allintitle:`            | Busca páginas que contengan todas las palabras especificadas en el título.           | `allintitle:confidential report 2023`               | Busque páginas con "confidencial", "informe" y "2023" en el título.                                    |
| `AND`                    | Limita los resultados al exigir que todos los términos estén presentes.              | `site:example.com AND (inurl:admin OR inurl:login)` | Encuentre páginas de administración o de inicio de sesión específicamente en example.com.              |
| `OR`                     | Amplía los resultados al incluir páginas con cualquiera de los términos.             | `"linux" OR "ubuntu" OR "debian"`                   | Busca páginas web que mencionen Linux, Ubuntu o Debian.                                                |
| `NOT`                    | Excluye los resultados que contienen el término especificado.                        | `site:bank.com NOT inurl:login`                     | Buscar páginas en bank.com excluyendo las páginas de inicio de sesión.                                 |
| `*` (comodín)            | Representa cualquier carácter o palabra.                                             | `site:socialnetwork.com filetype:pdf user* manual`  | Busque manuales de usuario (guía del usuario, manual del usuario) en formato PDF en socialnetwork.com. |
| `..` (búsqueda de rango) | Busca resultados dentro de un rango numérico especificado.                           | `site:ecommerce.com "price" 100..500`               | Busque productos con precios entre 100 y 500 en un sitio web de comercio electrónico.                  |
| `" "` (comillas)         | Busca frases exactas.                                                                | `"information security policy"`                     | Encuentre documentos que mencionen la frase exacta "política de seguridad de la información".          |
| `-` (signo menos)        | Excluye términos de los resultados de búsqueda.                                      | `site:news.com -inurl:sports`                       | Busque artículos de noticias sobre news.com excluyendo contenido relacionado con los deportes.         |



Fases Metasploit

<figure><img src="../../../../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

#### Database

`MySQL`esquemas/bases de datos del sistema predeterminados:

* `mysql`- es la base de datos del sistema que contiene tablas que almacenan la información requerida por el servidor MySQL
* `information_schema`- proporciona acceso a los metadatos de la base de datos
* `performance_schema`- es una función para monitorear la ejecución del servidor MySQL a un nivel bajo
* `sys`- un conjunto de objetos que ayuda a los administradores de bases de datos y a los desarrolladores a interpretar los datos recopilados por el esquema de rendimiento

`MSSQL`esquemas/bases de datos del sistema predeterminados:

* `master`- mantiene la información de una instancia de SQL Server.
* `msdb`- utilizado por el Agente SQL Server.
* `model`- una base de datos de plantillas copiada para cada nueva base de datos.
* `resource`- una base de datos de solo lectura que mantiene los objetos del sistema visibles en cada base de datos del servidor en el esquema sys.
* `tempdb`- mantiene objetos temporales para consultas SQL.

<br>
