# Movimiento Lateral

El movimiento lateral es una fase crítica en las pruebas de penetración que ocurre tras haber explotado exitosamente un sistema y escalado privilegios. Su objetivo es simular lo que un atacante podría lograr al moverse dentro de la red corporativa, accediendo a otros sistemas, datos sensibles o puntos de control críticos. Este paso permite evaluar el verdadero alcance de una intrusión y cómo podría propagarse, por ejemplo, un ransomware, comprometiendo toda la red. Durante esta fase se aplican técnicas como el pivoteo, que permite usar un sistema comprometido como puente para acceder a redes internas, así como pruebas evasivas para evitar ser detectados. Estas acciones buscan identificar vulnerabilidades internas que podrían ser explotadas para ampliar el control dentro de la red.

Para ello, se retoman fases como la recolección de información, evaluación de vulnerabilidades y explotación, pero ahora desde dentro de la red. Se analizan sistemas, servicios y usuarios con mayor detalle, aprovechando posibles configuraciones débiles o accesos mal gestionados. Al comprometer cuentas privilegiadas, por ejemplo, de desarrolladores, se pueden descubrir datos internos clave o rutas adicionales de ataque. Esta fase culmina con la recolección de evidencia (post-explotación) y la creación de una prueba de concepto que demuestre el impacto del ataque y permita a la organización tomar acciones correctivas. Una adecuada implementación de segmentación de red y monitoreo de amenazas podría prevenir estos movimientos si se entiende cómo operan.

En esta etapa, queremos comprobar hasta dónde podemos llegar manualmente en toda la red y qué vulnerabilidades internas podemos encontrar que puedan explotarse. Para ello, repasaremos varias fases:

1. Pivoteando
2. Pruebas evasivas
3. Recopilación de información
4. Evaluación de vulnerabilidad
5. Explotación (de privilegios)
6. Post-explotación
