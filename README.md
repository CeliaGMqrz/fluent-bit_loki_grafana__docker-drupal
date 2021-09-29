# Web Drupal (Nginx, Drupal+php-fpm y MySQL) en Docker 

### Objetivo:

Montar una web con Drupal

* Servidor Web Nginx 
* Base de datos MySQL
* Drupal con PHP-FPM

### Requisitos 

- Docker y Docker Compose instalados

### Clonar el repositorio 

```shell 
https://github.com/CeliaGMqrz/drupal_nginx_basic.git
```

### Crear el directorio de datos 

```shell 
mkdir -p storage/files storage/mysql
```
### Cargar las variables de entorno 

No te olvides de modificar las variables para tu proyecto.

Ubicado en el fichero `.env`

### Desplegar el entorno 

Lanzamos docker-compose up, en el directorio principal donde se encuentra el fichero yml

```shell
docker-compose up -d
```

### Contenedores en funcionamiento:

```shell
cgarcia@ws-cgarcia:~/github/drupal_nginx_basic$ docker ps 
CONTAINER ID   IMAGE              COMMAND                  CREATED          STATUS          PORTS                                                                      NAMES
2cf8061a14e2   cgmarquez95/nx     "/bin/bash /assets/b…"   11 minutes ago   Up 11 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp   nginx_c
a39156429bce   cgmarquez95/dp     "docker-php-entrypoi…"   11 minutes ago   Up 11 minutes   9000/tcp                                                                   drupal_c
f609adefcaa4   cgmarquez95/mybd   "docker-entrypoint.s…"   11 minutes ago   Up 11 minutes   3306/tcp, 33060/tcp                                                        mysql_c
```

### Drupal desde navegador 

![images.png](/images/misitio.png)

Puntos de montaje:

**Volúmenes**

```shell 
cgarcia@ws-cgarcia:~/github/drupal_nginx_basic$ docker volume ls
DRIVER    VOLUME NAME
local     drupal_nginx_basic_drupaldatabase
local     drupal_nginx_basic_staticfiles
```
**Puntos de montaje**

**Nginx**
```shell 
cgarcia@ws-cgarcia:~/github/drupal_nginx_basic$ docker exec -ti nginx_c /bin/bash
root@2cf8061a14e2:/var/www/html# ls   
INSTALL.txt  README.txt  autoload.php  core  example.gitignore	index.php  modules  profiles  robots.txt  sites  themes  update.php  web.config
root@2cf8061a14e2:/var/www/html# lsblk 
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0         7:0    0 142.7M  1 loop 
loop1         7:1    0  55.5M  1 loop 
loop2         7:2    0  55.4M  1 loop 
loop3         7:3    0 164.8M  1 loop 
loop4         7:4    0   219M  1 loop 
loop5         7:5    0 142.8M  1 loop 
loop6         7:6    0   219M  1 loop 
loop7         7:7    0  64.8M  1 loop 
loop8         7:8    0    51M  1 loop 
loop9         7:9    0  32.3M  1 loop 
loop10        7:10   0    51M  1 loop 
loop11        7:11   0  31.1M  1 loop 
loop12        7:12   0  65.1M  1 loop 
nvme0n1     259:0    0   477G  0 disk 
|-nvme0n1p1 259:1    0   512M  0 part 
`-nvme0n1p2 259:2    0 476.4G  0 part /var/www/html
root@2cf8061a14e2:/var/www/html# 

```
**mysql**

```shell
cgarcia@ws-cgarcia:~/github/drupal_nginx_basic$ docker exec -ti mysql_c /bin/bash
root@f609adefcaa4:/# lsblk 
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0         7:0    0 142.7M  1 loop 
loop1         7:1    0  55.5M  1 loop 
loop2         7:2    0  55.4M  1 loop 
loop3         7:3    0 164.8M  1 loop 
loop4         7:4    0   219M  1 loop 
loop5         7:5    0 142.8M  1 loop 
loop6         7:6    0   219M  1 loop 
loop7         7:7    0  64.8M  1 loop 
loop8         7:8    0    51M  1 loop 
loop9         7:9    0  32.3M  1 loop 
loop10        7:10   0    51M  1 loop 
loop11        7:11   0  31.1M  1 loop 
loop12        7:12   0  65.1M  1 loop 
nvme0n1     259:0    0   477G  0 disk 
|-nvme0n1p1 259:1    0   512M  0 part 
`-nvme0n1p2 259:2    0 476.4G  0 part /var/lib/mysql

```
**drupal**

```shell
cgarcia@ws-cgarcia:~/github/drupal_nginx_basic$ docker exec -ti drupal_c /bin/bash
root@a39156429bce:/opt/drupal/web# ls
INSTALL.txt  README.txt  autoload.php  core  example.gitignore	index.php  modules  profiles  robots.txt  sites  themes  update.php  web.config
root@a39156429bce:/opt/drupal/web# lsblk -f
NAME        FSTYPE LABEL UUID FSAVAIL FSUSE% MOUNTPOINT
loop0                                        
loop1                                        
loop2                                        
loop3                                        
loop4                                        
loop5                                        
loop6                                        
loop7                                        
loop8                                        
loop9                                        
loop10                                       
loop11                                       
loop12                                       
nvme0n1                                      
|-nvme0n1p1                                  
`-nvme0n1p2                    419.1G     5% /opt/drupal/web

```

