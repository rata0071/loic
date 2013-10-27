#LOIC

Es una implementación de algunas de las funcionalidades de [LOIC](https://es.wikipedia.org/wiki/Low_Orbit_Ion_Cannon) realizadas en lenguaje JavaScript, lo cual permite ejecutarlo desde un navegador web.

[![Icecat anonymous](logo.png)](http://b4zz4.github.io/loic/release/loic.firefox.xpi)
 
[Instalar](http://b4zz4.github.io/loic/release/loic.firefox.xpi) en GNU Icecat, GNU Iceweasel, Seamonkey y Mozilla Firefox.

**Nota:** Este código fuente esta basado en el empaquetado den [cryptocat](https://crypto.cat) y [lowc](https://code.google.com/p/lowc/)

## Enjambre (Hive Ming)

Esta opción esta ensada para coordinar ataques entre varias personas, originalmente suelen hacerse con [RSS](https://es.wikipedia.org/wiki/Rss) pero esto todavia no esta soportado por este plugin.

~~~
var info = ({
  "target": "http://www.example.com/", //Obejtivo URL (con "http://").
  "msg": "LOWC - Test tool", //Mensaje.
  "status": "stop" //Estado del ataque ("start" o "stop").
})
~~~

Esto podes publicarlo en un [pasti](http://pastebin.com/) y pasar la URL crudo (raw).

## Pendientes

* Documentación de Inteligencia de emjambe
* Chat cifrado bajado en crytocat
