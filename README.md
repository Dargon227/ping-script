# Script de conexión | .bat
Este script está diseñado para Windows, sirve para aquellos problemas que son "A veces".

------------
**Tabla de contenidos**

[TOC]

------------

## Caracteristicas 
Cuenta con:

- Tres destinos a realizar el ping
- Creación de logs automáticos con fecha y hora, dentro de ellos guarda:
	- Hora, minutos y segundos del ping hecho
	- IP a hacer el ping con latencia (se mide en ms)
	- Si el destino es inaccesible va a mencionar "Error"
	- Diferencia entre los tres destinos
- Configuración fácil, probado en Windows 10 y Windows 7

## Ejemplo
Image:

![](https://github.com/Dargon227/ping-script/img/1.jpg)

## Instalación

## Configuración

La configuración es muy sencilla, puntos a tener en cuenta:

- Especificar si es Windows 7 o Windows 10
- Especificar los tres destinos (uno preferentemente que sea el router principal)

Las líneas que empiezan con **REM** son Comentarios, hay que sólo modificar luego del signo =

```batch
REM CAMBIAR SOLO USANDO "w10" o "w7"
REM w10  equivale a  Windows 10
REM w7    equivale a  Windows 7
set windows=w10
```
Los destinos por defecto son: **Google**, **DNS de CloudFlare** y **Router principal** (192.168.1.1)
Las líneas que empiezan con **REM** son Comentarios, hay que sólo modificar luego del signo =
```batch
REM CONFIGURACION, ESTOS SON LOS SERVIDORES PARA HACER PING
REM SIEMPRE USAR TRES OPCIONES
REM EL ULTIMO ES EL IP DEL ROUTER, SE USA PARA SABER SI
REM ES PROBLEMA DE LA CONEXION DEL EQUIPO CON LA RED O
REM EL EQUIPO CON INTERNET

set servidor1=google.com
set servidor2=1.1.1.1
set gatewayLocal=192.168.1.1

REM MANTENER LOS ESPACIO QUE TIENEN / PARA QUE EN EL
REM ARCHIVO SE VEA ORDENADO
set nombreServidor1=Google                /
set nombreServidor2=DNS CloudFlare  /
set nombreServidor3=Router                 /
```

## FAQ

##### ¿Cómo funciona?
Lo que hace este script es hacer ping con la finalidad de ver si tiene conexión y a su ves ver la latencia con el destino.


------------


##### ¿Qué pasa si no puede hacer ping con el destino?
Cuando el ping al destino que previamente se configuró no es accesible se pasa al siguiente destino para corroborar que el equipo tenga internet.

------------

##### ¿Los destinos 1 y 2 son de confianza?
Por defecto está configurado para hacer ping a Google, si llega a fallar ese ping pasa a hacerlo con los DNS de CloudFlare.

------------

##### ¿Cómo diferenciar si es problema de internet o con la red local?
Luego de pasar por el destino 1 y el destino 2 hace ping al router (Gateway) principal, si el ping a ese destino es inaccesible es porque está presentando problemas con la conexión entre el equipo y la red local. 

------------

Creado y pensado para la empresa **Infotel**.
