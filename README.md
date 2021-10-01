# Logging Fluent-bit + Loki & Grafana en Docker

### Objetivo:

Reflejar logs de los diferentes contenedores en Grafana

Este entorno se despliega con docker-compose.

Se compone de:

* Servidor Web Nginx 
* Base de datos MySQL
* Drupal con PHP-FPM
* Fluent-bit
* Loki
* Grafana

### Requisitos 

- Docker y Docker Compose instalados
- Git instalado

### Clonar el repositorio 

```shell 
git clone https://github.com/CeliaGMqrz/fluent-bit_loki_grafana__docker-drupal
```

### Crear el directorio de datos 

```shell 
mkdir -p storage/files storage/mysql
```

### Construir las imágenes 

Necesitamos construir las imágenes para nuestro entorno, para ello:

Ejecuta el pequeño script `bash build_images.sh`


### Cargar las variables de entorno 

Cargamos las variables de entorno necesarias para el escenario, ya que están incluidas en el fichero `docker-compose.yaml`

!! No te olvides de modificar las variables para tu proyecto.

> Estas credenciales solo son muestras de prueba. Se recomienda usar contraseñas seguras.

Las encuentras en el fichero `.env` en el repositorio


### Desplegar el entorno 

Lanzamos docker-compose up, en el directorio principal donde se encuentra el fichero yml

```shell
docker-compose up -d
```

### Contenedores en funcionamiento:

```shell
```

