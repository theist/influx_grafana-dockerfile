influxdb-grafana Dockerfile [WIP]
=================================

Es un dockerfile que (a dia de hoy) instala grafana e influxdb para poder hacer trasteos.

Quiero darle un poco más de cariño para que sea algo más útil pero de momento solo hace eso


Para construir (por ejemplo)
```
docker build -t influx .
```

Para arrancar

```
docker run -t -i -p 80:80 -p 8083:8083 -p 8086:8086 influx /bin/bash
```

Una vez dentro se arranca todo con

```
supervisord
```

También se puede lanzar directamente supervisord en vez de una sesión interactiva

```
docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 /usr/bin/supervisord
```

Con esto queda

- http://localhost:80 -> interfaz de grafana
- http://localhost:8083 -> interfaz de administracion de influxdb
- http://localhost:8086 -> http api influxdb

grafana user pass admin/admin
influx admin pass admin/admin
api sin claves

TODO
----

- [ ] Cambiar los almacenenes de datos para que puedan ser montados fuera del contenedor
- [ ] Creacion de primera base de datos al arrancar sin
- [ ] Salida de logs de grafana e influx por el log del contenedor
- [ ] personalizacion usuario admin de influx
- [ ] personalizacion usuario admin de grafana
